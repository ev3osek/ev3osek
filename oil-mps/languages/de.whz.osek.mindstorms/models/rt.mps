<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:e45d922f-1536-49e9-9e76-fb0f78d94041(de.whz.osek.mindstorms.rt)">
  <persistence version="9" />
  <languages>
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
    <language id="92d2ea16-5a42-4fdf-a676-c7604efe3504" name="de.slisson.mps.richtext">
      <concept id="2557074442922380897" name="de.slisson.mps.richtext.structure.Text" flags="ng" index="19SGf9">
        <child id="2557074442922392302" name="words" index="19SJt6" />
      </concept>
      <concept id="2557074442922438156" name="de.slisson.mps.richtext.structure.Word" flags="ng" index="19SUe$">
        <property id="2557074442922438158" name="escapedValue" index="19SUeA" />
      </concept>
    </language>
    <language id="3bf5377a-e904-4ded-9754-5a516023bfaa" name="com.mbeddr.core.pointers">
      <concept id="279446265608459824" name="com.mbeddr.core.pointers.structure.PointerType" flags="ng" index="3wxxNl" />
      <concept id="5679441017214012545" name="com.mbeddr.core.pointers.structure.ArrayType" flags="ng" index="3J0A42">
        <child id="1452920870317474611" name="sizeExpr" index="1YbSNA" />
      </concept>
    </language>
    <language id="efda956e-491e-4f00-ba14-36af2f213ecf" name="com.mbeddr.core.udt">
      <concept id="8811614583515725893" name="com.mbeddr.core.udt.structure.EnumType" flags="ng" index="1AkAi2">
        <reference id="8811614583515725894" name="enum" index="1AkAi1" />
      </concept>
      <concept id="8811614583515725853" name="com.mbeddr.core.udt.structure.EnumLiteral" flags="ng" index="1AkAjq" />
      <concept id="8811614583515725851" name="com.mbeddr.core.udt.structure.EnumDeclaration" flags="ng" index="1AkAjs">
        <child id="8811614583515725857" name="literals" index="1AkAjA" />
      </concept>
    </language>
    <language id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base">
      <concept id="8375407818529178006" name="com.mbeddr.core.base.structure.TextBlock" flags="ng" index="OjmMv">
        <child id="8375407818529178007" name="text" index="OjmMu" />
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
      <concept id="6116558314501417950" name="com.mbeddr.core.modules.structure.ObjResourceDescriptor" flags="ng" index="rcWEZ" />
      <concept id="1028666136487545270" name="com.mbeddr.core.modules.structure.CommentModuleContent" flags="ng" index="2B_Gvg">
        <child id="1028666136487550078" name="text" index="2B_H8o" />
      </concept>
      <concept id="3376775282622611165" name="com.mbeddr.core.modules.structure.StaticMemoryLocation" flags="ng" index="2DPCBB" />
      <concept id="3376775282622142916" name="com.mbeddr.core.modules.structure.AbstractDefineLike" flags="ng" index="2DRUVY">
        <child id="3376775282622233992" name="value" index="2DQcEM" />
      </concept>
      <concept id="8105003328814797298" name="com.mbeddr.core.modules.structure.IFunctionLike" flags="ng" index="2H9T1B">
        <child id="5708867820623310661" name="arguments" index="1UOdpc" />
      </concept>
      <concept id="6437088627575722813" name="com.mbeddr.core.modules.structure.Module" flags="ng" index="N3F4X">
        <child id="6437088627575722833" name="contents" index="N3F5h" />
      </concept>
      <concept id="6437088627575722831" name="com.mbeddr.core.modules.structure.IModuleContent" flags="ng" index="N3F5f">
        <property id="1317894735999272944" name="exported" index="2OOxQR" />
      </concept>
      <concept id="6437088627575724000" name="com.mbeddr.core.modules.structure.FunctionPrototype" flags="ng" index="N3Fnw" />
      <concept id="8934095934011938595" name="com.mbeddr.core.modules.structure.EmptyModuleContent" flags="ng" index="2NXPZ9" />
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
      <concept id="8463282783691618440" name="com.mbeddr.core.expressions.structure.Int32tType" flags="ng" index="26Vqph" />
      <concept id="8463282783691618435" name="com.mbeddr.core.expressions.structure.Int16tType" flags="ng" index="26Vqpq" />
      <concept id="8463282783691618466" name="com.mbeddr.core.expressions.structure.UnsignedInt16tType" flags="ng" index="26VqpV" />
      <concept id="8463282783691618426" name="com.mbeddr.core.expressions.structure.Int8tType" flags="ng" index="26Vqqz" />
      <concept id="8463282783691492730" name="com.mbeddr.core.expressions.structure.UnsignedIntType" flags="ng" index="26VXez" />
      <concept id="1664480272136207708" name="com.mbeddr.core.expressions.structure.CharType" flags="ng" index="biTqx" />
      <concept id="2212975673976017893" name="com.mbeddr.core.expressions.structure.NumericLiteral" flags="ng" index="2hns93">
        <property id="2212975673976043696" name="value" index="2hmy$m" />
      </concept>
      <concept id="318113533128716675" name="com.mbeddr.core.expressions.structure.ITyped" flags="ng" index="2C2TGh">
        <child id="318113533128716676" name="type" index="2C2TGm" />
      </concept>
      <concept id="7892328519581699353" name="com.mbeddr.core.expressions.structure.VoidType" flags="ng" index="19Rifw" />
      <concept id="1054289341113450444" name="com.mbeddr.core.expressions.structure.HexNumberLiteral" flags="ng" index="3Hbq_t" />
      <concept id="8860443239512128058" name="com.mbeddr.core.expressions.structure.BooleanType" flags="ng" index="3TlMgk" />
      <concept id="8860443239512128054" name="com.mbeddr.core.expressions.structure.Type" flags="ng" index="3TlMgo">
        <property id="2941277002445651368" name="const" index="2c7vTL" />
        <property id="2941277002448691247" name="volatile" index="2caQfQ" />
      </concept>
      <concept id="8860443239512128108" name="com.mbeddr.core.expressions.structure.IntType" flags="ng" index="3TlMh2" />
      <concept id="8860443239512128103" name="com.mbeddr.core.expressions.structure.NumberLiteral" flags="ng" index="3TlMh9" />
    </language>
  </registry>
  <node concept="rcWEw" id="3tDp_yW6whK">
    <property role="TrG5h" value="ecrobot_interface" />
    <node concept="1AkAjs" id="3tDp_yW5Idw" role="N3F5h">
      <property role="TrG5h" value="MOTOR_PORT_T" />
      <property role="2OOxQR" value="false" />
      <node concept="1AkAjq" id="3tDp_yW5IAq" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_A" />
      </node>
      <node concept="1AkAjq" id="3tDp_yW5IAv" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_B" />
      </node>
      <node concept="1AkAjq" id="3tDp_yW5IAC" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_C" />
      </node>
    </node>
    <node concept="2NXPZ9" id="3tDp_yW5IBI" role="N3F5h">
      <property role="TrG5h" value="empty_1452261090287_11" />
    </node>
    <node concept="1AkAjs" id="3tDp_yW5K_Z" role="N3F5h">
      <property role="TrG5h" value="SENSOR_PORT_T" />
      <property role="2OOxQR" value="false" />
      <node concept="1AkAjq" id="3tDp_yW5KYY" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_S1" />
      </node>
      <node concept="1AkAjq" id="3tDp_yW5KZ3" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_S2" />
      </node>
      <node concept="1AkAjq" id="3tDp_yW5KZc" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_S3" />
      </node>
      <node concept="1AkAjq" id="3tDp_yW5KZp" role="1AkAjA">
        <property role="TrG5h" value="EV3_PORT_S4" />
      </node>
    </node>
    <node concept="2NXPZ9" id="3tDp_yW5H2F" role="N3F5h">
      <property role="TrG5h" value="empty_1452261009062_10" />
    </node>
    <node concept="2DPCBB" id="3QwuWjHkjzg" role="N3F5h">
      <property role="TrG5h" value="LOWSPEED_9V" />
      <node concept="3TlMh9" id="3QwuWjHkkLP" role="2DQcEM">
        <property role="2hmy$m" value="1" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkl2F" role="N3F5h">
      <property role="TrG5h" value="LOWSPEED" />
      <node concept="3TlMh9" id="3QwuWjHklrM" role="2DQcEM">
        <property role="2hmy$m" value="2" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHklXU" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHklXW" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHklXX" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHklXY" role="19SJt6">
            <property role="19SUeA" value="NXT buttons" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkmeT" role="N3F5h">
      <property role="TrG5h" value="BTN_ORANGE_RECT" />
      <node concept="3Hbq_t" id="3QwuWjHkncM" role="2DQcEM">
        <property role="2hmy$m" value="1" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkntZ" role="N3F5h">
      <property role="TrG5h" value="BTN_LEFT" />
      <node concept="3Hbq_t" id="3QwuWjHko6j" role="2DQcEM">
        <property role="2hmy$m" value="2" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkonB" role="N3F5h">
      <property role="TrG5h" value="BTN_RIGHT" />
      <node concept="3Hbq_t" id="3QwuWjHkoM8" role="2DQcEM">
        <property role="2hmy$m" value="4" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkoMH" role="N3F5h">
      <property role="TrG5h" value="BTN_GREY_RECT" />
      <node concept="3Hbq_t" id="3QwuWjHkpdT" role="2DQcEM">
        <property role="2hmy$m" value="8" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkpKi" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkpKk" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkpKl" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkpKm" role="19SJt6">
            <property role="19SUeA" value="NXT Color Sensor sensor mode macros" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkq1x" role="N3F5h">
      <property role="TrG5h" value="NXT_COLORSENSOR" />
      <node concept="3TlMh9" id="3QwuWjHkqrL" role="2DQcEM">
        <property role="2hmy$m" value="0" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkqHL" role="N3F5h">
      <property role="TrG5h" value="NXT_LIGHTSENSOR_RED" />
      <node concept="3TlMh9" id="3QwuWjHkr9c" role="2DQcEM">
        <property role="2hmy$m" value="1" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkrrB" role="N3F5h">
      <property role="TrG5h" value="NXT_LIGHTSENSOR_GREEN" />
      <node concept="3TlMh9" id="3QwuWjHkrRI" role="2DQcEM">
        <property role="2hmy$m" value="2" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHksa$" role="N3F5h">
      <property role="TrG5h" value="NXT_LIGHTSENSOR_BLUE" />
      <node concept="3TlMh9" id="3QwuWjHksBF" role="2DQcEM">
        <property role="2hmy$m" value="3" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHksUW" role="N3F5h">
      <property role="TrG5h" value="NXT_LIGHTSENSOR_WHITE" />
      <node concept="3TlMh9" id="3QwuWjHktoF" role="2DQcEM">
        <property role="2hmy$m" value="4" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHktGn" role="N3F5h">
      <property role="TrG5h" value="NXT_LIGHTSENSOR_NONE" />
      <node concept="3TlMh9" id="3QwuWjHkuaY" role="2DQcEM">
        <property role="2hmy$m" value="5" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkuv5" role="N3F5h">
      <property role="TrG5h" value="NXT_COLORSENSOR_DEACTIVATE" />
      <node concept="3TlMh9" id="3QwuWjHkuYS" role="2DQcEM">
        <property role="2hmy$m" value="6" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkvjq" role="N3F5h">
      <property role="TrG5h" value="NUM_OF_NXT_COLORSENSOR_MODES" />
      <node concept="3TlMh9" id="3QwuWjHkvOl" role="2DQcEM">
        <property role="2hmy$m" value="7" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkyMU" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkyMW" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkyMX" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkyMY" role="19SJt6">
            <property role="19SUeA" value="NXT Color Sensor color number macros" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkz7H" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_BLACK" />
      <node concept="3TlMh9" id="3QwuWjHkzD1" role="2DQcEM">
        <property role="2hmy$m" value="0" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkzY_" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_BLUE" />
      <node concept="3TlMh9" id="3QwuWjHk$wo" role="2DQcEM">
        <property role="2hmy$m" value="1" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHk$Qn" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_GREEN" />
      <node concept="3TlMh9" id="3QwuWjHk_pe" role="2DQcEM">
        <property role="2hmy$m" value="2" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHk_JC" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_YELLOW" />
      <node concept="3TlMh9" id="3QwuWjHkAjb" role="2DQcEM">
        <property role="2hmy$m" value="3" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkAE0" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_ORRANGE" />
      <node concept="3TlMh9" id="3QwuWjHkBer" role="2DQcEM">
        <property role="2hmy$m" value="4" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkB_F" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_RED" />
      <node concept="3TlMh9" id="3QwuWjHkCaY" role="2DQcEM">
        <property role="2hmy$m" value="5" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkCyD" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_WHITE" />
      <node concept="3TlMh9" id="3QwuWjHkD8C" role="2DQcEM">
        <property role="2hmy$m" value="6" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkDwI" role="N3F5h">
      <property role="TrG5h" value="NXT_COLOR_UNKNOWN" />
      <node concept="3TlMh9" id="3QwuWjHkE7D" role="2DQcEM">
        <property role="2hmy$m" value="99" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkw9i" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkw9k" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkw9l" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkw9m" role="19SJt6">
            <property role="19SUeA" value="HiTechnic Color Sensor calibration modes" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkwMG" role="N3F5h">
      <property role="TrG5h" value="CAL_WHITE" />
      <node concept="3Hbq_t" id="3QwuWjHkxjz" role="2DQcEM">
        <property role="2hmy$m" value="43" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkxCn" role="N3F5h">
      <property role="TrG5h" value="CAL_BLACK" />
      <node concept="3Hbq_t" id="3QwuWjHky9p" role="2DQcEM">
        <property role="2hmy$m" value="42" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkESh" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkESj" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkESk" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkESl" role="19SJt6">
            <property role="19SUeA" value="HiTechnic Prototype Sensor digital port configuraitons" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkFgw" role="N3F5h">
      <property role="TrG5h" value="HTPS_DIGITAL_PORTS" />
      <node concept="3Hbq_t" id="3QwuWjHkFSF" role="2DQcEM">
        <property role="2hmy$m" value="3f" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkGh8" role="N3F5h">
      <property role="TrG5h" value="HTPS_D0" />
      <node concept="3Hbq_t" id="3QwuWjHkGSM" role="2DQcEM">
        <property role="2hmy$m" value="1" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkIq0" role="N3F5h">
      <property role="TrG5h" value="HTPS_D1" />
      <node concept="3Hbq_t" id="3QwuWjHkIq1" role="2DQcEM">
        <property role="2hmy$m" value="2" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkIMl" role="N3F5h">
      <property role="TrG5h" value="HTPS_D2" />
      <node concept="3Hbq_t" id="3QwuWjHkIMm" role="2DQcEM">
        <property role="2hmy$m" value="4" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkJaG" role="N3F5h">
      <property role="TrG5h" value="HTPS_D3" />
      <node concept="3Hbq_t" id="3QwuWjHkJaH" role="2DQcEM">
        <property role="2hmy$m" value="8" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkJz5" role="N3F5h">
      <property role="TrG5h" value="HTPS_D4" />
      <node concept="3Hbq_t" id="3QwuWjHkJz6" role="2DQcEM">
        <property role="2hmy$m" value="10" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkJVw" role="N3F5h">
      <property role="TrG5h" value="HTPS_D5" />
      <node concept="3Hbq_t" id="3QwuWjHkJVx" role="2DQcEM">
        <property role="2hmy$m" value="20" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkL5O" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkL5Q" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkL5R" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkL5S" role="19SJt6">
            <property role="19SUeA" value="HiTechnic Tetrix controllers" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkLul" role="N3F5h">
      <property role="TrG5h" value="TETRIX_MODE_PWM" />
      <node concept="3Hbq_t" id="3QwuWjHkM6S" role="2DQcEM">
        <property role="2hmy$m" value="0" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkMvy" role="N3F5h">
      <property role="TrG5h" value="TETRIX_MODE_PWM_REV" />
      <node concept="3Hbq_t" id="3QwuWjHkN7Y" role="2DQcEM">
        <property role="2hmy$m" value="8" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkNwE" role="N3F5h">
      <property role="TrG5h" value="TETRIX_MOTOR_FLOAT" />
      <node concept="3TlMh9" id="3QwuWjHkO94" role="2DQcEM">
        <property role="2hmy$m" value="-128" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkOyc" role="N3F5h">
      <property role="TrG5h" value="TETRIX_MOTOR_BRAKE" />
      <node concept="3TlMh9" id="3QwuWjHkPaX" role="2DQcEM">
        <property role="2hmy$m" value="0" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkP$u" role="N3F5h">
      <property role="TrG5h" value="TETRIX_ADDRESS_1" />
      <node concept="3Hbq_t" id="3QwuWjHkQeT" role="2DQcEM">
        <property role="2hmy$m" value="1" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkQCd" role="N3F5h">
      <property role="TrG5h" value="TETRIX_ADDRESS_2" />
      <node concept="3Hbq_t" id="3QwuWjHkQCe" role="2DQcEM">
        <property role="2hmy$m" value="2" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkR1t" role="N3F5h">
      <property role="TrG5h" value="TETRIX_ADDRESS_3" />
      <node concept="3Hbq_t" id="3QwuWjHkR1u" role="2DQcEM">
        <property role="2hmy$m" value="3" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkRqJ" role="N3F5h">
      <property role="TrG5h" value="TETRIX_ADDRESS_4" />
      <node concept="3Hbq_t" id="3QwuWjHkRqK" role="2DQcEM">
        <property role="2hmy$m" value="4" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkSdU" role="N3F5h">
      <property role="TrG5h" value="TETRIX_SERVO_OFF" />
      <node concept="3Hbq_t" id="3QwuWjHkSRo" role="2DQcEM">
        <property role="2hmy$m" value="FF" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkTh9" role="N3F5h">
      <property role="TrG5h" value="TETRIX_SERVO_ON_NO_TIMEOUT" />
      <node concept="3Hbq_t" id="3QwuWjHkTVA" role="2DQcEM">
        <property role="2hmy$m" value="AA" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkUla" role="N3F5h">
      <property role="TrG5h" value="TETRIX_SERVO_ON" />
      <node concept="3Hbq_t" id="3QwuWjHkUYt" role="2DQcEM">
        <property role="2hmy$m" value="0" />
      </node>
    </node>
    <node concept="2DPCBB" id="3QwuWjHkVo3" role="N3F5h">
      <property role="TrG5h" value="TETRIX_SERVO_NO_STEP_TIME" />
      <node concept="3Hbq_t" id="3QwuWjHkW1G" role="2DQcEM">
        <property role="2hmy$m" value="0" />
      </node>
    </node>
    <node concept="2NXPZ9" id="3QwuWjHkQf5" role="N3F5h">
      <property role="TrG5h" value="empty_1451295373236_154" />
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjGQr" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjGQt" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjGQu" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjGQv" role="19SJt6">
            <property role="19SUeA" value="NXT servo motor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjGGJ" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_motor_rev" />
      <property role="2OOxQR" value="false" />
      <node concept="26Vqph" id="3QwuWjHjGFN" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjGGT" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflgK" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="1AkAi1" node="3tDp_yW5Idw" resolve="MOTOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjGJX" role="N3F5h">
      <property role="TrG5h" value="ecrobot_set_motor_speed" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjGI1" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjGKb" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflgY" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5Idw" resolve="MOTOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjGL3" role="1UOdpc">
        <property role="TrG5h" value="speed" />
        <node concept="26Vqqz" id="3QwuWjHjGL1" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjGN_" role="N3F5h">
      <property role="TrG5h" value="ecrobot_set_motor_mode_speed" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjGM1" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjGNT" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflhc" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <ref role="1AkAi1" node="3tDp_yW5Idw" resolve="MOTOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjGOt" role="1UOdpc">
        <property role="TrG5h" value="mode" />
        <node concept="26Vqph" id="3QwuWjHjGOr" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjGP5" role="1UOdpc">
        <property role="TrG5h" value="speed" />
        <node concept="26Vqqz" id="3QwuWjHjGP3" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjGQT" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjGQV" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjGQW" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjGQX" role="19SJt6">
            <property role="19SUeA" value="NXT light sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjGV8" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_light_sensor" />
      <property role="2OOxQR" value="false" />
      <node concept="26VqpV" id="3QwuWjHjGTv" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjGVH" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflhq" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjGZA" role="N3F5h">
      <property role="TrG5h" value="ecrobot_set_light_sensor_active" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjGXH" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjH0f" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflhC" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjH4l" role="N3F5h">
      <property role="TrG5h" value="ecrobot_set_light_sensor_inactive" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjH1m" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjH52" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflhQ" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjH6W" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjH6Y" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjH6Z" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjH70" role="19SJt6">
            <property role="19SUeA" value="NXT touch sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjHa4" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_touch_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqp4" id="5f8fKyILT0P" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjHaU" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUflnW" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjHd1" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjHd3" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjHd4" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjHd5" role="19SJt6">
            <property role="19SUeA" value="NXT sound sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjHh2" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_sound_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26VqpV" id="3QwuWjHjHeN" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjHi1" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="4NwoSLUfloa" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjHkl" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjHkn" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjHko" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjHkp" role="19SJt6">
            <property role="19SUeA" value="NXT I2C API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjHo_" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_i2c" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjHmp" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjHpH" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjUb" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHqw" role="1UOdpc">
        <property role="TrG5h" value="type" />
        <node concept="26Vqp4" id="3QwuWjHjHqu" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjHuA" role="N3F5h">
      <property role="TrG5h" value="ecrobot_wait_i2c_ready" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqp4" id="3QwuWjHjHsk" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjHvY" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjUp" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHx5" role="1UOdpc">
        <property role="TrG5h" value="wait" />
        <node concept="26Vqpb" id="3QwuWjHjHx3" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjHAg" role="N3F5h">
      <property role="TrG5h" value="ecrobot_send_i2c" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="3TlMh2" id="3QwuWjHjHzt" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjHBB" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjUS" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHC_" role="1UOdpc">
        <property role="TrG5h" value="address" />
        <node concept="26Vqpb" id="3QwuWjHjHCz" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHDo" role="1UOdpc">
        <property role="TrG5h" value="i2c_reg" />
        <node concept="3TlMh2" id="3QwuWjHjHDm" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHEN" role="1UOdpc">
        <property role="TrG5h" value="buf" />
        <node concept="3wxxNl" id="3QwuWjHjHFL" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqp4" id="3QwuWjHjHFD" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHGq" role="1UOdpc">
        <property role="TrG5h" value="len" />
        <node concept="26Vqpb" id="3QwuWjHjHGo" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjHMq" role="N3F5h">
      <property role="TrG5h" value="ecrobot_read_i2c" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="3TlMh2" id="3QwuWjHjHIM" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjHOu" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjV6" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHPn" role="1UOdpc">
        <property role="TrG5h" value="address" />
        <node concept="26Vqpb" id="3QwuWjHjHPl" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHQf" role="1UOdpc">
        <property role="TrG5h" value="i2c_reg" />
        <node concept="3TlMh2" id="3QwuWjHjHQd" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHRE" role="1UOdpc">
        <property role="TrG5h" value="buf" />
        <node concept="3wxxNl" id="3QwuWjHjHSO" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqp4" id="3QwuWjHjHRC" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjHUA" role="1UOdpc">
        <property role="TrG5h" value="len" />
        <node concept="26Vqpb" id="3QwuWjHjHU$" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjI0v" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_i2c" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjHXr" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjI2X" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjVk" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="false" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjIaK" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjIaM" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjIaN" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjIaO" role="19SJt6">
            <property role="19SUeA" value="NXT ultrasonic sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjIh5" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_sonar_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjIdk" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjIjG" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjVy" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjIBp" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_sonar_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqph" id="3QwuWjHjIz$" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjIE4" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjVK" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjILF" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_sonar_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjIH8" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjIOq" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjVY" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjKDh" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjKDj" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjKDk" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjKDl" role="19SJt6">
            <property role="19SUeA" value="HiTechnic gyro sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjKMa" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_gyro_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26VqpV" id="3QwuWjHjKHp" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjKQl" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjXI" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="5VhEZbxeapX" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_gyro_sensor_degrees" />
      <property role="2OOxQR" value="false" />
      <node concept="26Vqpq" id="5VhEZbxe9Z8" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="5VhEZbxeaN9" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5VhEZbxeaN8" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjL3a" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjL3c" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjL3d" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjL3e" role="19SJt6">
            <property role="19SUeA" value="HiTechnic acceleration sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjLcZ" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_accel_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjL7r" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjLhj" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjXW" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjM5Z" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_accel_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjLuJ" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjMaj" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjYa" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjMaR" role="1UOdpc">
        <property role="TrG5h" value="buf" />
        <node concept="3J0A42" id="3QwuWjHjMbA" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqpq" id="3QwuWjHjMaP" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjMc0" role="1YbSNA">
            <property role="2hmy$m" value="3" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjMoc" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_accel_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjMhA" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjMtg" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjYo" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjIX0" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjIX2" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjIX3" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjIX4" role="19SJt6">
            <property role="19SUeA" value="NXT color sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjJ4l" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_nxtcolorsensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjIZP" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjJ7d" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjWc" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjJ7L" role="1UOdpc">
        <property role="TrG5h" value="mode" />
        <node concept="26Vqp4" id="3QwuWjHjJ7J" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjJfm" role="N3F5h">
      <property role="TrG5h" value="ecrobot_process_bg_nxtcolorsensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjJaW" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjJpV" role="N3F5h">
      <property role="TrG5h" value="ecrobot_set_nxtcolorsensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjJlv" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjJsV" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjWq" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjJtD" role="1UOdpc">
        <property role="TrG5h" value="mode" />
        <node concept="26Vqp4" id="3QwuWjHjJtB" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjJ_i" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_nxtcolorsensor_mode" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqp4" id="3QwuWjHjJwW" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjJCo" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjWC" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjJK1" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_nxtcolorsensor_id" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26VqpV" id="3QwuWjHjJQD" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjJNb" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjWQ" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjJVB" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_nxtcolorsensor_rgb" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjJQL" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjJYP" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjX4" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjJZk" role="1UOdpc">
        <property role="TrG5h" value="rgb" />
        <node concept="3J0A42" id="3QwuWjHjJZN" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqpq" id="3QwuWjHjJZi" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjK09" role="1YbSNA">
            <property role="2hmy$m" value="3" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjKaZ" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_nxtcolorsensor_light" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26VqpV" id="3QwuWjHjK4D" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjKeX" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjXi" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjKoP" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_nxtcolorsensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjKjz" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjKsR" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjXw" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjLqm" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjLqo" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjLqp" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjLqq" role="19SJt6">
            <property role="19SUeA" value="HiTechnic IR Seeker API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjMD7" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_ir_seeker" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjMz1" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjMIf" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjYA" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjMTM" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_ir_seeker" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjMNU" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjMYY" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjYO" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjMZt" role="1UOdpc">
        <property role="TrG5h" value="buf" />
        <node concept="3J0A42" id="3QwuWjHjMZX" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqqz" id="3QwuWjHjMZr" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjN0n" role="1YbSNA">
            <property role="2hmy$m" value="6" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjNdn" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_ir_seeker" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjN6P" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjNjj" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjZ2" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjNvx" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjNvz" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjNv$" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjNv_" role="19SJt6">
            <property role="19SUeA" value="HiTechnic color sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjNGo" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_color_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjN_y" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjNMs" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjZg" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjNZS" role="N3F5h">
      <property role="TrG5h" value="ecrobot_cal_color_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHkhyN" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjO60" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjZu" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjO6I" role="1UOdpc">
        <property role="TrG5h" value="mode" />
        <node concept="26Vqp4" id="3QwuWjHjO6G" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjOk3" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_color_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjOd9" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjOqh" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjZG" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjOr4" role="1UOdpc">
        <property role="TrG5h" value="buf" />
        <node concept="3J0A42" id="3QwuWjHjOrv" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqpq" id="3QwuWjHjOr2" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjOrT" role="1YbSNA">
            <property role="2hmy$m" value="3" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjOFB" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_color_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjOzp" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjOM_" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXjZU" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjP11" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjP13" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjP14" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjP15" role="19SJt6">
            <property role="19SUeA" value="HiTechnic compass sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjPfW" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_compass_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjP84" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjPn2" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk08" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjPB9" role="N3F5h">
      <property role="TrG5h" value="ecrobot_cal_compass_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHkhyF" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjPIj" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk0m" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjPYi" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_compass_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqpq" id="3QwuWjHjPQ0" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjQ5w" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk0$" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjQl9" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_compass_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjQdh" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjQsr" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk0M" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjQF6" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjQF8" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjQF9" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjQFa" role="19SJt6">
            <property role="19SUeA" value="HiTechnic prototype sensor API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjQVd" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_prototype_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjQMt" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjR2B" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk10" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjRsA" role="1UOdpc">
        <property role="TrG5h" value="rate" />
        <node concept="26Vqp4" id="3QwuWjHjRs$" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjRto" role="1UOdpc">
        <property role="TrG5h" value="dir" />
        <node concept="26Vqp4" id="3QwuWjHjRtm" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjRiJ" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_prototype_analog_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjRav" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjRqd" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk1e" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjRr0" role="1UOdpc">
        <property role="TrG5h" value="buf" />
        <node concept="3J0A42" id="3QwuWjHjRrm" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqpq" id="3QwuWjHjRqY" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjRrK" role="1YbSNA">
            <property role="2hmy$m" value="5" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjRJB" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_prototype_digital_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqp4" id="3QwuWjHjR_T" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjRRT" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk1s" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjSa$" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_prototype_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjS14" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjSiU" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk1E" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjSjH" role="1UOdpc">
        <property role="TrG5h" value="a_buf" />
        <node concept="3J0A42" id="3QwuWjHjSlg" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqpq" id="3QwuWjHjSjF" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjSlE" role="1YbSNA">
            <property role="2hmy$m" value="5" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjSkI" role="1UOdpc">
        <property role="TrG5h" value="dbuf" />
        <node concept="3J0A42" id="3QwuWjHjSml" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqp4" id="3QwuWjHjSkG" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHjSmJ" role="1YbSNA">
            <property role="2hmy$m" value="6" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjSGt" role="N3F5h">
      <property role="TrG5h" value="ecrobot_send_prototype_digital_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjSx3" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjSQf" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk1S" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjSQS" role="1UOdpc">
        <property role="TrG5h" value="data" />
        <node concept="26Vqp4" id="3QwuWjHjSQQ" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjTbW" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_prototype_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjT1c" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjTlO" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk26" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjTDZ" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjTE1" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjTE2" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjTE3" role="19SJt6">
            <property role="19SUeA" value="HiTechnic Tetrix controllers" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjUiQ" role="N3F5h">
      <property role="TrG5h" value="ecrobot_init_tetrix" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjU7G" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjUsQ" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="26Vqp4" id="3QwuWjHjUsP" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjUNc" role="N3F5h">
      <property role="TrG5h" value="ecrobot_tetrix_motors" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjUBk" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjUXg" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="26Vqp4" id="3QwuWjHjUXf" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjUY8" role="1UOdpc">
        <property role="TrG5h" value="i2c_address" />
        <node concept="26Vqpb" id="3QwuWjHjUY6" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjUZo" role="1UOdpc">
        <property role="TrG5h" value="mode_motor1" />
        <node concept="26Vqp4" id="3QwuWjHjUZm" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjV0y" role="1UOdpc">
        <property role="TrG5h" value="mode_motor2" />
        <node concept="26Vqp4" id="3QwuWjHjV0w" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjV1K" role="1UOdpc">
        <property role="TrG5h" value="pwm_motor1" />
        <node concept="26Vqqz" id="3QwuWjHjV1I" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjV37" role="1UOdpc">
        <property role="TrG5h" value="pwm_motor2" />
        <node concept="26Vqqz" id="3QwuWjHjV35" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjVpC" role="N3F5h">
      <property role="TrG5h" value="ecrobot_tetrix_servos" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjVec" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjVzU" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="26Vqp4" id="3QwuWjHjVzT" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjV$H" role="1UOdpc">
        <property role="TrG5h" value="i2c_address" />
        <node concept="26Vqpb" id="3QwuWjHjV$F" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjV_D" role="1UOdpc">
        <property role="TrG5h" value="step_time" />
        <node concept="26Vqp4" id="3QwuWjHjV_B" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVAN" role="1UOdpc">
        <property role="TrG5h" value="pwm" />
        <node concept="26Vqp4" id="3QwuWjHjVAL" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVBH" role="1UOdpc">
        <property role="TrG5h" value="servo1" />
        <node concept="26Vqp4" id="3QwuWjHjVBF" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVCA" role="1UOdpc">
        <property role="TrG5h" value="servo2" />
        <node concept="26Vqp4" id="3QwuWjHjVC$" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVDC" role="1UOdpc">
        <property role="TrG5h" value="servo3" />
        <node concept="26Vqp4" id="3QwuWjHjVDA" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVED" role="1UOdpc">
        <property role="TrG5h" value="servo4" />
        <node concept="26Vqp4" id="3QwuWjHjVEB" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVGr" role="1UOdpc">
        <property role="TrG5h" value="servo5" />
        <node concept="26Vqp4" id="3QwuWjHjVGp" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjVHD" role="1UOdpc">
        <property role="TrG5h" value="servo6" />
        <node concept="26Vqp4" id="3QwuWjHjVHB" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjW4h" role="N3F5h">
      <property role="TrG5h" value="ecrobot_tetrix_battery" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="26Vqpb" id="3QwuWjHjVSX" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjWeT" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="26Vqp4" id="3QwuWjHjWeS" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHjWfB" role="1UOdpc">
        <property role="TrG5h" value="i2c_address" />
        <node concept="26Vqpb" id="3QwuWjHjWf_" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjWBR" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_tetrix" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="false" />
      <node concept="19Rifw" id="3QwuWjHjWrf" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjWM_" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="26Vqp4" id="3QwuWjHjWM$" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjX8x" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjX8z" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjX8$" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjX8_" role="19SJt6">
            <property role="19SUeA" value="RCX sensors API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjXvS" role="N3F5h">
      <property role="TrG5h" value="ecrobot_set_RCX_power_source" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHjXjk" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjXEI" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk2k" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjY2j" role="N3F5h">
      <property role="TrG5h" value="ecrobot_term_RCX_power_source" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHjXPX" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjYdd" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk2y" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjY_a" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_RCX_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="26Vqpq" id="3QwuWjHjYoE" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjYK8" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk2K" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHjZ7M" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_RCX_touch_sensor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMgk" id="3QwuWjHkhyz" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHjZiO" role="1UOdpc">
        <property role="TrG5h" value="port_id" />
        <node concept="1AkAi2" id="5g5RAGpXk2Y" role="2C2TGm">
          <property role="2caQfQ" value="true" />
          <property role="2c7vTL" value="true" />
          <ref role="1AkAi1" node="3tDp_yW5K_Z" resolve="SENSOR_PORT_T" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHjZDt" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHjZDv" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHjZDw" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHjZDx" role="19SJt6">
            <property role="19SUeA" value="NXT internal status API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk008" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_battery_voltage" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="26VqpV" id="3QwuWjHjZO$" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk0zm" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_systick_ms" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="26Vqpb" id="3QwuWjHk0my" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="5f8fKyINbZ8" role="N3F5h">
      <property role="TrG5h" value="ecrobot_wait_ms" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="5f8fKyINb$U" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="5f8fKyINcon" role="1UOdpc">
        <property role="TrG5h" value="ms" />
        <node concept="26Vqpb" id="5f8fKyINcom" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk16t" role="N3F5h">
      <property role="TrG5h" value="ecrobot_is_ENTER_button_pressed" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMgk" id="3QwuWjHk2yK" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk1D6" role="N3F5h">
      <property role="TrG5h" value="ecrobot_is_RUN_button_pressed" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMgk" id="3QwuWjHk2yS" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk2cj" role="N3F5h">
      <property role="TrG5h" value="ecrobot_get_button_state" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="26Vqp4" id="3QwuWjHk1Zv" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk2UY" role="N3F5h">
      <property role="TrG5h" value="ecrobot_restart_NXT" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk2Id" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk3u8" role="N3F5h">
      <property role="TrG5h" value="ecrobot_shutdown_NXT" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk3hx" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHk401" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHk403" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHk404" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHk405" role="19SJt6">
            <property role="19SUeA" value="LCD display command for system" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk4oM" role="N3F5h">
      <property role="TrG5h" value="ecrobot_bmp2lcd" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMgk" id="3QwuWjHkcrG" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk4$i" role="1UOdpc">
        <property role="TrG5h" value="file" />
        <node concept="3wxxNl" id="3QwuWjHk4BL" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="biTqx" id="3QwuWjHk4$h" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk4$X" role="1UOdpc">
        <property role="TrG5h" value="lcd" />
        <node concept="3wxxNl" id="3QwuWjHk4Cf" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="26Vqp4" id="3QwuWjHk4$V" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk4Ae" role="1UOdpc">
        <property role="TrG5h" value="width" />
        <node concept="26Vqph" id="3QwuWjHk4Ac" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk4Ba" role="1UOdpc">
        <property role="TrG5h" value="height" />
        <node concept="26Vqph" id="3QwuWjHk4B8" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk51x" role="N3F5h">
      <property role="TrG5h" value="ecrobot_show_int" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk4O_" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk5d_" role="1UOdpc">
        <property role="TrG5h" value="var" />
        <node concept="26Vqph" id="3QwuWjHk5d$" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk5B3" role="N3F5h">
      <property role="TrG5h" value="ecrobot_debug1" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk5pX" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk5Nb" role="1UOdpc">
        <property role="TrG5h" value="var1" />
        <node concept="26VXez" id="3QwuWjHk5Na" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk5O8" role="1UOdpc">
        <property role="TrG5h" value="var2" />
        <node concept="26VXez" id="3QwuWjHk5O6" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk5P1" role="1UOdpc">
        <property role="TrG5h" value="var3" />
        <node concept="26VXez" id="3QwuWjHk5OZ" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk62m" role="N3F5h">
      <property role="TrG5h" value="ecrobot_debug2" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk62n" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk62o" role="1UOdpc">
        <property role="TrG5h" value="var1" />
        <node concept="26VXez" id="3QwuWjHk62p" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk62q" role="1UOdpc">
        <property role="TrG5h" value="var2" />
        <node concept="26VXez" id="3QwuWjHk62r" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk62s" role="1UOdpc">
        <property role="TrG5h" value="var3" />
        <node concept="26VXez" id="3QwuWjHk62t" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk7vw" role="N3F5h">
      <property role="TrG5h" value="ecrobot_status_monitor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk7h3" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk7GB" role="1UOdpc">
        <property role="TrG5h" value="target_name" />
        <node concept="3wxxNl" id="3QwuWjHk7HD" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="biTqx" id="3QwuWjHk7GA" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk8$S" role="N3F5h">
      <property role="TrG5h" value="ecrobot_adc_data_monitor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk8m9" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk8Mn" role="1UOdpc">
        <property role="TrG5h" value="target_name" />
        <node concept="3wxxNl" id="3QwuWjHk8MD" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="biTqx" id="3QwuWjHk8Mm" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk9gW" role="N3F5h">
      <property role="TrG5h" value="ecrobot_bt_data_logger" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk921" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHk9uN" role="1UOdpc">
        <property role="TrG5h" value="data1" />
        <node concept="26Vqqz" id="3QwuWjHk9uM" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHk9vn" role="1UOdpc">
        <property role="TrG5h" value="data2" />
        <node concept="26Vqqz" id="3QwuWjHk9vl" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHk9Xh" role="N3F5h">
      <property role="TrG5h" value="ecrobot_bt_adc_dat_logger" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHk9HA" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHkabe" role="1UOdpc">
        <property role="TrG5h" value="data1" />
        <node concept="26Vqqz" id="3QwuWjHkabd" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkabR" role="1UOdpc">
        <property role="TrG5h" value="data_2" />
        <node concept="26Vqqz" id="3QwuWjHkabP" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkacI" role="1UOdpc">
        <property role="TrG5h" value="adc1" />
        <node concept="26Vqpq" id="3QwuWjHkacG" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkad$" role="1UOdpc">
        <property role="TrG5h" value="adc2" />
        <node concept="26Vqpq" id="3QwuWjHkady" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkaeu" role="1UOdpc">
        <property role="TrG5h" value="adc3" />
        <node concept="26Vqpq" id="3QwuWjHkaes" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkafs" role="1UOdpc">
        <property role="TrG5h" value="adc4" />
        <node concept="26Vqpq" id="3QwuWjHkafq" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHkaHG" role="N3F5h">
      <property role="TrG5h" value="ecrobot_sint_var_monitor" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHkaub" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHkaVR" role="1UOdpc">
        <property role="TrG5h" value="vars" />
        <node concept="3J0A42" id="3QwuWjHkaWx" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="3TlMh2" id="3QwuWjHkaVQ" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
          <node concept="3TlMh9" id="3QwuWjHkaWY" role="1YbSNA">
            <property role="2hmy$m" value="16" />
          </node>
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkbrZ" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkbs1" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkbs2" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkbs3" role="19SJt6">
            <property role="19SUeA" value="NXT sound API" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHkbVr" role="N3F5h">
      <property role="TrG5h" value="ecrobot_sound_tone" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMgk" id="3QwuWjHkhyr" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHkcau" role="1UOdpc">
        <property role="TrG5h" value="freq" />
        <node concept="26Vqpb" id="3QwuWjHkcat" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkcbi" role="1UOdpc">
        <property role="TrG5h" value="ms" />
        <node concept="26Vqpb" id="3QwuWjHkcbg" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkcc0" role="1UOdpc">
        <property role="TrG5h" value="vol" />
        <node concept="26Vqpb" id="3QwuWjHkcbY" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHkcGb" role="N3F5h">
      <property role="TrG5h" value="ecrobot_sound_wav" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMh2" id="3QwuWjHkhyg" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="3QwuWjHkcVo" role="1UOdpc">
        <property role="TrG5h" value="file" />
        <node concept="3wxxNl" id="3QwuWjHkcVM" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="biTqx" id="3QwuWjHkcVn" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkcWs" role="1UOdpc">
        <property role="TrG5h" value="length" />
        <node concept="26Vqpb" id="3QwuWjHkcWq" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkcX6" role="1UOdpc">
        <property role="TrG5h" value="freq" />
        <node concept="26Vqph" id="3QwuWjHkcX4" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="3QwuWjHkcXT" role="1UOdpc">
        <property role="TrG5h" value="vol" />
        <node concept="26Vqpb" id="3QwuWjHkcXR" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
    </node>
    <node concept="2B_Gvg" id="3QwuWjHkdvi" role="N3F5h">
      <node concept="OjmMv" id="3QwuWjHkdvk" role="2B_H8o">
        <node concept="19SGf9" id="3QwuWjHkdvl" role="OjmMu">
          <node concept="19SUe$" id="3QwuWjHkdvm" role="19SJt6">
            <property role="19SUeA" value="system hook functions" />
          </node>
        </node>
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHke0T" role="N3F5h">
      <property role="TrG5h" value="ecrobot_device_initialize" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHkdIY" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHkeLb" role="N3F5h">
      <property role="TrG5h" value="ecrobot_device_terminate" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHkewg" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="2NXPZ9" id="3QwuWjHkf0V" role="N3F5h">
      <property role="TrG5h" value="empty_1451292985176_111" />
    </node>
    <node concept="N3Fnw" id="3QwuWjHkfLC" role="N3F5h">
      <property role="TrG5h" value="user_1ms_isr_type2" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHkfwi" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHkgy3" role="N3F5h">
      <property role="TrG5h" value="check_NXT_buttons" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="19Rifw" id="3QwuWjHkgh9" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="N3Fnw" id="3QwuWjHkhhI" role="N3F5h">
      <property role="TrG5h" value="get_OS_flag" />
      <property role="2OOxQR" value="false" />
      <property role="3mNisv" value="true" />
      <node concept="3TlMh2" id="3QwuWjHkh1C" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="rcWE1" id="3tDp_yW6NPX" role="rcWEr">
      <property role="rcWEL" value="&quot;ecrobot_interface.h&quot;" />
    </node>
    <node concept="rcWEZ" id="3tDp_yW6MRA" role="rcWEr">
      <property role="rcWEL" value="&quot;ecrobot/libecrobot.a&quot;" />
    </node>
  </node>
</model>

