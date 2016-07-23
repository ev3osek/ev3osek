<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:9d6ce390-4d44-4400-939c-b4fe1c7fb12e(oil.sandbox.Linefollower)">
  <persistence version="9" />
  <languages>
    <use id="159e346e-43bd-4325-9139-eb179631a38c" name="de.whz.external" version="0" />
    <use id="7a30de00-cb30-45dd-ab11-776f84eb73fe" name="de.whz.osek" version="0" />
    <use id="b5816e12-8c8a-48cb-b63a-257253332775" name="de.whz.osek.mindstorms" version="0" />
    <use id="017fba0e-af15-4a23-b0a8-02b5c1141e75" name="com.mbeddr.cc.var.annotations" version="0" />
    <use id="e401b447-8019-4ccd-a72c-bfb0230f5782" name="com.mbeddr.cc.var.fm" version="1" />
    <devkit ref="d2a9c55c-6bdc-4cc2-97e1-4ba7552f5584(com.mbeddr.core)" />
  </languages>
  <imports>
    <import index="ei6g" ref="r:e45d922f-1536-49e9-9e76-fb0f78d94041(de.whz.osek.mindstorms.rt)" implicit="true" />
    <import index="tzd5" ref="r:0126c7d2-560a-4504-a602-3e7bcb88fde4(de.whz.osek.rt)" implicit="true" />
    <import index="k7td" ref="r:494f59bd-1442-4e92-9db8-2bc4ada1797a(de.whz.external)" implicit="true" />
  </imports>
  <registry>
    <language id="a9d69647-0840-491e-bf39-2eb0805d2011" name="com.mbeddr.core.statements">
      <concept id="8441331188640862326" name="com.mbeddr.core.statements.structure.BreakStatement" flags="ng" index="27uf6b" />
      <concept id="8441331188640771826" name="com.mbeddr.core.statements.structure.WhileStatement" flags="ng" index="27v$Wf">
        <child id="8441331188640771828" name="body" index="27v$W9" />
        <child id="8441331188640771827" name="condition" index="27v$We" />
      </concept>
      <concept id="6275792049641600983" name="com.mbeddr.core.statements.structure.IfStatement" flags="ng" index="c0U19">
        <child id="6275792049641600984" name="condition" index="c0U16" />
        <child id="6275792049641600985" name="thenPart" index="c0U17" />
        <child id="3134547887598498723" name="elseIfs" index="gg_kh" />
        <child id="3134547887598486571" name="elsePart" index="ggAap" />
      </concept>
      <concept id="3134547887598498470" name="com.mbeddr.core.statements.structure.ElseIfPart" flags="ng" index="gg_gk">
        <child id="3134547887598498471" name="body" index="gg_gl" />
        <child id="3134547887598498479" name="condition" index="gg_gt" />
      </concept>
      <concept id="7763322639126652757" name="com.mbeddr.core.statements.structure.ITypeContainingType" flags="ng" index="2umbIr">
        <child id="7763322639126652758" name="baseType" index="2umbIo" />
      </concept>
      <concept id="1494329074535282918" name="com.mbeddr.core.statements.structure.ElsePart" flags="ng" index="1ly_i6">
        <child id="1494329074535283249" name="body" index="1ly_ph" />
      </concept>
      <concept id="7254843406768833938" name="com.mbeddr.core.statements.structure.ExpressionStatement" flags="ng" index="1_9egQ">
        <child id="7254843406768833939" name="expr" index="1_9egR" />
      </concept>
      <concept id="1679452829930336984" name="com.mbeddr.core.statements.structure.CommentStatement" flags="ng" index="1QiMYF">
        <child id="8624890525768479139" name="textblock" index="3SJzmv" />
      </concept>
      <concept id="8132151755547066635" name="com.mbeddr.core.statements.structure.ContinueStatement" flags="ng" index="3Safn$" />
      <concept id="4185783222026475238" name="com.mbeddr.core.statements.structure.LocalVariableDeclaration" flags="ng" index="3XIRlf">
        <child id="4185783222026502647" name="init" index="3XIe9u" />
      </concept>
      <concept id="4185783222026475861" name="com.mbeddr.core.statements.structure.StatementList" flags="ng" index="3XIRFW">
        <child id="4185783222026475862" name="statements" index="3XIRFZ" />
      </concept>
      <concept id="4185783222026464515" name="com.mbeddr.core.statements.structure.Statement" flags="ng" index="3XISUE" />
      <concept id="2093108837558113914" name="com.mbeddr.core.statements.structure.LocalVarRef" flags="ng" index="3ZVu4v">
        <reference id="2093108837558124071" name="var" index="3ZVs_2" />
      </concept>
    </language>
    <language id="7a30de00-cb30-45dd-ab11-776f84eb73fe" name="de.whz.osek">
      <concept id="2006000646084265599" name="de.whz.osek.structure.EventMaskType" flags="ng" index="22Q3ya" />
      <concept id="5314349176037211237" name="de.whz.osek.structure.EventDeclaration" flags="ng" index="bPy0e" />
      <concept id="5386172915620401270" name="de.whz.osek.structure.OsekExecutable" flags="ng" index="2cRtvc" />
      <concept id="5386789703557459044" name="de.whz.osek.structure.ExtendedTask" flags="ng" index="2yxTjl">
        <child id="5386789703557459045" name="events" index="2yxTjk" />
      </concept>
      <concept id="5539536996663425168" name="de.whz.osek.structure.TerminateTaskStatement" flags="ng" index="QCpGs" />
      <concept id="3455329014158468467" name="de.whz.osek.structure.TaskMacro" flags="ng" index="18XYSt">
        <reference id="3455329014158468471" name="oilTask" index="18XYSp" />
      </concept>
      <concept id="1748589669711250635" name="de.whz.osek.structure.OilFile" flags="ng" index="1hiFB1">
        <property id="1748589669711297437" name="oilVersion" index="1hiKqn" />
        <child id="8856442871040962239" name="cpu" index="1v1S_x" />
      </concept>
      <concept id="1748589669711636823" name="de.whz.osek.structure.AppModeType" flags="ng" index="1hk5ht">
        <reference id="1748589669711636824" name="appMode" index="1hk5hi" />
      </concept>
      <concept id="1748589669711635627" name="de.whz.osek.structure.EventLiteral" flags="ng" index="1hk5Ax">
        <child id="8230360703443541364" name="mask" index="1$bw00" />
      </concept>
      <concept id="1748589669711636310" name="de.whz.osek.structure.TaskRef" flags="ng" index="1hk5Ds">
        <reference id="1748589669711636311" name="task" index="1hk5Dt" />
      </concept>
      <concept id="1748589669711636430" name="de.whz.osek.structure.EventRef" flags="ng" index="1hk5F4">
        <reference id="6616213586235273506" name="event" index="2euN8h" />
      </concept>
      <concept id="1748589669711635212" name="de.whz.osek.structure.Task" flags="ng" index="1hk5S6">
        <property id="4440685318312908091" name="schedule" index="3gXiVZ" />
        <child id="5386789703557459047" name="resources" index="2yxTjm" />
        <child id="5917907947848927324" name="stacksize" index="36RUAK" />
        <child id="6962994334519590179" name="appModes" index="3aInHn" />
        <child id="8230360703443541359" name="activationAmount" index="1$bw0r" />
        <child id="8230360703443541355" name="priority" index="1$bw0v" />
      </concept>
      <concept id="1748589669711635319" name="de.whz.osek.structure.ResourceRef" flags="ng" index="1hk5TX">
        <reference id="5917907947849493442" name="resource" index="379KCI" />
      </concept>
      <concept id="1748589669711635404" name="de.whz.osek.structure.Alarm" flags="ng" index="1hk5V6">
        <reference id="8856442871041222564" name="counter" index="1v6S1U" />
        <child id="8856442871041224123" name="action" index="1v6SD_" />
        <child id="8856442871041222671" name="autostart" index="1v6SZh" />
      </concept>
      <concept id="1748589669711635125" name="de.whz.osek.structure.AppMode" flags="ng" index="1hk5YZ" />
      <concept id="1748589669711583492" name="de.whz.osek.structure.CPU" flags="ng" index="1hlUge">
        <child id="6962994334519642309" name="events" index="3aI4UL" />
        <child id="1748589669711635098" name="os" index="1hk5Yg" />
        <child id="1748589669711635180" name="appModes" index="1hk5ZA" />
        <child id="6637659417469863484" name="counters" index="3qjf8I" />
        <child id="8856442871040973848" name="resources" index="1v67J6" />
        <child id="8856442871040973844" name="tasks" index="1v67Ja" />
        <child id="8856442871041199224" name="alarms" index="1v6YIA" />
      </concept>
      <concept id="1748589669711583504" name="de.whz.osek.structure.OS" flags="ng" index="1hlUgq">
        <property id="1748589669711583518" name="status" index="1hlUgk" />
      </concept>
      <concept id="6637659417469770051" name="de.whz.osek.structure.Counter" flags="ng" index="3qkAPh">
        <child id="8230360703443541346" name="minCycle" index="1$bw0m" />
        <child id="8230360703443541343" name="ticksPerBase" index="1$bw0F" />
        <child id="8230360703443541324" name="maxAllowedValue" index="1$bw0S" />
      </concept>
      <concept id="7207764911834149556" name="de.whz.osek.structure.ResourceLiteral" flags="ng" index="3uoiPb">
        <property id="7207764911834151445" name="property" index="3uoinE" />
      </concept>
      <concept id="7207764911834169913" name="de.whz.osek.structure.ResourceDeclaration" flags="ng" index="3uopR6" />
      <concept id="8856442871041223276" name="de.whz.osek.structure.AlarmActionActivateTask" flags="ng" index="1v6SQM">
        <reference id="8856442871041223485" name="task" index="1v6SNz" />
      </concept>
      <concept id="8856442871041199703" name="de.whz.osek.structure.AlarmAutostart" flags="ng" index="1v6YA9">
        <child id="8856442871041199512" name="appModes" index="1v6YD6" />
        <child id="8230360703443541350" name="alarmTime" index="1$bw0i" />
        <child id="8230360703443541352" name="cycleTime" index="1$bw0s" />
      </concept>
    </language>
    <language id="92d2ea16-5a42-4fdf-a676-c7604efe3504" name="de.slisson.mps.richtext">
      <concept id="2557074442922380897" name="de.slisson.mps.richtext.structure.Text" flags="ng" index="19SGf9">
        <child id="2557074442922392302" name="words" index="19SJt6" />
      </concept>
      <concept id="2557074442922438156" name="de.slisson.mps.richtext.structure.Word" flags="ng" index="19SUe$">
        <property id="2557074442922438158" name="escapedValue" index="19SUeA" />
      </concept>
    </language>
    <language id="2d7fadf5-33f6-4e80-a78f-0f739add2bde" name="com.mbeddr.core.buildconfig">
      <concept id="5046689135693761556" name="com.mbeddr.core.buildconfig.structure.Binary" flags="ng" index="2eOfOj">
        <child id="5046689135693761559" name="referencedModules" index="2eOfOg" />
      </concept>
      <concept id="5046689135693761554" name="com.mbeddr.core.buildconfig.structure.Executable" flags="ng" index="2eOfOl">
        <property id="3431613015799084476" name="isTest" index="iO3LB" />
      </concept>
      <concept id="7717755763392524104" name="com.mbeddr.core.buildconfig.structure.BuildConfiguration" flags="ng" index="2v9HqL">
        <child id="5046689135694070731" name="binaries" index="2ePNbc" />
        <child id="5323740605968447026" name="target" index="2AWWZH" />
      </concept>
      <concept id="7717755763392524107" name="com.mbeddr.core.buildconfig.structure.ModuleRef" flags="ng" index="2v9HqM">
        <reference id="7717755763392524108" name="module" index="2v9HqP" />
      </concept>
    </language>
    <language id="3bf5377a-e904-4ded-9754-5a516023bfaa" name="com.mbeddr.core.pointers">
      <concept id="6113173064526131575" name="com.mbeddr.core.pointers.structure.StringLiteral" flags="ng" index="PhEJO">
        <property id="6113173064526131578" name="value" index="PhEJT" />
      </concept>
      <concept id="1595838349830846141" name="com.mbeddr.core.pointers.structure.ReferenceExpr" flags="ng" index="YInwV" />
      <concept id="279446265608459824" name="com.mbeddr.core.pointers.structure.PointerType" flags="ng" index="3wxxNl" />
    </language>
    <language id="efda956e-491e-4f00-ba14-36af2f213ecf" name="com.mbeddr.core.udt">
      <concept id="7099329415459817973" name="com.mbeddr.core.udt.structure.SUDeclaration" flags="ng" index="HsMI8">
        <child id="7099329415459888018" name="members" index="HszBJ" />
      </concept>
      <concept id="5882395403881875736" name="com.mbeddr.core.udt.structure.Member" flags="ng" index="1dpRTG" />
      <concept id="6394819151180597807" name="com.mbeddr.core.udt.structure.StructDeclaration" flags="ng" index="1sgJKc" />
      <concept id="6394819151180597816" name="com.mbeddr.core.udt.structure.StructType" flags="ng" index="1sgJKr">
        <reference id="6394819151180597817" name="struct" index="1sgJKq" />
      </concept>
      <concept id="8811614583515726007" name="com.mbeddr.core.udt.structure.EnumLiteralRef" flags="ng" index="1AkAhK">
        <reference id="8811614583515726008" name="literal" index="1AkAhZ" />
      </concept>
      <concept id="7034214596253391076" name="com.mbeddr.core.udt.structure.GenericMemberRef" flags="ng" index="1E4Tgc">
        <reference id="7034214596253391078" name="member" index="1E4Tge" />
      </concept>
    </language>
    <language id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base">
      <concept id="8375407818529178006" name="com.mbeddr.core.base.structure.TextBlock" flags="ng" index="OjmMv">
        <child id="8375407818529178007" name="text" index="OjmMu" />
      </concept>
      <concept id="4459718605982007337" name="com.mbeddr.core.base.structure.IConfigurationContainer" flags="ng" index="2Q9xDo">
        <child id="4459718605982007338" name="configurationItems" index="2Q9xDr" />
      </concept>
      <concept id="3857533489766146428" name="com.mbeddr.core.base.structure.ElementDocumentation" flags="ng" index="1z9TsT">
        <child id="4052432714772608243" name="text" index="1w35rA" />
      </concept>
      <concept id="747084250476811597" name="com.mbeddr.core.base.structure.DefaultGenericChunkDependency" flags="ng" index="3GEVxB">
        <reference id="747084250476878887" name="chunk" index="3GEb4d" />
      </concept>
    </language>
    <language id="6d11763d-483d-4b2b-8efc-09336c1b0001" name="com.mbeddr.core.modules">
      <concept id="3788988821851860886" name="com.mbeddr.core.modules.structure.GlobalConstantDeclaration" flags="ng" index="4WHVk" />
      <concept id="3788988821852026523" name="com.mbeddr.core.modules.structure.GlobalConstantRef" flags="ng" index="4ZOvp">
        <reference id="3376775282622611130" name="constant" index="2DPCA0" />
      </concept>
      <concept id="8967919205527146149" name="com.mbeddr.core.modules.structure.ReturnStatement" flags="ng" index="2BFjQ_">
        <child id="8967919205527146150" name="expression" index="2BFjQA" />
      </concept>
      <concept id="3376775282622142916" name="com.mbeddr.core.modules.structure.AbstractDefineLike" flags="ng" index="2DRUVY">
        <child id="3376775282622233992" name="value" index="2DQcEM" />
      </concept>
      <concept id="8105003328814797298" name="com.mbeddr.core.modules.structure.IFunctionLike" flags="ng" index="2H9T1B">
        <child id="5708867820623310661" name="arguments" index="1UOdpc" />
      </concept>
      <concept id="6437088627575722813" name="com.mbeddr.core.modules.structure.Module" flags="ng" index="N3F4X">
        <child id="6437088627575722833" name="contents" index="N3F5h" />
        <child id="1317894735999304826" name="imports" index="2OODSX" />
      </concept>
      <concept id="6437088627575722830" name="com.mbeddr.core.modules.structure.ImplementationModule" flags="ng" index="N3F5e" />
      <concept id="6437088627575722831" name="com.mbeddr.core.modules.structure.IModuleContent" flags="ng" index="N3F5f">
        <property id="1317894735999272944" name="exported" index="2OOxQR" />
      </concept>
      <concept id="6437088627575724001" name="com.mbeddr.core.modules.structure.Function" flags="ng" index="N3Fnx">
        <child id="4185783222026475860" name="body" index="3XIRFX" />
      </concept>
      <concept id="8934095934011938595" name="com.mbeddr.core.modules.structure.EmptyModuleContent" flags="ng" index="2NXPZ9" />
      <concept id="7892328519581704407" name="com.mbeddr.core.modules.structure.Argument" flags="ng" index="19RgSI" />
      <concept id="6708182213627045678" name="com.mbeddr.core.modules.structure.IExternable" flags="ng" index="3mNis0">
        <property id="6708182213627045681" name="extern" index="3mNisv" />
      </concept>
      <concept id="5950410542643524492" name="com.mbeddr.core.modules.structure.FunctionCall" flags="ng" index="3O_q_g">
        <reference id="5950410542643524493" name="function" index="3O_q_h" />
        <child id="5950410542643524495" name="actuals" index="3O_q_j" />
      </concept>
      <concept id="6610873504380357354" name="com.mbeddr.core.modules.structure.GlobalVarRef" flags="ng" index="1S7827">
        <reference id="6610873504380357355" name="var" index="1S7826" />
      </concept>
      <concept id="6610873504380335822" name="com.mbeddr.core.modules.structure.GlobalVariableDeclaration" flags="ng" index="1S7NMz" />
      <concept id="2093108837558505658" name="com.mbeddr.core.modules.structure.ArgumentRef" flags="ng" index="3ZUYvv">
        <reference id="2093108837558505659" name="arg" index="3ZUYvu" />
      </concept>
    </language>
    <language id="b5816e12-8c8a-48cb-b63a-257253332775" name="de.whz.osek.mindstorms">
      <concept id="5539536996663091217" name="de.whz.osek.mindstorms.structure.EV3Platform" flags="ng" index="QR8et">
        <property id="3356290354729003068" name="ev3_osekDotMakPath" index="2U8HxR" />
        <property id="7467785128650067750" name="compiler" index="1bwMw$" />
        <property id="7467785128650067752" name="make" index="1bwMwE" />
      </concept>
    </language>
    <language id="017fba0e-af15-4a23-b0a8-02b5c1141e75" name="com.mbeddr.cc.var.annotations">
      <concept id="661141253149262080" name="com.mbeddr.cc.var.annotations.structure.FeatureModelConfiguration" flags="ng" index="2dvl_R">
        <reference id="661141253149262081" name="featureModel" index="2dvl_Q" />
        <reference id="7455436784495586129" name="configModel" index="AiAcg" />
      </concept>
      <concept id="6617704999132114000" name="com.mbeddr.cc.var.annotations.structure.ConfigurationMapping" flags="ng" index="IjAfM">
        <reference id="6617704999132114002" name="featureModel" index="IjAfK" />
        <reference id="6617704999132114003" name="configurationModel" index="IjAfL" />
      </concept>
      <concept id="6514264311693667923" name="com.mbeddr.cc.var.annotations.structure.VariabilityConfigItem" flags="ng" index="35TzUN">
        <child id="4920787109780106774" name="mappings" index="19yoJo" />
      </concept>
    </language>
    <language id="e401b447-8019-4ccd-a72c-bfb0230f5782" name="com.mbeddr.cc.var.fm">
      <concept id="8473958930087782177" name="com.mbeddr.cc.var.fm.structure.RootFeature" flags="ng" index="28I2Iu" />
      <concept id="6825476687691297416" name="com.mbeddr.cc.var.fm.structure.ConfigurationModel" flags="ng" index="Id4hE">
        <reference id="6825476687691297418" name="configures" index="Id4hC" />
        <child id="6825476687691297417" name="rootFeature" index="Id4hF" />
      </concept>
      <concept id="6825476687691297422" name="com.mbeddr.cc.var.fm.structure.SelectedFeature" flags="ng" index="Id4hG">
        <reference id="6825476687691297425" name="feature" index="Id4hN" />
        <child id="6825476687691297423" name="children" index="Id4hH" />
      </concept>
      <concept id="6825476687691297426" name="com.mbeddr.cc.var.fm.structure.Feature" flags="ng" index="Id4hK">
        <child id="6825476687691297427" name="constraint" index="Id4hL" />
        <child id="6825476687691297428" name="children" index="Id4hQ" />
      </concept>
      <concept id="6825476687691297434" name="com.mbeddr.cc.var.fm.structure.FeatureModel" flags="ng" index="Id4hS">
        <child id="6825476687691297435" name="root" index="Id4hT" />
      </concept>
      <concept id="6825476687691337712" name="com.mbeddr.cc.var.fm.structure.VariabilitySupport" flags="ng" index="Idr$i">
        <child id="6825476687691337713" name="contents" index="Idr$j" />
      </concept>
      <concept id="6825476687691317627" name="com.mbeddr.cc.var.fm.structure.OptionalConstraint" flags="ng" index="Idvup" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
      <concept id="709746936026466394" name="jetbrains.mps.lang.core.structure.ChildAttribute" flags="ng" index="3VBwX9">
        <property id="709746936026609031" name="linkId" index="3V$3ak" />
        <property id="709746936026609029" name="linkRole" index="3V$3am" />
      </concept>
      <concept id="4452961908202556907" name="jetbrains.mps.lang.core.structure.BaseCommentAttribute" flags="ng" index="1X3_iC">
        <child id="3078666699043039389" name="commentedNode" index="8Wnug" />
      </concept>
    </language>
    <language id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions">
      <concept id="8463282783691618466" name="com.mbeddr.core.expressions.structure.UnsignedInt16tType" flags="ng" index="26VqpV" />
      <concept id="8463282783691618426" name="com.mbeddr.core.expressions.structure.Int8tType" flags="ng" index="26Vqqz" />
      <concept id="3005510381523579442" name="com.mbeddr.core.expressions.structure.UnaryExpression" flags="ng" index="2aKSnQ">
        <child id="7254843406768839760" name="expression" index="1_9fRO" />
      </concept>
      <concept id="8864856114140038681" name="com.mbeddr.core.expressions.structure.DoubleType" flags="ng" index="2fgwQN" />
      <concept id="2212975673976017893" name="com.mbeddr.core.expressions.structure.NumericLiteral" flags="ng" index="2hns93">
        <property id="2212975673976043696" name="value" index="2hmy$m" />
      </concept>
      <concept id="4620120465980402700" name="com.mbeddr.core.expressions.structure.GenericDotExpression" flags="ng" index="2qmXGp">
        <child id="7034214596252529803" name="target" index="1ESnxz" />
      </concept>
      <concept id="5763383285156373020" name="com.mbeddr.core.expressions.structure.MultiExpression" flags="ng" index="2BOcij" />
      <concept id="5763383285156373018" name="com.mbeddr.core.expressions.structure.MinusExpression" flags="ng" index="2BOcil" />
      <concept id="5763383285156373013" name="com.mbeddr.core.expressions.structure.PlusExpression" flags="ng" index="2BOciq" />
      <concept id="5763383285156533447" name="com.mbeddr.core.expressions.structure.ParensExpression" flags="ng" index="2BPB98" />
      <concept id="318113533128716675" name="com.mbeddr.core.expressions.structure.ITyped" flags="ng" index="2C2TGh">
        <child id="318113533128716676" name="type" index="2C2TGm" />
      </concept>
      <concept id="8399455261460717642" name="com.mbeddr.core.expressions.structure.OrExpression" flags="ng" index="2EHzL4" />
      <concept id="8399455261460717640" name="com.mbeddr.core.expressions.structure.AndExpression" flags="ng" index="2EHzL6" />
      <concept id="1136530067488156615" name="com.mbeddr.core.expressions.structure.BitwiseORExpression" flags="ng" index="EUQZk" />
      <concept id="5962749441518381743" name="com.mbeddr.core.expressions.structure.BitwiseAndExpression" flags="ng" index="SSPID" />
      <concept id="3820836583575227340" name="com.mbeddr.core.expressions.structure.DirectPlusAssignmentExpression" flags="ng" index="TPXPH" />
      <concept id="3830958861296781575" name="com.mbeddr.core.expressions.structure.NotExpression" flags="ng" index="19$8ne" />
      <concept id="7892328519581699353" name="com.mbeddr.core.expressions.structure.VoidType" flags="ng" index="19Rifw" />
      <concept id="22102029902365709" name="com.mbeddr.core.expressions.structure.AssignmentExpr" flags="ng" index="3pqW6w" />
      <concept id="6610873504380029780" name="com.mbeddr.core.expressions.structure.CastExpression" flags="ng" index="1S8S4T">
        <child id="6610873504380029790" name="targetType" index="1S8S4N" />
        <child id="6610873504380029782" name="expr" index="1S8S4V" />
      </concept>
      <concept id="8860443239512147449" name="com.mbeddr.core.expressions.structure.LessExpression" flags="ng" index="3Tl9Jn" />
      <concept id="8860443239512147447" name="com.mbeddr.core.expressions.structure.GreaterEqualsExpression" flags="ng" index="3Tl9Jp" />
      <concept id="8860443239512147445" name="com.mbeddr.core.expressions.structure.GreaterExpression" flags="ng" index="3Tl9Jr" />
      <concept id="8860443239512128058" name="com.mbeddr.core.expressions.structure.BooleanType" flags="ng" index="3TlMgk" />
      <concept id="8860443239512128054" name="com.mbeddr.core.expressions.structure.Type" flags="ng" index="3TlMgo">
        <property id="2941277002445651368" name="const" index="2c7vTL" />
        <property id="2941277002448691247" name="volatile" index="2caQfQ" />
      </concept>
      <concept id="8860443239512128052" name="com.mbeddr.core.expressions.structure.BinaryExpression" flags="ng" index="3TlMgq">
        <child id="8860443239512128064" name="left" index="3TlMhI" />
        <child id="8860443239512128065" name="right" index="3TlMhJ" />
      </concept>
      <concept id="8860443239512128103" name="com.mbeddr.core.expressions.structure.NumberLiteral" flags="ng" index="3TlMh9" />
      <concept id="8860443239512128099" name="com.mbeddr.core.expressions.structure.FalseLiteral" flags="ng" index="3TlMhd" />
      <concept id="8860443239512128094" name="com.mbeddr.core.expressions.structure.TrueLiteral" flags="ng" index="3TlMhK" />
    </language>
  </registry>
  <node concept="2v9HqL" id="4EZxVF6pCNt">
    <node concept="2cRtvc" id="3biQP486PWy" role="2ePNbc">
      <property role="iO3LB" value="false" />
      <property role="TrG5h" value="Linefollower" />
      <node concept="2v9HqM" id="3biQP486PWG" role="2eOfOg">
        <ref role="2v9HqP" node="5g5RAGpVlbu" resolve="LinefollowerTask" />
      </node>
      <node concept="2v9HqM" id="3biQP486PWL" role="2eOfOg">
        <ref role="2v9HqP" node="4osOqZkm2sh" resolve="LightValueEventDispatcherTask" />
      </node>
      <node concept="2v9HqM" id="3biQP486PWT" role="2eOfOg">
        <ref role="2v9HqP" node="5g5RAGpXkGH" resolve="TouchEventDispatcherTask" />
      </node>
      <node concept="2v9HqM" id="3biQP486PX3" role="2eOfOg">
        <ref role="2v9HqP" to="ei6g:3tDp_yW6whK" resolve="ecrobot_interface" />
      </node>
      <node concept="2v9HqM" id="3biQP486PXf" role="2eOfOg">
        <ref role="2v9HqP" to="tzd5:2UjW4IkHtzb" resolve="kernel" />
      </node>
      <node concept="2v9HqM" id="3biQP486PXt" role="2eOfOg">
        <ref role="2v9HqP" to="tzd5:2UjW4IkHtze" resolve="osek" />
      </node>
      <node concept="2v9HqM" id="5YkaFUJVQo6" role="2eOfOg">
        <ref role="2v9HqP" to="k7td:5YkaFUJVGNP" resolve="stdio_stub" />
      </node>
      <node concept="2v9HqM" id="GqrtFI5RqB" role="2eOfOg">
        <ref role="2v9HqP" node="2CJ7vlDPYcx" resolve="LinefollowerOil" />
      </node>
    </node>
    <node concept="QR8et" id="4osOqZklR7d" role="2AWWZH">
      <property role="1bwMw$" value="gcc" />
      <property role="1bwMwE" value="make" />
      <property role="2U8HxR" value="../../../../../../../OSEK_EV3/OSEK_EV3.mak" />
    </node>
    <node concept="35TzUN" id="3biQP486NtI" role="2Q9xDr">
      <node concept="IjAfM" id="3biQP486NtM" role="19yoJo">
        <ref role="IjAfK" node="3biQP486ju6" resolve="DebugFeature" />
        <ref role="IjAfL" node="3biQP486ju_" resolve="DoDebug" />
      </node>
    </node>
  </node>
  <node concept="Idr$i" id="3biQP486ju3">
    <property role="TrG5h" value="LfVariability" />
    <node concept="Id4hS" id="3biQP486ju6" role="Idr$j">
      <property role="TrG5h" value="DebugFeature" />
      <node concept="28I2Iu" id="3biQP486ju7" role="Id4hT">
        <node concept="Idvup" id="3biQP486ju8" role="Id4hL" />
        <node concept="Id4hK" id="3biQP486jud" role="Id4hQ">
          <property role="TrG5h" value="IsDebug" />
        </node>
      </node>
    </node>
    <node concept="Id4hE" id="3biQP486ju_" role="Idr$j">
      <property role="TrG5h" value="DoDebug" />
      <ref role="Id4hC" node="3biQP486ju6" resolve="DebugFeature" />
      <node concept="Id4hG" id="3biQP486juJ" role="Id4hF">
        <ref role="Id4hN" node="3biQP486ju7" resolve="DebugFeature_root" />
        <node concept="Id4hG" id="3biQP486juN" role="Id4hH">
          <ref role="Id4hN" node="3biQP486jud" resolve="IsDebug" />
        </node>
      </node>
    </node>
    <node concept="Id4hE" id="3biQP486Mp5" role="Idr$j">
      <property role="TrG5h" value="DoNotDebug" />
      <ref role="Id4hC" node="3biQP486ju6" resolve="DebugFeature" />
      <node concept="Id4hG" id="3biQP486Mpi" role="Id4hF">
        <ref role="Id4hN" node="3biQP486ju7" resolve="DebugFeature_root" />
      </node>
    </node>
  </node>
  <node concept="N3F5e" id="4osOqZkm2sh">
    <property role="TrG5h" value="LightValueEventDispatcherTask" />
    <node concept="1S7NMz" id="4osOqZkm2sr" role="N3F5h">
      <property role="TrG5h" value="lightSensorValue" />
      <property role="3mNisv" value="false" />
      <property role="2OOxQR" value="true" />
      <node concept="26VqpV" id="4osOqZkm2ss" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="2NXPZ9" id="4B0n6H28e9D" role="N3F5h">
      <property role="TrG5h" value="empty_1454466460583_3" />
    </node>
    <node concept="2NXPZ9" id="2CJ7vlDRhzi" role="N3F5h">
      <property role="TrG5h" value="empty_1468592633088_21" />
    </node>
    <node concept="18XYSt" id="2CJ7vlDRgCo" role="N3F5h">
      <ref role="18XYSp" node="2CJ7vlDQS6S" resolve="LightValueEventDispatcherTask" />
      <node concept="3XIRFW" id="2CJ7vlDRgCq" role="3XIRFX">
        <node concept="1QiMYF" id="2CJ7vlDRjPQ" role="3XIRFZ">
          <node concept="OjmMv" id="2CJ7vlDRjPS" role="3SJzmv">
            <node concept="19SGf9" id="2CJ7vlDRjPT" role="OjmMu">
              <node concept="19SUe$" id="2CJ7vlDRjPU" role="19SJt6">
                <property role="19SUeA" value="TODO: #ifdef Debug_Output" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="2CJ7vlDRjUb" role="3XIRFZ">
          <node concept="3O_q_g" id="2CJ7vlDRjU9" role="1_9egR">
            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
            <node concept="PhEJO" id="2CJ7vlDRjVl" role="3O_q_j">
              <property role="PhEJT" value="Starting LightEventTask\n\r" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="2CJ7vlDRk5I" role="3XIRFZ" />
        <node concept="1_9egQ" id="2CJ7vlDRgRx" role="3XIRFZ">
          <node concept="3O_q_g" id="2CJ7vlDRgRv" role="1_9egR">
            <ref role="3O_q_h" to="tzd5:2hqbsEGB5gH" resolve="GetResource" />
            <node concept="4ZOvp" id="2CJ7vlDRgSS" role="3O_q_j">
              <ref role="2DPCA0" node="2CJ7vlDPYc_" resolve="LightValue" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="GqrtFI6me3" role="3XIRFZ" />
        <node concept="1_9egQ" id="GqrtFI6m8r" role="3XIRFZ">
          <node concept="3pqW6w" id="GqrtFI6m9j" role="1_9egR">
            <node concept="3O_q_g" id="GqrtFI6mab" role="3TlMhJ">
              <ref role="3O_q_h" to="ei6g:3QwuWjHjKaZ" resolve="ecrobot_get_nxtcolorsensor_light" />
              <node concept="1AkAhK" id="GqrtFI6mbB" role="3O_q_j">
                <ref role="1AkAhZ" to="ei6g:3tDp_yW5KZ3" resolve="EV3_PORT_S2" />
              </node>
            </node>
            <node concept="1S7827" id="GqrtFI6m8p" role="3TlMhI">
              <ref role="1S7826" node="4osOqZkm2sr" resolve="lightSensorValue" />
            </node>
          </node>
        </node>
        <node concept="1QiMYF" id="2CJ7vlDRjQS" role="3XIRFZ">
          <node concept="OjmMv" id="2CJ7vlDRjQU" role="3SJzmv">
            <node concept="19SGf9" id="2CJ7vlDRjQV" role="OjmMu">
              <node concept="19SUe$" id="2CJ7vlDRjQW" role="19SJt6">
                <property role="19SUeA" value="TODO: #ifdef Debug_Output" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="2CJ7vlDRibS" role="3XIRFZ">
          <node concept="3O_q_g" id="2CJ7vlDRibQ" role="1_9egR">
            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
            <node concept="PhEJO" id="2CJ7vlDRicp" role="3O_q_j">
              <property role="PhEJT" value="Light sensor value: %u\n\r" />
            </node>
            <node concept="1S7827" id="2CJ7vlDRivW" role="3O_q_j">
              <ref role="1S7826" node="4osOqZkm2sr" resolve="lightSensorValue" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="2CJ7vlDRk6N" role="3XIRFZ" />
        <node concept="1_9egQ" id="2CJ7vlDRi$7" role="3XIRFZ">
          <node concept="3O_q_g" id="2CJ7vlDRi$5" role="1_9egR">
            <ref role="3O_q_h" to="tzd5:2hqbsEGB5xU" resolve="ReleaseResource" />
            <node concept="4ZOvp" id="2CJ7vlDRiP3" role="3O_q_j">
              <ref role="2DPCA0" node="2CJ7vlDPYc_" resolve="LightValue" />
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="2CJ7vlDRi_q" role="3XIRFZ">
          <node concept="3O_q_g" id="2CJ7vlDRi_o" role="1_9egR">
            <ref role="3O_q_h" to="tzd5:2hqbsEGB5KT" resolve="SetEvent" />
            <node concept="1hk5Ds" id="2CJ7vlDRiQ7" role="3O_q_j">
              <ref role="1hk5Dt" node="2CJ7vlDRfCX" resolve="LineFollowerTask" />
            </node>
            <node concept="4ZOvp" id="2CJ7vlDRiAo" role="3O_q_j">
              <ref role="2DPCA0" node="2CJ7vlDQlc3" resolve="LightValueEvent" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="2CJ7vlDRk7U" role="3XIRFZ" />
        <node concept="QCpGs" id="2CJ7vlDRgCt" role="3XIRFZ" />
      </node>
      <node concept="19Rifw" id="2CJ7vlDRgCs" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="3GEVxB" id="4osOqZkm2si" role="2OODSX">
      <ref role="3GEb4d" to="tzd5:2UjW4IkHtzb" resolve="kernel" />
    </node>
    <node concept="3GEVxB" id="4osOqZkm2sn" role="2OODSX">
      <ref role="3GEb4d" to="ei6g:3tDp_yW6whK" resolve="ecrobot_interface" />
    </node>
    <node concept="3GEVxB" id="3biQP486lnr" role="2OODSX">
      <ref role="3GEb4d" node="3biQP486ju3" resolve="LfVariability" />
    </node>
    <node concept="3GEVxB" id="5YkaFUJVHZx" role="2OODSX">
      <ref role="3GEb4d" to="k7td:5YkaFUJVGNP" resolve="stdio_stub" />
    </node>
    <node concept="3GEVxB" id="2CJ7vlDRgS_" role="2OODSX">
      <ref role="3GEb4d" node="2CJ7vlDPYcx" resolve="LinefollowerOil" />
    </node>
    <node concept="2dvl_R" id="3biQP486lnG" role="lGtFl">
      <ref role="2dvl_Q" node="3biQP486ju6" resolve="DebugFeature" />
      <ref role="AiAcg" node="3biQP486ju_" resolve="DoDebug" />
    </node>
  </node>
  <node concept="1hiFB1" id="2CJ7vlDPYcx">
    <property role="TrG5h" value="LinefollowerOil" />
    <property role="1hiKqn" value="2.5" />
    <node concept="1hlUge" id="2CJ7vlDPYcy" role="1v1S_x">
      <property role="TrG5h" value="ATMEL_AT91SAM7S256" />
      <node concept="1hk5V6" id="2CJ7vlDRgoX" role="1v6YIA">
        <property role="TrG5h" value="TouchEventCyclicAlarm" />
        <ref role="1v6S1U" node="2CJ7vlDRg73" resolve="SysTimerCnt" />
        <node concept="1v6SQM" id="2CJ7vlDRgp5" role="1v6SD_">
          <ref role="1v6SNz" node="2CJ7vlDQldO" resolve="TouchEventDispatcherTask" />
        </node>
        <node concept="1v6YA9" id="2CJ7vlDRgp8" role="1v6SZh">
          <node concept="3TlMh9" id="2CJ7vlDRgpt" role="1$bw0i">
            <property role="2hmy$m" value="1" />
          </node>
          <node concept="3TlMh9" id="2CJ7vlDRgrl" role="1$bw0s">
            <property role="2hmy$m" value="10" />
          </node>
          <node concept="1hk5ht" id="2CJ7vlDRgvk" role="1v6YD6">
            <ref role="1hk5hi" node="2CJ7vlDPYc$" resolve="appmode1" />
          </node>
        </node>
      </node>
      <node concept="1hk5V6" id="2CJ7vlDRgxt" role="1v6YIA">
        <property role="TrG5h" value="LightValueEventCyclicAlarm" />
        <ref role="1v6S1U" node="2CJ7vlDRg73" resolve="SysTimerCnt" />
        <node concept="1v6YA9" id="2CJ7vlDRgxI" role="1v6SZh">
          <node concept="3TlMh9" id="2CJ7vlDRgy3" role="1$bw0i">
            <property role="2hmy$m" value="1" />
          </node>
          <node concept="3TlMh9" id="2CJ7vlDRgzV" role="1$bw0s">
            <property role="2hmy$m" value="10" />
          </node>
          <node concept="1hk5ht" id="2CJ7vlDRgA4" role="1v6YD6">
            <ref role="1hk5hi" node="2CJ7vlDPYc$" resolve="appmode1" />
          </node>
        </node>
        <node concept="1v6SQM" id="2CJ7vlDRiOO" role="1v6SD_">
          <ref role="1v6SNz" node="2CJ7vlDQS6S" resolve="LightValueEventDispatcherTask" />
        </node>
      </node>
      <node concept="3qkAPh" id="2CJ7vlDRg73" role="3qjf8I">
        <property role="TrG5h" value="SysTimerCnt" />
        <node concept="3TlMh9" id="2CJ7vlDRg9K" role="1$bw0m">
          <property role="2hmy$m" value="1" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDRgbJ" role="1$bw0S">
          <property role="2hmy$m" value="10000" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDRglw" role="1$bw0F">
          <property role="2hmy$m" value="1" />
        </node>
      </node>
      <node concept="1hlUgq" id="2CJ7vlDPYcz" role="1hk5Yg">
        <property role="TrG5h" value="LEJOS_OSEK" />
        <property role="1hlUgk" value="standard" />
      </node>
      <node concept="1hk5YZ" id="2CJ7vlDPYc$" role="1hk5ZA">
        <property role="TrG5h" value="appmode1" />
      </node>
      <node concept="3uopR6" id="2CJ7vlDPYc_" role="1v67J6">
        <node concept="3uoiPb" id="2CJ7vlDPYdk" role="2DQcEM">
          <property role="2hmy$m" value="0" />
          <property role="TrG5h" value="LightValue" />
          <property role="3uoinE" value="STANDARD" />
        </node>
      </node>
      <node concept="bPy0e" id="2CJ7vlDPYef" role="3aI4UL">
        <node concept="1hk5Ax" id="2CJ7vlDPYes" role="2DQcEM">
          <property role="TrG5h" value="TouchEvent" />
          <node concept="3TlMh9" id="2CJ7vlDPYeV" role="1$bw00">
            <property role="2hmy$m" value="1" />
          </node>
        </node>
      </node>
      <node concept="bPy0e" id="2CJ7vlDQlc3" role="3aI4UL">
        <node concept="1hk5Ax" id="2CJ7vlDQlcj" role="2DQcEM">
          <property role="TrG5h" value="LightValueEvent" />
          <node concept="3TlMh9" id="2CJ7vlDQldk" role="1$bw00">
            <property role="2hmy$m" value="2" />
          </node>
        </node>
      </node>
      <node concept="1hk5S6" id="2CJ7vlDQldO" role="1v67Ja">
        <property role="2hmy$m" value="0" />
        <property role="TrG5h" value="TouchEventDispatcherTask" />
        <property role="3gXiVZ" value="FULL" />
        <node concept="3TlMh9" id="2CJ7vlDQlhP" role="1$bw0v">
          <property role="2hmy$m" value="1" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDQlm6" role="1$bw0r">
          <property role="2hmy$m" value="1" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDQloA" role="36RUAK">
          <property role="2hmy$m" value="4096" />
        </node>
      </node>
      <node concept="1hk5S6" id="2CJ7vlDQS6S" role="1v67Ja">
        <property role="2hmy$m" value="0" />
        <property role="TrG5h" value="LightValueEventDispatcherTask" />
        <property role="3gXiVZ" value="FULL" />
        <node concept="3TlMh9" id="2CJ7vlDQSbs" role="1$bw0v">
          <property role="2hmy$m" value="1" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDQSfH" role="1$bw0r">
          <property role="2hmy$m" value="1" />
        </node>
        <node concept="1hk5TX" id="2CJ7vlDQSi9" role="2yxTjm">
          <ref role="379KCI" node="2CJ7vlDPYc_" resolve="LightValue" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDR3ON" role="36RUAK">
          <property role="2hmy$m" value="4096" />
        </node>
      </node>
      <node concept="2yxTjl" id="2CJ7vlDRfCX" role="1v67Ja">
        <property role="2hmy$m" value="0" />
        <property role="TrG5h" value="LineFollowerTask" />
        <property role="3gXiVZ" value="FULL" />
        <node concept="3TlMh9" id="2CJ7vlDR42b" role="1$bw0v">
          <property role="2hmy$m" value="2" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDR46s" role="1$bw0r">
          <property role="2hmy$m" value="1" />
        </node>
        <node concept="1hk5TX" id="2CJ7vlDR48S" role="2yxTjm">
          <ref role="379KCI" node="2CJ7vlDPYc_" resolve="LightValue" />
        </node>
        <node concept="1hk5ht" id="2CJ7vlDR4bn" role="3aInHn">
          <ref role="1hk5hi" node="2CJ7vlDPYc$" resolve="appmode1" />
        </node>
        <node concept="3TlMh9" id="2CJ7vlDRbQU" role="36RUAK">
          <property role="2hmy$m" value="4096" />
        </node>
        <node concept="1hk5F4" id="2CJ7vlDRfH6" role="2yxTjk">
          <ref role="2euN8h" node="2CJ7vlDPYef" resolve="TouchEvent" />
        </node>
        <node concept="1hk5F4" id="2CJ7vlDRfZC" role="2yxTjk">
          <ref role="2euN8h" node="2CJ7vlDQlc3" resolve="LightValueEvent" />
        </node>
      </node>
    </node>
  </node>
  <node concept="N3F5e" id="5g5RAGpVlbu">
    <property role="TrG5h" value="LinefollowerTask" />
    <node concept="4WHVk" id="5g5RAGpXl0p" role="N3F5h">
      <property role="TrG5h" value="NORMAL_SPEED" />
      <node concept="3TlMh9" id="5g5RAGpXl4B" role="2DQcEM">
        <property role="2hmy$m" value="40" />
      </node>
    </node>
    <node concept="4WHVk" id="5g5RAGpXl7h" role="N3F5h">
      <property role="TrG5h" value="WHITE" />
      <node concept="3TlMh9" id="5g5RAGpXlbD" role="2DQcEM">
        <property role="2hmy$m" value="425" />
      </node>
    </node>
    <node concept="4WHVk" id="5g5RAGpXlfw" role="N3F5h">
      <property role="TrG5h" value="BLACK" />
      <node concept="3TlMh9" id="5g5RAGpXll1" role="2DQcEM">
        <property role="2hmy$m" value="555" />
      </node>
    </node>
    <node concept="4WHVk" id="5g5RAGpXloU" role="N3F5h">
      <property role="TrG5h" value="MIDDLE" />
      <node concept="3TlMh9" id="5g5RAGpXlv3" role="2DQcEM">
        <property role="2hmy$m" value="455" />
      </node>
    </node>
    <node concept="2NXPZ9" id="5JhwNflEMwJ" role="N3F5h">
      <property role="TrG5h" value="empty_1464793641696_83" />
    </node>
    <node concept="1sgJKc" id="5g5RAGpXlEm" role="N3F5h">
      <property role="TrG5h" value="SPid" />
      <node concept="1dpRTG" id="5g5RAGpXlPh" role="HszBJ">
        <property role="TrG5h" value="dState" />
        <node concept="2fgwQN" id="5g5RAGpXlPg" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
        <node concept="1z9TsT" id="5g5RAGpXlPH" role="lGtFl">
          <node concept="OjmMv" id="5g5RAGpXlPI" role="1w35rA">
            <node concept="19SGf9" id="5g5RAGpXlPJ" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXlPK" role="19SJt6">
                <property role="19SUeA" value="Last position input" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXlPW" role="HszBJ">
        <property role="TrG5h" value="iState" />
        <node concept="2fgwQN" id="5g5RAGpXlPU" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
        <node concept="1z9TsT" id="5g5RAGpXlQq" role="lGtFl">
          <node concept="OjmMv" id="5g5RAGpXlQr" role="1w35rA">
            <node concept="19SGf9" id="5g5RAGpXlQs" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXlQt" role="19SJt6">
                <property role="19SUeA" value="Integrator state" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXlQR" role="HszBJ">
        <property role="TrG5h" value="iMax" />
        <node concept="2fgwQN" id="5g5RAGpXlQP" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
        <node concept="1z9TsT" id="5g5RAGpXlTE" role="lGtFl">
          <node concept="OjmMv" id="5g5RAGpXlTF" role="1w35rA">
            <node concept="19SGf9" id="5g5RAGpXlTG" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXlTH" role="19SJt6">
                <property role="19SUeA" value="Maximum and minimum allowable integrator state" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXlS1" role="HszBJ">
        <property role="TrG5h" value="iMin" />
        <node concept="2fgwQN" id="5g5RAGpXlRZ" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXlUz" role="HszBJ">
        <property role="TrG5h" value="iGain" />
        <node concept="2fgwQN" id="5g5RAGpXlUx" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
        <node concept="1z9TsT" id="5g5RAGpXlVa" role="lGtFl">
          <node concept="OjmMv" id="5g5RAGpXlVb" role="1w35rA">
            <node concept="19SGf9" id="5g5RAGpXlVc" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXlVd" role="19SJt6">
                <property role="19SUeA" value="Integral gain" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXlVP" role="HszBJ">
        <property role="TrG5h" value="pGain" />
        <node concept="2fgwQN" id="5g5RAGpXlVN" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
        <node concept="1z9TsT" id="5g5RAGpXlY0" role="lGtFl">
          <node concept="OjmMv" id="5g5RAGpXlY1" role="1w35rA">
            <node concept="19SGf9" id="5g5RAGpXlY2" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXlY3" role="19SJt6">
                <property role="19SUeA" value="Proportional gain" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXlX2" role="HszBJ">
        <property role="TrG5h" value="dGain" />
        <node concept="2fgwQN" id="5g5RAGpXlX0" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
        <node concept="1z9TsT" id="5g5RAGpXlYT" role="lGtFl">
          <node concept="OjmMv" id="5g5RAGpXlYU" role="1w35rA">
            <node concept="19SGf9" id="5g5RAGpXlYV" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXlYW" role="19SJt6">
                <property role="19SUeA" value="Derivative gain" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="5g5RAGpXlHQ" role="N3F5h">
      <property role="TrG5h" value="empty_1452788508201_50" />
    </node>
    <node concept="N3Fnx" id="5g5RAGpXm9g" role="N3F5h">
      <property role="TrG5h" value="initPIDStruct" />
      <property role="2OOxQR" value="false" />
      <node concept="3XIRFW" id="5g5RAGpXm9i" role="3XIRFX">
        <node concept="1_9egQ" id="5g5RAGpXmjk" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXmkp" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXmlb" role="3TlMhJ">
              <property role="2hmy$m" value="0" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXmjz" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXmk6" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlPh" resolve="dState" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXmji" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXmn_" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXmqA" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXmtd" role="3TlMhJ">
              <property role="2hmy$m" value="0" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXmnV" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXmqj" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXmnz" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXmwy" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXm$t" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXmBT" role="3TlMhJ">
              <property role="2hmy$m" value="1000" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXmwX" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXm$a" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlQR" resolve="iMax" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXmww" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXn2R" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXnjw" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXnuM" role="3TlMhJ">
              <property role="2hmy$m" value="-1000" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXndU" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXnjd" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlS1" resolve="iMin" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXn2P" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXnGP" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXnOH" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXnVU" role="3TlMhJ">
              <property role="2hmy$m" value="0.75" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXnHs" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXnOq" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlVP" resolve="pGain" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXnGN" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXoql" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXoz1" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXoEW" role="3TlMhJ">
              <property role="2hmy$m" value="0.06" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXor2" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXoyI" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlUz" resolve="iGain" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXoqj" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXpbR" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXpld" role="1_9egR">
            <node concept="3TlMh9" id="5g5RAGpXptG" role="3TlMhJ">
              <property role="2hmy$m" value="2.34375" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXpcE" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXpkU" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlX2" resolve="dGain" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXpbP" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXmdC" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="19Rifw" id="5g5RAGpXm3P" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="5g5RAGpXmdC" role="1UOdpc">
        <property role="TrG5h" value="pid" />
        <node concept="3wxxNl" id="5g5RAGpXmXE" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="1sgJKr" id="5g5RAGpXmdB" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
            <ref role="1sgJKq" node="5g5RAGpXlEm" resolve="SPid" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="1Y5JHpRyubX" role="N3F5h">
      <property role="TrG5h" value="empty_1454411167773_22" />
    </node>
    <node concept="N3Fnx" id="5g5RAGpXqPj" role="N3F5h">
      <property role="TrG5h" value="UpdatePID" />
      <property role="2OOxQR" value="false" />
      <node concept="3XIRFW" id="5g5RAGpXqPl" role="3XIRFX">
        <node concept="3XIRlf" id="5g5RAGpXrhn" role="3XIRFZ">
          <property role="TrG5h" value="pTerm" />
          <node concept="2fgwQN" id="5g5RAGpXrhm" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
        <node concept="3XIRlf" id="5g5RAGpXrhN" role="3XIRFZ">
          <property role="TrG5h" value="dTerm" />
          <node concept="2fgwQN" id="5g5RAGpXrhL" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
        <node concept="3XIRlf" id="5g5RAGpXrip" role="3XIRFZ">
          <property role="TrG5h" value="iTerm" />
          <node concept="2fgwQN" id="5g5RAGpXrin" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
        <node concept="3XISUE" id="6g77ZYUpbDT" role="3XIRFZ" />
        <node concept="3XIRlf" id="5g5RAGpXrjf" role="3XIRFZ">
          <property role="TrG5h" value="hasSignChanged" />
          <node concept="3TlMgk" id="5g5RAGpXrjd" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="2EHzL4" id="5g5RAGpXsEa" role="3XIe9u">
            <node concept="2BPB98" id="5g5RAGpXsRL" role="3TlMhJ">
              <node concept="2EHzL6" id="5g5RAGpXtYq" role="1_9fRO">
                <node concept="3Tl9Jn" id="5g5RAGpXurU" role="3TlMhJ">
                  <node concept="3TlMh9" id="5g5RAGpXuEu" role="3TlMhJ">
                    <property role="2hmy$m" value="0" />
                  </node>
                  <node concept="3ZUYvv" id="5g5RAGpXud6" role="3TlMhI">
                    <ref role="3ZUYvu" node="5g5RAGpXr3I" resolve="error" />
                  </node>
                </node>
                <node concept="3Tl9Jp" id="5g5RAGpXty3" role="3TlMhI">
                  <node concept="3TlMh9" id="5g5RAGpXtJN" role="3TlMhJ">
                    <property role="2hmy$m" value="0" />
                  </node>
                  <node concept="2qmXGp" id="5g5RAGpXtki" role="3TlMhI">
                    <node concept="1E4Tgc" id="5g5RAGpXtxK" role="1ESnxz">
                      <ref role="1E4Tge" node="5g5RAGpXlPh" resolve="dState" />
                    </node>
                    <node concept="3ZUYvv" id="5g5RAGpXt57" role="1_9fRO">
                      <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="2BPB98" id="5g5RAGpXrjV" role="3TlMhI">
              <node concept="2EHzL6" id="5g5RAGpXrGi" role="1_9fRO">
                <node concept="3Tl9Jp" id="5g5RAGpXs50" role="3TlMhJ">
                  <node concept="3TlMh9" id="5g5RAGpXshs" role="3TlMhJ">
                    <property role="2hmy$m" value="0" />
                  </node>
                  <node concept="3ZUYvv" id="5g5RAGpXrS$" role="3TlMhI">
                    <ref role="3ZUYvu" node="5g5RAGpXr3I" resolve="error" />
                  </node>
                </node>
                <node concept="3Tl9Jn" id="5g5RAGpXrmJ" role="3TlMhI">
                  <node concept="3TlMh9" id="5g5RAGpXrw3" role="3TlMhJ">
                    <property role="2hmy$m" value="0" />
                  </node>
                  <node concept="2qmXGp" id="5g5RAGpXrlO" role="3TlMhI">
                    <node concept="1E4Tgc" id="5g5RAGpXrms" role="1ESnxz">
                      <ref role="1E4Tge" node="5g5RAGpXlPh" resolve="dState" />
                    </node>
                    <node concept="3ZUYvv" id="5g5RAGpXrka" role="1_9fRO">
                      <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1QiMYF" id="5g5RAGpXuVj" role="3XIRFZ">
          <node concept="OjmMv" id="5g5RAGpXuVl" role="3SJzmv">
            <node concept="19SGf9" id="5g5RAGpXuVm" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXuVn" role="19SJt6">
                <property role="19SUeA" value="calculate the proportional term" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXuWx" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXuXd" role="1_9egR">
            <node concept="2BOcij" id="5g5RAGpXvf$" role="3TlMhJ">
              <node concept="3ZUYvv" id="5g5RAGpXvw0" role="3TlMhJ">
                <ref role="3ZUYvu" node="5g5RAGpXr3I" resolve="error" />
              </node>
              <node concept="2qmXGp" id="5g5RAGpXuZe" role="3TlMhI">
                <node concept="1E4Tgc" id="5g5RAGpXvfh" role="1ESnxz">
                  <ref role="1E4Tge" node="5g5RAGpXlVP" resolve="pGain" />
                </node>
                <node concept="3ZUYvv" id="5g5RAGpXuXy" role="1_9fRO">
                  <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                </node>
              </node>
            </node>
            <node concept="3ZVu4v" id="5g5RAGpXuWv" role="3TlMhI">
              <ref role="3ZVs_2" node="5g5RAGpXrhn" resolve="pTerm" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="5g5RAGpXvKr" role="3XIRFZ" />
        <node concept="c0U19" id="5g5RAGpXvLO" role="3XIRFZ">
          <node concept="3XIRFW" id="5g5RAGpXvLP" role="c0U17">
            <node concept="1QiMYF" id="5g5RAGpXvML" role="3XIRFZ">
              <node concept="OjmMv" id="5g5RAGpXvMM" role="3SJzmv">
                <node concept="19SGf9" id="5g5RAGpXvMN" role="OjmMu">
                  <node concept="19SUe$" id="5g5RAGpXvMO" role="19SJt6">
                    <property role="19SUeA" value="reset integral if sign of error changed" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="1_9egQ" id="5g5RAGpXvN1" role="3XIRFZ">
              <node concept="3pqW6w" id="5g5RAGpXw4m" role="1_9egR">
                <node concept="3TlMh9" id="5g5RAGpXwlf" role="3TlMhJ">
                  <property role="2hmy$m" value="0" />
                </node>
                <node concept="2qmXGp" id="5g5RAGpXvNk" role="3TlMhI">
                  <node concept="1E4Tgc" id="5g5RAGpXw43" role="1ESnxz">
                    <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                  </node>
                  <node concept="3ZUYvv" id="5g5RAGpXvMZ" role="1_9fRO">
                    <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3ZVu4v" id="5g5RAGpXvMD" role="c0U16">
            <ref role="3ZVs_2" node="5g5RAGpXrjf" resolve="hasSignChanged" />
          </node>
          <node concept="1ly_i6" id="5g5RAGpXwAC" role="ggAap">
            <node concept="3XIRFW" id="5g5RAGpXwAD" role="1ly_ph">
              <node concept="1QiMYF" id="5g5RAGpXwRT" role="3XIRFZ">
                <node concept="OjmMv" id="5g5RAGpXwRU" role="3SJzmv">
                  <node concept="19SGf9" id="5g5RAGpXwRV" role="OjmMu">
                    <node concept="19SUe$" id="5g5RAGpXwRW" role="19SJt6">
                      <property role="19SUeA" value="calculate the integral state with appropriate limiting" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="1_9egQ" id="5g5RAGpXwS9" role="3XIRFZ">
                <node concept="TPXPH" id="5g5RAGpXxae" role="1_9egR">
                  <node concept="3ZUYvv" id="5g5RAGpXxrZ" role="3TlMhJ">
                    <ref role="3ZUYvu" node="5g5RAGpXr3I" resolve="error" />
                  </node>
                  <node concept="2qmXGp" id="5g5RAGpXwSs" role="3TlMhI">
                    <node concept="1E4Tgc" id="5g5RAGpXx9V" role="1ESnxz">
                      <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                    </node>
                    <node concept="3ZUYvv" id="5g5RAGpXwS7" role="1_9fRO">
                      <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                    </node>
                  </node>
                </node>
              </node>
              <node concept="c0U19" id="5g5RAGpXxI1" role="3XIRFZ">
                <node concept="3XIRFW" id="5g5RAGpXxI2" role="c0U17">
                  <node concept="1_9egQ" id="5g5RAGpXyWC" role="3XIRFZ">
                    <node concept="3pqW6w" id="5g5RAGpXzfZ" role="1_9egR">
                      <node concept="2qmXGp" id="5g5RAGpXzRw" role="3TlMhJ">
                        <node concept="1E4Tgc" id="5g5RAGpX$aE" role="1ESnxz">
                          <ref role="1E4Tge" node="5g5RAGpXlQR" resolve="iMax" />
                        </node>
                        <node concept="3ZUYvv" id="5g5RAGpXzz6" role="1_9fRO">
                          <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                        </node>
                      </node>
                      <node concept="2qmXGp" id="5g5RAGpXyWR" role="3TlMhI">
                        <node concept="1E4Tgc" id="5g5RAGpXzfG" role="1ESnxz">
                          <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                        </node>
                        <node concept="3ZUYvv" id="5g5RAGpXyWB" role="1_9fRO">
                          <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="3Tl9Jr" id="5g5RAGpXy2d" role="c0U16">
                  <node concept="2qmXGp" id="5g5RAGpXyDX" role="3TlMhJ">
                    <node concept="1E4Tgc" id="5g5RAGpXyWm" role="1ESnxz">
                      <ref role="1E4Tge" node="5g5RAGpXlQR" resolve="iMax" />
                    </node>
                    <node concept="3ZUYvv" id="5g5RAGpXykz" role="1_9fRO">
                      <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                    </node>
                  </node>
                  <node concept="2qmXGp" id="5g5RAGpXxJQ" role="3TlMhI">
                    <node concept="1E4Tgc" id="5g5RAGpXy1U" role="1ESnxz">
                      <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                    </node>
                    <node concept="3ZUYvv" id="5g5RAGpXxIl" role="1_9fRO">
                      <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                    </node>
                  </node>
                </node>
                <node concept="gg_gk" id="5g5RAGpX$aX" role="gg_kh">
                  <node concept="3XIRFW" id="5g5RAGpX$aY" role="gg_gl">
                    <node concept="1_9egQ" id="5g5RAGpX_LK" role="3XIRFZ">
                      <node concept="3pqW6w" id="5g5RAGpXA6z" role="1_9egR">
                        <node concept="2qmXGp" id="5g5RAGpXAKW" role="3TlMhJ">
                          <node concept="1E4Tgc" id="5g5RAGpXB5y" role="1ESnxz">
                            <ref role="1E4Tge" node="5g5RAGpXlS1" resolve="iMin" />
                          </node>
                          <node concept="3ZUYvv" id="5g5RAGpXAr6" role="1_9fRO">
                            <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                          </node>
                        </node>
                        <node concept="2qmXGp" id="5g5RAGpX_LZ" role="3TlMhI">
                          <node concept="1E4Tgc" id="5g5RAGpXA6g" role="1ESnxz">
                            <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                          </node>
                          <node concept="3ZUYvv" id="5g5RAGpX_LJ" role="1_9fRO">
                            <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3Tl9Jn" id="5g5RAGpX$N_" role="gg_gt">
                    <node concept="2qmXGp" id="5g5RAGpX_tD" role="3TlMhJ">
                      <node concept="1E4Tgc" id="5g5RAGpX_Lu" role="1ESnxz">
                        <ref role="1E4Tge" node="5g5RAGpXlS1" resolve="iMin" />
                      </node>
                      <node concept="3ZUYvv" id="5g5RAGpX_8n" role="1_9fRO">
                        <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                      </node>
                    </node>
                    <node concept="2qmXGp" id="5g5RAGpX$vM" role="3TlMhI">
                      <node concept="1E4Tgc" id="5g5RAGpX$Ni" role="1ESnxz">
                        <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                      </node>
                      <node concept="3ZUYvv" id="5g5RAGpX$ui" role="1_9fRO">
                        <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1QiMYF" id="5g5RAGpXBau" role="3XIRFZ">
          <node concept="OjmMv" id="5g5RAGpXBaw" role="3SJzmv">
            <node concept="19SGf9" id="5g5RAGpXBax" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXBay" role="19SJt6">
                <property role="19SUeA" value="calculate the integral term" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXBdY" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXBfN" role="1_9egR">
            <node concept="2BOcij" id="5g5RAGpXBBe" role="3TlMhJ">
              <node concept="2qmXGp" id="5g5RAGpXCjS" role="3TlMhJ">
                <node concept="1E4Tgc" id="5g5RAGpXCDk" role="1ESnxz">
                  <ref role="1E4Tge" node="5g5RAGpXlPW" resolve="iState" />
                </node>
                <node concept="3ZUYvv" id="5g5RAGpXBWI" role="1_9fRO">
                  <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                </node>
              </node>
              <node concept="2qmXGp" id="5g5RAGpXBhO" role="3TlMhI">
                <node concept="1E4Tgc" id="5g5RAGpXBAV" role="1ESnxz">
                  <ref role="1E4Tge" node="5g5RAGpXlUz" resolve="iGain" />
                </node>
                <node concept="3ZUYvv" id="5g5RAGpXBg8" role="1_9fRO">
                  <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                </node>
              </node>
            </node>
            <node concept="3ZVu4v" id="5g5RAGpXBdW" role="3TlMhI">
              <ref role="3ZVs_2" node="5g5RAGpXrip" resolve="iTerm" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="5g5RAGpXCD_" role="3XIRFZ" />
        <node concept="1QiMYF" id="5g5RAGpXCQP" role="3XIRFZ">
          <node concept="OjmMv" id="5g5RAGpXCQQ" role="3SJzmv">
            <node concept="19SGf9" id="5g5RAGpXCQR" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXCQS" role="19SJt6">
                <property role="19SUeA" value="reset derivate if sign of error changed" />
              </node>
            </node>
          </node>
        </node>
        <node concept="c0U19" id="5g5RAGpXCKZ" role="3XIRFZ">
          <node concept="3XIRFW" id="5g5RAGpXCL0" role="c0U17">
            <node concept="1_9egQ" id="5g5RAGpXCR5" role="3XIRFZ">
              <node concept="3pqW6w" id="5g5RAGpXDdF" role="1_9egR">
                <node concept="3TlMh9" id="5g5RAGpXDzP" role="3TlMhJ">
                  <property role="2hmy$m" value="0" />
                </node>
                <node concept="2qmXGp" id="5g5RAGpXCRo" role="3TlMhI">
                  <node concept="1E4Tgc" id="5g5RAGpXDdo" role="1ESnxz">
                    <ref role="1E4Tge" node="5g5RAGpXlPh" resolve="dState" />
                  </node>
                  <node concept="3ZUYvv" id="5g5RAGpXCR3" role="1_9fRO">
                    <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node concept="3ZVu4v" id="5g5RAGpXCMX" role="c0U16">
            <ref role="3ZVs_2" node="5g5RAGpXrjf" resolve="hasSignChanged" />
          </node>
        </node>
        <node concept="1QiMYF" id="5g5RAGpXEf7" role="3XIRFZ">
          <node concept="OjmMv" id="5g5RAGpXEf9" role="3SJzmv">
            <node concept="19SGf9" id="5g5RAGpXEfa" role="OjmMu">
              <node concept="19SUe$" id="5g5RAGpXEfb" role="19SJt6">
                <property role="19SUeA" value="calculate the derivate term" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXEjr" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXElE" role="1_9egR">
            <node concept="2BOcij" id="5g5RAGpXEIT" role="3TlMhJ">
              <node concept="2BPB98" id="5g5RAGpXF5X" role="3TlMhJ">
                <node concept="2BOcil" id="5g5RAGpXFOD" role="1_9fRO">
                  <node concept="2qmXGp" id="5g5RAGpXG_$" role="3TlMhJ">
                    <node concept="1E4Tgc" id="5g5RAGpXGWT" role="1ESnxz">
                      <ref role="1E4Tge" node="5g5RAGpXlPh" resolve="dState" />
                    </node>
                    <node concept="3ZUYvv" id="5g5RAGpXGbR" role="1_9fRO">
                      <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                    </node>
                  </node>
                  <node concept="3ZUYvv" id="5g5RAGpXFtn" role="3TlMhI">
                    <ref role="3ZUYvu" node="5g5RAGpXr3I" resolve="error" />
                  </node>
                </node>
              </node>
              <node concept="2qmXGp" id="5g5RAGpXEnG" role="3TlMhI">
                <node concept="1E4Tgc" id="5g5RAGpXEIA" role="1ESnxz">
                  <ref role="1E4Tge" node="5g5RAGpXlX2" resolve="dGain" />
                </node>
                <node concept="3ZUYvv" id="5g5RAGpXElZ" role="1_9fRO">
                  <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
                </node>
              </node>
            </node>
            <node concept="3ZVu4v" id="5g5RAGpXEjp" role="3TlMhI">
              <ref role="3ZVs_2" node="5g5RAGpXrhN" resolve="dTerm" />
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="5g5RAGpXGZw" role="3XIRFZ">
          <node concept="3pqW6w" id="5g5RAGpXHqg" role="1_9egR">
            <node concept="3ZUYvv" id="5g5RAGpXHMu" role="3TlMhJ">
              <ref role="3ZUYvu" node="5g5RAGpXr3I" resolve="error" />
            </node>
            <node concept="2qmXGp" id="5g5RAGpXH21" role="3TlMhI">
              <node concept="1E4Tgc" id="5g5RAGpXHpX" role="1ESnxz">
                <ref role="1E4Tge" node="5g5RAGpXlPh" resolve="dState" />
              </node>
              <node concept="3ZUYvv" id="5g5RAGpXGZu" role="1_9fRO">
                <ref role="3ZUYvu" node="5g5RAGpXr2X" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="5g5RAGpXIaA" role="3XIRFZ" />
        <node concept="2BFjQ_" id="5g5RAGpXIpG" role="3XIRFZ">
          <node concept="2BOciq" id="5g5RAGpXJdW" role="2BFjQA">
            <node concept="3ZVu4v" id="5g5RAGpXJAB" role="3TlMhJ">
              <ref role="3ZVs_2" node="5g5RAGpXrip" resolve="iTerm" />
            </node>
            <node concept="2BOciq" id="5g5RAGpXIsP" role="3TlMhI">
              <node concept="3ZVu4v" id="5g5RAGpXIPg" role="3TlMhJ">
                <ref role="3ZVs_2" node="5g5RAGpXrhN" resolve="dTerm" />
              </node>
              <node concept="3ZVu4v" id="5g5RAGpXIs$" role="3TlMhI">
                <ref role="3ZVs_2" node="5g5RAGpXrhn" resolve="pTerm" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node concept="2fgwQN" id="5g5RAGpXIsk" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="5g5RAGpXr2X" role="1UOdpc">
        <property role="TrG5h" value="pid" />
        <node concept="3wxxNl" id="5g5RAGpXrfT" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="1sgJKr" id="5g5RAGpXr2W" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
            <ref role="1sgJKq" node="5g5RAGpXlEm" resolve="SPid" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="5g5RAGpXr3I" role="1UOdpc">
        <property role="TrG5h" value="error" />
        <node concept="2fgwQN" id="5g5RAGpXr3G" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="5g5RAGpXlLI" role="N3F5h">
      <property role="TrG5h" value="empty_1452788508568_52" />
    </node>
    <node concept="18XYSt" id="2CJ7vlDRmr_" role="N3F5h">
      <ref role="18XYSp" node="2CJ7vlDRfCX" resolve="LineFollowerTask" />
      <node concept="3XIRFW" id="2CJ7vlDRmrB" role="3XIRFX">
        <node concept="3XIRlf" id="7vKHPVqx$ov" role="3XIRFZ">
          <property role="TrG5h" value="isMoving" />
          <node concept="3TlMgk" id="7vKHPVqx$ow" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMhd" id="7vKHPVqxAfj" role="3XIe9u" />
          <node concept="1z9TsT" id="7vKHPVqxAfZ" role="lGtFl">
            <node concept="OjmMv" id="7vKHPVqxAg0" role="1w35rA">
              <node concept="19SGf9" id="7vKHPVqxAg1" role="OjmMu">
                <node concept="19SUe$" id="7vKHPVqxAg2" role="19SJt6">
                  <property role="19SUeA" value="variable declaration" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3XIRlf" id="7vKHPVqxAgU" role="3XIRFZ">
          <property role="TrG5h" value="pid" />
          <node concept="1sgJKr" id="7vKHPVqxAgT" role="2C2TGm">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
            <ref role="1sgJKq" node="5g5RAGpXlEm" resolve="SPid" />
          </node>
        </node>
        <node concept="1_9egQ" id="7vKHPVqxAhY" role="3XIRFZ">
          <node concept="3O_q_g" id="7vKHPVqxAhW" role="1_9egR">
            <ref role="3O_q_h" to="ei6g:3QwuWjHjGZA" resolve="ecrobot_set_light_sensor_active" />
            <node concept="1AkAhK" id="7vKHPVqxAil" role="3O_q_j">
              <ref role="1AkAhZ" to="ei6g:3tDp_yW5KZ3" resolve="EV3_PORT_S2" />
            </node>
          </node>
          <node concept="1z9TsT" id="7vKHPVqxAiI" role="lGtFl">
            <node concept="OjmMv" id="7vKHPVqxAiJ" role="1w35rA">
              <node concept="19SGf9" id="7vKHPVqxAiK" role="OjmMu">
                <node concept="19SUe$" id="7vKHPVqxAiL" role="19SJt6">
                  <property role="19SUeA" value="initialize light sensor and PID" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="7vKHPVqxAjr" role="3XIRFZ">
          <node concept="3O_q_g" id="7vKHPVqxAjp" role="1_9egR">
            <ref role="3O_q_h" node="5g5RAGpXm9g" resolve="initPIDStruct" />
            <node concept="YInwV" id="7vKHPVqxAjT" role="3O_q_j">
              <node concept="3ZVu4v" id="7vKHPVqxAkh" role="1_9fRO">
                <ref role="3ZVs_2" node="7vKHPVqxAgU" resolve="pid" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="7vKHPVqxAmr" role="3XIRFZ">
          <node concept="3O_q_g" id="7vKHPVqxAmp" role="1_9egR">
            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
            <node concept="PhEJO" id="7vKHPVqxAmY" role="3O_q_j">
              <property role="PhEJT" value="Initialization passed\n\r" />
            </node>
          </node>
          <node concept="1z9TsT" id="7vKHPVqxAzK" role="lGtFl">
            <node concept="OjmMv" id="7vKHPVqxAzL" role="1w35rA">
              <node concept="19SGf9" id="7vKHPVqxAzM" role="OjmMu">
                <node concept="19SUe$" id="7vKHPVqxAzN" role="19SJt6">
                  <property role="19SUeA" value="start the control loop" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="7vKHPVqxAl5" role="3XIRFZ" />
        <node concept="27v$Wf" id="GqrtFI5X3i" role="3XIRFZ">
          <node concept="3XIRFW" id="GqrtFI5X3j" role="27v$W9">
            <node concept="3XIRlf" id="GqrtFI5X51" role="3XIRFZ">
              <property role="TrG5h" value="eventmask" />
              <node concept="22Q3ya" id="GqrtFI5X50" role="2C2TGm">
                <property role="2caQfQ" value="false" />
                <property role="2c7vTL" value="false" />
              </node>
              <node concept="3TlMh9" id="GqrtFI5X5Q" role="3XIe9u">
                <property role="2hmy$m" value="0" />
              </node>
              <node concept="1z9TsT" id="GqrtFI5X7J" role="lGtFl">
                <node concept="OjmMv" id="GqrtFI5X7K" role="1w35rA">
                  <node concept="19SGf9" id="GqrtFI5X7L" role="OjmMu">
                    <node concept="19SUe$" id="GqrtFI5X7M" role="19SJt6">
                      <property role="19SUeA" value="wait for light or touch event" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="3XISUE" id="GqrtFI5X7E" role="3XIRFZ" />
            <node concept="1_9egQ" id="GqrtFI5Xal" role="3XIRFZ">
              <node concept="3O_q_g" id="GqrtFI5Xaj" role="1_9egR">
                <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                <node concept="PhEJO" id="GqrtFI5XaD" role="3O_q_j">
                  <property role="PhEJT" value="Waiting for event\n\r" />
                </node>
              </node>
            </node>
            <node concept="3XISUE" id="GqrtFI5Xrh" role="3XIRFZ" />
            <node concept="1_9egQ" id="GqrtFI5Xse" role="3XIRFZ">
              <node concept="3O_q_g" id="GqrtFI5Xsc" role="1_9egR">
                <ref role="3O_q_h" to="tzd5:2hqbsEGB6IL" resolve="WaitEvent" />
                <node concept="EUQZk" id="GqrtFI5Xto" role="3O_q_j">
                  <node concept="4ZOvp" id="GqrtFI5XtP" role="3TlMhJ">
                    <ref role="2DPCA0" node="2CJ7vlDQlc3" resolve="LightValueEvent" />
                  </node>
                  <node concept="4ZOvp" id="GqrtFI5XsP" role="3TlMhI">
                    <ref role="2DPCA0" node="2CJ7vlDPYef" resolve="TouchEvent" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="1_9egQ" id="GqrtFI5Xv2" role="3XIRFZ">
              <node concept="3O_q_g" id="GqrtFI5Xv0" role="1_9egR">
                <ref role="3O_q_h" to="tzd5:2hqbsEGB6ro" resolve="GetEvent" />
                <node concept="1hk5Ds" id="GqrtFI5Xwa" role="3O_q_j">
                  <ref role="1hk5Dt" node="2CJ7vlDRfCX" resolve="LineFollowerTask" />
                </node>
                <node concept="YInwV" id="GqrtFI5Xwt" role="3O_q_j">
                  <node concept="3ZVu4v" id="GqrtFI5XwR" role="1_9fRO">
                    <ref role="3ZVs_2" node="GqrtFI5X51" resolve="eventmask" />
                  </node>
                </node>
              </node>
            </node>
            <node concept="3XISUE" id="GqrtFI5XGL" role="3XIRFZ" />
            <node concept="c0U19" id="GqrtFI5XKf" role="3XIRFZ">
              <node concept="3XIRFW" id="GqrtFI5XKg" role="c0U17">
                <node concept="1_9egQ" id="GqrtFI5XRY" role="3XIRFZ">
                  <node concept="3O_q_g" id="GqrtFI5XRW" role="1_9egR">
                    <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                    <node concept="PhEJO" id="GqrtFI5XSb" role="3O_q_j">
                      <property role="PhEJT" value="Got touch event \n\r" />
                    </node>
                  </node>
                </node>
                <node concept="1_9egQ" id="GqrtFI5Yan" role="3XIRFZ">
                  <node concept="3O_q_g" id="GqrtFI5Yal" role="1_9egR">
                    <ref role="3O_q_h" to="tzd5:2hqbsEGB6c8" resolve="ClearEvent" />
                    <node concept="4ZOvp" id="GqrtFI5YaN" role="3O_q_j">
                      <ref role="2DPCA0" node="2CJ7vlDPYef" resolve="TouchEvent" />
                    </node>
                  </node>
                  <node concept="1z9TsT" id="GqrtFI5YaV" role="lGtFl">
                    <node concept="OjmMv" id="GqrtFI5YaW" role="1w35rA">
                      <node concept="19SGf9" id="GqrtFI5YaX" role="OjmMu">
                        <node concept="19SUe$" id="GqrtFI5YaY" role="19SJt6">
                          <property role="19SUeA" value="clear event" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="c0U19" id="GqrtFI5Yel" role="3XIRFZ">
                  <node concept="3XIRFW" id="GqrtFI5Yem" role="c0U17">
                    <node concept="1_9egQ" id="GqrtFI5Ygv" role="3XIRFZ">
                      <node concept="3O_q_g" id="GqrtFI5Ygu" role="1_9egR">
                        <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                        <node concept="PhEJO" id="GqrtFI5YgE" role="3O_q_j">
                          <property role="PhEJT" value="Starting motors\n\r" />
                        </node>
                      </node>
                    </node>
                    <node concept="1_9egQ" id="GqrtFI5Z59" role="3XIRFZ">
                      <node concept="3O_q_g" id="GqrtFI5Z_b" role="1_9egR">
                        <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                        <node concept="1AkAhK" id="GqrtFI5Z_m" role="3O_q_j">
                          <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAq" resolve="EV3_PORT_A" />
                        </node>
                        <node concept="4ZOvp" id="GqrtFI5Z_V" role="3O_q_j">
                          <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                        </node>
                      </node>
                      <node concept="1z9TsT" id="GqrtFI5ZIC" role="lGtFl">
                        <node concept="OjmMv" id="GqrtFI5ZID" role="1w35rA">
                          <node concept="19SGf9" id="GqrtFI5ZIE" role="OjmMu">
                            <node concept="19SUe$" id="GqrtFI5ZIF" role="19SJt6">
                              <property role="19SUeA" value="start" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="1_9egQ" id="GqrtFI5ZDC" role="3XIRFZ">
                      <node concept="3O_q_g" id="GqrtFI5ZDA" role="1_9egR">
                        <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                        <node concept="1AkAhK" id="GqrtFI5ZDU" role="3O_q_j">
                          <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAv" resolve="EV3_PORT_B" />
                        </node>
                        <node concept="4ZOvp" id="GqrtFI5ZEt" role="3O_q_j">
                          <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                        </node>
                      </node>
                    </node>
                    <node concept="1_9egQ" id="GqrtFI5ZNm" role="3XIRFZ">
                      <node concept="3pqW6w" id="GqrtFI5ZNK" role="1_9egR">
                        <node concept="3TlMhK" id="GqrtFI5ZOJ" role="3TlMhJ" />
                        <node concept="3ZVu4v" id="GqrtFI5ZNk" role="3TlMhI">
                          <ref role="3ZVs_2" node="7vKHPVqx$ov" resolve="isMoving" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="19$8ne" id="GqrtFI5YeH" role="c0U16">
                    <node concept="3ZVu4v" id="GqrtFI5Yf8" role="1_9fRO">
                      <ref role="3ZVs_2" node="7vKHPVqx$ov" resolve="isMoving" />
                    </node>
                  </node>
                  <node concept="1z9TsT" id="GqrtFI5Yfm" role="lGtFl">
                    <node concept="OjmMv" id="GqrtFI5Yfn" role="1w35rA">
                      <node concept="19SGf9" id="GqrtFI5Yfo" role="OjmMu">
                        <node concept="19SUe$" id="GqrtFI5Yfp" role="19SJt6">
                          <property role="19SUeA" value="start or stop the motors" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="1ly_i6" id="GqrtFI5ZRL" role="ggAap">
                    <node concept="3XIRFW" id="GqrtFI5ZRM" role="1ly_ph">
                      <node concept="1_9egQ" id="GqrtFI5ZSJ" role="3XIRFZ">
                        <node concept="3O_q_g" id="GqrtFI5ZSI" role="1_9egR">
                          <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                          <node concept="PhEJO" id="GqrtFI5ZSU" role="3O_q_j">
                            <property role="PhEJT" value="Stopping motors\n\r" />
                          </node>
                        </node>
                      </node>
                      <node concept="1_9egQ" id="GqrtFI609g" role="3XIRFZ">
                        <node concept="3O_q_g" id="GqrtFI609e" role="1_9egR">
                          <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                          <node concept="1AkAhK" id="GqrtFI609$" role="3O_q_j">
                            <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAq" resolve="EV3_PORT_A" />
                          </node>
                          <node concept="3TlMh9" id="GqrtFI609Y" role="3O_q_j">
                            <property role="2hmy$m" value="0" />
                          </node>
                        </node>
                        <node concept="1z9TsT" id="GqrtFI60eH" role="lGtFl">
                          <node concept="OjmMv" id="GqrtFI60eI" role="1w35rA">
                            <node concept="19SGf9" id="GqrtFI60eJ" role="OjmMu">
                              <node concept="19SUe$" id="GqrtFI60eK" role="19SJt6">
                                <property role="19SUeA" value="stop" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="1_9egQ" id="GqrtFI60jW" role="3XIRFZ">
                        <node concept="3O_q_g" id="GqrtFI60jU" role="1_9egR">
                          <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                          <node concept="1AkAhK" id="GqrtFI60ko" role="3O_q_j">
                            <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAv" resolve="EV3_PORT_B" />
                          </node>
                          <node concept="3TlMh9" id="GqrtFI60kM" role="3O_q_j">
                            <property role="2hmy$m" value="0" />
                          </node>
                        </node>
                      </node>
                      <node concept="1_9egQ" id="GqrtFI60qC" role="3XIRFZ">
                        <node concept="3pqW6w" id="GqrtFI60r2" role="1_9egR">
                          <node concept="3TlMhd" id="GqrtFI60s8" role="3TlMhJ" />
                          <node concept="3ZVu4v" id="GqrtFI60qA" role="3TlMhI">
                            <ref role="3ZVs_2" node="7vKHPVqx$ov" resolve="isMoving" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node concept="SSPID" id="GqrtFI5XLF" role="c0U16">
                <node concept="4ZOvp" id="GqrtFI5XOJ" role="3TlMhJ">
                  <ref role="2DPCA0" node="2CJ7vlDPYef" resolve="TouchEvent" />
                </node>
                <node concept="3ZVu4v" id="GqrtFI5XLe" role="3TlMhI">
                  <ref role="3ZVs_2" node="GqrtFI5X51" resolve="eventmask" />
                </node>
              </node>
              <node concept="gg_gk" id="GqrtFI60tO" role="gg_kh">
                <node concept="3XIRFW" id="GqrtFI60tP" role="gg_gl">
                  <node concept="1_9egQ" id="GqrtFI60Cq" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI60Cp" role="1_9egR">
                      <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                      <node concept="PhEJO" id="GqrtFI60CJ" role="3O_q_j">
                        <property role="PhEJT" value="Got light event\n\r" />
                      </node>
                    </node>
                  </node>
                  <node concept="1_9egQ" id="GqrtFI610p" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI610n" role="1_9egR">
                      <ref role="3O_q_h" to="tzd5:2hqbsEGB6c8" resolve="ClearEvent" />
                      <node concept="4ZOvp" id="GqrtFI610I" role="3O_q_j">
                        <ref role="2DPCA0" node="2CJ7vlDQlc3" resolve="LightValueEvent" />
                      </node>
                    </node>
                    <node concept="1z9TsT" id="GqrtFI610Q" role="lGtFl">
                      <node concept="OjmMv" id="GqrtFI610R" role="1w35rA">
                        <node concept="19SGf9" id="GqrtFI610S" role="OjmMu">
                          <node concept="19SUe$" id="GqrtFI610T" role="19SJt6">
                            <property role="19SUeA" value="clear event" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="1_9egQ" id="GqrtFI614H" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI614F" role="1_9egR">
                      <ref role="3O_q_h" to="tzd5:2hqbsEGB5gH" resolve="GetResource" />
                      <node concept="4ZOvp" id="GqrtFI6158" role="3O_q_j">
                        <ref role="2DPCA0" node="2CJ7vlDPYc_" resolve="LightValue" />
                      </node>
                    </node>
                    <node concept="1z9TsT" id="GqrtFI615N" role="lGtFl">
                      <node concept="OjmMv" id="GqrtFI615O" role="1w35rA">
                        <node concept="19SGf9" id="GqrtFI615P" role="OjmMu">
                          <node concept="19SUe$" id="GqrtFI615Q" role="19SJt6">
                            <property role="19SUeA" value="get local light sensor value to work with" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3XIRlf" id="GqrtFI616A" role="3XIRFZ">
                    <property role="TrG5h" value="localLightSensorValue" />
                    <node concept="26VqpV" id="GqrtFI616$" role="2C2TGm">
                      <property role="2caQfQ" value="false" />
                      <property role="2c7vTL" value="false" />
                    </node>
                    <node concept="1S7827" id="GqrtFI617Y" role="3XIe9u">
                      <ref role="1S7826" node="4osOqZkm2sr" resolve="lightSensorValue" />
                    </node>
                  </node>
                  <node concept="1_9egQ" id="GqrtFI618P" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI618N" role="1_9egR">
                      <ref role="3O_q_h" to="tzd5:2hqbsEGB5xU" resolve="ReleaseResource" />
                      <node concept="4ZOvp" id="GqrtFI619q" role="3O_q_j">
                        <ref role="2DPCA0" node="2CJ7vlDPYc_" resolve="LightValue" />
                      </node>
                    </node>
                  </node>
                  <node concept="3XIRlf" id="GqrtFI61ai" role="3XIRFZ">
                    <property role="TrG5h" value="error" />
                    <node concept="2fgwQN" id="GqrtFI61ag" role="2C2TGm">
                      <property role="2caQfQ" value="false" />
                      <property role="2c7vTL" value="false" />
                    </node>
                    <node concept="2BOcil" id="GqrtFI61bR" role="3XIe9u">
                      <node concept="4ZOvp" id="GqrtFI61cy" role="3TlMhJ">
                        <ref role="2DPCA0" node="5g5RAGpXloU" resolve="MIDDLE" />
                      </node>
                      <node concept="3ZVu4v" id="GqrtFI61bo" role="3TlMhI">
                        <ref role="3ZVs_2" node="GqrtFI616A" resolve="localLightSensorValue" />
                      </node>
                    </node>
                    <node concept="1z9TsT" id="GqrtFI61le" role="lGtFl">
                      <node concept="OjmMv" id="GqrtFI61lf" role="1w35rA">
                        <node concept="19SGf9" id="GqrtFI61lg" role="OjmMu">
                          <node concept="19SUe$" id="GqrtFI61lh" role="19SJt6">
                            <property role="19SUeA" value="error is &lt; 0 if we are too far left,&#10;error is &gt; 0 if we are too far right" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3XIRlf" id="GqrtFI61vh" role="3XIRFZ">
                    <property role="TrG5h" value="output" />
                    <node concept="2fgwQN" id="GqrtFI61vf" role="2C2TGm">
                      <property role="2caQfQ" value="false" />
                      <property role="2c7vTL" value="false" />
                    </node>
                    <node concept="3O_q_g" id="GqrtFI61wk" role="3XIe9u">
                      <ref role="3O_q_h" node="5g5RAGpXqPj" resolve="UpdatePID" />
                      <node concept="YInwV" id="GqrtFI61wx" role="3O_q_j">
                        <node concept="3ZVu4v" id="GqrtFI61wU" role="1_9fRO">
                          <ref role="3ZVs_2" node="7vKHPVqxAgU" resolve="pid" />
                        </node>
                      </node>
                      <node concept="3ZVu4v" id="GqrtFI61xO" role="3O_q_j">
                        <ref role="3ZVs_2" node="GqrtFI61ai" resolve="error" />
                      </node>
                    </node>
                    <node concept="1z9TsT" id="GqrtFI61yV" role="lGtFl">
                      <node concept="OjmMv" id="GqrtFI61yW" role="1w35rA">
                        <node concept="19SGf9" id="GqrtFI61yX" role="OjmMu">
                          <node concept="19SUe$" id="GqrtFI61yY" role="19SJt6">
                            <property role="19SUeA" value="output will have the same signs as error" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3XISUE" id="GqrtFI61Gy" role="3XIRFZ" />
                  <node concept="1_9egQ" id="GqrtFI61FK" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI61FI" role="1_9egR">
                      <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                      <node concept="PhEJO" id="GqrtFI61I2" role="3O_q_j">
                        <property role="PhEJT" value="PID output is %i\n\r" />
                      </node>
                      <node concept="3ZVu4v" id="GqrtFI62hd" role="3O_q_j">
                        <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                      </node>
                    </node>
                  </node>
                  <node concept="3XISUE" id="GqrtFI62m6" role="3XIRFZ" />
                  <node concept="c0U19" id="GqrtFI62kj" role="3XIRFZ">
                    <node concept="3XIRFW" id="GqrtFI62kk" role="c0U17">
                      <node concept="3Safn$" id="GqrtFI62m4" role="3XIRFZ" />
                    </node>
                    <node concept="19$8ne" id="GqrtFI62lf" role="c0U16">
                      <node concept="3ZVu4v" id="GqrtFI62lH" role="1_9fRO">
                        <ref role="3ZVs_2" node="7vKHPVqx$ov" resolve="isMoving" />
                      </node>
                    </node>
                    <node concept="1z9TsT" id="GqrtFI62mW" role="lGtFl">
                      <node concept="OjmMv" id="GqrtFI62mX" role="1w35rA">
                        <node concept="19SGf9" id="GqrtFI62mY" role="OjmMu">
                          <node concept="19SUe$" id="GqrtFI62mZ" role="19SJt6">
                            <property role="19SUeA" value="check if we are moving - if not, we have nothing to adjust" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="3XISUE" id="GqrtFI62nY" role="3XIRFZ" />
                  <node concept="c0U19" id="GqrtFI62pX" role="3XIRFZ">
                    <node concept="3XIRFW" id="GqrtFI62pY" role="c0U17">
                      <node concept="1_9egQ" id="GqrtFI62Ew" role="3XIRFZ">
                        <node concept="3O_q_g" id="GqrtFI62Ev" role="1_9egR">
                          <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                          <node concept="PhEJO" id="GqrtFI62EF" role="3O_q_j">
                            <property role="PhEJT" value="Turning right\n\r" />
                          </node>
                        </node>
                      </node>
                      <node concept="3XIRlf" id="GqrtFI63f2" role="3XIRFZ">
                        <property role="TrG5h" value="leftMotorSpeed" />
                        <node concept="26Vqqz" id="GqrtFI63f0" role="2C2TGm">
                          <property role="2caQfQ" value="false" />
                          <property role="2c7vTL" value="false" />
                        </node>
                        <node concept="1S8S4T" id="GqrtFI65h9" role="3XIe9u">
                          <node concept="2BPB98" id="GqrtFI65ha" role="1S8S4V">
                            <node concept="2BOcil" id="GqrtFI63iJ" role="1_9fRO">
                              <node concept="2BOcij" id="GqrtFI64fv" role="3TlMhJ">
                                <node concept="3ZVu4v" id="GqrtFI64lP" role="3TlMhJ">
                                  <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                                </node>
                                <node concept="3TlMh9" id="GqrtFI63ow" role="3TlMhI">
                                  <property role="2hmy$m" value="0.75" />
                                </node>
                              </node>
                              <node concept="4ZOvp" id="GqrtFI63fL" role="3TlMhI">
                                <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                              </node>
                            </node>
                          </node>
                          <node concept="26Vqqz" id="GqrtFI65_w" role="1S8S4N">
                            <property role="2caQfQ" value="false" />
                            <property role="2c7vTL" value="false" />
                          </node>
                        </node>
                        <node concept="1z9TsT" id="GqrtFI663f" role="lGtFl">
                          <node concept="OjmMv" id="GqrtFI663g" role="1w35rA">
                            <node concept="19SGf9" id="GqrtFI663h" role="OjmMu">
                              <node concept="19SUe$" id="GqrtFI663i" role="19SJt6">
                                <property role="19SUeA" value="result &gt; NORMAL_SPEED" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3XIRlf" id="GqrtFI66A5" role="3XIRFZ">
                        <property role="TrG5h" value="rightMotorSpeed" />
                        <node concept="26Vqqz" id="GqrtFI66A3" role="2C2TGm">
                          <property role="2caQfQ" value="false" />
                          <property role="2c7vTL" value="false" />
                        </node>
                        <node concept="1S8S4T" id="GqrtFI66AT" role="3XIe9u">
                          <node concept="2BPB98" id="GqrtFI66AU" role="1S8S4V">
                            <node concept="2BOciq" id="GqrtFI66Ca" role="1_9fRO">
                              <node concept="2BOcij" id="GqrtFI67DC" role="3TlMhJ">
                                <node concept="3ZVu4v" id="GqrtFI67EW" role="3TlMhJ">
                                  <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                                </node>
                                <node concept="3TlMh9" id="GqrtFI66Cz" role="3TlMhI">
                                  <property role="2hmy$m" value="1.5" />
                                </node>
                              </node>
                              <node concept="4ZOvp" id="GqrtFI66BP" role="3TlMhI">
                                <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                              </node>
                            </node>
                          </node>
                          <node concept="26Vqqz" id="GqrtFI66Be" role="1S8S4N">
                            <property role="2caQfQ" value="false" />
                            <property role="2c7vTL" value="false" />
                          </node>
                        </node>
                        <node concept="1z9TsT" id="GqrtFI68ai" role="lGtFl">
                          <node concept="OjmMv" id="GqrtFI68aj" role="1w35rA">
                            <node concept="19SGf9" id="GqrtFI68ak" role="OjmMu">
                              <node concept="19SUe$" id="GqrtFI68al" role="19SJt6">
                                <property role="19SUeA" value="result &lt; NORMAL_SPEED" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="1X3_iC" id="GqrtFI6blz" role="lGtFl">
                        <property role="3V$3am" value="statements" />
                        <property role="3V$3ak" value="a9d69647-0840-491e-bf39-2eb0805d2011/4185783222026475861/4185783222026475862" />
                        <node concept="1_9egQ" id="GqrtFI68bu" role="8Wnug">
                          <node concept="3O_q_g" id="GqrtFI68bs" role="1_9egR">
                            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                            <node concept="PhEJO" id="GqrtFI68c8" role="3O_q_j">
                              <property role="PhEJT" value="Left Motor Power: %i, Right Motor Power: %i\n" />
                            </node>
                            <node concept="3ZVu4v" id="GqrtFI69ZH" role="3O_q_j">
                              <ref role="3ZVs_2" node="GqrtFI63f2" resolve="leftMotorSpeed" />
                            </node>
                            <node concept="3ZVu4v" id="GqrtFI6a7f" role="3O_q_j">
                              <ref role="3ZVs_2" node="GqrtFI66A5" resolve="rightMotorSpeed" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="1_9egQ" id="GqrtFI6abL" role="3XIRFZ">
                        <node concept="3O_q_g" id="GqrtFI6abJ" role="1_9egR">
                          <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                          <node concept="1AkAhK" id="GqrtFI6acv" role="3O_q_j">
                            <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAq" resolve="EV3_PORT_A" />
                          </node>
                          <node concept="3ZVu4v" id="GqrtFI6acZ" role="3O_q_j">
                            <ref role="3ZVs_2" node="GqrtFI63f2" resolve="leftMotorSpeed" />
                          </node>
                        </node>
                      </node>
                      <node concept="1_9egQ" id="GqrtFI6aKX" role="3XIRFZ">
                        <node concept="3O_q_g" id="GqrtFI6aKV" role="1_9egR">
                          <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                          <node concept="1AkAhK" id="GqrtFI6aLK" role="3O_q_j">
                            <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAv" resolve="EV3_PORT_B" />
                          </node>
                          <node concept="3ZVu4v" id="GqrtFI6aMg" role="3O_q_j">
                            <ref role="3ZVs_2" node="GqrtFI66A5" resolve="rightMotorSpeed" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node concept="3Tl9Jn" id="GqrtFI62rD" role="c0U16">
                      <node concept="3TlMh9" id="GqrtFI62rM" role="3TlMhJ">
                        <property role="2hmy$m" value="0" />
                      </node>
                      <node concept="3ZVu4v" id="GqrtFI62rp" role="3TlMhI">
                        <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                      </node>
                    </node>
                    <node concept="gg_gk" id="GqrtFI6cPg" role="gg_kh">
                      <node concept="3XIRFW" id="GqrtFI6cPh" role="gg_gl">
                        <node concept="1_9egQ" id="GqrtFI6dgC" role="3XIRFZ">
                          <node concept="3O_q_g" id="GqrtFI6dgD" role="1_9egR">
                            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                            <node concept="PhEJO" id="GqrtFI6dgE" role="3O_q_j">
                              <property role="PhEJT" value="Turning left\n\r" />
                            </node>
                          </node>
                        </node>
                        <node concept="3XIRlf" id="GqrtFI6dgF" role="3XIRFZ">
                          <property role="TrG5h" value="leftMotorSpeed" />
                          <node concept="26Vqqz" id="GqrtFI6dgG" role="2C2TGm">
                            <property role="2caQfQ" value="false" />
                            <property role="2c7vTL" value="false" />
                          </node>
                          <node concept="1S8S4T" id="GqrtFI6dgH" role="3XIe9u">
                            <node concept="2BPB98" id="GqrtFI6dgI" role="1S8S4V">
                              <node concept="2BOcil" id="GqrtFI6dgJ" role="1_9fRO">
                                <node concept="2BOcij" id="GqrtFI6dgK" role="3TlMhJ">
                                  <node concept="3ZVu4v" id="GqrtFI6dgL" role="3TlMhJ">
                                    <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                                  </node>
                                  <node concept="3TlMh9" id="GqrtFI6dgM" role="3TlMhI">
                                    <property role="2hmy$m" value="1.5" />
                                  </node>
                                </node>
                                <node concept="4ZOvp" id="GqrtFI6dgN" role="3TlMhI">
                                  <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                                </node>
                              </node>
                            </node>
                            <node concept="26Vqqz" id="GqrtFI6dgO" role="1S8S4N">
                              <property role="2caQfQ" value="false" />
                              <property role="2c7vTL" value="false" />
                            </node>
                          </node>
                          <node concept="1z9TsT" id="GqrtFI6dgP" role="lGtFl">
                            <node concept="OjmMv" id="GqrtFI6dgQ" role="1w35rA">
                              <node concept="19SGf9" id="GqrtFI6dgR" role="OjmMu">
                                <node concept="19SUe$" id="GqrtFI6dgS" role="19SJt6">
                                  <property role="19SUeA" value="result &lt; NORMAL_SPEED" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="3XIRlf" id="GqrtFI6dgT" role="3XIRFZ">
                          <property role="TrG5h" value="rightMotorSpeed" />
                          <node concept="26Vqqz" id="GqrtFI6dgU" role="2C2TGm">
                            <property role="2caQfQ" value="false" />
                            <property role="2c7vTL" value="false" />
                          </node>
                          <node concept="1S8S4T" id="GqrtFI6dgV" role="3XIe9u">
                            <node concept="2BPB98" id="GqrtFI6dgW" role="1S8S4V">
                              <node concept="2BOciq" id="GqrtFI6dgX" role="1_9fRO">
                                <node concept="2BOcij" id="GqrtFI6dgY" role="3TlMhJ">
                                  <node concept="3ZVu4v" id="GqrtFI6dgZ" role="3TlMhJ">
                                    <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                                  </node>
                                  <node concept="3TlMh9" id="GqrtFI6dh0" role="3TlMhI">
                                    <property role="2hmy$m" value="0.75" />
                                  </node>
                                </node>
                                <node concept="4ZOvp" id="GqrtFI6dh1" role="3TlMhI">
                                  <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                                </node>
                              </node>
                            </node>
                            <node concept="26Vqqz" id="GqrtFI6dh2" role="1S8S4N">
                              <property role="2caQfQ" value="false" />
                              <property role="2c7vTL" value="false" />
                            </node>
                          </node>
                          <node concept="1z9TsT" id="GqrtFI6dh3" role="lGtFl">
                            <node concept="OjmMv" id="GqrtFI6dh4" role="1w35rA">
                              <node concept="19SGf9" id="GqrtFI6dh5" role="OjmMu">
                                <node concept="19SUe$" id="GqrtFI6dh6" role="19SJt6">
                                  <property role="19SUeA" value="result &gt; NORMAL_SPEED" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node concept="1_9egQ" id="GqrtFI6dh7" role="3XIRFZ">
                          <node concept="3O_q_g" id="GqrtFI6dh8" role="1_9egR">
                            <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                            <node concept="1AkAhK" id="GqrtFI6dh9" role="3O_q_j">
                              <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAq" resolve="EV3_PORT_A" />
                            </node>
                            <node concept="3ZVu4v" id="GqrtFI6dha" role="3O_q_j">
                              <ref role="3ZVs_2" node="GqrtFI6dgF" resolve="leftMotorSpeed" />
                            </node>
                          </node>
                        </node>
                        <node concept="1_9egQ" id="GqrtFI6dhb" role="3XIRFZ">
                          <node concept="3O_q_g" id="GqrtFI6dhc" role="1_9egR">
                            <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                            <node concept="1AkAhK" id="GqrtFI6dhd" role="3O_q_j">
                              <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAv" resolve="EV3_PORT_B" />
                            </node>
                            <node concept="3ZVu4v" id="GqrtFI6dhe" role="3O_q_j">
                              <ref role="3ZVs_2" node="GqrtFI6dgT" resolve="rightMotorSpeed" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node concept="3Tl9Jr" id="GqrtFI6d3W" role="gg_gt">
                        <node concept="3TlMh9" id="GqrtFI6d45" role="3TlMhJ">
                          <property role="2hmy$m" value="0" />
                        </node>
                        <node concept="3ZVu4v" id="GqrtFI6d3H" role="3TlMhI">
                          <ref role="3ZVs_2" node="GqrtFI61vh" resolve="output" />
                        </node>
                      </node>
                    </node>
                    <node concept="1ly_i6" id="GqrtFI6idd" role="ggAap">
                      <node concept="3XIRFW" id="GqrtFI6ide" role="1ly_ph">
                        <node concept="1_9egQ" id="GqrtFI6iA6" role="3XIRFZ">
                          <node concept="3O_q_g" id="GqrtFI6iA5" role="1_9egR">
                            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                            <node concept="PhEJO" id="GqrtFI6iAh" role="3O_q_j">
                              <property role="PhEJT" value="Going straight\n\r" />
                            </node>
                          </node>
                        </node>
                        <node concept="1_9egQ" id="GqrtFI6iSg" role="3XIRFZ">
                          <node concept="3O_q_g" id="GqrtFI6iSe" role="1_9egR">
                            <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                            <node concept="1AkAhK" id="GqrtFI6iSu" role="3O_q_j">
                              <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAq" resolve="EV3_PORT_A" />
                            </node>
                            <node concept="4ZOvp" id="GqrtFI6iSY" role="3O_q_j">
                              <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                            </node>
                          </node>
                        </node>
                        <node concept="1_9egQ" id="GqrtFI6jof" role="3XIRFZ">
                          <node concept="3O_q_g" id="GqrtFI6jod" role="1_9egR">
                            <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                            <node concept="1AkAhK" id="GqrtFI6jox" role="3O_q_j">
                              <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAv" resolve="EV3_PORT_B" />
                            </node>
                            <node concept="4ZOvp" id="GqrtFI6jp1" role="3O_q_j">
                              <ref role="2DPCA0" node="5g5RAGpXl0p" resolve="NORMAL_SPEED" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node concept="SSPID" id="GqrtFI60xH" role="gg_gt">
                  <node concept="4ZOvp" id="GqrtFI60_1" role="3TlMhJ">
                    <ref role="2DPCA0" node="2CJ7vlDQlc3" resolve="LightValueEvent" />
                  </node>
                  <node concept="3ZVu4v" id="GqrtFI60xh" role="3TlMhI">
                    <ref role="3ZVs_2" node="GqrtFI5X51" resolve="eventmask" />
                  </node>
                </node>
              </node>
              <node concept="1ly_i6" id="GqrtFI6jUQ" role="ggAap">
                <node concept="3XIRFW" id="GqrtFI6jUR" role="1ly_ph">
                  <node concept="1_9egQ" id="GqrtFI6jXg" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI6jXf" role="1_9egR">
                      <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                      <node concept="PhEJO" id="GqrtFI6jXr" role="3O_q_j">
                        <property role="PhEJT" value="An error occured (wrong event)\n\r" />
                      </node>
                    </node>
                  </node>
                  <node concept="1_9egQ" id="GqrtFI6kwg" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI6kwe" role="1_9egR">
                      <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                      <node concept="1AkAhK" id="GqrtFI6kwu" role="3O_q_j">
                        <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAq" resolve="EV3_PORT_A" />
                      </node>
                      <node concept="3TlMh9" id="GqrtFI6kwS" role="3O_q_j">
                        <property role="2hmy$m" value="0" />
                      </node>
                    </node>
                    <node concept="1z9TsT" id="GqrtFI6l_x" role="lGtFl">
                      <node concept="OjmMv" id="GqrtFI6l_y" role="1w35rA">
                        <node concept="19SGf9" id="GqrtFI6l_z" role="OjmMu">
                          <node concept="19SUe$" id="GqrtFI6l_$" role="19SJt6">
                            <property role="19SUeA" value="must not happen - something went wrong&#10;log error and stop execution" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node concept="1_9egQ" id="GqrtFI6l1Q" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI6l1O" role="1_9egR">
                      <ref role="3O_q_h" to="ei6g:3QwuWjHjGJX" resolve="ecrobot_set_motor_speed" />
                      <node concept="1AkAhK" id="GqrtFI6l2e" role="3O_q_j">
                        <ref role="1AkAhZ" to="ei6g:3tDp_yW5IAv" resolve="EV3_PORT_B" />
                      </node>
                      <node concept="3TlMh9" id="GqrtFI6l2C" role="3O_q_j">
                        <property role="2hmy$m" value="0" />
                      </node>
                    </node>
                  </node>
                  <node concept="1_9egQ" id="GqrtFI6l$3" role="3XIRFZ">
                    <node concept="3O_q_g" id="GqrtFI6l$1" role="1_9egR">
                      <ref role="3O_q_h" to="ei6g:3QwuWjHjH4l" resolve="ecrobot_set_light_sensor_inactive" />
                      <node concept="1AkAhK" id="GqrtFI6l$o" role="3O_q_j">
                        <ref role="1AkAhZ" to="ei6g:3tDp_yW5KZ3" resolve="EV3_PORT_S2" />
                      </node>
                    </node>
                  </node>
                  <node concept="27uf6b" id="GqrtFI6l_g" role="3XIRFZ" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3TlMhK" id="GqrtFI5X48" role="27v$We" />
        </node>
        <node concept="3XISUE" id="GqrtFI5X4l" role="3XIRFZ" />
        <node concept="QCpGs" id="2CJ7vlDRmrE" role="3XIRFZ" />
      </node>
      <node concept="19Rifw" id="2CJ7vlDRmrD" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="3GEVxB" id="5g5RAGpXMM3" role="2OODSX">
      <ref role="3GEb4d" to="ei6g:3tDp_yW6whK" resolve="ecrobot_interface" />
    </node>
    <node concept="3GEVxB" id="5g5RAGpXO$m" role="2OODSX">
      <ref role="3GEb4d" to="tzd5:2UjW4IkHtzb" resolve="kernel" />
    </node>
    <node concept="3GEVxB" id="3biQP486lm2" role="2OODSX">
      <ref role="3GEb4d" node="3biQP486ju3" resolve="LfVariability" />
    </node>
    <node concept="3GEVxB" id="5YkaFUJVHXg" role="2OODSX">
      <ref role="3GEb4d" to="k7td:5YkaFUJVGNP" resolve="stdio_stub" />
    </node>
    <node concept="3GEVxB" id="5JhwNflEOw8" role="2OODSX">
      <ref role="3GEb4d" node="4osOqZkm2sh" resolve="LightValueEventDispatcherTask" />
    </node>
    <node concept="3GEVxB" id="2CJ7vlDRiEb" role="2OODSX">
      <ref role="3GEb4d" node="2CJ7vlDPYcx" resolve="LinefollowerOil" />
    </node>
    <node concept="2dvl_R" id="3biQP486llN" role="lGtFl">
      <ref role="AiAcg" node="3biQP486ju_" resolve="DoDebug" />
      <ref role="2dvl_Q" node="3biQP486ju6" resolve="DebugFeature" />
    </node>
  </node>
  <node concept="N3F5e" id="5g5RAGpXkGH">
    <property role="TrG5h" value="TouchEventDispatcherTask" />
    <node concept="3GEVxB" id="5g5RAGpXkOY" role="2OODSX">
      <ref role="3GEb4d" to="ei6g:3tDp_yW6whK" resolve="ecrobot_interface" />
    </node>
    <node concept="3GEVxB" id="5g5RAGpXkPC" role="2OODSX">
      <ref role="3GEb4d" to="tzd5:2UjW4IkHtzb" resolve="kernel" />
    </node>
    <node concept="3GEVxB" id="3biQP486sqV" role="2OODSX">
      <ref role="3GEb4d" node="3biQP486ju3" resolve="LfVariability" />
    </node>
    <node concept="3GEVxB" id="5YkaFUJVHXs" role="2OODSX">
      <ref role="3GEb4d" to="k7td:5YkaFUJVGNP" resolve="stdio_stub" />
    </node>
    <node concept="3GEVxB" id="2CJ7vlDRlVn" role="2OODSX">
      <ref role="3GEb4d" node="2CJ7vlDPYcx" resolve="LinefollowerOil" />
    </node>
    <node concept="2dvl_R" id="3biQP486sDE" role="lGtFl">
      <ref role="2dvl_Q" node="3biQP486ju6" resolve="DebugFeature" />
      <ref role="AiAcg" node="3biQP486ju_" resolve="DoDebug" />
    </node>
    <node concept="18XYSt" id="2CJ7vlDRkfQ" role="N3F5h">
      <ref role="18XYSp" node="2CJ7vlDQldO" resolve="TouchEventDispatcherTask" />
      <node concept="3XIRFW" id="2CJ7vlDRkfS" role="3XIRFX">
        <node concept="1QiMYF" id="2CJ7vlDRkgT" role="3XIRFZ">
          <node concept="OjmMv" id="2CJ7vlDRkgV" role="3SJzmv">
            <node concept="19SGf9" id="2CJ7vlDRkgW" role="OjmMu">
              <node concept="19SUe$" id="2CJ7vlDRkgX" role="19SJt6">
                <property role="19SUeA" value="ifdef Debug_Output" />
              </node>
            </node>
          </node>
        </node>
        <node concept="1_9egQ" id="2CJ7vlDRki9" role="3XIRFZ">
          <node concept="3O_q_g" id="2CJ7vlDRki7" role="1_9egR">
            <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
            <node concept="PhEJO" id="2CJ7vlDRkiP" role="3O_q_j">
              <property role="PhEJT" value="Starting TouchEventTask\n\r" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="2CJ7vlDRkhn" role="3XIRFZ" />
        <node concept="c0U19" id="2CJ7vlDRl1j" role="3XIRFZ">
          <node concept="3XIRFW" id="2CJ7vlDRl1k" role="c0U17">
            <node concept="1_9egQ" id="2CJ7vlDRlzZ" role="3XIRFZ">
              <node concept="3O_q_g" id="2CJ7vlDRlzY" role="1_9egR">
                <ref role="3O_q_h" to="k7td:5_NnRVV9ojC" resolve="printf" />
                <node concept="PhEJO" id="2CJ7vlDRl$c" role="3O_q_j">
                  <property role="PhEJT" value="Sending touch event" />
                </node>
              </node>
              <node concept="1z9TsT" id="2CJ7vlDRm0y" role="lGtFl">
                <node concept="OjmMv" id="2CJ7vlDRm0z" role="1w35rA">
                  <node concept="19SGf9" id="2CJ7vlDRm0$" role="OjmMu">
                    <node concept="19SUe$" id="2CJ7vlDRm0_" role="19SJt6">
                      <property role="19SUeA" value="ifdef Debug_Output" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node concept="1_9egQ" id="2CJ7vlDRlQm" role="3XIRFZ">
              <node concept="3O_q_g" id="2CJ7vlDRlQk" role="1_9egR">
                <ref role="3O_q_h" to="tzd5:2hqbsEGB5KT" resolve="SetEvent" />
                <node concept="1hk5Ds" id="2CJ7vlDRlQK" role="3O_q_j">
                  <ref role="1hk5Dt" node="2CJ7vlDRfCX" resolve="LineFollowerTask" />
                </node>
                <node concept="4ZOvp" id="2CJ7vlDRlXL" role="3O_q_j">
                  <ref role="2DPCA0" node="2CJ7vlDPYef" resolve="TouchEvent" />
                </node>
              </node>
            </node>
          </node>
          <node concept="3O_q_g" id="2CJ7vlDRl23" role="c0U16">
            <ref role="3O_q_h" to="ei6g:3QwuWjHjHa4" resolve="ecrobot_get_touch_sensor" />
            <node concept="1AkAhK" id="2CJ7vlDRl2e" role="3O_q_j">
              <ref role="1AkAhZ" to="ei6g:3tDp_yW5KZc" resolve="EV3_PORT_S3" />
            </node>
          </node>
        </node>
        <node concept="3XISUE" id="2CJ7vlDRl0C" role="3XIRFZ" />
        <node concept="QCpGs" id="2CJ7vlDRkfV" role="3XIRFZ" />
      </node>
      <node concept="19Rifw" id="2CJ7vlDRkfU" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
  </node>
</model>

