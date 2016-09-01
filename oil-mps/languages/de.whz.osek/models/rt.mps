<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:0126c7d2-560a-4504-a602-3e7bcb88fde4(de.whz.osek.rt)">
  <persistence version="9" />
  <languages>
    <use id="7a30de00-cb30-45dd-ab11-776f84eb73fe" name="de.whz.osek" version="0" />
    <devkit ref="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
    <devkit ref="d2a9c55c-6bdc-4cc2-97e1-4ba7552f5584(com.mbeddr.core)" />
  </languages>
  <imports />
  <registry>
    <language id="a9d69647-0840-491e-bf39-2eb0805d2011" name="com.mbeddr.core.statements">
      <concept id="7763322639126652757" name="com.mbeddr.core.statements.structure.ITypeContainingType" flags="ng" index="2umbIr">
        <child id="7763322639126652758" name="baseType" index="2umbIo" />
      </concept>
    </language>
    <language id="3bf5377a-e904-4ded-9754-5a516023bfaa" name="com.mbeddr.core.pointers">
      <concept id="279446265608459824" name="com.mbeddr.core.pointers.structure.PointerType" flags="ng" index="3wxxNl" />
    </language>
    <language id="efda956e-491e-4f00-ba14-36af2f213ecf" name="com.mbeddr.core.udt">
      <concept id="6116558314501347857" name="com.mbeddr.core.udt.structure.TypeDef" flags="ng" index="rcJHK">
        <child id="6116558314501347862" name="original" index="rcJHR" />
      </concept>
      <concept id="6116558314501347863" name="com.mbeddr.core.udt.structure.TypeDefType" flags="ng" index="rcJHQ">
        <reference id="6116558314501347864" name="typeDef" index="rcJHT" />
      </concept>
      <concept id="7099329415459817973" name="com.mbeddr.core.udt.structure.SUDeclaration" flags="ng" index="HsMI8">
        <child id="7099329415459888018" name="members" index="HszBJ" />
      </concept>
      <concept id="5882395403881875736" name="com.mbeddr.core.udt.structure.Member" flags="ng" index="1dpRTG" />
      <concept id="6394819151180597807" name="com.mbeddr.core.udt.structure.StructDeclaration" flags="ng" index="1sgJKc" />
      <concept id="6394819151180597816" name="com.mbeddr.core.udt.structure.StructType" flags="ng" index="1sgJKr">
        <reference id="6394819151180597817" name="struct" index="1sgJKq" />
      </concept>
    </language>
    <language id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base">
      <concept id="747084250476811597" name="com.mbeddr.core.base.structure.DefaultGenericChunkDependency" flags="ng" index="3GEVxB">
        <reference id="747084250476878887" name="chunk" index="3GEb4d" />
      </concept>
    </language>
    <language id="6d11763d-483d-4b2b-8efc-09336c1b0001" name="com.mbeddr.core.modules">
      <concept id="6116558314501417952" name="com.mbeddr.core.modules.structure.HeaderDescriptor" flags="ng" index="rcWE1" />
      <concept id="6116558314501417921" name="com.mbeddr.core.modules.structure.ExternalModule" flags="ng" index="rcWEw">
        <child id="6116558314501417978" name="descriptors" index="rcWEr" />
      </concept>
      <concept id="6116558314501417934" name="com.mbeddr.core.modules.structure.ExternalResourceDescriptor" flags="ng" index="rcWEJ">
        <property id="6116558314501417936" name="path" index="rcWEL" />
      </concept>
      <concept id="6021475212425916971" name="com.mbeddr.core.modules.structure.GlobalConstantFunctionDeclaration" flags="ng" index="BTY7A">
        <child id="8655966904682451042" name="content" index="2_0FLF" />
        <child id="6021475212425916983" name="arguments" index="BTY7U" />
      </concept>
      <concept id="6021475212426054485" name="com.mbeddr.core.modules.structure.GlobalConstantFunctionArgument" flags="ng" index="BUhyo" />
      <concept id="8105003328814797298" name="com.mbeddr.core.modules.structure.IFunctionLike" flags="ng" index="2H9T1B">
        <child id="5708867820623310661" name="arguments" index="1UOdpc" />
      </concept>
      <concept id="6437088627575722813" name="com.mbeddr.core.modules.structure.Module" flags="ng" index="N3F4X">
        <child id="6437088627575722833" name="contents" index="N3F5h" />
        <child id="1317894735999304826" name="imports" index="2OODSX" />
      </concept>
      <concept id="6437088627575722831" name="com.mbeddr.core.modules.structure.IModuleContent" flags="ng" index="N3F5f">
        <property id="1317894735999272944" name="exported" index="2OOxQR" />
      </concept>
      <concept id="6437088627575724000" name="com.mbeddr.core.modules.structure.FunctionPrototype" flags="ng" index="N3Fnw" />
      <concept id="8934095934011938595" name="com.mbeddr.core.modules.structure.EmptyModuleContent" flags="ng" index="2NXPZ9" />
      <concept id="7308356872494660981" name="com.mbeddr.core.modules.structure.GlobalConstantFuntionArgumentRef" flags="ng" index="39I4aJ">
        <reference id="7308356872494660982" name="arg" index="39I4aG" />
      </concept>
      <concept id="7892328519581704407" name="com.mbeddr.core.modules.structure.Argument" flags="ng" index="19RgSI" />
      <concept id="6708182213627045678" name="com.mbeddr.core.modules.structure.IExternable" flags="ng" index="3mNis0">
        <property id="6708182213627045681" name="extern" index="3mNisv" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions">
      <concept id="8463282783691618461" name="com.mbeddr.core.expressions.structure.UnsignedInt8tType" flags="ng" index="26Vqp4" />
      <concept id="8463282783691618450" name="com.mbeddr.core.expressions.structure.UnsignedInt32tType" flags="ng" index="26Vqpb" />
      <concept id="8463282783691618445" name="com.mbeddr.core.expressions.structure.Int64tType" flags="ng" index="26Vqpk" />
      <concept id="8463282783691492730" name="com.mbeddr.core.expressions.structure.UnsignedIntType" flags="ng" index="26VXez" />
      <concept id="318113533128716675" name="com.mbeddr.core.expressions.structure.ITyped" flags="ng" index="2C2TGh">
        <child id="318113533128716676" name="type" index="2C2TGm" />
      </concept>
      <concept id="8860443239512128054" name="com.mbeddr.core.expressions.structure.Type" flags="ng" index="3TlMgo">
        <property id="2941277002445651368" name="const" index="2c7vTL" />
        <property id="2941277002448691247" name="volatile" index="2caQfQ" />
      </concept>
    </language>
  </registry>
  <node concept="rcWEw" id="2UjW4IkHtze">
    <property role="TrG5h" value="osek" />
    <node concept="rcWE1" id="2UjW4IkHtzf" role="rcWEr">
      <property role="rcWEL" value="&quot;osek.h&quot;" />
    </node>
    <node concept="rcJHK" id="2UjW4IkHtzR" role="N3F5h">
      <property role="TrG5h" value="StatusType" />
      <node concept="26Vqp4" id="2UjW4IkHt$0" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
  </node>
  <node concept="rcWEw" id="2UjW4IkHtzb">
    <property role="TrG5h" value="kernel" />
    <node concept="rcJHK" id="2hqbsEGB3XX" role="N3F5h">
      <property role="TrG5h" value="TaskType" />
      <node concept="26VXez" id="2hqbsEGB3ZU" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXkd4" role="N3F5h">
      <property role="TrG5h" value="TaskStateType" />
      <node concept="26Vqp4" id="5g5RAGpXkdH" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="2hqbsEGB4g2" role="N3F5h">
      <property role="TrG5h" value="ResourceType" />
      <node concept="26Vqp4" id="2hqbsEGB4iv" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="2hqbsEGB4l2" role="N3F5h">
      <property role="TrG5h" value="EventMaskType" />
      <node concept="26Vqpb" id="2hqbsEGB4nx" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXkh0" role="N3F5h">
      <property role="TrG5h" value="TickType" />
      <node concept="26Vqpb" id="5g5RAGpXkhI" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXkiB" role="N3F5h">
      <property role="TrG5h" value="AlarmType" />
      <node concept="26Vqp4" id="5g5RAGpXkjn" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXkkx" role="N3F5h">
      <property role="TrG5h" value="AppModeType" />
      <node concept="26Vqp4" id="5g5RAGpXklj" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXkmq" role="N3F5h">
      <property role="TrG5h" value="OSServiceIdType" />
      <node concept="26Vqp4" id="5g5RAGpXkne" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXkp9" role="N3F5h">
      <property role="TrG5h" value="IsrType" />
      <node concept="26Vqp4" id="5g5RAGpXkpZ" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcJHK" id="2UjW4IkHtxp" role="N3F5h">
      <property role="TrG5h" value="CounterType" />
      <node concept="26Vqp4" id="2UjW4IkHtxS" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="2NXPZ9" id="5g5RAGpXkee" role="N3F5h">
      <property role="TrG5h" value="empty_1452786929361_31" />
    </node>
    <node concept="1sgJKc" id="5g5RAGpXPjm" role="N3F5h">
      <property role="TrG5h" value="AlarmBaseType" />
      <node concept="1dpRTG" id="5g5RAGpXPkF" role="HszBJ">
        <property role="TrG5h" value="maxallowedvalue" />
        <node concept="rcJHQ" id="5g5RAGpXPkE" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="5g5RAGpXkh0" resolve="TickType" />
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXPlX" role="HszBJ">
        <property role="TrG5h" value="ticksperbase" />
        <node concept="rcJHQ" id="5g5RAGpXPlV" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="5g5RAGpXkh0" resolve="TickType" />
        </node>
      </node>
      <node concept="1dpRTG" id="5g5RAGpXPmz" role="HszBJ">
        <property role="TrG5h" value="mincycle" />
        <node concept="rcJHQ" id="5g5RAGpXPmx" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="5g5RAGpXkh0" resolve="TickType" />
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="5g5RAGpXPnr" role="N3F5h">
      <property role="TrG5h" value="empty_1452790628821_60" />
    </node>
    <node concept="rcJHK" id="2hqbsEGB3Ue" role="N3F5h">
      <property role="TrG5h" value="TaskRefType" />
      <node concept="3wxxNl" id="2hqbsEGB463" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <node concept="rcJHQ" id="2hqbsEGB458" role="2umbIo">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3XX" resolve="TaskType" />
        </node>
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXPve" role="N3F5h">
      <property role="TrG5h" value="TaskStateRefType" />
      <node concept="3wxxNl" id="5g5RAGpXPxn" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <node concept="rcJHQ" id="5g5RAGpXPxb" role="2umbIo">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="5g5RAGpXkd4" resolve="TaskStateType" />
        </node>
      </node>
    </node>
    <node concept="rcJHK" id="2hqbsEGB4bj" role="N3F5h">
      <property role="TrG5h" value="EventMaskRefType" />
      <node concept="3wxxNl" id="2hqbsEGB4oo" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <node concept="rcJHQ" id="2hqbsEGB4oc" role="2umbIo">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4l2" resolve="EventMaskType" />
        </node>
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXPEJ" role="N3F5h">
      <property role="TrG5h" value="TickRefType" />
      <node concept="3wxxNl" id="5g5RAGpXPGY" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <node concept="rcJHQ" id="5g5RAGpXPGM" role="2umbIo">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="5g5RAGpXkh0" resolve="TickType" />
        </node>
      </node>
    </node>
    <node concept="rcJHK" id="5g5RAGpXPK$" role="N3F5h">
      <property role="TrG5h" value="AlarmBaseRefType" />
      <node concept="3wxxNl" id="5g5RAGpXPR8" role="rcJHR">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <node concept="1sgJKr" id="5g5RAGpXPME" role="2umbIo">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="1sgJKq" node="5g5RAGpXPjm" resolve="AlarmBaseType" />
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="2UjW4IkHtya" role="N3F5h">
      <property role="TrG5h" value="empty_1452769245543_9" />
    </node>
    <node concept="BTY7A" id="3WvbRq1UQDY" role="N3F5h">
      <property role="TrG5h" value="DeclareCounter" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="3WvbRq1UQHK" role="BTY7U">
        <property role="TrG5h" value="CounterName" />
        <node concept="rcJHQ" id="3WvbRq1UQIe" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2UjW4IkHtxp" resolve="CounterType" />
        </node>
      </node>
      <node concept="39I4aJ" id="3WvbRq1UQJf" role="2_0FLF">
        <ref role="39I4aG" node="3WvbRq1UQHK" resolve="CounterName" />
      </node>
    </node>
    <node concept="2NXPZ9" id="3WvbRq1UQAg" role="N3F5h">
      <property role="TrG5h" value="empty_1471892619668_4" />
    </node>
    <node concept="BTY7A" id="1Y5JHpRyqWG" role="N3F5h">
      <property role="TrG5h" value="TASKNAME" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="1Y5JHpRyr0b" role="BTY7U">
        <property role="TrG5h" value="TaskName" />
        <node concept="26Vqpk" id="1Y5JHpRyr0c" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="BTY7A" id="1Y5JHpRyrCo" role="N3F5h">
      <property role="TrG5h" value="TASK" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="1Y5JHpRyrFU" role="BTY7U">
        <property role="TrG5h" value="TaskName" />
        <node concept="26Vqpk" id="1Y5JHpRyrFV" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="BTY7A" id="1Y5JHpRyrKt" role="N3F5h">
      <property role="TrG5h" value="ISRNAME" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="1Y5JHpRyrO5" role="BTY7U">
        <property role="TrG5h" value="ISRName" />
        <node concept="26Vqpk" id="1Y5JHpRyrO6" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="BTY7A" id="1Y5JHpRyrSK" role="N3F5h">
      <property role="TrG5h" value="ISR" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="1Y5JHpRyrWl" role="BTY7U">
        <property role="TrG5h" value="ISRName" />
        <node concept="26Vqpk" id="1Y5JHpRyrWm" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="BTY7A" id="1Y5JHpRys0r" role="N3F5h">
      <property role="TrG5h" value="ALARMCALLBACKNAME" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="1Y5JHpRys45" role="BTY7U">
        <property role="TrG5h" value="AlarmCallBackName" />
        <node concept="26Vqpk" id="1Y5JHpRys46" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="BTY7A" id="1Y5JHpRys8e" role="N3F5h">
      <property role="TrG5h" value="ALARMCALLBACK" />
      <property role="2OOxQR" value="true" />
      <node concept="BUhyo" id="1Y5JHpRysbU" role="BTY7U">
        <property role="TrG5h" value="AlarmCallBackName" />
        <node concept="26Vqpk" id="1Y5JHpRysbV" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="1Y5JHpRyqTl" role="N3F5h">
      <property role="TrG5h" value="empty_1454410515800_11" />
    </node>
    <node concept="N3Fnw" id="2hqbsEGB4zH" role="N3F5h">
      <property role="TrG5h" value="ActivateTask" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB4wJ" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB4Ad" role="1UOdpc">
        <property role="TrG5h" value="tskId" />
        <node concept="rcJHQ" id="2hqbsEGB4Ac" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3XX" resolve="TaskType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="1Y5JHpRypQb" role="N3F5h">
      <property role="TrG5h" value="TerminateTask" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="1Y5JHpRypM_" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
    </node>
    <node concept="N3Fnw" id="2hqbsEGB4Jk" role="N3F5h">
      <property role="TrG5h" value="ChainTask" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB4Gb" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB4LZ" role="1UOdpc">
        <property role="TrG5h" value="tskId" />
        <node concept="rcJHQ" id="2hqbsEGB4LY" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3XX" resolve="TaskType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="1Y5JHpRyq7S" role="N3F5h">
      <property role="TrG5h" value="Schedule" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="1Y5JHpRyq4I" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
    </node>
    <node concept="N3Fnw" id="1Y5JHpRyqh0" role="N3F5h">
      <property role="TrG5h" value="GetTaskID" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="1Y5JHpRyqdg" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="1Y5JHpRyqjJ" role="1UOdpc">
        <property role="TrG5h" value="p_tskId" />
        <node concept="rcJHQ" id="2hqbsEGB4MZ" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3Ue" resolve="TaskRefType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="2hqbsEGB4Za" role="N3F5h">
      <property role="TrG5h" value="GetTaskState" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19RgSI" id="2hqbsEGB52B" role="1UOdpc">
        <property role="TrG5h" value="tskId" />
        <node concept="rcJHQ" id="2hqbsEGB52_" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3XX" resolve="TaskType" />
        </node>
      </node>
      <node concept="19RgSI" id="2hqbsEGB53z" role="1UOdpc">
        <property role="TrG5h" value="p_state" />
        <node concept="rcJHQ" id="2hqbsEGB53x" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="5g5RAGpXPve" resolve="TaskStateRefType" />
        </node>
      </node>
      <node concept="rcJHQ" id="2hqbsEGB4TJ" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
    </node>
    <node concept="2NXPZ9" id="1Y5JHpRyqne" role="N3F5h">
      <property role="TrG5h" value="empty_1454410405427_7" />
    </node>
    <node concept="N3Fnw" id="2hqbsEGB5gH" role="N3F5h">
      <property role="TrG5h" value="GetResource" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB5cL" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB5kb" role="1UOdpc">
        <property role="TrG5h" value="resId" />
        <node concept="rcJHQ" id="2hqbsEGB5ka" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4g2" resolve="ResourceType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="2hqbsEGB5xU" role="N3F5h">
      <property role="TrG5h" value="ReleaseResource" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB5tY" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB5_o" role="1UOdpc">
        <property role="TrG5h" value="resId" />
        <node concept="rcJHQ" id="2hqbsEGB5_n" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4g2" resolve="ResourceType" />
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="5g5RAGpXj2E" role="N3F5h">
      <property role="TrG5h" value="empty_1452785377678_23" />
    </node>
    <node concept="N3Fnw" id="2hqbsEGB5KT" role="N3F5h">
      <property role="TrG5h" value="SetEvent" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB5G$" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB5Ol" role="1UOdpc">
        <property role="TrG5h" value="tskId" />
        <node concept="rcJHQ" id="2hqbsEGB5Ok" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3XX" resolve="TaskType" />
        </node>
      </node>
      <node concept="19RgSI" id="2hqbsEGB5PM" role="1UOdpc">
        <property role="TrG5h" value="mask" />
        <node concept="rcJHQ" id="2hqbsEGB5PK" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4l2" resolve="EventMaskType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="2hqbsEGB6c8" role="N3F5h">
      <property role="TrG5h" value="ClearEvent" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB68a" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB6fL" role="1UOdpc">
        <property role="TrG5h" value="mask" />
        <node concept="rcJHQ" id="2hqbsEGB6fK" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4l2" resolve="EventMaskType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="2hqbsEGB6ro" role="N3F5h">
      <property role="TrG5h" value="GetEvent" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB6nI" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB6uZ" role="1UOdpc">
        <property role="TrG5h" value="tskId" />
        <node concept="rcJHQ" id="2hqbsEGB6uY" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB3XX" resolve="TaskType" />
        </node>
      </node>
      <node concept="19RgSI" id="2hqbsEGB6ws" role="1UOdpc">
        <property role="TrG5h" value="p_mask" />
        <node concept="rcJHQ" id="2hqbsEGB6wq" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4bj" resolve="EventMaskRefType" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="2hqbsEGB6IL" role="N3F5h">
      <property role="TrG5h" value="WaitEvent" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="rcJHQ" id="2hqbsEGB6Em" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
      <node concept="19RgSI" id="2hqbsEGB6M_" role="1UOdpc">
        <property role="TrG5h" value="mask" />
        <node concept="rcJHQ" id="2hqbsEGB6M$" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2hqbsEGB4l2" resolve="EventMaskType" />
        </node>
      </node>
    </node>
    <node concept="2NXPZ9" id="5g5RAGpXka$" role="N3F5h">
      <property role="TrG5h" value="empty_1452786843374_28" />
    </node>
    <node concept="N3Fnw" id="2UjW4IkHtwi" role="N3F5h">
      <property role="TrG5h" value="SignalCounter" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19RgSI" id="2UjW4IkJ37H" role="1UOdpc">
        <property role="TrG5h" value="cntid" />
        <node concept="rcJHQ" id="5f8fKyINf6P" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="rcJHT" node="2UjW4IkHtxp" resolve="CounterType" />
        </node>
      </node>
      <node concept="rcJHQ" id="2UjW4IkHt$D" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
        <ref role="rcJHT" node="2UjW4IkHtzR" resolve="StatusType" />
      </node>
    </node>
    <node concept="rcWE1" id="2UjW4IkHtzc" role="rcWEr">
      <property role="rcWEL" value="&quot;kernel.h&quot;" />
    </node>
    <node concept="3GEVxB" id="2UjW4IkHtzH" role="2OODSX">
      <ref role="3GEb4d" node="2UjW4IkHtze" resolve="osek" />
    </node>
  </node>
</model>

