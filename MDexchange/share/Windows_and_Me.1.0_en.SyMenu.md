SyMenu 'Windows and Me'  v. 1.0 en
--------------
&lt;!--

This menu for SyMenu, named **'Windows and Me'**, is my first attempt to define a generalist menu for advanced users. Any comments and contributions are welcome.

<img src="https://github.com/msillano/ms_symtools/blob/main/img/menu01.png?raw=true"  style="float:left; padding-right:10px" />

**First part** is a general catalog of Windows software, practically present in every PC for maintenance.
This taxonomy starts from hardware and reaches to vertical applications, following the criterion of functional complexity (for alternatives see References). <br />It should be used for the installed HW and SW, for online services and resources, for local documentation, etc.

**Second Part** is user oriented, to be a useful daily assistant. Start with personal storage and end with free time. <br /> This part of the menu is a scheme that needs to be customized, with new items and workflows for the most frequent tasks, so that you always have everything at your fingertips: the goal is easy access for repetitive tasks. Some elements can be duplicated from the first part.

![](https://github.com/msillano/ms_symtools/blob/main/img/menu02.png?raw=true)

**References**

- Itroduction <A href="https://en.wikipedia.org/wiki/Software_categories" target="_blank">wikipedia: Software categories</A><br/>
Taxonomies:
- <A href="https://cran.r-project.org/web/classifications/ACM.html" target="_blank">ACM Classification codes</A>
- <A href="http://www.winpenpack.com/en/download.php" target="_blank">WinPenPack software</A>
- <A href="https://www.researchgate.net/publication/221501031_A_taxonomy_of_software_types_to_facilitate_search_and_evidence-based_software_engineering" target="_blank">A taxonomy of software types to facilitate search and evidence-based software engineering</A>

<hr>

**use with MDExchange**

*This menu may simply be a source of inspiration, but it was meant to be imported into SyMenu using <A href="https://github.com/msillano/ms_symtools">MDExchange</A>: it's a menu with no Items, so it's portable.*

*Completely reorganizing your SyMenu may seem like a titanic undertaking, but in reality it's very simple and quick:*


1. *When importing this menu with **MD2SyMenuImport** 'Windows and Me' replaces the existing menu. <br />All the present items (SyProgramCmd, SyFolder, etc.) are grouped, in the original order, in an 'Orphans' SyContainer placed at the end of the menu: no program is lost !.*
2. *Now each Item can be dragged to the right place using the **SyMenu|Configuration** tree and 'drag & drop'.*
3. *As alternative you can use **MDExchange** again:*
   - Export your new menu to MD (FULL mode)
   - Edit the MD file: move the programs to the right place and edit the descriptions. 
   - At the end, import the file back into SyMenu.
 
note: the ► symbol indicates my HW devices. Here only as an example.

--&gt;


-----------------------------
#SyRoot

>##HARDWARE
*includes the physical parts of a computer, such as the case, central processing unit (CPU), monitor, mouse, keyboard, computer data storage, graphics card, sound card, speakers and motherboard.*

>>###Workstation
*My workstation: CPU, Motherboard, Memory,*

>>>####configuration
*CPU and Motherboard Tuning, like Intel Extreme Tuning.*

>>>####diagnostic
*HW diagnostic tools, like memtest*

>>>####startup
*Startup  managers, like msconfig*

>>>####shutdown
*Shutdown and wake up for local or remote PCs, like PsShutdown.*

>>>####port management
*Local port use. Like netstat or portmon.*

>>>####drivers/devices
*Device drivers management and control. Like Driver View.*

>>><label>Custom devices</label>

>>>####►Intel i9-11900 CPU
*My PC CPU*

>>>####►ASRock Z590 Board
*My PC mainboard*

>>>####misc

>>###HD Storage
*Internal hard drives and basic management tools, for any type of file..*

>>>####HD managers
*RAID, Partition managers, etc, like AOMEI Partition Assistant*

>>>####Diagnostics
*Information about the performance of hard disk hardware, like CrystalDiskInfo*

>>>####backup
*Backup tools, like AOMEI Backupper*

>>>####data recovery
*Undelete,  recover files from all media, like undelete*

>>>####defrag
*Tools for the HD defragmentation, like defrag.*

>>>####disk space
*Find free and allocated space, like WizTree*

>>>####MD5_SHA1-Hashing
*To check file integrity, like HashCheck.*

>>>####Synchronization
*Folder comparison and synchronization software, like EchoSync*

>>><label>Custom devices</label>

>>>####►SSD 512G

>>>####►Raid 10 2T

>>>####misc

>>###Mobile Storage
*All removable storage devices*

>>>####Burning-CD-DVD
*burning software to create CD, DVD and Blu-ray, like CDBurner*

>>>####Iso-creation-tools
*CD ISO image management software, like ISO Workshop*

>>>####USB flash driver
*Flash drive testing and maintaining tool, like ChkFlsh.*

>>><label>Custom devices</label>

>>>####►Delock 3.5" USB Card reader

>>>####►Adata HV620S external 1T HD

>>>####misc

>>###Input Devices
*My system input devices, included external: documentation and dedicated tools.*

>>>####keyboard, mouse
*Keyboard and mouse managers, like Power Toys*

>>>####scanner fax
*Scanner and fax bsic SW, like WFS*

>>>####GPS, maps
*Use of NMEA messages from a GPS device, like GPS Visualizer.*

>>><label>Custom devices</label>

>>>####►Canon Inkjet TS3450 scanner

>>>####►Canon photo camera

>>>####►Xpro 215 action camera

>>>####►Logitech QuickCam Easy/Cool

>>>####misc

>>###Screen
*Monitors and basic Video activities*

>>>####desktop
*Apps that make it easy to customize your PC desktop. Like BeWidgets*

>>>####Screen grabber
*- Images: alternatives to [Shift][WIN][S]
- Data: like SysExplorer*

>>>####screen recorders
*Capturing screen to Video+audio. Like ShareX.*

>>>####actions recorder
*User actions recorder, like MS psr.*

>>><label>Custom devices</label>

>>>####►Hyundai HIQ T71S Screen

>>>####►United CHHWJT Screen

>>>####misc

>>###Output Devices
*Other system output devices*

>>>####►NVIDIA GeForce GTX 750

>>>####►Canon Inkjet TS3450

>>>><label>rferences</label>

>>>####►Canon MX310 (remote)

>>>####►3D printer

>>>####►laser cutter

>>>####misc

>>###USB devices&amp;tools
*More USB related devices*

>>><label>Custom devices</label>

>>>####►RTL-SDR radio
*Large band radio.*

>>>####►DVB dongle
*DVB2 sint.*

>>>####misc

>>###Telephony
*Smartphone mobile devices*

>>>####file transfert
*Data, Photo transfert, like phone app.*

>>>####backup on PC
*Phone data backup on  PC, like PhotoSync.*

>>><label>Family phones</label>

>>>####►Oukitel WP5 Pro

>>>####misc

>>###Network
*LAN related devices, and other 2 ways channels*

>>>####WiFi
*Local area networking of devices and Internet access.*

>>>####Bluethoot
*Data exchange between fixed and mobile devices over short distances.*

>>><label>Custom devices</label>

>>>####►Router

>>>####►NFC ring

>>><label>portable PCs</label>

>>>####►Lonovo 80S2

>>>####misc

>>###IOT devices
*Physical objects that are embedded with sensors, processing ability, software, and other technologies that connect and exchange data with other devices and systems over the Internet or other communications networks.*

>>>####Tuya references
*Tuya offer a cloud platform that connects your IOT devices.*

>>><label>TuyaDaemon poject</label>

>>>####►TuyaDaemon 24/7:Android
*Access to local net Tuya Damon.*

>>>####misc

>##SYSTEM WIN11
*General pourpose horizontal tools and apps, for area and media*

>>###Management
*Windows maintenance and administration tasks.
Tips:
- Win programs: shell:::{4234d49b-0245-4df3-b780-3893943456e1}
- God mode: shell:::{ED7BA470-8E54-465E-825C-99712043E01C}*

>>>####Favorite tools
*My favorite repetitive Win maintenance tasks.*

>>><hr class="syseparator" />
*available tools*

>>>####Informations
*Analysis of the computer, HW (also basic SW) and reports.
Generalized, specialized, forensic profiles.
Tips: 
1) Standard Win info:  shell:::{bb06c0e4-d293-4f75-8a90-cb05b6477eee}
2) Under 'Reports' Label:
   -  Last reports (link)
   -  Historical reports  (link)*

>>>><label>Reports</label>

>>>####benchmark
*Performance of my computer system, guide for tune up.
Tip: 
1) Under 'Reports' Label:
   -  Last reports (link)
   -  Historical reports  (link)*

>>>><label>Reports</label>

>>>####UI tweaking
*Managers for Windows User Interface (UI), like Winaero Tweaqker.
tip:
- msconfig
- MS Power Toys.*

>>>####accessibility
*Accessibility is the right thing to do.*

>>>####cleanUp utilities
*Clenup temp file, registry, etc., like Glary Utilities*

>>>####antivirus, antimalware
*Resident or test apps, like AVG, Kaspersky, Spybot*

>>>####antispam
*Email protection.*

>>>####password managers
*Trusted & Secure Password Managers, like Norton, Dashlane*

>>>####secure deletion
*To destroy sensitive data so that they can't be recovered and viewed by others.
tip:
- included in Glary Utilities.*

>>>####clock, time
*Standard and secial timers.
tip:
- Win set data time:  shell:::{E2E7934B-DCE5-43C4-9576-7FE4F75E7480}*

>>>####Sysinternal Process utilities
*Tool collection. (also in SyMenu SPS apps).*

>>>>#####PStools
*subset of SysInternals.*

>>>####automate
*Tools that can help in task automation, like nircmd.*

>>>####Win Software Store
*Win program repository, like MS store,*

>>>####Win Update&amp;Security

>>>####Win internals
*Managers for Windows internal informations.*

>>>####misc

>>###File System
*Management, for all file type:
Add links to:
- HD: C:, D:... to workarea
- Special folders more used: Download, Documents,...*

>>>####Favorite tools
*My favorite tools for file maintenence*

>>><hr class="syseparator" />
*installed tools*

>>>####install/uninstall
*File and apps.*

>>>####File UI  tweaking
*File Types, File contextual menu, File Explorer management tools*

>>>####file-managers
*Explorer replacement like  Q-dir.*

>>>####folder-managers
*Directory management, like Dir to HTML.*

>>>####compression/decompression
*Archive management.*

>>>####encryption/decryption
*Secure file, like VeraCrypt*

>>>####file-copiers/renamer
*For bulk file handling.*

>>>####Duplicate finder
*Finds duplicate file.*

>>>####file-searchers
*Fast and better Win replacements, like Everything.*

>>>####file-splitters

>>>####misc

>>###Connections
*Basic tools for remote access*

>>>####WiFi
*WiFi mnagement, like NetSpot*

>>>####ping
*Utilities for lan. like ping*

>>>####proxy
*Proxy software, like UltraSoft*

>>>####firewall
*LAN protection.
Tip: 
- natve Win: shell:::{4026492f-2f69-46b8-b9bf-5654fc07e423}*

>>>####network scanners
*Sniffer software, like PortScan, Intermapper.*

>>>####misc

>>###Virtualization
*SW simulation and enbedding*

>>>####virtual desktop
*Replacement of Win destop.
tip:
Native: shell:::{3080f90e-d7ad-11d9-bd98-0000947b0257}*

>>>####virtual drive
*Virtual CD/DVD for ISO files, like WinCDEmu.*

>>>####virtual OS
*Virtual machine software, like VirtualBox.*

>>>####Linux distro
*There are many Linux live CD distributions, like Knoppix.*

>>>####PenDrive software
*Portable software suites, like SyMenu.*

>>>>#####SyMenu tools
*It can't be missed!*

>>>####misc

>##MEDIA TOOLS
*operations (editing, merge etc.) for different media*

>>###Text
*generic tools for text files, excluding programming*

>>>####MD-viewer-editors
*MD editors, like MarkdownPad.*

>>>####notepads
*Ascii text editor, like notepad.*

>>>####sticky-notes
*On Desktop, yellow notepads, like Memo.*

>>>####converter to/from text
*Some conversions involving text files, like htmlastext.*

>>>####diff\Merging tools
*File difference tools, like WinMerge.*

>>>####misc

>>###Sound, Music
*Audio file management*

>>>####audio-converters
*Audio file format changer, like Stellar Audio Converter.*

>>>####audio-editors
*Audio editing software allows users to edit and generate audio files. Like Audacy.*

>>>####audio-splitting tools
*cut and edit audio files, like Audacity.*

>>>####voice recognition
*Dictation and speaker identification. Like MS Dictate.*

>>>####misc

>>###Images
*Still images tools, not photo*

>>>####image explorer
*search and view various images easily. Like IrfanView.*

>>>####image viewers
*Image viewer, like Photo.*

>>>####colorpickers
*Use the color picker by clicking and dragging your cursor inside the picker area to highlight a color. Like ColorPic.*

>>>####icon editors
*tool for creating both bitmap and pixmap image files for use as icons or backdrops. Like Greenfish Icon Editor.*

>>>####raster Image editors
*Editor for images in one of many raster graphics file formats (also known as bitmap images) such as JPEG, PNG, and GIF. Like Paint.net*

>>>####vector Image editor
*Edit vector graphics images interactively and save them in one of many popular vector graphics formats, such as EPS, PDF, WMF, SVG, or VML.
Like Inkscape.*

>>>####misc

>>###Photo
*Photo  processing*

>>>####Photo editors
*Tools for  enhance photos. Like PhotoWorks.*

>>>####photo special effects
*tools to apply effects, add stickers, create collages, etc... Like AVS Photo Editor.*

>>>####tag-editors
*EXIF Editor to manipulate METAdata. Like MyMeta.*

>>>####Photo Albums
*To organize my photos. Like FilpHTML5*

>>>####misc

>>###Video
*Tools for video production*

>>>####codec-audio-video
*In the context of audio/video compression, codec is a portmanteau of encoder and decoder, while a device that only compresses is typically called an encoder, and one that only decompresses is a decoder. Like K-lite.*

>>>####video-converters
*To change video/audio format:MPEG, VOB, WMV, MKV, AVI, MOV, FLV etc. Like VideoProc.*

>>>####video-editors
*Tools for videomakers. Like PowerDirector.*

>>>####rippers
*Ripping is extracting all or parts of digital contents from a container (e.g. DVD).
Like AudioGrabber.*

>>>####repair-tools
*Repair corrupt Video Files. Like Remo Repair.*

>>>####tag-editors
*Video tags and metadata editors, like VSDC.*

>>>####misc

>>###Framework
*A multimedia framework is a software framework that handles media on a computer and through a network. Like VCL.*

>##APPLICATIONS
*Vertical software solutions, classed by technological areas*

>>###Broadcasting
*Digital media on air or lan*

>>>####TV players
*See DVB on PC. Like DVB Portal*

>>>####TV streamers
*IPTV, like VideoLan.*

>>>####IPTV-players
*Internet TV players, like MyIPTV*

>>>####radio players
*Radio applications for RTL-SDR, like  HDSDR.*

>>>####radio streamers
*Audio IP broadcasting software, like AltaCast.*

>>>####IPradio players
*Internet Radio apps, like Audials Radio.*

>>>####misc

>>###Multimedia
*Home theater and media centers*

>>>####multimedia-centers
*All-in-one media centers software like kodi.*

>>>####multimedia-players
*Media players are primarily designed for music and video playback, like VCL Media Player.*

>>>####e-books
*e-book readers, like Calibre.*

>>>####movie managers
*Movie Catalog software let you manage your collection of movies, like Ant Movie Catalog.*

>>>####music manager
*Manager for music collection, like MuscBee.*

>>>####media-catalogues
*general, like Data Crow.*

>>>####photo-albums
*To organize your photos on Windows, like Adobe Bridge.*

>>>####screen share
*software to communicate and work together with coworkers, like Zoom.*

>>>####screencast
*Screencasting is the video recording of a computer screen,  like OBS Studio. #SyMenu.APPLICATIONS.Multimedia.branch.3*

>>>####misc

>>###Office
*Documentation tools*

>>>####suites
*Apllication collection, like MS Office.*

>>>>#####LibreOffice
*Direct access.*

>>>####word processors
*Featureted  text editor, Like OpenOffice Writer.*

>>>####PDF-readers editors
*PDF viewer and editors, like Foxit.*

>>>####fonts
*Font collections and font editing applications, like FontForge.*

>>>####OCR
*From image to text file, like FreeOCR.*

>>>####calendars managers
*Clendar applications, like Google Calendar.*

>>>####C.A.P. postal-code
*Postal code applications, country dependent, like CAP-Italia.*

>>>####finance-managers
*Budget and expense tracking, like Quicken*

>>>####project-management
*Help in projects, like  SmartSheet.*

>>>####misc

>>###CAD
*The design applications*

>>>####electronics
*Electronic project tools, like Fritzing.*

>>>####architecture
*Building design, like Autocad.*

>>>####CAD-2D
*CAD tools 2D, like DraftSight.*

>>>####CAD-3D
*CAD tools 3D like freeCAD.*

>>###Internet
*per-protocol applications*

>>>####browsers
*WWW client, like Opera.*

>>>####offline-browsers
*Local site download, like HTTrck*

>>>####download-managers
*For better file transfert, like JDownloader.*

>>>####FTP-clients
*FTP client software, like WinSPC.*

>>>####FTP-servers
*FTP server, like FileZilla,*

>>>####MQTT-clients
*IOT protocol client applications like HiveMQ.*

>>>####MQTT-servers
*MQTT brokers, like Mosqitto.*

>>>####email-clients
*Local mail client, like Thunderbird.*

>>>####email-monitors
*For better inbox deliverability, like NXAlerts.*

>>>####email-tools
*Email management, convrsion... Like MBOX to PDF Aspose*

>>>####newsreaders
*RSS readers, Like  NewsFlow*

>>>####P2P-clients_File-sharing
*file exchange, like Vuze.*

>>>####remote assist
*Tools for remote PC roubleshooting, like QuickAssist*

>>>####messengers
*Social applications like Facebook Messenger.*

>>>####video-chats
*Social video applications like Facebook Messenger Rooms.*

>>>####VOIP
*Voice over IP tools, like MicroSIP*

>>>####misc

>>###Development
*Programmimg related*

>>>####reference manuals
*My reference library: HTML, XML, Java...*

>>>>#####Java

>>>>#####XML

>>>>#####HTML

>>>>#####DBase

>>>####languages-consoles
*Fast console access for used anguages, like python.*

>>>####IDE
*Developping environment like Eclipse.*

>>>####reverse engineering
*Tools to analyze software, like Java decompiler.*

>>>####programmers editors
*Editor for programmers, Like Notepad++*

>>>####HEX-viewer editors
*Hex editors like wxHexEditor.*

>>>####UML tools
*Unified Modeling Language tools and documentation.*

>>>####HTML Web tools
*More HTML editor and tools, like LinkChecker.*

>>>####XML tools
*More XML editor and tools, like XML Explorer*

>>>####help tools
*Building help tools, like Help Workshop.*

>>>####installation builder
*Package installation makers, like InstallAware*

>>>####DBase tools
*Database management tools, like db_main*

>>>####WEB servers AMP
*Local  Apache, MySQL and MariaDB services, like WAMPServer*

>>>####misc

>>###Science&amp;School
*Tech, Education, Science*

>>>####children
*Kids applications, like ABCmouse*

>>>####PC-typing
*Typing tutor software, like UltraKey.*

>>>####dictionaries Translators
*Translator applications, like DualClip.*

>>>####geography
*Like Google Earth.*

>>>####literature
*Programs and documents, like  Calibre.*

>>>####math
*Mathematic application, like Geogebra*

>>>####music
*Music-making and MIDI applications, like BandLab.*

>>>####physics
*Physic related application, like Optical simulation.*

>>>####science
*Scienze related software, like Chemspread.*

>>>####misc

>>###Games
*for relax*

>>>####Win Classic
*Classic win games (discontinued).
see WinaeroTweaker for installation.*

>>>####arcade

>>>####cards

>>>####casino

>>>####Flay-Driving simulators

>>>####labyrinth

>>>####logic

>>>####Role Playing

>>>####shooting

>>>####sport

>>>####strategy

>>>####platforms
*Most popular gaming console. Like PlayStation.*

>>>####Lego
*programs like Studio 2.0*

>>>####misc

>##MY PERSONAL
*For every computer user, it can be tailored to the needs.
The goal is an ordered, fast and easy access to frequent data, activities and workflows.*

>>###master diario
*personel plenner used*

>>###My Activities
*I am Responsable*

>>>####My Library

>>>####My Informations
*Documents and data links.*

>>>####My Projects
*Work in progress.*

>>>####My Pubblications
*Web presence.*

>>>####My network
*Access to my  WEB servers.*

>>>####My Hobbies
*Libre time interst.*

>>>####more...

>>###Coworks
*We collaborate*

>>>####My Company
*Web presence and local documentation.*

>>>####My shared Apps
*Tools required by work.*

>>>####My Providers
*Local info and web presence.*

>>>####My Customers
*Local info and WEB presence.*

>>>####My Banks
*Access to home banking.*

>>>####more...

>>###TODO
*Tasks I must do*

>>>####Public administration and me
*Frequent access to public services.*

>>>####Service suppliers and me
*Main suppliers like power, wather etc.*

>>>####Home
*My Home relate documents.*

>>>####Car
*My car related documentation.*

>>>####more...

>>###Social media
*my favorite portals*

>>>####My socials
*The preferred social applications, like Facebook.*

>>>####My Live chats
*Live chat preferred .*

>>>####My email accounts
*AQccess to mail services and tools.*

>>>####Relatives and friends
*People info.*

>>>####My charity
*For donation or collaborations.*

>>>####more...

>>###Leisure
*Not only jobs*

>>>####My news

>>>####My multimedia

>>>####My Games

>>>####more...

>##SAFE AREA
*passoword protect storage
see: https://www.ugmfree.it/Forum/messages.aspx?TopicID=20*

>>###My passwords
*Manager or safe storage for my passwords*

>>###Data Access
*personal and private*

>>>####My private documents

>>>####My finances

>>>####My healt

>>>####more...

><hr class="syseparator" />
*&lt;Separator&gt;*

>##ms SyMenu Tools
*New, under development*

>>###SyMenu Export

-----------------------------
by SyMenu2MDexport.export v. 2.2 (beta)     ©2021 Marco Sillano 
