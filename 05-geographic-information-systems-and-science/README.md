# CASA0005 · Geographic Information Systems and Science

前四周 Practical 与 Homework：代码、简要方法、结果及数据来源。项目入口为 `casa0005.Rproj`。普通分析块可 Knit；安装、下载和文件导出保持独立。

| 周次 | Practical | Homework | 结果图 |
|---|---|---|---|
| 01 | [Rmd](week01/practical-中文教程.Rmd) | [新西兰 Rmd](week01/homework.Rmd) | [受薪雇员地图](week01/results/nz-paid-employees.png) |
| 02 | [Rmd](week02/practical-中文教程.Rmd) | [Washington Rmd](week02/homework.Rmd) | [Science 县级比较](week02/results/washington-science.png) |
| 03 | [Rmd](week03/practical-中文教程.Rmd) | [未来气温 Rmd](week03/homework.Rmd) | [情景差值地图](week03/results/australia-scenario-difference-map.png) |
| 04 | [Rmd](week04/practical-中文教程.Rmd) | [GII Rmd](week04/homework.Rmd) | [2010–2019 差值](week04/results/gii-change.png) |

GitHub 保留 Rmd、PNG 和选定数据成果；HTML 报告仅在本地保存。PNG 可直接查看。每周 `results/` 保存选定的派生成果。

- Week 1：伦敦 33 区连接；新西兰 67 个 TA 的 2018 受薪雇员人数。另有[相对路径 QGIS 项目](week01/qgis/london-flytipping.qgz)及配套 GeoPackage。
- Week 2：39 县匹配；完整公开记录的 Science 州基准 47.47%，17 县高于、22 县低于。保密排除记录意味着结果不代表完整学生总体。
- Week 3：Australia、ACCESS-CM2、5 arcmin、2081–2100 tmax，SSP126 对 SSP585；180 个完整配对，平均情景差 3.31 °C。海岸共同邻格的选择见取样审计。
- Week 4：GII 2019−2010；154 条完整差值，145 下降、9 上升，其余 90 条缺失或未匹配。

## 数据与复现

[数据来源及路径](data/README.md)。原始数据与本地 R 包库不上传；下载并按相对路径放置后可重新运行。表连接使用 dplyr joins，先检查唯一键和未匹配。

[核验记录](验证报告.md)记录当前文件与报告检查范围。代码顺序来自[课程手册](https://andrewmaclachlan.github.io/CASA0005repo/)；中文整理与部分代码适配使用 AI 辅助，原作者、许可及具体适配见[来源说明](来源与改编范围.md)。

老师的[链接登记表](https://docs.google.com/spreadsheets/d/1mHrA09wGPqq7c8J_EJeOqeKupOea9AKysE9NdbpsyNs/edit)由本人填写；仓库上传与表格登记分开记录。
