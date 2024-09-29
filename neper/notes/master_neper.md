## Learn Neper
## TODO 
1. 刷一遍 [Neper Tutorials](https://neper.info/doc/tutorials.html)；
2. 整理有无孪晶的建模笔记；


## tutorials notes

### 一个简单的test
```bash
neper -T -n 100 # 生成一个名为n100-id1.tess的文件
neper -T -n 100 -id 2

neper -V n100-id1.tess -print img1 # 采用-V来可视化
neper -M n100-id2.tess
neper -V n100-id1.tess,n100-id1.msh -print img2
neper -V n100-id1.tess,n100-id1.msh -showelt1d all -dataelt1drad 0.005 -print img3

neper -T -n 100 -reg 1
neper -V n100-id1.tess -print img4
neper -M n100-id1.tess
neper -V n100-id1.tess,n100-id1.msh -showelt1d all -dataelt1drad 0.005 -print img5

neper -M n100-id1.tess -rcl 0.7 -order 2
neper -V n100-id1.tess,n100-id1.msh -showelt1d all -dataelt1drad 0.005 -print img6

```

### 可视化 tessellation (镶嵌)
```bash
neper -T -n 200 -morpho gg -oricrysym cubic -o n200
neper -V n200.tess -print img1
neper -V n200.tess -showcell "z<0.5" -print img2
neper -V n200.tess -showcell "z<0.5" -showedge all -print img3
neper -V n200.tess -showcell "z<0.5" -showedge "cell_shown||domtype==1" -print img4
neper -V n200.tess -showcell "(vol>0.005)&&(facenb>=20)&&(body>0)" -showedge "cell_shown||domtype==1" -print img5
neper -V n200.tess -showcell none -showface "z<0.5" -showedge "face_shown||domtype==1" -print img6
neper -V n200.tess -showcell none -showedge "domtype==1" -showver all -print img7
neper -V n200.tess -showcell none -showcrystal all -showedge "domtype==1" -print img8
neper -V n200.tess -datacellcol ori -print img9
neper -V n200.tess -datacellcol ori -datacellcolscheme ipf -print img10
neper -V n200.tess -datacellcol int:facenb -print img11
neper -V n200.tess -datacellcol int:vernb-edgenb+facenb -print img12
neper -V n200.tess -datavercol int:cellnb -dataverrad 0.02 -showcell "z<0.5" -showedge "cell_shown||domtype==1" -showver cell_shown -print img13

neper -V n200.tess -datacellcol real:diameq -datacellscale 0.00:0.50 -datacellscaletitle "Equivalent diameter" -print img14
convert img14.png img14-scale3.png -gravity East -composite img14.png

neper -V n200.tess -datacellcol "real:x*sqrt(y)*sqrt(z)" -datacellscale 0.00:1.00 -datacellscaletitle "x*sqrt(y)*sqrt(z)" -print img15
convert img15.png img15-scale3.png -gravity East -composite img15.png

neper -V n200.tess -datacellcol "real:x*sqrt(y)*sqrt(z)" -datacellscale 0.00:1.00 -datacellscaletitle "x*sqrt(y)*sqrt(z)" -datacellcolscheme heat -print img16
convert img16.png img16-scale3.png -gravity East -composite img16.png

neper -V n200.tess -datacelltrs 0.5 -print img19
neper -V n200.tess -showcell none -showface "domtype==-1" -showedge face_shown -datafacecol area -datafacetrs 0.5 -datafacescale 0.00:0.01:0.02:0.03:0.04:0.05 -datafacescaletitle "Suface area" -print img20
convert img20.png img20-scale2.png -gravity East -composite img20.png
neper -V n200.tess -dataedgerad 0.05 -dataedgecol id -print img21

neper -V n200.tess -datacelltrs 0.5 -cameraangle 12 -imagesize 400:400 -print view -cameracoo 7:y:z -camerasky 0:1:0 -print xview -cameracoo x:7:z -camerasky 0:0:1 -print yview -cameracoo x:y:7 -camerasky 1:0:0 -print zview
convert +append view.png xview.png tmp1.png
```
### 绘制极图
1. 
```bash
neper -T -n 100 -morpho gg -oricrysym cubic -o n100
neper -V n100.tess -imagesize 800:400 -print img1
neper -V n100.tess -space pf -print img2
neper -V n100.tess -space pf -imageformat pdf -print img2
neper -V n100.tess -space pf -pfpole 1:0:0 -print img3
neper -V n100.tess -space pf -pfdir y:z -datacsyslabel RD:TD:ND -print img5
neper -V n100.tess -space pf -pfmode density -print img6
```
### 基于Statistical Cell Properties生成镶嵌

### 对Synchrotron X-Ray Diffraction获取的多晶图像进行网格划分

### 处理EBSD类型的数据

### 生成取向空间的基本区域并Meshing

### 针对镶嵌cells指定取向信息

### 绘制取向轨迹

### 绘制取向Colar Key

## 1. 资源与参考
- **官方文档链接**: [Neper 官方网站](https://neper.info/index.html)
- **官方论坛链接**: [Neper 官方网站](https://github.com/neperfepx/neper/discussions)
- **教程和学习资源**:
  - [Neper 安装教程](https://neper.info/doc/tutorials/install_ubuntu22.html)
  - [Neper 用户手册](https://neper.info/doc/)
  - [Neper Tutorials](https://neper.info/doc/tutorials.html)
## 相关论文和出版物
  - [Applications](https://neper.info/applications.html)
  - 
**介绍性论文**
  - [2011-Large-scale 3D random polycrystals for the finite element method-Generation, meshing and remeshing](https://neper.info/neper-reference-paper.pdf)
  - [2017-Optimal polyhedral description of 3D polycrystals-method and application to statistical and synchrotron X-ray diffraction data](https://hal.science/hal-01626440)
  - [2018-Nearly uniform sampling of crystal orientations](https://hal.science/hal-01850591)
  - [2022-The Neper-FEPX Project Free and Open-source Polycrystal Generation, Deformation Simulation, and Post-processing](https://iopscience.iop.org/article/10.1088/1757-899X/1249/1/012021/meta)

## 2. 介绍
- **什么是 Neper**？
  - Neper 是一款用于生成和分析多晶材料微观结构的软件。
- **主要功能和应用领域**：
  - 生成多晶体的网格结构（tessellation）。
  - 进行微观结构的数值模拟和分析。
  - 适用于材料科学、工程等领域的研究。
- **发展历史和版本更新**：
  - 简要介绍 Neper 的发展历程和主要版本更新信息。

## 3. 安装指南
- **系统要求**:
  - Ubuntu 20.04 或其他兼容系统。
- **安装步骤**：
  - 下载并运行安装脚本：`./install_neper.sh`
- **解决安装过程中可能遇到的问题**：
  - 列出已知问题及其解决方案。

## 4. 基本概念
- **多晶材料的定义和重要性**：
  - 解释多晶材料的基本概念及其在材料科学中的重要性。
- **Neper 中的关键术语**：
  - **Tessellation**：描述材料的微观结构的过程。
  - **Mesh**：网格结构，通常用于模拟和分析。
  - **Element Types**：不同类型的单元（如三角形、四面体等）。
- **Neper 的文件格式和结构**：
  - 介绍主要的文件类型：
    - `.tess`：用于存储 tessellation 数据。
    - `.msh`：用于存储网格数据。

## Tessellation Module (-T)
## Meshing Module (-M)
## Visualization Module (-V)
1. The way entities are represented can be specified using options -data*. The entities of a tessellation are the cells (which correspond to polyhedra in 3D and faces in 2D), polyhedra, faces, edges, vertices, seeds and crystals, and their properties include the color (options -data<entity>col, -data<entity>colscheme and -data<entity>scale and -data<entity>scaletitle), transparency (option -data<entity>trs) and radius (or size) (option -data<entity>rad). Similarly to the -show* options, the -data* options can take (mathematical) expressions as argument.
2. Neper uses POV-Ray, a ray-tracing software, to generate the PNG images. As such, properties such as the camera position, angle, etc., the type of projection, shadowing effects, etc. can be set.
3. 
## 
## 5. 使用手册
### 5.1 基本命令
- **生成 tessellation**：
  - 命令示例及其参数解释。
- **从 tessellation 生成网格**：
  - 命令示例及其参数解释。
- **可视化结果**：
  - 可视化结果的命令及参数示例。

### 5.2 高级功能
- **随机性和控制变量**：
  - 介绍如何在生成过程中引入随机性及其控制。
- **参数设置**：
  - 详细说明可调整的参数及其影响。

### 5.3 示例与应用
- **实际案例分析**：
  - 记录具体的使用案例及命令。
- **结果分析与可视化示例**：
  - 如何分析生成的结果并进行可视化。

## 6. 常见问题与解决方案
- **安装过程中常见的问题及解决方法**：
  - 列出常见安装问题及其解决方案。
- **使用中的常见问题**：
  - 列出在使用 Neper 时可能遇到的问题及建议的解决方法。

## 7. 个人总结与思考
- **学习过程中遇到的挑战和收获**：
  - 反思在学习 Neper 时的挑战和收获。
- **对 Neper 的个人评价**：
  - 分享对软件的使用体验和看法。
- **未来的学习计划**：
  - 规划进一步的学习和研究方向。
