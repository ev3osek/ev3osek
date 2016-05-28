<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:6cad1e6e-58b9-4727-b550-4ef677c59a42(oil.sandbox.simpleC)">
  <persistence version="9" />
  <languages>
    <devkit ref="d2a9c55c-6bdc-4cc2-97e1-4ba7552f5584(com.mbeddr.core)" />
  </languages>
  <imports>
    <import index="iv2k" ref="r:b5d9fe20-6649-4266-8dba-4613a5d85e99(OSEK Implementation Language.__spreferences.PlatformTemplates)" />
  </imports>
  <registry>
    <language id="a9d69647-0840-491e-bf39-2eb0805d2011" name="com.mbeddr.core.statements">
      <concept id="7763322639126652757" name="com.mbeddr.core.statements.structure.ITypeContainingType" flags="ng" index="2umbIr">
        <child id="7763322639126652758" name="baseType" index="2umbIo" />
      </concept>
      <concept id="7254843406768833938" name="com.mbeddr.core.statements.structure.ExpressionStatement" flags="ng" index="1_9egQ">
        <child id="7254843406768833939" name="expr" index="1_9egR" />
      </concept>
      <concept id="4185783222026475861" name="com.mbeddr.core.statements.structure.StatementList" flags="ng" index="3XIRFW">
        <child id="4185783222026475862" name="statements" index="3XIRFZ" />
      </concept>
      <concept id="4185783222026464515" name="com.mbeddr.core.statements.structure.Statement" flags="ng" index="3XISUE" />
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
      <concept id="8719112291175211294" name="com.mbeddr.core.buildconfig.structure.PlatformReference" flags="ng" index="2xfidK">
        <reference id="8719112291175211414" name="template" index="2xfifS" />
      </concept>
    </language>
    <language id="3bf5377a-e904-4ded-9754-5a516023bfaa" name="com.mbeddr.core.pointers">
      <concept id="6113173064526131575" name="com.mbeddr.core.pointers.structure.StringLiteral" flags="ng" index="PhEJO">
        <property id="6113173064526131578" name="value" index="PhEJT" />
      </concept>
      <concept id="6113173064528067332" name="com.mbeddr.core.pointers.structure.StringType" flags="ng" index="Pu267" />
      <concept id="5679441017214012545" name="com.mbeddr.core.pointers.structure.ArrayType" flags="ng" index="3J0A42" />
    </language>
    <language id="d4280a54-f6df-4383-aa41-d1b2bffa7eb1" name="com.mbeddr.core.base">
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
      </concept>
      <concept id="6610873504380357354" name="com.mbeddr.core.modules.structure.GlobalVarRef" flags="ng" index="1S7827">
        <reference id="6610873504380357355" name="var" index="1S7826" />
      </concept>
      <concept id="6610873504380335822" name="com.mbeddr.core.modules.structure.GlobalVariableDeclaration" flags="ng" index="1S7NMz">
        <child id="2771264470558526601" name="init" index="1cecVj" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="61c69711-ed61-4850-81d9-7714ff227fb0" name="com.mbeddr.core.expressions">
      <concept id="8463282783691618440" name="com.mbeddr.core.expressions.structure.Int32tType" flags="ng" index="26Vqph" />
      <concept id="2212975673976017893" name="com.mbeddr.core.expressions.structure.NumericLiteral" flags="ng" index="2hns93">
        <property id="2212975673976043696" name="value" index="2hmy$m" />
      </concept>
      <concept id="318113533128716675" name="com.mbeddr.core.expressions.structure.ITyped" flags="ng" index="2C2TGh">
        <child id="318113533128716676" name="type" index="2C2TGm" />
      </concept>
      <concept id="7892328519581699353" name="com.mbeddr.core.expressions.structure.VoidType" flags="ng" index="19Rifw" />
      <concept id="8860443239512128054" name="com.mbeddr.core.expressions.structure.Type" flags="ng" index="3TlMgo">
        <property id="2941277002445651368" name="const" index="2c7vTL" />
        <property id="2941277002448691247" name="volatile" index="2caQfQ" />
      </concept>
      <concept id="8860443239512128103" name="com.mbeddr.core.expressions.structure.NumberLiteral" flags="ng" index="3TlMh9" />
    </language>
  </registry>
  <node concept="N3F5e" id="v5qeus7P6N">
    <property role="TrG5h" value="A" />
    <node concept="N3Fnx" id="v5qeus7P6O" role="N3F5h">
      <property role="TrG5h" value="main" />
      <property role="2OOxQR" value="true" />
      <node concept="3XIRFW" id="v5qeus7P6Q" role="3XIRFX">
        <node concept="1_9egQ" id="v5qeus7PhA" role="3XIRFZ">
          <node concept="3O_q_g" id="5z6cQ9ldNPb" role="1_9egR">
            <ref role="3O_q_h" node="v5qeus7P9k" resolve="foo" />
          </node>
        </node>
        <node concept="1_9egQ" id="1JmJJmp3gBz" role="3XIRFZ">
          <node concept="1S7827" id="5z6cQ9ldNRd" role="1_9egR">
            <ref role="1S7826" node="1JmJJmp3gwT" resolve="publicBar" />
          </node>
        </node>
        <node concept="1_9egQ" id="v5qeus7Ppt" role="3XIRFZ">
          <node concept="3O_q_g" id="v5qeus7Ppr" role="1_9egR">
            <ref role="3O_q_h" node="v5qeus7P9K" resolve="bar" />
          </node>
        </node>
        <node concept="1_9egQ" id="4B0n6H25C1i" role="3XIRFZ">
          <node concept="4ZOvp" id="5z6cQ9ldNTu" role="1_9egR">
            <ref role="2DPCA0" node="4B0n6H25BUV" resolve="myGlobalConstant" />
          </node>
        </node>
        <node concept="2BFjQ_" id="v5qeus7P6Y" role="3XIRFZ">
          <node concept="3TlMh9" id="v5qeus7P6Z" role="2BFjQA">
            <property role="2hmy$m" value="0" />
          </node>
        </node>
      </node>
      <node concept="26Vqph" id="v5qeus7P6S" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="19RgSI" id="v5qeus7P6T" role="1UOdpc">
        <property role="TrG5h" value="argc" />
        <node concept="26Vqph" id="v5qeus7P6U" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
        </node>
      </node>
      <node concept="19RgSI" id="v5qeus7P6V" role="1UOdpc">
        <property role="TrG5h" value="argv" />
        <node concept="3J0A42" id="v5qeus7P6W" role="2C2TGm">
          <property role="2caQfQ" value="false" />
          <property role="2c7vTL" value="false" />
          <node concept="Pu267" id="v5qeus7P6X" role="2umbIo">
            <property role="2caQfQ" value="false" />
            <property role="2c7vTL" value="false" />
          </node>
        </node>
      </node>
    </node>
    <node concept="3GEVxB" id="v5qeus7Pdo" role="2OODSX">
      <ref role="3GEb4d" node="v5qeus7P9$" resolve="C" />
    </node>
    <node concept="3GEVxB" id="5z6cQ9ldNNj" role="2OODSX">
      <ref role="3GEb4d" node="v5qeus7P92" resolve="B" />
    </node>
  </node>
  <node concept="N3F5e" id="v5qeus7P92">
    <property role="TrG5h" value="B" />
    <node concept="1S7NMz" id="1JmJJmp3gwT" role="N3F5h">
      <property role="TrG5h" value="publicBar" />
      <property role="2OOxQR" value="true" />
      <node concept="Pu267" id="1JmJJmp3gwR" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="1S7NMz" id="1JmJJmp3gyW" role="N3F5h">
      <property role="TrG5h" value="privateBar" />
      <node concept="Pu267" id="1JmJJmp3gyU" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
      <node concept="PhEJO" id="4B0n6H25BJC" role="1cecVj">
        <property role="PhEJT" value="hallo" />
      </node>
    </node>
    <node concept="4WHVk" id="4B0n6H25BUV" role="N3F5h">
      <property role="TrG5h" value="myGlobalConstant" />
      <property role="2OOxQR" value="true" />
      <node concept="PhEJO" id="4B0n6H25BWp" role="2DQcEM">
        <property role="PhEJT" value="Welt" />
      </node>
    </node>
    <node concept="N3Fnx" id="v5qeus7P9k" role="N3F5h">
      <property role="TrG5h" value="foo" />
      <property role="2OOxQR" value="true" />
      <node concept="3XIRFW" id="v5qeus7P9m" role="3XIRFX" />
      <node concept="19Rifw" id="v5qeus7P93" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
    <node concept="2NXPZ9" id="1JmJJmp3gwE" role="N3F5h">
      <property role="TrG5h" value="empty_1453669603350_1" />
    </node>
  </node>
  <node concept="N3F5e" id="v5qeus7P9$">
    <property role="TrG5h" value="C" />
    <node concept="N3Fnx" id="v5qeus7P9K" role="N3F5h">
      <property role="TrG5h" value="bar" />
      <property role="2OOxQR" value="true" />
      <property role="3mNisv" value="false" />
      <node concept="3XIRFW" id="v5qeus7P9M" role="3XIRFX">
        <node concept="3XISUE" id="v5qeus7P9N" role="3XIRFZ" />
      </node>
      <node concept="19Rifw" id="v5qeus7P9_" role="2C2TGm">
        <property role="2caQfQ" value="false" />
        <property role="2c7vTL" value="false" />
      </node>
    </node>
  </node>
  <node concept="2v9HqL" id="v5qeus7Pry">
    <node concept="2eOfOl" id="v5qeus7Pr_" role="2ePNbc">
      <property role="iO3LB" value="false" />
      <property role="TrG5h" value="ABC" />
      <node concept="2v9HqM" id="v5qeus7PrB" role="2eOfOg">
        <ref role="2v9HqP" node="v5qeus7P6N" resolve="A" />
      </node>
      <node concept="2v9HqM" id="v5qeus7PrG" role="2eOfOg">
        <ref role="2v9HqP" node="v5qeus7P92" resolve="B" />
      </node>
      <node concept="2v9HqM" id="v5qeus7PrO" role="2eOfOg">
        <ref role="2v9HqP" node="v5qeus7P9$" resolve="C" />
      </node>
    </node>
    <node concept="2xfidK" id="v5qeus7PuG" role="2AWWZH">
      <ref role="2xfifS" to="iv2k:2UjW4IkK5Yw" resolve="Desktop Platform" />
    </node>
  </node>
</model>

