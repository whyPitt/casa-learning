# 数据来源与路径

路径相对于课程根目录；原始输入位于 `data/raw/`，不随代码上传。`results/` 仅保存选定的派生成果。

| 用途 | 来源 | 本地目录 / 版本 |
|---|---|---|
| W1 London 边界与 fly-tipping | [London Datastore](https://data.london.gov.uk/) | `data/raw/london/`；borough 边界与 GB18030 中文透视表 |
| W1 New Zealand 边界 | [Stats NZ TA 2018 generalised](https://datafinder.stats.govt.nz/layer/92214-territorial-authority-2018-generalised/) | `data/raw/nz2018/boundaries/`，Shapefile 配套文件同目录 |
| W1 New Zealand 普查 | [课程数据入口](https://andrewmaclachlan.github.io/CASA0005repo/geographic-information.html#homework) | `data/raw/nz2018/census/2018-SA1-dataset-individual-part-3a-total-NZ_updated_16-7-20.xlsx` |
| W2 Ward Profiles | [London Datastore](https://data.london.gov.uk/) | `data/raw/london/attributes/ward-profiles-excel-version.csv` |
| W2 ONS 2015 边界 | [课程入口](https://andrewmaclachlan.github.io/CASA0005repo/introduction-to-r.html) | `data/raw/london/boundaries/lad_dec_2015_gb_bfc/` |
| W2 Science 成绩 | [OSPI 重发数据 6rue-47ak](https://data.wa.gov/Education/Report-Card-Assessment-School-Years-2017-18-and-2018-19/6rue-47ak) | `data/raw/washington2018/`，仅 2018–19；原始元数据保存在 documentation |
| W2 Washington 县界 | King County，WASHSH_AREA_122 | `data/raw/washington2018/boundaries/washington_counties_natural_shoreline.geojson` |
| W3 国家边界 | [GADM 4.1 Australia GPKG](https://geodata.ucdavis.edu/gadm/gadm4.1/gpkg/gadm41_AUS.gpkg) | `data/raw/week03/gadm41_AUS.gpkg`；国家层 ADM_ADM_0 |
| W3 历史课堂气温 | [WorldClim 2.1 tavg 5m](https://geodata.ucdavis.edu/climate/worldclim/2_1/base/wc2.1_5m_tavg.zip) | `data/raw/week03/worldclim/`，12 月，1970–2000 |
| W3 未来作业气温 | [WorldClim CMIP6 5m](https://www.worldclim.org/data/cmip6/cmip6_clim5m.html) | `data/raw/week03/homework/ACCESS-CM2-5m-tmax-2081-2100/`，SSP126/SSP585 |
| W4 GII | [UNDP HDR 2025 完整时间序列](https://hdr.undp.org/sites/default/files/2025_HDR/HDR25_Composite_indices_complete_time_series.csv) | `data/raw/week04/`；Windows-1252；2010 与 2019 |
| W4 世界边界 | [教程指定 Esri World Countries Generalized](https://hub.arcgis.com/datasets/2b93b06dc0dc4e809d3c8db5cb96ba69_0/explore) | `data/raw/week04/world-countries-generalized.geojson`；官方 FeatureServer 接口 |

W1 普查使用 `Territorial authority` 表的第 38 列，2018 Paid employee。W2 长表为 `fly-tipping-long.csv`，与 W1 中文宽表不同；冒号占位保留 NA。OSPI 的现成百分比改用实考人数，作业仍从计数按应考人数重算。

未来 CMIP6 tmax 已为 °C，不除以 10；5m 表示 5 arc-minutes。未来文件名、下载代码与校验记录见 W3 Homework。W4 完整下载与 ISO 代码处理见 W4 Homework。

数据保留原发布方许可；课程 CC BY-SA 不覆盖所有第三方原始数据。详细 WorldClim 提取序列、本地包库、备份与工作区只在本地保存。
