# CASA0005 中文教程共用工具；只检查路径和数据，不运行学生原有 Rmd。
gis_root <- function() {
  override <- Sys.getenv("CASA_GIS_ROOT", unset = "")
  if (nzchar(override)) return(normalizePath(override, mustWork = TRUE))
  candidate <- normalizePath(getwd(), mustWork = TRUE)
  for (i in seq_len(8)) {
    if (file.exists(file.path(candidate, "casa0005.Rproj"))) return(candidate)
    parent <- dirname(candidate)
    if (identical(parent, candidate)) break
    candidate <- parent
  }
  stop("先在 RStudio 打开课程 casa0005.Rproj；不要临时 setwd 到数据目录。")
}
gis_packages <- function(packages) {
  missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
  if (length(missing)) stop("缺少包：", paste(missing, collapse = ", "),
                           "。请先自行安装，再重新运行本块。")
  invisible(packages)
}
gis_file <- function(relative, pattern = NULL) {
  root <- gis_root()
  path <- file.path(root, relative)
  if (file.exists(path)) return(path)
  if (!is.null(pattern)) {
    candidates <- list.files(file.path(root, "data", "raw"), pattern = pattern,
                             recursive = TRUE, full.names = TRUE, ignore.case = TRUE)
    if (length(candidates) == 1L) return(candidates)
    if (length(candidates) > 1L) stop("找到多份候选文件，请明确选择版本：\n",
                                     paste(candidates, collapse = "\n"))
  }
  stop("尚未准备数据：", path, "。请按本节来源下载并解压后再继续。")
}
gis_unique <- function(data, key) {
  if (!key %in% names(data)) stop("找不到连接字段：", key)
  x <- data[[key]]
  if (anyNA(x) || anyDuplicated(x)) stop("连接键含缺失或重复：", key,
                                        "。请检查，不要用 distinct 隐藏冲突。")
  invisible(data)
}
gis_columns <- function(data, columns) {
  missing <- setdiff(columns, names(data))
  if (length(missing)) stop("数据字段与教材版本不同：", paste(missing, collapse = ", "),
                           "。先查看 names(data) 和数据字典，不要猜字段。")
  invisible(data)
}
gis_new_output <- function(week, name) {
  dir <- file.path(gis_root(), week, "outputs")
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  target <- file.path(dir, name)
  if (file.exists(target)) stop("已有同名结果，避免覆盖：", target, "。请改一个新文件名。")
  target
}
gis_owin <- function(area) {
  # 现代替代：不依赖已退役maptools，也不把bbox误当真实研究窗。
  gis_packages(c("sf", "spatstat.geom"))
  if (isTRUE(sf::st_is_longlat(area))) stop("点模式研究窗必须先转到合适的米制投影。")
  geometry <- sf::st_cast(sf::st_union(sf::st_make_valid(sf::st_geometry(area))), "MULTIPOLYGON")
  stopifnot(length(geometry) == 1L)
  rings <- list()
  for (polygon in geometry[[1]]) {
    for (i in seq_along(polygon)) {
      ring <- polygon[[i]][, 1:2, drop = FALSE]
      if (all(ring[1, ] == ring[nrow(ring), ])) ring <- ring[-nrow(ring), , drop = FALSE]
      next_i <- c(2:nrow(ring), 1)
      signed_area <- sum(ring[, 1] * ring[next_i, 2] - ring[next_i, 1] * ring[, 2]) / 2
      if (!is.finite(signed_area) || signed_area == 0) stop("研究窗含退化环。")
      # spatstat外环逆时针(正面积)，洞顺时针(负面积)。
      if ((i == 1L && signed_area < 0) || (i > 1L && signed_area > 0)) ring <- ring[nrow(ring):1, , drop = FALSE]
      rings[[length(rings) + 1L]] <- list(x = ring[, 1], y = ring[, 2])
    }
  }
  spatstat.geom::owin(poly = rings, unitname = c("metre", "metres"))
}
