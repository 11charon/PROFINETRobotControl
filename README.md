PROFINETRobotControl/
├── PortalProject/
│   ├── PortalProject.ap18   # 西门子 TIA Portal (博途) 项目主文件，包含 PLC 程序、硬件组态及 HMI 配置
│   └── AdditionalFiles/
│       └── GSD/
│           └── gsdml-v2.33-abb robotics-robot device-20170522.xml  # ABB 机器人的 GSDML 描述文件，用于在博途中组态 PROFINET 通信
├── RSProject/
│   ├── MainModule.mod       # ABB 机器人 RAPID 程序模块文件，包含机器人的核心控制逻辑、运动指令及数据处理
│   └── NewProgramName.pgf   # ABB RobotStudio 程序文件，通常用于保存离线仿真的程序配置或打包数据
├── EIO.cfg                  # ABB 机器人的电子 I/O 配置文件，定义机器人与外部设备的通信信号
└── SIO.cfg                  # ABB 机器人的系统 I/O 配置文件，用于底层系统级信号配置
