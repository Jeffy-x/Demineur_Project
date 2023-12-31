pragma Warnings (Off);
pragma Ada_95;
with System;
with System.Parameters;
with System.Secondary_Stack;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: 12.2.0" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   GNAT_Version_Address : constant System.Address := GNAT_Version'Address;
   pragma Export (C, GNAT_Version_Address, "__gnat_version_address");

   Ada_Main_Program_Name : constant String := "_ada_test_es_fichier" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#cbb9b3ba#;
   pragma Export (C, u00001, "test_es_fichierB");
   u00002 : constant Version_32 := 16#7320ff5f#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#b0d43184#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#76789da1#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#8b07c00c#;
   pragma Export (C, u00005, "ada__directoriesB");
   u00006 : constant Version_32 := 16#62239e2c#;
   pragma Export (C, u00006, "ada__directoriesS");
   u00007 : constant Version_32 := 16#da9e3f22#;
   pragma Export (C, u00007, "ada__calendarB");
   u00008 : constant Version_32 := 16#8324cd02#;
   pragma Export (C, u00008, "ada__calendarS");
   u00009 : constant Version_32 := 16#7b8a0989#;
   pragma Export (C, u00009, "ada__exceptionsB");
   u00010 : constant Version_32 := 16#fec21d10#;
   pragma Export (C, u00010, "ada__exceptionsS");
   u00011 : constant Version_32 := 16#0740df23#;
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   u00012 : constant Version_32 := 16#6dc27684#;
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   u00013 : constant Version_32 := 16#a2da961d#;
   pragma Export (C, u00013, "systemS");
   u00014 : constant Version_32 := 16#fd5f5f4c#;
   pragma Export (C, u00014, "system__soft_linksB");
   u00015 : constant Version_32 := 16#ea08eb09#;
   pragma Export (C, u00015, "system__soft_linksS");
   u00016 : constant Version_32 := 16#e12f1eb0#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#790dbf4d#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#821dff88#;
   pragma Export (C, u00018, "system__parametersB");
   u00019 : constant Version_32 := 16#764e32bb#;
   pragma Export (C, u00019, "system__parametersS");
   u00020 : constant Version_32 := 16#ec4fa52d#;
   pragma Export (C, u00020, "system__storage_elementsB");
   u00021 : constant Version_32 := 16#cf5489e9#;
   pragma Export (C, u00021, "system__storage_elementsS");
   u00022 : constant Version_32 := 16#37c92568#;
   pragma Export (C, u00022, "system__soft_links__initializeB");
   u00023 : constant Version_32 := 16#2ed17187#;
   pragma Export (C, u00023, "system__soft_links__initializeS");
   u00024 : constant Version_32 := 16#8599b27b#;
   pragma Export (C, u00024, "system__stack_checkingB");
   u00025 : constant Version_32 := 16#c4d54817#;
   pragma Export (C, u00025, "system__stack_checkingS");
   u00026 : constant Version_32 := 16#c71e6c8a#;
   pragma Export (C, u00026, "system__exception_tableB");
   u00027 : constant Version_32 := 16#2ff1e004#;
   pragma Export (C, u00027, "system__exception_tableS");
   u00028 : constant Version_32 := 16#907f292f#;
   pragma Export (C, u00028, "system__exceptionsS");
   u00029 : constant Version_32 := 16#69416224#;
   pragma Export (C, u00029, "system__exceptions__machineB");
   u00030 : constant Version_32 := 16#8bdfdbe3#;
   pragma Export (C, u00030, "system__exceptions__machineS");
   u00031 : constant Version_32 := 16#7706238d#;
   pragma Export (C, u00031, "system__exceptions_debugB");
   u00032 : constant Version_32 := 16#92d4ce4e#;
   pragma Export (C, u00032, "system__exceptions_debugS");
   u00033 : constant Version_32 := 16#1253e556#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#5c7d9c20#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#244062a0#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#5f6b6486#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#6ac62991#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#69fd68e2#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#d9e66ad1#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#179d7d28#;
   pragma Export (C, u00040, "ada__containersS");
   u00041 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00041, "ada__exceptions__tracebackB");
   u00042 : constant Version_32 := 16#eb07882c#;
   pragma Export (C, u00042, "ada__exceptions__tracebackS");
   u00043 : constant Version_32 := 16#edec285f#;
   pragma Export (C, u00043, "interfacesS");
   u00044 : constant Version_32 := 16#7f1e3740#;
   pragma Export (C, u00044, "interfaces__cB");
   u00045 : constant Version_32 := 16#1bfc3385#;
   pragma Export (C, u00045, "interfaces__cS");
   u00046 : constant Version_32 := 16#a828b371#;
   pragma Export (C, u00046, "system__bounded_stringsB");
   u00047 : constant Version_32 := 16#d527b704#;
   pragma Export (C, u00047, "system__bounded_stringsS");
   u00048 : constant Version_32 := 16#fc48a043#;
   pragma Export (C, u00048, "system__crtlS");
   u00049 : constant Version_32 := 16#173d8a0c#;
   pragma Export (C, u00049, "system__dwarf_linesB");
   u00050 : constant Version_32 := 16#457ca30b#;
   pragma Export (C, u00050, "system__dwarf_linesS");
   u00051 : constant Version_32 := 16#5b4659fa#;
   pragma Export (C, u00051, "ada__charactersS");
   u00052 : constant Version_32 := 16#a5e53111#;
   pragma Export (C, u00052, "ada__characters__handlingB");
   u00053 : constant Version_32 := 16#763c2a94#;
   pragma Export (C, u00053, "ada__characters__handlingS");
   u00054 : constant Version_32 := 16#cde9ea2d#;
   pragma Export (C, u00054, "ada__characters__latin_1S");
   u00055 : constant Version_32 := 16#e6d4fa36#;
   pragma Export (C, u00055, "ada__stringsS");
   u00056 : constant Version_32 := 16#6424b9ce#;
   pragma Export (C, u00056, "ada__strings__mapsB");
   u00057 : constant Version_32 := 16#5349602c#;
   pragma Export (C, u00057, "ada__strings__mapsS");
   u00058 : constant Version_32 := 16#96b40646#;
   pragma Export (C, u00058, "system__bit_opsB");
   u00059 : constant Version_32 := 16#6f293a21#;
   pragma Export (C, u00059, "system__bit_opsS");
   u00060 : constant Version_32 := 16#58f0e944#;
   pragma Export (C, u00060, "system__unsigned_typesS");
   u00061 : constant Version_32 := 16#88fa2db0#;
   pragma Export (C, u00061, "ada__strings__maps__constantsS");
   u00062 : constant Version_32 := 16#a0d3d22b#;
   pragma Export (C, u00062, "system__address_imageB");
   u00063 : constant Version_32 := 16#03360b27#;
   pragma Export (C, u00063, "system__address_imageS");
   u00064 : constant Version_32 := 16#04e17b2e#;
   pragma Export (C, u00064, "system__img_unsS");
   u00065 : constant Version_32 := 16#20ec7aa3#;
   pragma Export (C, u00065, "system__ioB");
   u00066 : constant Version_32 := 16#3c986152#;
   pragma Export (C, u00066, "system__ioS");
   u00067 : constant Version_32 := 16#754b4bb8#;
   pragma Export (C, u00067, "system__mmapB");
   u00068 : constant Version_32 := 16#e42f418c#;
   pragma Export (C, u00068, "system__mmapS");
   u00069 : constant Version_32 := 16#367911c4#;
   pragma Export (C, u00069, "ada__io_exceptionsS");
   u00070 : constant Version_32 := 16#dd82c35a#;
   pragma Export (C, u00070, "system__mmap__os_interfaceB");
   u00071 : constant Version_32 := 16#37fd3b64#;
   pragma Export (C, u00071, "system__mmap__os_interfaceS");
   u00072 : constant Version_32 := 16#40e7f3aa#;
   pragma Export (C, u00072, "system__mmap__unixS");
   u00073 : constant Version_32 := 16#3d77d417#;
   pragma Export (C, u00073, "system__os_libB");
   u00074 : constant Version_32 := 16#58b64642#;
   pragma Export (C, u00074, "system__os_libS");
   u00075 : constant Version_32 := 16#6e5d049a#;
   pragma Export (C, u00075, "system__atomic_operations__test_and_setB");
   u00076 : constant Version_32 := 16#57acee8e#;
   pragma Export (C, u00076, "system__atomic_operations__test_and_setS");
   u00077 : constant Version_32 := 16#65b9ec38#;
   pragma Export (C, u00077, "system__atomic_operationsS");
   u00078 : constant Version_32 := 16#29cc6115#;
   pragma Export (C, u00078, "system__atomic_primitivesB");
   u00079 : constant Version_32 := 16#9b4d0d57#;
   pragma Export (C, u00079, "system__atomic_primitivesS");
   u00080 : constant Version_32 := 16#b98923bf#;
   pragma Export (C, u00080, "system__case_utilB");
   u00081 : constant Version_32 := 16#6dc94148#;
   pragma Export (C, u00081, "system__case_utilS");
   u00082 : constant Version_32 := 16#256dbbe5#;
   pragma Export (C, u00082, "system__stringsB");
   u00083 : constant Version_32 := 16#39589605#;
   pragma Export (C, u00083, "system__stringsS");
   u00084 : constant Version_32 := 16#51051765#;
   pragma Export (C, u00084, "system__object_readerB");
   u00085 : constant Version_32 := 16#4d58338b#;
   pragma Export (C, u00085, "system__object_readerS");
   u00086 : constant Version_32 := 16#6fe12729#;
   pragma Export (C, u00086, "system__val_lliS");
   u00087 : constant Version_32 := 16#79b18bfd#;
   pragma Export (C, u00087, "system__val_lluS");
   u00088 : constant Version_32 := 16#273bd629#;
   pragma Export (C, u00088, "system__val_utilB");
   u00089 : constant Version_32 := 16#20c400bb#;
   pragma Export (C, u00089, "system__val_utilS");
   u00090 : constant Version_32 := 16#bad10b33#;
   pragma Export (C, u00090, "system__exception_tracesB");
   u00091 : constant Version_32 := 16#4e42ff7b#;
   pragma Export (C, u00091, "system__exception_tracesS");
   u00092 : constant Version_32 := 16#fd158a37#;
   pragma Export (C, u00092, "system__wch_conB");
   u00093 : constant Version_32 := 16#7bd9b57e#;
   pragma Export (C, u00093, "system__wch_conS");
   u00094 : constant Version_32 := 16#5c289972#;
   pragma Export (C, u00094, "system__wch_stwB");
   u00095 : constant Version_32 := 16#56c8997f#;
   pragma Export (C, u00095, "system__wch_stwS");
   u00096 : constant Version_32 := 16#002bec7b#;
   pragma Export (C, u00096, "system__wch_cnvB");
   u00097 : constant Version_32 := 16#7d197f0e#;
   pragma Export (C, u00097, "system__wch_cnvS");
   u00098 : constant Version_32 := 16#e538de43#;
   pragma Export (C, u00098, "system__wch_jisB");
   u00099 : constant Version_32 := 16#c8ae1d24#;
   pragma Export (C, u00099, "system__wch_jisS");
   u00100 : constant Version_32 := 16#307180be#;
   pragma Export (C, u00100, "system__os_primitivesB");
   u00101 : constant Version_32 := 16#a527f3eb#;
   pragma Export (C, u00101, "system__os_primitivesS");
   u00102 : constant Version_32 := 16#de53e0a3#;
   pragma Export (C, u00102, "ada__containers__helpersB");
   u00103 : constant Version_32 := 16#229b07a5#;
   pragma Export (C, u00103, "ada__containers__helpersS");
   u00104 : constant Version_32 := 16#86c56e5a#;
   pragma Export (C, u00104, "ada__finalizationS");
   u00105 : constant Version_32 := 16#b4f41810#;
   pragma Export (C, u00105, "ada__streamsB");
   u00106 : constant Version_32 := 16#67e31212#;
   pragma Export (C, u00106, "ada__streamsS");
   u00107 : constant Version_32 := 16#a94883d4#;
   pragma Export (C, u00107, "ada__strings__text_buffersB");
   u00108 : constant Version_32 := 16#bb49bb93#;
   pragma Export (C, u00108, "ada__strings__text_buffersS");
   u00109 : constant Version_32 := 16#7e7d940a#;
   pragma Export (C, u00109, "ada__strings__utf_encodingB");
   u00110 : constant Version_32 := 16#84aa91b0#;
   pragma Export (C, u00110, "ada__strings__utf_encodingS");
   u00111 : constant Version_32 := 16#d1d1ed0b#;
   pragma Export (C, u00111, "ada__strings__utf_encoding__wide_stringsB");
   u00112 : constant Version_32 := 16#a373d741#;
   pragma Export (C, u00112, "ada__strings__utf_encoding__wide_stringsS");
   u00113 : constant Version_32 := 16#c2b98963#;
   pragma Export (C, u00113, "ada__strings__utf_encoding__wide_wide_stringsB");
   u00114 : constant Version_32 := 16#22a4a396#;
   pragma Export (C, u00114, "ada__strings__utf_encoding__wide_wide_stringsS");
   u00115 : constant Version_32 := 16#c3fbe91b#;
   pragma Export (C, u00115, "ada__tagsB");
   u00116 : constant Version_32 := 16#8bc79dfc#;
   pragma Export (C, u00116, "ada__tagsS");
   u00117 : constant Version_32 := 16#3548d972#;
   pragma Export (C, u00117, "system__htableB");
   u00118 : constant Version_32 := 16#2303cef6#;
   pragma Export (C, u00118, "system__htableS");
   u00119 : constant Version_32 := 16#1f1abe38#;
   pragma Export (C, u00119, "system__string_hashB");
   u00120 : constant Version_32 := 16#84464e89#;
   pragma Export (C, u00120, "system__string_hashS");
   u00121 : constant Version_32 := 16#5fc04ee2#;
   pragma Export (C, u00121, "system__put_imagesB");
   u00122 : constant Version_32 := 16#0ed92da1#;
   pragma Export (C, u00122, "system__put_imagesS");
   u00123 : constant Version_32 := 16#22b9eb9f#;
   pragma Export (C, u00123, "ada__strings__text_buffers__utilsB");
   u00124 : constant Version_32 := 16#608bd105#;
   pragma Export (C, u00124, "ada__strings__text_buffers__utilsS");
   u00125 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00125, "system__finalization_rootB");
   u00126 : constant Version_32 := 16#ed28e58d#;
   pragma Export (C, u00126, "system__finalization_rootS");
   u00127 : constant Version_32 := 16#a8ed4e2b#;
   pragma Export (C, u00127, "system__atomic_countersB");
   u00128 : constant Version_32 := 16#7ec279de#;
   pragma Export (C, u00128, "system__atomic_countersS");
   u00129 : constant Version_32 := 16#f2ee0adc#;
   pragma Export (C, u00129, "ada__directories__hierarchical_file_namesB");
   u00130 : constant Version_32 := 16#34d5eeb2#;
   pragma Export (C, u00130, "ada__directories__hierarchical_file_namesS");
   u00131 : constant Version_32 := 16#ab4ad33a#;
   pragma Export (C, u00131, "ada__directories__validityB");
   u00132 : constant Version_32 := 16#0877bcae#;
   pragma Export (C, u00132, "ada__directories__validityS");
   u00133 : constant Version_32 := 16#091deb62#;
   pragma Export (C, u00133, "ada__strings__fixedB");
   u00134 : constant Version_32 := 16#780cfb01#;
   pragma Export (C, u00134, "ada__strings__fixedS");
   u00135 : constant Version_32 := 16#5a763444#;
   pragma Export (C, u00135, "ada__strings__searchB");
   u00136 : constant Version_32 := 16#dcefc5ee#;
   pragma Export (C, u00136, "ada__strings__searchS");
   u00137 : constant Version_32 := 16#cf7bfc56#;
   pragma Export (C, u00137, "ada__strings__unboundedB");
   u00138 : constant Version_32 := 16#90de6517#;
   pragma Export (C, u00138, "ada__strings__unboundedS");
   u00139 : constant Version_32 := 16#190570e0#;
   pragma Export (C, u00139, "system__compare_array_unsigned_8B");
   u00140 : constant Version_32 := 16#323c087e#;
   pragma Export (C, u00140, "system__compare_array_unsigned_8S");
   u00141 : constant Version_32 := 16#74e358eb#;
   pragma Export (C, u00141, "system__address_operationsB");
   u00142 : constant Version_32 := 16#dceebabd#;
   pragma Export (C, u00142, "system__address_operationsS");
   u00143 : constant Version_32 := 16#d50f3cfb#;
   pragma Export (C, u00143, "system__stream_attributesB");
   u00144 : constant Version_32 := 16#beb4b171#;
   pragma Export (C, u00144, "system__stream_attributesS");
   u00145 : constant Version_32 := 16#d998b4f3#;
   pragma Export (C, u00145, "system__stream_attributes__xdrB");
   u00146 : constant Version_32 := 16#42985e70#;
   pragma Export (C, u00146, "system__stream_attributes__xdrS");
   u00147 : constant Version_32 := 16#61e84971#;
   pragma Export (C, u00147, "system__fat_fltS");
   u00148 : constant Version_32 := 16#47da407c#;
   pragma Export (C, u00148, "system__fat_lfltS");
   u00149 : constant Version_32 := 16#3d0aee96#;
   pragma Export (C, u00149, "system__fat_llfS");
   u00150 : constant Version_32 := 16#32fdb361#;
   pragma Export (C, u00150, "system__file_attributesS");
   u00151 : constant Version_32 := 16#09793772#;
   pragma Export (C, u00151, "system__os_constantsS");
   u00152 : constant Version_32 := 16#1aa716c1#;
   pragma Export (C, u00152, "system__file_ioB");
   u00153 : constant Version_32 := 16#de785348#;
   pragma Export (C, u00153, "system__file_ioS");
   u00154 : constant Version_32 := 16#73d2d764#;
   pragma Export (C, u00154, "interfaces__c_streamsB");
   u00155 : constant Version_32 := 16#82d73129#;
   pragma Export (C, u00155, "interfaces__c_streamsS");
   u00156 : constant Version_32 := 16#002b610c#;
   pragma Export (C, u00156, "system__file_control_blockS");
   u00157 : constant Version_32 := 16#ee52fa88#;
   pragma Export (C, u00157, "system__finalization_mastersB");
   u00158 : constant Version_32 := 16#2489a36e#;
   pragma Export (C, u00158, "system__finalization_mastersS");
   u00159 : constant Version_32 := 16#35d6ef80#;
   pragma Export (C, u00159, "system__storage_poolsB");
   u00160 : constant Version_32 := 16#99e1245a#;
   pragma Export (C, u00160, "system__storage_poolsS");
   u00161 : constant Version_32 := 16#8f8e85c2#;
   pragma Export (C, u00161, "system__regexpB");
   u00162 : constant Version_32 := 16#81e831d1#;
   pragma Export (C, u00162, "system__regexpS");
   u00163 : constant Version_32 := 16#e56aa583#;
   pragma Export (C, u00163, "ada__text_ioB");
   u00164 : constant Version_32 := 16#5ec7e357#;
   pragma Export (C, u00164, "ada__text_ioS");
   u00165 : constant Version_32 := 16#62440350#;
   pragma Export (C, u00165, "es_fichierB");
   u00166 : constant Version_32 := 16#9414f93c#;
   pragma Export (C, u00166, "es_fichierS");
   u00167 : constant Version_32 := 16#e18a47a0#;
   pragma Export (C, u00167, "ada__float_text_ioB");
   u00168 : constant Version_32 := 16#495f738b#;
   pragma Export (C, u00168, "ada__float_text_ioS");
   u00169 : constant Version_32 := 16#44bc8f6a#;
   pragma Export (C, u00169, "ada__text_io__generic_auxB");
   u00170 : constant Version_32 := 16#38ee6479#;
   pragma Export (C, u00170, "ada__text_io__generic_auxS");
   u00171 : constant Version_32 := 16#a621ddec#;
   pragma Export (C, u00171, "system__img_fltS");
   u00172 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00172, "system__float_controlB");
   u00173 : constant Version_32 := 16#4226d521#;
   pragma Export (C, u00173, "system__float_controlS");
   u00174 : constant Version_32 := 16#2549028f#;
   pragma Export (C, u00174, "system__img_utilB");
   u00175 : constant Version_32 := 16#c9a0e932#;
   pragma Export (C, u00175, "system__img_utilS");
   u00176 : constant Version_32 := 16#7a258c58#;
   pragma Export (C, u00176, "system__powten_fltS");
   u00177 : constant Version_32 := 16#b21210e0#;
   pragma Export (C, u00177, "system__img_lfltS");
   u00178 : constant Version_32 := 16#ea896312#;
   pragma Export (C, u00178, "system__img_lluS");
   u00179 : constant Version_32 := 16#a1d642dc#;
   pragma Export (C, u00179, "system__powten_lfltS");
   u00180 : constant Version_32 := 16#ee24b312#;
   pragma Export (C, u00180, "system__img_llfS");
   u00181 : constant Version_32 := 16#9dd1b61e#;
   pragma Export (C, u00181, "system__powten_llfS");
   u00182 : constant Version_32 := 16#daeb2f58#;
   pragma Export (C, u00182, "system__val_fltS");
   u00183 : constant Version_32 := 16#07cab9e4#;
   pragma Export (C, u00183, "system__exn_fltS");
   u00184 : constant Version_32 := 16#7f0e6534#;
   pragma Export (C, u00184, "system__val_lfltS");
   u00185 : constant Version_32 := 16#b98b583d#;
   pragma Export (C, u00185, "system__exn_lfltS");
   u00186 : constant Version_32 := 16#241739fa#;
   pragma Export (C, u00186, "system__val_llfS");
   u00187 : constant Version_32 := 16#9425984d#;
   pragma Export (C, u00187, "system__exn_llfS");
   u00188 : constant Version_32 := 16#f64b89a4#;
   pragma Export (C, u00188, "ada__integer_text_ioB");
   u00189 : constant Version_32 := 16#5e9ebd8f#;
   pragma Export (C, u00189, "ada__integer_text_ioS");
   u00190 : constant Version_32 := 16#6b2d15e3#;
   pragma Export (C, u00190, "system__img_biuS");
   u00191 : constant Version_32 := 16#2673d23d#;
   pragma Export (C, u00191, "system__img_llbS");
   u00192 : constant Version_32 := 16#98c6c945#;
   pragma Export (C, u00192, "system__img_lliS");
   u00193 : constant Version_32 := 16#5182274f#;
   pragma Export (C, u00193, "system__img_lllbS");
   u00194 : constant Version_32 := 16#f316ccbd#;
   pragma Export (C, u00194, "system__img_llliS");
   u00195 : constant Version_32 := 16#5bf63e43#;
   pragma Export (C, u00195, "system__img_lllwS");
   u00196 : constant Version_32 := 16#7a41a736#;
   pragma Export (C, u00196, "system__img_llwS");
   u00197 : constant Version_32 := 16#54f7aed1#;
   pragma Export (C, u00197, "system__img_wiuS");
   u00198 : constant Version_32 := 16#40199964#;
   pragma Export (C, u00198, "system__val_intS");
   u00199 : constant Version_32 := 16#5b7e5917#;
   pragma Export (C, u00199, "system__val_unsS");
   u00200 : constant Version_32 := 16#3738e9f5#;
   pragma Export (C, u00200, "system__val_llliS");
   u00201 : constant Version_32 := 16#4f0fea27#;
   pragma Export (C, u00201, "system__val_llluS");
   u00202 : constant Version_32 := 16#1982dcd0#;
   pragma Export (C, u00202, "system__memoryB");
   u00203 : constant Version_32 := 16#f95ea4cd#;
   pragma Export (C, u00203, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.latin_1%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_operations%s
   --  system.float_control%s
   --  system.float_control%b
   --  system.img_int%s
   --  system.img_lli%s
   --  system.img_llli%s
   --  system.io%s
   --  system.io%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.powten_flt%s
   --  system.powten_lflt%s
   --  system.powten_llf%s
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%s
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_llb%s
   --  system.img_lllb%s
   --  system.img_lllw%s
   --  system.img_llu%s
   --  system.img_llw%s
   --  system.img_uns%s
   --  system.img_util%s
   --  system.img_util%b
   --  system.img_wiu%s
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%s
   --  system.wch_cnv%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.exn_flt%s
   --  system.exn_lflt%s
   --  system.exn_llf%s
   --  system.traceback%s
   --  system.traceback%b
   --  ada.characters.handling%s
   --  system.atomic_operations.test_and_set%s
   --  system.case_util%s
   --  system.os_lib%s
   --  system.secondary_stack%s
   --  system.standard_library%s
   --  ada.exceptions%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.soft_links%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_llu%s
   --  system.val_lli%s
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  ada.exceptions.traceback%b
   --  system.address_image%s
   --  system.address_image%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.bounded_strings%s
   --  system.bounded_strings%b
   --  system.case_util%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.containers%s
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps%b
   --  ada.strings.maps.constants%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.atomic_primitives%s
   --  system.atomic_primitives%b
   --  system.exceptions%s
   --  system.exceptions.machine%s
   --  system.exceptions.machine%b
   --  ada.characters.handling%b
   --  system.atomic_operations.test_and_set%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.mmap%s
   --  system.mmap.os_interface%s
   --  system.mmap%b
   --  system.mmap.unix%s
   --  system.mmap.os_interface%b
   --  system.object_reader%s
   --  system.object_reader%b
   --  system.dwarf_lines%s
   --  system.dwarf_lines%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.soft_links.initialize%s
   --  system.soft_links.initialize%b
   --  system.soft_links%b
   --  system.standard_library%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.fixed%s
   --  ada.strings.fixed%b
   --  ada.strings.utf_encoding%s
   --  ada.strings.utf_encoding%b
   --  ada.strings.utf_encoding.wide_strings%s
   --  ada.strings.utf_encoding.wide_strings%b
   --  ada.strings.utf_encoding.wide_wide_strings%s
   --  ada.strings.utf_encoding.wide_wide_strings%b
   --  ada.tags%s
   --  ada.tags%b
   --  ada.strings.text_buffers%s
   --  ada.strings.text_buffers%b
   --  ada.strings.text_buffers.utils%s
   --  ada.strings.text_buffers.utils%b
   --  system.atomic_counters%s
   --  system.atomic_counters%b
   --  system.fat_flt%s
   --  system.fat_lflt%s
   --  system.fat_llf%s
   --  system.img_flt%s
   --  system.img_lflt%s
   --  system.img_llf%s
   --  system.os_constants%s
   --  system.put_images%s
   --  system.put_images%b
   --  ada.streams%s
   --  ada.streams%b
   --  system.file_control_block%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.containers.helpers%s
   --  ada.containers.helpers%b
   --  system.file_io%s
   --  system.file_io%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.finalization_masters%b
   --  system.stream_attributes%s
   --  system.stream_attributes.xdr%s
   --  system.stream_attributes.xdr%b
   --  system.stream_attributes%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  system.val_flt%s
   --  system.val_lflt%s
   --  system.val_llf%s
   --  system.val_lllu%s
   --  system.val_llli%s
   --  system.val_uns%s
   --  system.val_int%s
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.float_text_io%s
   --  ada.float_text_io%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.file_attributes%s
   --  system.regexp%s
   --  system.regexp%b
   --  ada.directories%s
   --  ada.directories.hierarchical_file_names%s
   --  ada.directories.validity%s
   --  ada.directories.validity%b
   --  ada.directories%b
   --  ada.directories.hierarchical_file_names%b
   --  es_fichier%s
   --  es_fichier%b
   --  test_es_fichier%b
   --  END ELABORATION ORDER

end ada_main;
