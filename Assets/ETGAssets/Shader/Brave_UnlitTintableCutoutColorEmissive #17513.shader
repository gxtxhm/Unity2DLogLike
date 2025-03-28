//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/UnlitTintableCutoutColorEmissive" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_MaxValue ("Max Value", Float) = 1
_EmissivePower ("Emissive Power", Float) = 0
_EmissiveColorPower ("Emissive Color Power", Float) = 7
_EmissiveColor ("Emissive Color", Color) = (1,1,1,1)
_EmissiveThresholdSensitivity ("Threshold Sensitivity", Float) = 0
_EmissiveGlowToggle ("Custom Emissive Mode", Float) = 0
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" }
  ColorMask RGB 0
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 53732
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD4.xyz = vec3(0.0, 0.0, 0.0);
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _EmissiveColor;
uniform 	float _EmissiveThresholdSensitivity;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16 = u_xlat0.w + -0.100000001;
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = u_xlat0.xyz + (-_EmissiveColor.xyz);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat16 = u_xlat2.y + u_xlat2.x;
    u_xlat16 = u_xlat2.z * u_xlat2.z + u_xlat16;
    u_xlat16 = sqrt(u_xlat16);
    u_xlatb16 = u_xlat16<_EmissiveThresholdSensitivity;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vec3(0.298900008, 0.586600006, 0.114500001));
    u_xlat2.xy = u_xlat0.xz + (-u_xlat2.xx);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat12 = (-u_xlat2.x) * 0.298900008 + 1.0;
    u_xlat12 = (-u_xlat2.y) * 0.114500001 + u_xlat12;
    u_xlat12 = u_xlat12 * 1.70473921;
    u_xlat3.xz = log2(u_xlat2.xy);
    u_xlat3.y = log2(u_xlat12);
    u_xlat2.xyz = u_xlat3.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlat17 = u_xlat0.w + (-_Cutoff);
    u_xlatb17 = u_xlat17<0.0;
    if((int(u_xlatb17) * int(0xffffffffu))!=0){discard;}
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb17)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat17, u_xlat8);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat17 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat17) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat17) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 160
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 %149 %152 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %152 Location 152 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                               Output f32_3* %149 = OpVariable Output 
                                         f32 %150 = OpConstant 3.67402E-40 
                                       f32_3 %151 = OpConstantComposite %150 %150 %150 
                               Output f32_4* %152 = OpVariable Output 
                                       f32_4 %153 = OpConstantComposite %150 %150 %150 %150 
                                             %154 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                                      OpStore %149 %151 
                                                      OpStore %152 %153 
                                 Output f32* %155 = OpAccessChain %81 %23 %77 
                                         f32 %156 = OpLoad %155 
                                         f32 %157 = OpFNegate %156 
                                 Output f32* %158 = OpAccessChain %81 %23 %77 
                                                      OpStore %158 %157 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 382
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %233 %326 %367 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 RelaxedPrecision 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 RelaxedPrecision 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 RelaxedPrecision 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %226 SpecId 226 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %307 DescriptorSet 307 
                                                      OpDecorate %307 Binding 307 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %326 Location 326 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %367 Location 367 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeStruct %7 %7 %38 %21 %21 %7 %6 %6 %7 %6 %7 %6 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4; f32; f32_4; f32;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 10 
                                              %44 = OpTypePointer Uniform %7 
                                 Private f32* %61 = OpVariable Private 
                                          u32 %62 = OpConstant 3 
                                          f32 %65 = OpConstant 3.67402E-40 
                                              %67 = OpTypeBool 
                                              %68 = OpTypePointer Private %67 
                                Private bool* %69 = OpVariable Private 
                                          f32 %71 = OpConstant 3.67402E-40 
                                          i32 %74 = OpConstant 0 
                                          i32 %75 = OpConstant 1 
                                          i32 %77 = OpConstant -1 
                               Private f32_3* %83 = OpVariable Private 
                                          i32 %86 = OpConstant 8 
                                          u32 %99 = OpConstant 1 
                                         u32 %105 = OpConstant 2 
                                         i32 %116 = OpConstant 9 
                                             %117 = OpTypePointer Uniform %6 
                                             %121 = OpTypePointer Function %6 
                                         f32 %126 = OpConstant 3.67402E-40 
                                         f32 %131 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %133 = OpConstant 3.67402E-40 
                                       f32_3 %134 = OpConstantComposite %131 %132 %133 
                                       f32_2 %147 = OpConstantComposite %126 %126 
                                Private f32* %152 = OpVariable Private 
                                         f32 %165 = OpConstant 3.67402E-40 
                              Private f32_3* %167 = OpVariable Private 
                                         i32 %177 = OpConstant 7 
                                         i32 %193 = OpConstant 6 
                                         i32 %200 = OpConstant 11 
                               Private bool* %206 = OpVariable Private 
                                        bool %220 = OpConstantFalse 
                                        bool %226 = OpSpecConstantFalse 
                                             %232 = OpTypePointer Input %21 
                                Input f32_3* %233 = OpVariable Input 
                                         i32 %236 = OpConstant 2 
                                         i32 %258 = OpConstant 3 
                                             %263 = OpTypePointer Function %21 
                                         i32 %273 = OpConstant 4 
                                             %274 = OpTypePointer Uniform %21 
                              Private f32_4* %279 = OpVariable Private 
                                Private f32* %286 = OpVariable Private 
                                         f32 %289 = OpConstant 3.67402E-40 
                                         f32 %291 = OpConstant 3.67402E-40 
                                         f32 %295 = OpConstant 3.67402E-40 
                                             %304 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %305 = OpTypeSampledImage %304 
                                             %306 = OpTypePointer UniformConstant %305 
 UniformConstant read_only Texture3DSampled* %307 = OpVariable UniformConstant 
                                Private f32* %318 = OpVariable Private 
                                Input f32_3* %326 = OpVariable Input 
                              Private f32_3* %331 = OpVariable Private 
                                         i32 %333 = OpConstant 5 
                              Private f32_3* %338 = OpVariable Private 
                              Private f32_4* %362 = OpVariable Private 
                                             %366 = OpTypePointer Output %7 
                               Output f32_4* %367 = OpVariable Output 
                                             %379 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %122 = OpVariable Function 
                             Function f32_3* %264 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %36 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFNegate %50 
                                        f32_3 %52 = OpFAdd %48 %51 
                                                      OpStore %34 %52 
                               Uniform f32_4* %53 = OpAccessChain %41 %43 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 3 3 3 
                                        f32_3 %56 = OpLoad %34 
                                        f32_3 %57 = OpFMul %55 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFAdd %57 %59 
                                                      OpStore %34 %60 
                                 Private f32* %63 = OpAccessChain %9 %62 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFAdd %64 %65 
                                                      OpStore %61 %66 
                                          f32 %70 = OpLoad %61 
                                         bool %72 = OpFOrdLessThan %70 %71 
                                                      OpStore %69 %72 
                                         bool %73 = OpLoad %69 
                                          i32 %76 = OpSelect %73 %75 %74 
                                          i32 %78 = OpIMul %76 %77 
                                         bool %79 = OpINotEqual %78 %74 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpKill
                                              %81 = OpLabel 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %87 = OpAccessChain %41 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %85 %90 
                                                      OpStore %83 %91 
                                        f32_3 %92 = OpLoad %83 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_3 %94 = OpLoad %83 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %93 %95 
                                        f32_3 %97 = OpLoad %83 
                                        f32_3 %98 = OpVectorShuffle %97 %96 3 4 2 
                                                      OpStore %83 %98 
                                Private f32* %100 = OpAccessChain %83 %99 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %83 %30 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                                      OpStore %61 %104 
                                Private f32* %106 = OpAccessChain %83 %105 
                                         f32 %107 = OpLoad %106 
                                Private f32* %108 = OpAccessChain %83 %105 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                         f32 %111 = OpLoad %61 
                                         f32 %112 = OpFAdd %110 %111 
                                                      OpStore %61 %112 
                                         f32 %113 = OpLoad %61 
                                         f32 %114 = OpExtInst %1 31 %113 
                                                      OpStore %61 %114 
                                         f32 %115 = OpLoad %61 
                                Uniform f32* %118 = OpAccessChain %41 %116 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdLessThan %115 %119 
                                                      OpStore %69 %120 
                                        bool %123 = OpLoad %69 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %127 
                                             %124 = OpLabel 
                                                      OpStore %122 %126 
                                                      OpBranch %125 
                                             %127 = OpLabel 
                                                      OpStore %122 %71 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                         f32 %128 = OpLoad %122 
                                                      OpStore %61 %128 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %135 = OpDot %130 %134 
                                Private f32* %136 = OpAccessChain %83 %30 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 2 
                                       f32_3 %139 = OpLoad %83 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 0 
                                       f32_2 %141 = OpFNegate %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_3 %143 = OpLoad %83 
                                       f32_3 %144 = OpVectorShuffle %143 %142 3 4 2 
                                                      OpStore %83 %144 
                                       f32_3 %145 = OpLoad %83 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %148 = OpFMul %146 %147 
                                       f32_2 %149 = OpFAdd %148 %147 
                                       f32_3 %150 = OpLoad %83 
                                       f32_3 %151 = OpVectorShuffle %150 %149 3 4 2 
                                                      OpStore %83 %151 
                                Private f32* %153 = OpAccessChain %83 %30 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                         f32 %156 = OpFMul %155 %131 
                                         f32 %157 = OpFAdd %156 %126 
                                                      OpStore %152 %157 
                                Private f32* %158 = OpAccessChain %83 %99 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFNegate %159 
                                         f32 %161 = OpFMul %160 %133 
                                         f32 %162 = OpLoad %152 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %152 %163 
                                         f32 %164 = OpLoad %152 
                                         f32 %166 = OpFMul %164 %165 
                                                      OpStore %152 %166 
                                       f32_3 %168 = OpLoad %83 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpExtInst %1 30 %169 
                                       f32_3 %171 = OpLoad %167 
                                       f32_3 %172 = OpVectorShuffle %171 %170 3 1 4 
                                                      OpStore %167 %172 
                                         f32 %173 = OpLoad %152 
                                         f32 %174 = OpExtInst %1 30 %173 
                                Private f32* %175 = OpAccessChain %167 %99 
                                                      OpStore %175 %174 
                                       f32_3 %176 = OpLoad %167 
                                Uniform f32* %178 = OpAccessChain %41 %177 
                                         f32 %179 = OpLoad %178 
                                Uniform f32* %180 = OpAccessChain %41 %177 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %182 = OpAccessChain %41 %177 
                                         f32 %183 = OpLoad %182 
                                       f32_3 %184 = OpCompositeConstruct %179 %181 %183 
                                         f32 %185 = OpCompositeExtract %184 0 
                                         f32 %186 = OpCompositeExtract %184 1 
                                         f32 %187 = OpCompositeExtract %184 2 
                                       f32_3 %188 = OpCompositeConstruct %185 %186 %187 
                                       f32_3 %189 = OpFMul %176 %188 
                                                      OpStore %83 %189 
                                       f32_3 %190 = OpLoad %83 
                                       f32_3 %191 = OpExtInst %1 29 %190 
                                                      OpStore %83 %191 
                                       f32_3 %192 = OpLoad %83 
                                Uniform f32* %194 = OpAccessChain %41 %193 
                                         f32 %195 = OpLoad %194 
                                       f32_3 %196 = OpCompositeConstruct %195 %195 %195 
                                       f32_3 %197 = OpFMul %192 %196 
                                                      OpStore %83 %197 
                                Private f32* %198 = OpAccessChain %9 %62 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %41 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFNegate %202 
                                         f32 %204 = OpFAdd %199 %203 
                                Private f32* %205 = OpAccessChain %20 %30 
                                                      OpStore %205 %204 
                                Private f32* %207 = OpAccessChain %20 %30 
                                         f32 %208 = OpLoad %207 
                                        bool %209 = OpFOrdLessThan %208 %71 
                                                      OpStore %206 %209 
                                        bool %210 = OpLoad %206 
                                         i32 %211 = OpSelect %210 %75 %74 
                                         i32 %212 = OpIMul %211 %77 
                                        bool %213 = OpINotEqual %212 %74 
                                                      OpSelectionMerge %215 None 
                                                      OpBranchConditional %213 %214 %215 
                                             %214 = OpLabel 
                                                      OpKill
                                             %215 = OpLabel 
                                Uniform f32* %217 = OpAccessChain %41 %75 %30 
                                         f32 %218 = OpLoad %217 
                                        bool %219 = OpFOrdEqual %218 %126 
                                                      OpStore %206 %219 
                                                      OpSelectionMerge %222 None 
                                                      OpBranchConditional %220 %221 %222 
                                             %221 = OpLabel 
                                        bool %223 = OpLoad %206 
                                                      OpSelectionMerge %225 None 
                                                      OpBranchConditional %223 %224 %225 
                                             %224 = OpLabel 
                                                      OpBranch %225 
                                             %225 = OpLabel 
                                                      OpBranch %222 
                                             %222 = OpLabel 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %313 
                                             %227 = OpLabel 
                                Uniform f32* %229 = OpAccessChain %41 %75 %99 
                                         f32 %230 = OpLoad %229 
                                        bool %231 = OpFOrdEqual %230 %126 
                                                      OpStore %206 %231 
                                       f32_3 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 1 1 1 
                              Uniform f32_4* %237 = OpAccessChain %41 %236 %75 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFMul %235 %239 
                                                      OpStore %167 %240 
                              Uniform f32_4* %241 = OpAccessChain %41 %236 %74 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %233 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_3 %247 = OpLoad %167 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %167 %248 
                              Uniform f32_4* %249 = OpAccessChain %41 %236 %236 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpLoad %233 
                                       f32_3 %253 = OpVectorShuffle %252 %252 2 2 2 
                                       f32_3 %254 = OpFMul %251 %253 
                                       f32_3 %255 = OpLoad %167 
                                       f32_3 %256 = OpFAdd %254 %255 
                                                      OpStore %167 %256 
                                       f32_3 %257 = OpLoad %167 
                              Uniform f32_4* %259 = OpAccessChain %41 %236 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFAdd %257 %261 
                                                      OpStore %167 %262 
                                        bool %265 = OpLoad %206 
                                                      OpSelectionMerge %267 None 
                                                      OpBranchConditional %265 %266 %269 
                                             %266 = OpLabel 
                                       f32_3 %268 = OpLoad %167 
                                                      OpStore %264 %268 
                                                      OpBranch %267 
                                             %269 = OpLabel 
                                       f32_3 %270 = OpLoad %233 
                                                      OpStore %264 %270 
                                                      OpBranch %267 
                                             %267 = OpLabel 
                                       f32_3 %271 = OpLoad %264 
                                                      OpStore %167 %271 
                                       f32_3 %272 = OpLoad %167 
                              Uniform f32_3* %275 = OpAccessChain %41 %273 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %272 %277 
                                                      OpStore %167 %278 
                                       f32_3 %280 = OpLoad %167 
                              Uniform f32_3* %281 = OpAccessChain %41 %258 
                                       f32_3 %282 = OpLoad %281 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %279 
                                       f32_4 %285 = OpVectorShuffle %284 %283 0 4 5 6 
                                                      OpStore %279 %285 
                                Private f32* %287 = OpAccessChain %279 %99 
                                         f32 %288 = OpLoad %287 
                                         f32 %290 = OpFMul %288 %289 
                                         f32 %292 = OpFAdd %290 %291 
                                                      OpStore %286 %292 
                                Uniform f32* %293 = OpAccessChain %41 %75 %105 
                                         f32 %294 = OpLoad %293 
                                         f32 %296 = OpFMul %294 %295 
                                         f32 %297 = OpFAdd %296 %291 
                                Private f32* %298 = OpAccessChain %167 %30 
                                                      OpStore %298 %297 
                                         f32 %299 = OpLoad %286 
                                Private f32* %300 = OpAccessChain %167 %30 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 40 %299 %301 
                                Private f32* %303 = OpAccessChain %279 %30 
                                                      OpStore %303 %302 
                  read_only Texture3DSampled %308 = OpLoad %307 
                                       f32_4 %309 = OpLoad %279 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 2 3 
                                       f32_4 %311 = OpImageSampleImplicitLod %308 %310 
                                                      OpStore %279 %311 
                                       f32_4 %312 = OpLoad %279 
                                                      OpStore %20 %312 
                                                      OpBranch %228 
                                             %313 = OpLabel 
                                Private f32* %314 = OpAccessChain %20 %30 
                                                      OpStore %314 %126 
                                Private f32* %315 = OpAccessChain %20 %99 
                                                      OpStore %315 %126 
                                Private f32* %316 = OpAccessChain %20 %105 
                                                      OpStore %316 %126 
                                Private f32* %317 = OpAccessChain %20 %62 
                                                      OpStore %317 %126 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_4 %319 = OpLoad %20 
                              Uniform f32_4* %320 = OpAccessChain %41 %74 
                                       f32_4 %321 = OpLoad %320 
                                         f32 %322 = OpDot %319 %321 
                                                      OpStore %318 %322 
                                         f32 %323 = OpLoad %318 
                                         f32 %324 = OpExtInst %1 43 %323 %71 %126 
                                                      OpStore %318 %324 
                                       f32_3 %325 = OpLoad %34 
                                       f32_3 %327 = OpLoad %326 
                                       f32_3 %328 = OpFMul %325 %327 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                                      OpStore %20 %330 
                                       f32_3 %332 = OpLoad %34 
                              Uniform f32_4* %334 = OpAccessChain %41 %333 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFMul %332 %336 
                                                      OpStore %331 %337 
                                         f32 %339 = OpLoad %318 
                                       f32_3 %340 = OpCompositeConstruct %339 %339 %339 
                                       f32_3 %341 = OpLoad %331 
                                       f32_3 %342 = OpFMul %340 %341 
                                                      OpStore %338 %342 
                                       f32_3 %343 = OpLoad %331 
                                       f32_3 %344 = OpFNegate %343 
                                         f32 %345 = OpLoad %318 
                                       f32_3 %346 = OpCompositeConstruct %345 %345 %345 
                                       f32_3 %347 = OpFMul %344 %346 
                              Uniform f32_4* %348 = OpAccessChain %41 %43 
                                       f32_4 %349 = OpLoad %348 
                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
                                       f32_3 %351 = OpFAdd %347 %350 
                                                      OpStore %34 %351 
                              Uniform f32_4* %352 = OpAccessChain %41 %43 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 3 3 3 
                                       f32_3 %355 = OpLoad %34 
                                       f32_3 %356 = OpFMul %354 %355 
                                       f32_3 %357 = OpLoad %338 
                                       f32_3 %358 = OpFAdd %356 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
                                                      OpStore %9 %360 
                                Private f32* %361 = OpAccessChain %20 %62 
                                                      OpStore %361 %71 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpLoad %20 
                                       f32_4 %365 = OpFAdd %363 %364 
                                                      OpStore %362 %365 
                                       f32_3 %368 = OpLoad %83 
                                         f32 %369 = OpLoad %61 
                                       f32_3 %370 = OpCompositeConstruct %369 %369 %369 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %362 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %367 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %367 %376 
                                Private f32* %377 = OpAccessChain %362 %62 
                                         f32 %378 = OpLoad %377 
                                 Output f32* %380 = OpAccessChain %367 %62 
                                                      OpStore %380 %378 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD4.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _EmissiveColor;
uniform 	float _EmissiveThresholdSensitivity;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16 = u_xlat0.w + -0.100000001;
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = u_xlat0.xyz + (-_EmissiveColor.xyz);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat16 = u_xlat2.y + u_xlat2.x;
    u_xlat16 = u_xlat2.z * u_xlat2.z + u_xlat16;
    u_xlat16 = sqrt(u_xlat16);
    u_xlatb16 = u_xlat16<_EmissiveThresholdSensitivity;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vec3(0.298900008, 0.586600006, 0.114500001));
    u_xlat2.xy = u_xlat0.xz + (-u_xlat2.xx);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat12 = (-u_xlat2.x) * 0.298900008 + 1.0;
    u_xlat12 = (-u_xlat2.y) * 0.114500001 + u_xlat12;
    u_xlat12 = u_xlat12 * 1.70473921;
    u_xlat3.xz = log2(u_xlat2.xy);
    u_xlat3.y = log2(u_xlat12);
    u_xlat2.xyz = u_xlat3.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlat17 = u_xlat0.w + (-_Cutoff);
    u_xlatb17 = u_xlat17<0.0;
    if((int(u_xlatb17) * int(0xffffffffu))!=0){discard;}
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb17)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat17, u_xlat8);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat17 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat17) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat17) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 275
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %83 %95 %96 %110 %149 %152 %155 %264 %267 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 RelaxedPrecision 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 RelaxedPrecision 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpMemberDecorate %19 8 Offset 19 
                                                      OpMemberDecorate %19 9 Offset 19 
                                                      OpMemberDecorate %19 10 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %81 0 BuiltIn 81 
                                                      OpMemberDecorate %81 1 BuiltIn 81 
                                                      OpMemberDecorate %81 2 BuiltIn 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %110 Location 110 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %152 Location 152 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %264 Location 264 
                                                      OpDecorate %267 Location 267 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 7 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %29 = OpConstant 0 
                                          i32 %37 = OpConstant 2 
                               Private f32_4* %45 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %61 = OpConstant 9 
                                          u32 %79 = OpConstant 1 
                                              %80 = OpTypeArray %6 %79 
                                              %81 = OpTypeStruct %7 %6 %80 
                                              %82 = OpTypePointer Output %81 
         Output struct {f32_4; f32; f32[1];}* %83 = OpVariable Output 
                                              %91 = OpTypePointer Output %7 
                                              %93 = OpTypeVector %6 2 
                                              %94 = OpTypePointer Output %93 
                                Output f32_2* %95 = OpVariable Output 
                                 Input f32_4* %96 = OpVariable Input 
                                          i32 %99 = OpConstant 10 
                                             %108 = OpTypeVector %6 3 
                                             %109 = OpTypePointer Input %108 
                                Input f32_3* %110 = OpVariable Input 
                                         i32 %112 = OpConstant 8 
                                         u32 %117 = OpConstant 0 
                                             %118 = OpTypePointer Private %6 
                                         u32 %131 = OpConstant 2 
                                Private f32* %133 = OpVariable Private 
                                             %148 = OpTypePointer Output %108 
                               Output f32_3* %149 = OpVariable Output 
                               Output f32_3* %152 = OpVariable Output 
                               Output f32_4* %155 = OpVariable Output 
                                             %157 = OpTypePointer Private %108 
                              Private f32_3* %158 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                              Private f32_3* %181 = OpVariable Private 
                                         i32 %187 = OpConstant 4 
                                         i32 %193 = OpConstant 5 
                                         i32 %199 = OpConstant 6 
                                         f32 %208 = OpConstant 3.67402E-40 
                                         u32 %209 = OpConstant 3 
                                         f32 %230 = OpConstant 3.67402E-40 
                                       f32_3 %231 = OpConstantComposite %230 %230 %230 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_3 %252 = OpConstantComposite %251 %251 %251 
                                         f32 %254 = OpConstant 3.67402E-40 
                                       f32_3 %255 = OpConstantComposite %254 %254 %254 
                               Output f32_3* %264 = OpVariable Output 
                               Output f32_4* %267 = OpVariable Output 
                                       f32_4 %268 = OpConstantComposite %230 %230 %230 %230 
                                             %269 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %30 = OpAccessChain %21 %23 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %21 %23 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %46 = OpLoad %9 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpFAdd %46 %49 
                                                      OpStore %45 %50 
                               Uniform f32_4* %51 = OpAccessChain %21 %23 %47 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %11 
                                        f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                        f32_4 %55 = OpFMul %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpFAdd %55 %56 
                                                      OpStore %9 %57 
                                        f32_4 %59 = OpLoad %45 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %21 %61 %24 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %60 %63 
                                                      OpStore %58 %64 
                               Uniform f32_4* %65 = OpAccessChain %21 %61 %29 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %45 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %58 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %61 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %45 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %58 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %58 %78 
                               Uniform f32_4* %84 = OpAccessChain %21 %61 %47 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpLoad %45 
                                        f32_4 %87 = OpVectorShuffle %86 %86 3 3 3 3 
                                        f32_4 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %58 
                                        f32_4 %90 = OpFAdd %88 %89 
                                Output f32_4* %92 = OpAccessChain %83 %29 
                                                      OpStore %92 %90 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                              Uniform f32_4* %100 = OpAccessChain %21 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFMul %98 %102 
                              Uniform f32_4* %104 = OpAccessChain %21 %99 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 2 3 
                                       f32_2 %107 = OpFAdd %103 %106 
                                                      OpStore %95 %107 
                                       f32_3 %111 = OpLoad %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 %29 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                         f32 %116 = OpDot %111 %115 
                                Private f32* %119 = OpAccessChain %45 %117 
                                                      OpStore %119 %116 
                                       f32_3 %120 = OpLoad %110 
                              Uniform f32_4* %121 = OpAccessChain %21 %112 %24 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                         f32 %124 = OpDot %120 %123 
                                Private f32* %125 = OpAccessChain %45 %79 
                                                      OpStore %125 %124 
                                       f32_3 %126 = OpLoad %110 
                              Uniform f32_4* %127 = OpAccessChain %21 %112 %37 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                         f32 %130 = OpDot %126 %129 
                                Private f32* %132 = OpAccessChain %45 %131 
                                                      OpStore %132 %130 
                                       f32_4 %134 = OpLoad %45 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_4 %136 = OpLoad %45 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                                      OpStore %133 %138 
                                         f32 %139 = OpLoad %133 
                                         f32 %140 = OpExtInst %1 32 %139 
                                                      OpStore %133 %140 
                                         f32 %141 = OpLoad %133 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %45 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %45 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %45 %147 
                                       f32_4 %150 = OpLoad %45 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                                      OpStore %149 %151 
                                       f32_4 %153 = OpLoad %9 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                                      OpStore %152 %154 
                                       f32_4 %156 = OpLoad %9 
                                                      OpStore %155 %156 
                                Private f32* %159 = OpAccessChain %45 %79 
                                         f32 %160 = OpLoad %159 
                                Private f32* %161 = OpAccessChain %45 %79 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFMul %160 %162 
                                Private f32* %164 = OpAccessChain %158 %117 
                                                      OpStore %164 %163 
                                Private f32* %165 = OpAccessChain %45 %117 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %45 %117 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                Private f32* %170 = OpAccessChain %158 %117 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpFNegate %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %158 %117 
                                                      OpStore %174 %173 
                                       f32_4 %176 = OpLoad %45 
                                       f32_4 %177 = OpVectorShuffle %176 %176 1 2 2 0 
                                       f32_4 %178 = OpLoad %45 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 1 2 2 
                                       f32_4 %180 = OpFMul %177 %179 
                                                      OpStore %175 %180 
                              Uniform f32_4* %182 = OpAccessChain %21 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %175 
                                         f32 %185 = OpDot %183 %184 
                                Private f32* %186 = OpAccessChain %181 %117 
                                                      OpStore %186 %185 
                              Uniform f32_4* %188 = OpAccessChain %21 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_4 %190 = OpLoad %175 
                                         f32 %191 = OpDot %189 %190 
                                Private f32* %192 = OpAccessChain %181 %79 
                                                      OpStore %192 %191 
                              Uniform f32_4* %194 = OpAccessChain %21 %193 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpLoad %175 
                                         f32 %197 = OpDot %195 %196 
                                Private f32* %198 = OpAccessChain %181 %131 
                                                      OpStore %198 %197 
                              Uniform f32_4* %200 = OpAccessChain %21 %199 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %203 = OpLoad %158 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 0 0 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_3 %206 = OpLoad %181 
                                       f32_3 %207 = OpFAdd %205 %206 
                                                      OpStore %158 %207 
                                Private f32* %210 = OpAccessChain %45 %209 
                                                      OpStore %210 %208 
                              Uniform f32_4* %211 = OpAccessChain %21 %29 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpLoad %45 
                                         f32 %214 = OpDot %212 %213 
                                Private f32* %215 = OpAccessChain %181 %117 
                                                      OpStore %215 %214 
                              Uniform f32_4* %216 = OpAccessChain %21 %24 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %45 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %181 %79 
                                                      OpStore %220 %219 
                              Uniform f32_4* %221 = OpAccessChain %21 %37 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %45 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %181 %131 
                                                      OpStore %225 %224 
                                       f32_3 %226 = OpLoad %158 
                                       f32_3 %227 = OpLoad %181 
                                       f32_3 %228 = OpFAdd %226 %227 
                                                      OpStore %158 %228 
                                       f32_3 %229 = OpLoad %158 
                                       f32_3 %232 = OpExtInst %1 40 %229 %231 
                                                      OpStore %158 %232 
                                       f32_3 %233 = OpLoad %158 
                                       f32_3 %234 = OpExtInst %1 30 %233 
                                       f32_4 %235 = OpLoad %45 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 6 3 
                                                      OpStore %45 %236 
                                       f32_4 %237 = OpLoad %45 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_4 %242 = OpLoad %45 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 6 3 
                                                      OpStore %45 %243 
                                       f32_4 %244 = OpLoad %45 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpExtInst %1 29 %245 
                                       f32_4 %247 = OpLoad %45 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %45 %248 
                                       f32_4 %249 = OpLoad %45 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %253 = OpFMul %250 %252 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %45 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %45 %258 
                                       f32_4 %259 = OpLoad %45 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpExtInst %1 40 %260 %231 
                                       f32_4 %262 = OpLoad %45 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %45 %263 
                                       f32_4 %265 = OpLoad %45 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                                      OpStore %264 %266 
                                                      OpStore %267 %268 
                                 Output f32* %270 = OpAccessChain %83 %29 %79 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFNegate %271 
                                 Output f32* %273 = OpAccessChain %83 %29 %79 
                                                      OpStore %273 %272 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 382
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %233 %326 %367 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 RelaxedPrecision 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 RelaxedPrecision 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 RelaxedPrecision 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %226 SpecId 226 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %307 DescriptorSet 307 
                                                      OpDecorate %307 Binding 307 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %326 Location 326 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %367 Location 367 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeStruct %7 %7 %38 %21 %21 %7 %6 %6 %7 %6 %7 %6 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4; f32; f32_4; f32;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 10 
                                              %44 = OpTypePointer Uniform %7 
                                 Private f32* %61 = OpVariable Private 
                                          u32 %62 = OpConstant 3 
                                          f32 %65 = OpConstant 3.67402E-40 
                                              %67 = OpTypeBool 
                                              %68 = OpTypePointer Private %67 
                                Private bool* %69 = OpVariable Private 
                                          f32 %71 = OpConstant 3.67402E-40 
                                          i32 %74 = OpConstant 0 
                                          i32 %75 = OpConstant 1 
                                          i32 %77 = OpConstant -1 
                               Private f32_3* %83 = OpVariable Private 
                                          i32 %86 = OpConstant 8 
                                          u32 %99 = OpConstant 1 
                                         u32 %105 = OpConstant 2 
                                         i32 %116 = OpConstant 9 
                                             %117 = OpTypePointer Uniform %6 
                                             %121 = OpTypePointer Function %6 
                                         f32 %126 = OpConstant 3.67402E-40 
                                         f32 %131 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %133 = OpConstant 3.67402E-40 
                                       f32_3 %134 = OpConstantComposite %131 %132 %133 
                                       f32_2 %147 = OpConstantComposite %126 %126 
                                Private f32* %152 = OpVariable Private 
                                         f32 %165 = OpConstant 3.67402E-40 
                              Private f32_3* %167 = OpVariable Private 
                                         i32 %177 = OpConstant 7 
                                         i32 %193 = OpConstant 6 
                                         i32 %200 = OpConstant 11 
                               Private bool* %206 = OpVariable Private 
                                        bool %220 = OpConstantFalse 
                                        bool %226 = OpSpecConstantFalse 
                                             %232 = OpTypePointer Input %21 
                                Input f32_3* %233 = OpVariable Input 
                                         i32 %236 = OpConstant 2 
                                         i32 %258 = OpConstant 3 
                                             %263 = OpTypePointer Function %21 
                                         i32 %273 = OpConstant 4 
                                             %274 = OpTypePointer Uniform %21 
                              Private f32_4* %279 = OpVariable Private 
                                Private f32* %286 = OpVariable Private 
                                         f32 %289 = OpConstant 3.67402E-40 
                                         f32 %291 = OpConstant 3.67402E-40 
                                         f32 %295 = OpConstant 3.67402E-40 
                                             %304 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %305 = OpTypeSampledImage %304 
                                             %306 = OpTypePointer UniformConstant %305 
 UniformConstant read_only Texture3DSampled* %307 = OpVariable UniformConstant 
                                Private f32* %318 = OpVariable Private 
                                Input f32_3* %326 = OpVariable Input 
                              Private f32_3* %331 = OpVariable Private 
                                         i32 %333 = OpConstant 5 
                              Private f32_3* %338 = OpVariable Private 
                              Private f32_4* %362 = OpVariable Private 
                                             %366 = OpTypePointer Output %7 
                               Output f32_4* %367 = OpVariable Output 
                                             %379 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %122 = OpVariable Function 
                             Function f32_3* %264 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %36 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFNegate %50 
                                        f32_3 %52 = OpFAdd %48 %51 
                                                      OpStore %34 %52 
                               Uniform f32_4* %53 = OpAccessChain %41 %43 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 3 3 3 
                                        f32_3 %56 = OpLoad %34 
                                        f32_3 %57 = OpFMul %55 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFAdd %57 %59 
                                                      OpStore %34 %60 
                                 Private f32* %63 = OpAccessChain %9 %62 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFAdd %64 %65 
                                                      OpStore %61 %66 
                                          f32 %70 = OpLoad %61 
                                         bool %72 = OpFOrdLessThan %70 %71 
                                                      OpStore %69 %72 
                                         bool %73 = OpLoad %69 
                                          i32 %76 = OpSelect %73 %75 %74 
                                          i32 %78 = OpIMul %76 %77 
                                         bool %79 = OpINotEqual %78 %74 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpKill
                                              %81 = OpLabel 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %87 = OpAccessChain %41 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %85 %90 
                                                      OpStore %83 %91 
                                        f32_3 %92 = OpLoad %83 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_3 %94 = OpLoad %83 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %93 %95 
                                        f32_3 %97 = OpLoad %83 
                                        f32_3 %98 = OpVectorShuffle %97 %96 3 4 2 
                                                      OpStore %83 %98 
                                Private f32* %100 = OpAccessChain %83 %99 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %83 %30 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                                      OpStore %61 %104 
                                Private f32* %106 = OpAccessChain %83 %105 
                                         f32 %107 = OpLoad %106 
                                Private f32* %108 = OpAccessChain %83 %105 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                         f32 %111 = OpLoad %61 
                                         f32 %112 = OpFAdd %110 %111 
                                                      OpStore %61 %112 
                                         f32 %113 = OpLoad %61 
                                         f32 %114 = OpExtInst %1 31 %113 
                                                      OpStore %61 %114 
                                         f32 %115 = OpLoad %61 
                                Uniform f32* %118 = OpAccessChain %41 %116 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdLessThan %115 %119 
                                                      OpStore %69 %120 
                                        bool %123 = OpLoad %69 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %127 
                                             %124 = OpLabel 
                                                      OpStore %122 %126 
                                                      OpBranch %125 
                                             %127 = OpLabel 
                                                      OpStore %122 %71 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                         f32 %128 = OpLoad %122 
                                                      OpStore %61 %128 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %135 = OpDot %130 %134 
                                Private f32* %136 = OpAccessChain %83 %30 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 2 
                                       f32_3 %139 = OpLoad %83 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 0 
                                       f32_2 %141 = OpFNegate %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_3 %143 = OpLoad %83 
                                       f32_3 %144 = OpVectorShuffle %143 %142 3 4 2 
                                                      OpStore %83 %144 
                                       f32_3 %145 = OpLoad %83 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %148 = OpFMul %146 %147 
                                       f32_2 %149 = OpFAdd %148 %147 
                                       f32_3 %150 = OpLoad %83 
                                       f32_3 %151 = OpVectorShuffle %150 %149 3 4 2 
                                                      OpStore %83 %151 
                                Private f32* %153 = OpAccessChain %83 %30 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                         f32 %156 = OpFMul %155 %131 
                                         f32 %157 = OpFAdd %156 %126 
                                                      OpStore %152 %157 
                                Private f32* %158 = OpAccessChain %83 %99 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFNegate %159 
                                         f32 %161 = OpFMul %160 %133 
                                         f32 %162 = OpLoad %152 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %152 %163 
                                         f32 %164 = OpLoad %152 
                                         f32 %166 = OpFMul %164 %165 
                                                      OpStore %152 %166 
                                       f32_3 %168 = OpLoad %83 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpExtInst %1 30 %169 
                                       f32_3 %171 = OpLoad %167 
                                       f32_3 %172 = OpVectorShuffle %171 %170 3 1 4 
                                                      OpStore %167 %172 
                                         f32 %173 = OpLoad %152 
                                         f32 %174 = OpExtInst %1 30 %173 
                                Private f32* %175 = OpAccessChain %167 %99 
                                                      OpStore %175 %174 
                                       f32_3 %176 = OpLoad %167 
                                Uniform f32* %178 = OpAccessChain %41 %177 
                                         f32 %179 = OpLoad %178 
                                Uniform f32* %180 = OpAccessChain %41 %177 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %182 = OpAccessChain %41 %177 
                                         f32 %183 = OpLoad %182 
                                       f32_3 %184 = OpCompositeConstruct %179 %181 %183 
                                         f32 %185 = OpCompositeExtract %184 0 
                                         f32 %186 = OpCompositeExtract %184 1 
                                         f32 %187 = OpCompositeExtract %184 2 
                                       f32_3 %188 = OpCompositeConstruct %185 %186 %187 
                                       f32_3 %189 = OpFMul %176 %188 
                                                      OpStore %83 %189 
                                       f32_3 %190 = OpLoad %83 
                                       f32_3 %191 = OpExtInst %1 29 %190 
                                                      OpStore %83 %191 
                                       f32_3 %192 = OpLoad %83 
                                Uniform f32* %194 = OpAccessChain %41 %193 
                                         f32 %195 = OpLoad %194 
                                       f32_3 %196 = OpCompositeConstruct %195 %195 %195 
                                       f32_3 %197 = OpFMul %192 %196 
                                                      OpStore %83 %197 
                                Private f32* %198 = OpAccessChain %9 %62 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %41 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFNegate %202 
                                         f32 %204 = OpFAdd %199 %203 
                                Private f32* %205 = OpAccessChain %20 %30 
                                                      OpStore %205 %204 
                                Private f32* %207 = OpAccessChain %20 %30 
                                         f32 %208 = OpLoad %207 
                                        bool %209 = OpFOrdLessThan %208 %71 
                                                      OpStore %206 %209 
                                        bool %210 = OpLoad %206 
                                         i32 %211 = OpSelect %210 %75 %74 
                                         i32 %212 = OpIMul %211 %77 
                                        bool %213 = OpINotEqual %212 %74 
                                                      OpSelectionMerge %215 None 
                                                      OpBranchConditional %213 %214 %215 
                                             %214 = OpLabel 
                                                      OpKill
                                             %215 = OpLabel 
                                Uniform f32* %217 = OpAccessChain %41 %75 %30 
                                         f32 %218 = OpLoad %217 
                                        bool %219 = OpFOrdEqual %218 %126 
                                                      OpStore %206 %219 
                                                      OpSelectionMerge %222 None 
                                                      OpBranchConditional %220 %221 %222 
                                             %221 = OpLabel 
                                        bool %223 = OpLoad %206 
                                                      OpSelectionMerge %225 None 
                                                      OpBranchConditional %223 %224 %225 
                                             %224 = OpLabel 
                                                      OpBranch %225 
                                             %225 = OpLabel 
                                                      OpBranch %222 
                                             %222 = OpLabel 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %313 
                                             %227 = OpLabel 
                                Uniform f32* %229 = OpAccessChain %41 %75 %99 
                                         f32 %230 = OpLoad %229 
                                        bool %231 = OpFOrdEqual %230 %126 
                                                      OpStore %206 %231 
                                       f32_3 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 1 1 1 
                              Uniform f32_4* %237 = OpAccessChain %41 %236 %75 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFMul %235 %239 
                                                      OpStore %167 %240 
                              Uniform f32_4* %241 = OpAccessChain %41 %236 %74 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %233 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_3 %247 = OpLoad %167 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %167 %248 
                              Uniform f32_4* %249 = OpAccessChain %41 %236 %236 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpLoad %233 
                                       f32_3 %253 = OpVectorShuffle %252 %252 2 2 2 
                                       f32_3 %254 = OpFMul %251 %253 
                                       f32_3 %255 = OpLoad %167 
                                       f32_3 %256 = OpFAdd %254 %255 
                                                      OpStore %167 %256 
                                       f32_3 %257 = OpLoad %167 
                              Uniform f32_4* %259 = OpAccessChain %41 %236 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFAdd %257 %261 
                                                      OpStore %167 %262 
                                        bool %265 = OpLoad %206 
                                                      OpSelectionMerge %267 None 
                                                      OpBranchConditional %265 %266 %269 
                                             %266 = OpLabel 
                                       f32_3 %268 = OpLoad %167 
                                                      OpStore %264 %268 
                                                      OpBranch %267 
                                             %269 = OpLabel 
                                       f32_3 %270 = OpLoad %233 
                                                      OpStore %264 %270 
                                                      OpBranch %267 
                                             %267 = OpLabel 
                                       f32_3 %271 = OpLoad %264 
                                                      OpStore %167 %271 
                                       f32_3 %272 = OpLoad %167 
                              Uniform f32_3* %275 = OpAccessChain %41 %273 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %272 %277 
                                                      OpStore %167 %278 
                                       f32_3 %280 = OpLoad %167 
                              Uniform f32_3* %281 = OpAccessChain %41 %258 
                                       f32_3 %282 = OpLoad %281 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %279 
                                       f32_4 %285 = OpVectorShuffle %284 %283 0 4 5 6 
                                                      OpStore %279 %285 
                                Private f32* %287 = OpAccessChain %279 %99 
                                         f32 %288 = OpLoad %287 
                                         f32 %290 = OpFMul %288 %289 
                                         f32 %292 = OpFAdd %290 %291 
                                                      OpStore %286 %292 
                                Uniform f32* %293 = OpAccessChain %41 %75 %105 
                                         f32 %294 = OpLoad %293 
                                         f32 %296 = OpFMul %294 %295 
                                         f32 %297 = OpFAdd %296 %291 
                                Private f32* %298 = OpAccessChain %167 %30 
                                                      OpStore %298 %297 
                                         f32 %299 = OpLoad %286 
                                Private f32* %300 = OpAccessChain %167 %30 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 40 %299 %301 
                                Private f32* %303 = OpAccessChain %279 %30 
                                                      OpStore %303 %302 
                  read_only Texture3DSampled %308 = OpLoad %307 
                                       f32_4 %309 = OpLoad %279 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 2 3 
                                       f32_4 %311 = OpImageSampleImplicitLod %308 %310 
                                                      OpStore %279 %311 
                                       f32_4 %312 = OpLoad %279 
                                                      OpStore %20 %312 
                                                      OpBranch %228 
                                             %313 = OpLabel 
                                Private f32* %314 = OpAccessChain %20 %30 
                                                      OpStore %314 %126 
                                Private f32* %315 = OpAccessChain %20 %99 
                                                      OpStore %315 %126 
                                Private f32* %316 = OpAccessChain %20 %105 
                                                      OpStore %316 %126 
                                Private f32* %317 = OpAccessChain %20 %62 
                                                      OpStore %317 %126 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_4 %319 = OpLoad %20 
                              Uniform f32_4* %320 = OpAccessChain %41 %74 
                                       f32_4 %321 = OpLoad %320 
                                         f32 %322 = OpDot %319 %321 
                                                      OpStore %318 %322 
                                         f32 %323 = OpLoad %318 
                                         f32 %324 = OpExtInst %1 43 %323 %71 %126 
                                                      OpStore %318 %324 
                                       f32_3 %325 = OpLoad %34 
                                       f32_3 %327 = OpLoad %326 
                                       f32_3 %328 = OpFMul %325 %327 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                                      OpStore %20 %330 
                                       f32_3 %332 = OpLoad %34 
                              Uniform f32_4* %334 = OpAccessChain %41 %333 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFMul %332 %336 
                                                      OpStore %331 %337 
                                         f32 %339 = OpLoad %318 
                                       f32_3 %340 = OpCompositeConstruct %339 %339 %339 
                                       f32_3 %341 = OpLoad %331 
                                       f32_3 %342 = OpFMul %340 %341 
                                                      OpStore %338 %342 
                                       f32_3 %343 = OpLoad %331 
                                       f32_3 %344 = OpFNegate %343 
                                         f32 %345 = OpLoad %318 
                                       f32_3 %346 = OpCompositeConstruct %345 %345 %345 
                                       f32_3 %347 = OpFMul %344 %346 
                              Uniform f32_4* %348 = OpAccessChain %41 %43 
                                       f32_4 %349 = OpLoad %348 
                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
                                       f32_3 %351 = OpFAdd %347 %350 
                                                      OpStore %34 %351 
                              Uniform f32_4* %352 = OpAccessChain %41 %43 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 3 3 3 
                                       f32_3 %355 = OpLoad %34 
                                       f32_3 %356 = OpFMul %354 %355 
                                       f32_3 %357 = OpLoad %338 
                                       f32_3 %358 = OpFAdd %356 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
                                                      OpStore %9 %360 
                                Private f32* %361 = OpAccessChain %20 %62 
                                                      OpStore %361 %71 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpLoad %20 
                                       f32_4 %365 = OpFAdd %363 %364 
                                                      OpStore %362 %365 
                                       f32_3 %368 = OpLoad %83 
                                         f32 %369 = OpLoad %61 
                                       f32_3 %370 = OpCompositeConstruct %369 %369 %369 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %362 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %367 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %367 %376 
                                Private f32* %377 = OpAccessChain %362 %62 
                                         f32 %378 = OpLoad %377 
                                 Output f32* %380 = OpAccessChain %367 %62 
                                                      OpStore %380 %378 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat16;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat2 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _EmissiveColor;
uniform 	float _EmissiveThresholdSensitivity;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16 = u_xlat0.w + -0.100000001;
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = u_xlat0.xyz + (-_EmissiveColor.xyz);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat16 = u_xlat2.y + u_xlat2.x;
    u_xlat16 = u_xlat2.z * u_xlat2.z + u_xlat16;
    u_xlat16 = sqrt(u_xlat16);
    u_xlatb16 = u_xlat16<_EmissiveThresholdSensitivity;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vec3(0.298900008, 0.586600006, 0.114500001));
    u_xlat2.xy = u_xlat0.xz + (-u_xlat2.xx);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat12 = (-u_xlat2.x) * 0.298900008 + 1.0;
    u_xlat12 = (-u_xlat2.y) * 0.114500001 + u_xlat12;
    u_xlat12 = u_xlat12 * 1.70473921;
    u_xlat3.xz = log2(u_xlat2.xy);
    u_xlat3.y = log2(u_xlat12);
    u_xlat2.xyz = u_xlat3.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlat17 = u_xlat0.w + (-_Cutoff);
    u_xlatb17 = u_xlat17<0.0;
    if((int(u_xlatb17) * int(0xffffffffu))!=0){discard;}
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb17)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat17, u_xlat8);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat17 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat17) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat17) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 285
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %275 %278 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 RelaxedPrecision 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %275 Location 275 
                                                      OpDecorate %278 Location 278 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 8 
                                              %16 = OpTypeArray %7 %15 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeStruct %7 %7 %7 %7 %16 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 5 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 7 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         i32 %101 = OpConstant 8 
                                             %110 = OpTypeVector %6 3 
                                             %111 = OpTypePointer Input %110 
                                Input f32_3* %112 = OpVariable Input 
                                         i32 %114 = OpConstant 6 
                                         u32 %119 = OpConstant 0 
                                             %120 = OpTypePointer Private %6 
                                         u32 %133 = OpConstant 2 
                                Private f32* %135 = OpVariable Private 
                                             %150 = OpTypePointer Output %110 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_3* %154 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                              Private f32_4* %165 = OpVariable Private 
                              Private f32_4* %173 = OpVariable Private 
                                         f32 %209 = OpConstant 3.67402E-40 
                                       f32_4 %210 = OpConstantComposite %209 %209 %209 %209 
                                         f32 %218 = OpConstant 3.67402E-40 
                                       f32_4 %219 = OpConstantComposite %218 %218 %218 %218 
                                         f32 %227 = OpConstant 3.67402E-40 
                                       f32_4 %228 = OpConstantComposite %227 %227 %227 %227 
                                         i32 %235 = OpConstant 4 
                               Output f32_3* %275 = OpVariable Output 
                               Output f32_4* %278 = OpVariable Output 
                                             %279 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %23 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %23 %25 %31 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpLoad %11 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %40 = OpAccessChain %23 %25 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpLoad %11 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                                        f32_4 %48 = OpLoad %9 
                               Uniform f32_4* %50 = OpAccessChain %23 %25 %49 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpFAdd %48 %51 
                                                      OpStore %47 %52 
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %86 = OpAccessChain %23 %63 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %60 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %31 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %102 = OpAccessChain %23 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %100 %104 
                              Uniform f32_4* %106 = OpAccessChain %23 %101 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                       f32_2 %109 = OpFAdd %105 %108 
                                                      OpStore %97 %109 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %115 = OpAccessChain %23 %114 %31 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                         f32 %118 = OpDot %113 %117 
                                Private f32* %121 = OpAccessChain %47 %119 
                                                      OpStore %121 %118 
                                       f32_3 %122 = OpLoad %112 
                              Uniform f32_4* %123 = OpAccessChain %23 %114 %26 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %127 = OpAccessChain %47 %81 
                                                      OpStore %127 %126 
                                       f32_3 %128 = OpLoad %112 
                              Uniform f32_4* %129 = OpAccessChain %23 %114 %39 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %128 %131 
                                Private f32* %134 = OpAccessChain %47 %133 
                                                      OpStore %134 %132 
                                       f32_4 %136 = OpLoad %47 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_4 %138 = OpLoad %47 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                         f32 %140 = OpDot %137 %139 
                                                      OpStore %135 %140 
                                         f32 %141 = OpLoad %135 
                                         f32 %142 = OpExtInst %1 32 %141 
                                                      OpStore %135 %142 
                                         f32 %143 = OpLoad %135 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %47 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %47 %149 
                                       f32_4 %152 = OpLoad %47 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                                      OpStore %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                                      OpStore %157 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                                       f32_4 %161 = OpFNegate %160 
                              Uniform f32_4* %162 = OpAccessChain %23 %26 
                                       f32_4 %163 = OpLoad %162 
                                       f32_4 %164 = OpFAdd %161 %163 
                                                      OpStore %60 %164 
                                       f32_4 %166 = OpLoad %47 
                                       f32_4 %167 = OpVectorShuffle %166 %166 1 1 1 1 
                                       f32_4 %168 = OpLoad %60 
                                       f32_4 %169 = OpFMul %167 %168 
                                                      OpStore %165 %169 
                                       f32_4 %170 = OpLoad %60 
                                       f32_4 %171 = OpLoad %60 
                                       f32_4 %172 = OpFMul %170 %171 
                                                      OpStore %60 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_4 %175 = OpVectorShuffle %174 %174 0 0 0 0 
                                       f32_4 %176 = OpFNegate %175 
                              Uniform f32_4* %177 = OpAccessChain %23 %31 
                                       f32_4 %178 = OpLoad %177 
                                       f32_4 %179 = OpFAdd %176 %178 
                                                      OpStore %173 %179 
                                       f32_4 %180 = OpLoad %9 
                                       f32_4 %181 = OpVectorShuffle %180 %180 2 2 2 2 
                                       f32_4 %182 = OpFNegate %181 
                              Uniform f32_4* %183 = OpAccessChain %23 %39 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpFAdd %182 %184 
                                                      OpStore %9 %185 
                                       f32_4 %186 = OpLoad %173 
                                       f32_4 %187 = OpLoad %47 
                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %165 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %165 %191 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpLoad %47 
                                       f32_4 %194 = OpVectorShuffle %193 %193 2 2 2 2 
                                       f32_4 %195 = OpFMul %192 %194 
                                       f32_4 %196 = OpLoad %165 
                                       f32_4 %197 = OpFAdd %195 %196 
                                                      OpStore %47 %197 
                                       f32_4 %198 = OpLoad %173 
                                       f32_4 %199 = OpLoad %173 
                                       f32_4 %200 = OpFMul %198 %199 
                                       f32_4 %201 = OpLoad %60 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %60 %202 
                                       f32_4 %203 = OpLoad %9 
                                       f32_4 %204 = OpLoad %9 
                                       f32_4 %205 = OpFMul %203 %204 
                                       f32_4 %206 = OpLoad %60 
                                       f32_4 %207 = OpFAdd %205 %206 
                                                      OpStore %9 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %211 = OpExtInst %1 40 %208 %210 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpExtInst %1 32 %212 
                                                      OpStore %60 %213 
                                       f32_4 %214 = OpLoad %9 
                              Uniform f32_4* %215 = OpAccessChain %23 %49 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpFMul %214 %216 
                                       f32_4 %220 = OpFAdd %217 %219 
                                                      OpStore %9 %220 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpFDiv %219 %221 
                                                      OpStore %9 %222 
                                       f32_4 %223 = OpLoad %47 
                                       f32_4 %224 = OpLoad %60 
                                       f32_4 %225 = OpFMul %223 %224 
                                                      OpStore %47 %225 
                                       f32_4 %226 = OpLoad %47 
                                       f32_4 %229 = OpExtInst %1 40 %226 %228 
                                                      OpStore %47 %229 
                                       f32_4 %230 = OpLoad %9 
                                       f32_4 %231 = OpLoad %47 
                                       f32_4 %232 = OpFMul %230 %231 
                                                      OpStore %9 %232 
                                       f32_4 %233 = OpLoad %9 
                                       f32_3 %234 = OpVectorShuffle %233 %233 1 1 1 
                              Uniform f32_4* %236 = OpAccessChain %23 %235 %26 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpFMul %234 %238 
                                       f32_4 %240 = OpLoad %47 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 6 3 
                                                      OpStore %47 %241 
                              Uniform f32_4* %242 = OpAccessChain %23 %235 %31 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_4 %245 = OpLoad %9 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 0 0 
                                       f32_3 %247 = OpFMul %244 %246 
                                       f32_4 %248 = OpLoad %47 
                                       f32_3 %249 = OpVectorShuffle %248 %248 0 1 2 
                                       f32_3 %250 = OpFAdd %247 %249 
                                       f32_4 %251 = OpLoad %47 
                                       f32_4 %252 = OpVectorShuffle %251 %250 4 5 6 3 
                                                      OpStore %47 %252 
                              Uniform f32_4* %253 = OpAccessChain %23 %235 %39 
                                       f32_4 %254 = OpLoad %253 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_4 %256 = OpLoad %9 
                                       f32_3 %257 = OpVectorShuffle %256 %256 2 2 2 
                                       f32_3 %258 = OpFMul %255 %257 
                                       f32_4 %259 = OpLoad %47 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFAdd %258 %260 
                                       f32_4 %262 = OpLoad %9 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 6 3 
                                                      OpStore %9 %263 
                              Uniform f32_4* %264 = OpAccessChain %23 %235 %49 
                                       f32_4 %265 = OpLoad %264 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 3 3 3 
                                       f32_3 %269 = OpFMul %266 %268 
                                       f32_4 %270 = OpLoad %9 
                                       f32_3 %271 = OpVectorShuffle %270 %270 0 1 2 
                                       f32_3 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %9 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 6 3 
                                                      OpStore %9 %274 
                                       f32_4 %276 = OpLoad %9 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                                      OpStore %275 %277 
                                                      OpStore %278 %228 
                                 Output f32* %280 = OpAccessChain %85 %31 %81 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFNegate %281 
                                 Output f32* %283 = OpAccessChain %85 %31 %81 
                                                      OpStore %283 %282 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 382
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %233 %326 %367 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 RelaxedPrecision 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 RelaxedPrecision 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 RelaxedPrecision 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %226 SpecId 226 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %307 DescriptorSet 307 
                                                      OpDecorate %307 Binding 307 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %326 Location 326 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %367 Location 367 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeStruct %7 %7 %38 %21 %21 %7 %6 %6 %7 %6 %7 %6 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4; f32; f32_4; f32;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 10 
                                              %44 = OpTypePointer Uniform %7 
                                 Private f32* %61 = OpVariable Private 
                                          u32 %62 = OpConstant 3 
                                          f32 %65 = OpConstant 3.67402E-40 
                                              %67 = OpTypeBool 
                                              %68 = OpTypePointer Private %67 
                                Private bool* %69 = OpVariable Private 
                                          f32 %71 = OpConstant 3.67402E-40 
                                          i32 %74 = OpConstant 0 
                                          i32 %75 = OpConstant 1 
                                          i32 %77 = OpConstant -1 
                               Private f32_3* %83 = OpVariable Private 
                                          i32 %86 = OpConstant 8 
                                          u32 %99 = OpConstant 1 
                                         u32 %105 = OpConstant 2 
                                         i32 %116 = OpConstant 9 
                                             %117 = OpTypePointer Uniform %6 
                                             %121 = OpTypePointer Function %6 
                                         f32 %126 = OpConstant 3.67402E-40 
                                         f32 %131 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %133 = OpConstant 3.67402E-40 
                                       f32_3 %134 = OpConstantComposite %131 %132 %133 
                                       f32_2 %147 = OpConstantComposite %126 %126 
                                Private f32* %152 = OpVariable Private 
                                         f32 %165 = OpConstant 3.67402E-40 
                              Private f32_3* %167 = OpVariable Private 
                                         i32 %177 = OpConstant 7 
                                         i32 %193 = OpConstant 6 
                                         i32 %200 = OpConstant 11 
                               Private bool* %206 = OpVariable Private 
                                        bool %220 = OpConstantFalse 
                                        bool %226 = OpSpecConstantFalse 
                                             %232 = OpTypePointer Input %21 
                                Input f32_3* %233 = OpVariable Input 
                                         i32 %236 = OpConstant 2 
                                         i32 %258 = OpConstant 3 
                                             %263 = OpTypePointer Function %21 
                                         i32 %273 = OpConstant 4 
                                             %274 = OpTypePointer Uniform %21 
                              Private f32_4* %279 = OpVariable Private 
                                Private f32* %286 = OpVariable Private 
                                         f32 %289 = OpConstant 3.67402E-40 
                                         f32 %291 = OpConstant 3.67402E-40 
                                         f32 %295 = OpConstant 3.67402E-40 
                                             %304 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %305 = OpTypeSampledImage %304 
                                             %306 = OpTypePointer UniformConstant %305 
 UniformConstant read_only Texture3DSampled* %307 = OpVariable UniformConstant 
                                Private f32* %318 = OpVariable Private 
                                Input f32_3* %326 = OpVariable Input 
                              Private f32_3* %331 = OpVariable Private 
                                         i32 %333 = OpConstant 5 
                              Private f32_3* %338 = OpVariable Private 
                              Private f32_4* %362 = OpVariable Private 
                                             %366 = OpTypePointer Output %7 
                               Output f32_4* %367 = OpVariable Output 
                                             %379 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %122 = OpVariable Function 
                             Function f32_3* %264 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %36 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFNegate %50 
                                        f32_3 %52 = OpFAdd %48 %51 
                                                      OpStore %34 %52 
                               Uniform f32_4* %53 = OpAccessChain %41 %43 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 3 3 3 
                                        f32_3 %56 = OpLoad %34 
                                        f32_3 %57 = OpFMul %55 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFAdd %57 %59 
                                                      OpStore %34 %60 
                                 Private f32* %63 = OpAccessChain %9 %62 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFAdd %64 %65 
                                                      OpStore %61 %66 
                                          f32 %70 = OpLoad %61 
                                         bool %72 = OpFOrdLessThan %70 %71 
                                                      OpStore %69 %72 
                                         bool %73 = OpLoad %69 
                                          i32 %76 = OpSelect %73 %75 %74 
                                          i32 %78 = OpIMul %76 %77 
                                         bool %79 = OpINotEqual %78 %74 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpKill
                                              %81 = OpLabel 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %87 = OpAccessChain %41 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %85 %90 
                                                      OpStore %83 %91 
                                        f32_3 %92 = OpLoad %83 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_3 %94 = OpLoad %83 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %93 %95 
                                        f32_3 %97 = OpLoad %83 
                                        f32_3 %98 = OpVectorShuffle %97 %96 3 4 2 
                                                      OpStore %83 %98 
                                Private f32* %100 = OpAccessChain %83 %99 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %83 %30 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                                      OpStore %61 %104 
                                Private f32* %106 = OpAccessChain %83 %105 
                                         f32 %107 = OpLoad %106 
                                Private f32* %108 = OpAccessChain %83 %105 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                         f32 %111 = OpLoad %61 
                                         f32 %112 = OpFAdd %110 %111 
                                                      OpStore %61 %112 
                                         f32 %113 = OpLoad %61 
                                         f32 %114 = OpExtInst %1 31 %113 
                                                      OpStore %61 %114 
                                         f32 %115 = OpLoad %61 
                                Uniform f32* %118 = OpAccessChain %41 %116 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdLessThan %115 %119 
                                                      OpStore %69 %120 
                                        bool %123 = OpLoad %69 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %127 
                                             %124 = OpLabel 
                                                      OpStore %122 %126 
                                                      OpBranch %125 
                                             %127 = OpLabel 
                                                      OpStore %122 %71 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                         f32 %128 = OpLoad %122 
                                                      OpStore %61 %128 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %135 = OpDot %130 %134 
                                Private f32* %136 = OpAccessChain %83 %30 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 2 
                                       f32_3 %139 = OpLoad %83 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 0 
                                       f32_2 %141 = OpFNegate %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_3 %143 = OpLoad %83 
                                       f32_3 %144 = OpVectorShuffle %143 %142 3 4 2 
                                                      OpStore %83 %144 
                                       f32_3 %145 = OpLoad %83 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %148 = OpFMul %146 %147 
                                       f32_2 %149 = OpFAdd %148 %147 
                                       f32_3 %150 = OpLoad %83 
                                       f32_3 %151 = OpVectorShuffle %150 %149 3 4 2 
                                                      OpStore %83 %151 
                                Private f32* %153 = OpAccessChain %83 %30 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                         f32 %156 = OpFMul %155 %131 
                                         f32 %157 = OpFAdd %156 %126 
                                                      OpStore %152 %157 
                                Private f32* %158 = OpAccessChain %83 %99 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFNegate %159 
                                         f32 %161 = OpFMul %160 %133 
                                         f32 %162 = OpLoad %152 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %152 %163 
                                         f32 %164 = OpLoad %152 
                                         f32 %166 = OpFMul %164 %165 
                                                      OpStore %152 %166 
                                       f32_3 %168 = OpLoad %83 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpExtInst %1 30 %169 
                                       f32_3 %171 = OpLoad %167 
                                       f32_3 %172 = OpVectorShuffle %171 %170 3 1 4 
                                                      OpStore %167 %172 
                                         f32 %173 = OpLoad %152 
                                         f32 %174 = OpExtInst %1 30 %173 
                                Private f32* %175 = OpAccessChain %167 %99 
                                                      OpStore %175 %174 
                                       f32_3 %176 = OpLoad %167 
                                Uniform f32* %178 = OpAccessChain %41 %177 
                                         f32 %179 = OpLoad %178 
                                Uniform f32* %180 = OpAccessChain %41 %177 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %182 = OpAccessChain %41 %177 
                                         f32 %183 = OpLoad %182 
                                       f32_3 %184 = OpCompositeConstruct %179 %181 %183 
                                         f32 %185 = OpCompositeExtract %184 0 
                                         f32 %186 = OpCompositeExtract %184 1 
                                         f32 %187 = OpCompositeExtract %184 2 
                                       f32_3 %188 = OpCompositeConstruct %185 %186 %187 
                                       f32_3 %189 = OpFMul %176 %188 
                                                      OpStore %83 %189 
                                       f32_3 %190 = OpLoad %83 
                                       f32_3 %191 = OpExtInst %1 29 %190 
                                                      OpStore %83 %191 
                                       f32_3 %192 = OpLoad %83 
                                Uniform f32* %194 = OpAccessChain %41 %193 
                                         f32 %195 = OpLoad %194 
                                       f32_3 %196 = OpCompositeConstruct %195 %195 %195 
                                       f32_3 %197 = OpFMul %192 %196 
                                                      OpStore %83 %197 
                                Private f32* %198 = OpAccessChain %9 %62 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %41 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFNegate %202 
                                         f32 %204 = OpFAdd %199 %203 
                                Private f32* %205 = OpAccessChain %20 %30 
                                                      OpStore %205 %204 
                                Private f32* %207 = OpAccessChain %20 %30 
                                         f32 %208 = OpLoad %207 
                                        bool %209 = OpFOrdLessThan %208 %71 
                                                      OpStore %206 %209 
                                        bool %210 = OpLoad %206 
                                         i32 %211 = OpSelect %210 %75 %74 
                                         i32 %212 = OpIMul %211 %77 
                                        bool %213 = OpINotEqual %212 %74 
                                                      OpSelectionMerge %215 None 
                                                      OpBranchConditional %213 %214 %215 
                                             %214 = OpLabel 
                                                      OpKill
                                             %215 = OpLabel 
                                Uniform f32* %217 = OpAccessChain %41 %75 %30 
                                         f32 %218 = OpLoad %217 
                                        bool %219 = OpFOrdEqual %218 %126 
                                                      OpStore %206 %219 
                                                      OpSelectionMerge %222 None 
                                                      OpBranchConditional %220 %221 %222 
                                             %221 = OpLabel 
                                        bool %223 = OpLoad %206 
                                                      OpSelectionMerge %225 None 
                                                      OpBranchConditional %223 %224 %225 
                                             %224 = OpLabel 
                                                      OpBranch %225 
                                             %225 = OpLabel 
                                                      OpBranch %222 
                                             %222 = OpLabel 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %313 
                                             %227 = OpLabel 
                                Uniform f32* %229 = OpAccessChain %41 %75 %99 
                                         f32 %230 = OpLoad %229 
                                        bool %231 = OpFOrdEqual %230 %126 
                                                      OpStore %206 %231 
                                       f32_3 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 1 1 1 
                              Uniform f32_4* %237 = OpAccessChain %41 %236 %75 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFMul %235 %239 
                                                      OpStore %167 %240 
                              Uniform f32_4* %241 = OpAccessChain %41 %236 %74 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %233 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_3 %247 = OpLoad %167 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %167 %248 
                              Uniform f32_4* %249 = OpAccessChain %41 %236 %236 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpLoad %233 
                                       f32_3 %253 = OpVectorShuffle %252 %252 2 2 2 
                                       f32_3 %254 = OpFMul %251 %253 
                                       f32_3 %255 = OpLoad %167 
                                       f32_3 %256 = OpFAdd %254 %255 
                                                      OpStore %167 %256 
                                       f32_3 %257 = OpLoad %167 
                              Uniform f32_4* %259 = OpAccessChain %41 %236 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFAdd %257 %261 
                                                      OpStore %167 %262 
                                        bool %265 = OpLoad %206 
                                                      OpSelectionMerge %267 None 
                                                      OpBranchConditional %265 %266 %269 
                                             %266 = OpLabel 
                                       f32_3 %268 = OpLoad %167 
                                                      OpStore %264 %268 
                                                      OpBranch %267 
                                             %269 = OpLabel 
                                       f32_3 %270 = OpLoad %233 
                                                      OpStore %264 %270 
                                                      OpBranch %267 
                                             %267 = OpLabel 
                                       f32_3 %271 = OpLoad %264 
                                                      OpStore %167 %271 
                                       f32_3 %272 = OpLoad %167 
                              Uniform f32_3* %275 = OpAccessChain %41 %273 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %272 %277 
                                                      OpStore %167 %278 
                                       f32_3 %280 = OpLoad %167 
                              Uniform f32_3* %281 = OpAccessChain %41 %258 
                                       f32_3 %282 = OpLoad %281 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %279 
                                       f32_4 %285 = OpVectorShuffle %284 %283 0 4 5 6 
                                                      OpStore %279 %285 
                                Private f32* %287 = OpAccessChain %279 %99 
                                         f32 %288 = OpLoad %287 
                                         f32 %290 = OpFMul %288 %289 
                                         f32 %292 = OpFAdd %290 %291 
                                                      OpStore %286 %292 
                                Uniform f32* %293 = OpAccessChain %41 %75 %105 
                                         f32 %294 = OpLoad %293 
                                         f32 %296 = OpFMul %294 %295 
                                         f32 %297 = OpFAdd %296 %291 
                                Private f32* %298 = OpAccessChain %167 %30 
                                                      OpStore %298 %297 
                                         f32 %299 = OpLoad %286 
                                Private f32* %300 = OpAccessChain %167 %30 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 40 %299 %301 
                                Private f32* %303 = OpAccessChain %279 %30 
                                                      OpStore %303 %302 
                  read_only Texture3DSampled %308 = OpLoad %307 
                                       f32_4 %309 = OpLoad %279 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 2 3 
                                       f32_4 %311 = OpImageSampleImplicitLod %308 %310 
                                                      OpStore %279 %311 
                                       f32_4 %312 = OpLoad %279 
                                                      OpStore %20 %312 
                                                      OpBranch %228 
                                             %313 = OpLabel 
                                Private f32* %314 = OpAccessChain %20 %30 
                                                      OpStore %314 %126 
                                Private f32* %315 = OpAccessChain %20 %99 
                                                      OpStore %315 %126 
                                Private f32* %316 = OpAccessChain %20 %105 
                                                      OpStore %316 %126 
                                Private f32* %317 = OpAccessChain %20 %62 
                                                      OpStore %317 %126 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_4 %319 = OpLoad %20 
                              Uniform f32_4* %320 = OpAccessChain %41 %74 
                                       f32_4 %321 = OpLoad %320 
                                         f32 %322 = OpDot %319 %321 
                                                      OpStore %318 %322 
                                         f32 %323 = OpLoad %318 
                                         f32 %324 = OpExtInst %1 43 %323 %71 %126 
                                                      OpStore %318 %324 
                                       f32_3 %325 = OpLoad %34 
                                       f32_3 %327 = OpLoad %326 
                                       f32_3 %328 = OpFMul %325 %327 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                                      OpStore %20 %330 
                                       f32_3 %332 = OpLoad %34 
                              Uniform f32_4* %334 = OpAccessChain %41 %333 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFMul %332 %336 
                                                      OpStore %331 %337 
                                         f32 %339 = OpLoad %318 
                                       f32_3 %340 = OpCompositeConstruct %339 %339 %339 
                                       f32_3 %341 = OpLoad %331 
                                       f32_3 %342 = OpFMul %340 %341 
                                                      OpStore %338 %342 
                                       f32_3 %343 = OpLoad %331 
                                       f32_3 %344 = OpFNegate %343 
                                         f32 %345 = OpLoad %318 
                                       f32_3 %346 = OpCompositeConstruct %345 %345 %345 
                                       f32_3 %347 = OpFMul %344 %346 
                              Uniform f32_4* %348 = OpAccessChain %41 %43 
                                       f32_4 %349 = OpLoad %348 
                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
                                       f32_3 %351 = OpFAdd %347 %350 
                                                      OpStore %34 %351 
                              Uniform f32_4* %352 = OpAccessChain %41 %43 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 3 3 3 
                                       f32_3 %355 = OpLoad %34 
                                       f32_3 %356 = OpFMul %354 %355 
                                       f32_3 %357 = OpLoad %338 
                                       f32_3 %358 = OpFAdd %356 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
                                                      OpStore %9 %360 
                                Private f32* %361 = OpAccessChain %20 %62 
                                                      OpStore %361 %71 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpLoad %20 
                                       f32_4 %365 = OpFAdd %363 %364 
                                                      OpStore %362 %365 
                                       f32_3 %368 = OpLoad %83 
                                         f32 %369 = OpLoad %61 
                                       f32_3 %370 = OpCompositeConstruct %369 %369 %369 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %362 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %367 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %367 %376 
                                Private f32* %377 = OpAccessChain %362 %62 
                                         f32 %378 = OpLoad %377 
                                 Output f32* %380 = OpAccessChain %367 %62 
                                                      OpStore %380 %378 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec3 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat1 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz + u_xlat2.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _EmissiveColor;
uniform 	float _EmissiveThresholdSensitivity;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
float u_xlat12;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
bool u_xlatb17;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = u_xlat1.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat16 = u_xlat0.w + -0.100000001;
    u_xlatb16 = u_xlat16<0.0;
    if((int(u_xlatb16) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = u_xlat0.xyz + (-_EmissiveColor.xyz);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat16 = u_xlat2.y + u_xlat2.x;
    u_xlat16 = u_xlat2.z * u_xlat2.z + u_xlat16;
    u_xlat16 = sqrt(u_xlat16);
    u_xlatb16 = u_xlat16<_EmissiveThresholdSensitivity;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat2.x = dot(u_xlat0.xyz, vec3(0.298900008, 0.586600006, 0.114500001));
    u_xlat2.xy = u_xlat0.xz + (-u_xlat2.xx);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat12 = (-u_xlat2.x) * 0.298900008 + 1.0;
    u_xlat12 = (-u_xlat2.y) * 0.114500001 + u_xlat12;
    u_xlat12 = u_xlat12 * 1.70473921;
    u_xlat3.xz = log2(u_xlat2.xy);
    u_xlat3.y = log2(u_xlat12);
    u_xlat2.xyz = u_xlat3.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlat17 = u_xlat0.w + (-_Cutoff);
    u_xlatb17 = u_xlat17<0.0;
    if((int(u_xlatb17) * int(0xffffffffu))!=0){discard;}
    u_xlatb17 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb17){
        u_xlatb17 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb17)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat17 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat17, u_xlat8);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat17 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat3.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat17) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat17) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(u_xlat16) + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 387
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %85 %97 %98 %112 %151 %154 %157 %377 %380 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 RelaxedPrecision 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 RelaxedPrecision 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 RelaxedPrecision 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 RelaxedPrecision 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 RelaxedPrecision 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpMemberDecorate %21 9 RelaxedPrecision 
                                                      OpMemberDecorate %21 9 Offset 21 
                                                      OpMemberDecorate %21 10 RelaxedPrecision 
                                                      OpMemberDecorate %21 10 Offset 21 
                                                      OpMemberDecorate %21 11 RelaxedPrecision 
                                                      OpMemberDecorate %21 11 Offset 21 
                                                      OpMemberDecorate %21 12 Offset 21 
                                                      OpMemberDecorate %21 13 Offset 21 
                                                      OpMemberDecorate %21 14 Offset 21 
                                                      OpMemberDecorate %21 15 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpMemberDecorate %83 0 BuiltIn 83 
                                                      OpMemberDecorate %83 1 BuiltIn 83 
                                                      OpMemberDecorate %83 2 BuiltIn 83 
                                                      OpDecorate %83 Block 
                                                      OpDecorate %97 Location 97 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %151 Location 151 
                                                      OpDecorate %154 Location 154 
                                                      OpDecorate %157 Location 157 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %377 Location 377 
                                                      OpDecorate %380 Location 380 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 8 
                                              %16 = OpTypeArray %7 %15 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeStruct %7 %7 %7 %7 %16 %7 %7 %7 %7 %7 %7 %7 %18 %19 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %23 = OpVariable Uniform 
                                              %24 = OpTypeInt 32 1 
                                          i32 %25 = OpConstant 12 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 0 
                                          i32 %39 = OpConstant 2 
                               Private f32_4* %47 = OpVariable Private 
                                          i32 %49 = OpConstant 3 
                               Private f32_4* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 14 
                                          u32 %81 = OpConstant 1 
                                              %82 = OpTypeArray %6 %81 
                                              %83 = OpTypeStruct %7 %6 %82 
                                              %84 = OpTypePointer Output %83 
         Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                              %93 = OpTypePointer Output %7 
                                              %95 = OpTypeVector %6 2 
                                              %96 = OpTypePointer Output %95 
                                Output f32_2* %97 = OpVariable Output 
                                 Input f32_4* %98 = OpVariable Input 
                                         i32 %101 = OpConstant 15 
                                             %110 = OpTypeVector %6 3 
                                             %111 = OpTypePointer Input %110 
                                Input f32_3* %112 = OpVariable Input 
                                         i32 %114 = OpConstant 13 
                                         u32 %119 = OpConstant 0 
                                             %120 = OpTypePointer Private %6 
                                         u32 %133 = OpConstant 2 
                                Private f32* %135 = OpVariable Private 
                                             %150 = OpTypePointer Output %110 
                               Output f32_3* %151 = OpVariable Output 
                               Output f32_3* %154 = OpVariable Output 
                               Output f32_4* %157 = OpVariable Output 
                                             %159 = OpTypePointer Private %110 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_4* %177 = OpVariable Private 
                              Private f32_3* %183 = OpVariable Private 
                                         i32 %184 = OpConstant 8 
                                         i32 %190 = OpConstant 9 
                                         i32 %196 = OpConstant 10 
                                         i32 %202 = OpConstant 11 
                                         f32 %211 = OpConstant 3.67402E-40 
                                         u32 %212 = OpConstant 3 
                                         i32 %214 = OpConstant 5 
                                         i32 %220 = OpConstant 6 
                                         i32 %226 = OpConstant 7 
                                         f32 %236 = OpConstant 3.67402E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                              Private f32_3* %239 = OpVariable Private 
                                         f32 %243 = OpConstant 3.67402E-40 
                                       f32_3 %244 = OpConstantComposite %243 %243 %243 
                                         f32 %249 = OpConstant 3.67402E-40 
                                       f32_3 %250 = OpConstantComposite %249 %249 %249 
                                         f32 %252 = OpConstant 3.67402E-40 
                                       f32_3 %253 = OpConstantComposite %252 %252 %252 
                              Private f32_4* %263 = OpVariable Private 
                              Private f32_4* %271 = OpVariable Private 
                                         f32 %307 = OpConstant 3.67402E-40 
                                       f32_4 %308 = OpConstantComposite %307 %307 %307 %307 
                                       f32_4 %316 = OpConstantComposite %211 %211 %211 %211 
                                       f32_4 %324 = OpConstantComposite %236 %236 %236 %236 
                                         i32 %331 = OpConstant 4 
                               Output f32_3* %377 = OpVariable Output 
                               Output f32_4* %380 = OpVariable Output 
                                             %381 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %23 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %32 = OpAccessChain %23 %25 %31 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpLoad %11 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %40 = OpAccessChain %23 %25 %39 
                                        f32_4 %41 = OpLoad %40 
                                        f32_4 %42 = OpLoad %11 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %41 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                                        f32_4 %48 = OpLoad %9 
                               Uniform f32_4* %50 = OpAccessChain %23 %25 %49 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpFAdd %48 %51 
                                                      OpStore %47 %52 
                               Uniform f32_4* %53 = OpAccessChain %23 %25 %49 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %11 
                                        f32_4 %56 = OpVectorShuffle %55 %55 3 3 3 3 
                                        f32_4 %57 = OpFMul %54 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpFAdd %57 %58 
                                                      OpStore %9 %59 
                                        f32_4 %61 = OpLoad %47 
                                        f32_4 %62 = OpVectorShuffle %61 %61 1 1 1 1 
                               Uniform f32_4* %64 = OpAccessChain %23 %63 %26 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpFMul %62 %65 
                                                      OpStore %60 %66 
                               Uniform f32_4* %67 = OpAccessChain %23 %63 %31 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %47 
                                        f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %60 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %60 %73 
                               Uniform f32_4* %74 = OpAccessChain %23 %63 %39 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %47 
                                        f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %60 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %60 %80 
                               Uniform f32_4* %86 = OpAccessChain %23 %63 %49 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %47 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %60 
                                        f32_4 %92 = OpFAdd %90 %91 
                                Output f32_4* %94 = OpAccessChain %85 %31 
                                                      OpStore %94 %92 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                              Uniform f32_4* %102 = OpAccessChain %23 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpFMul %100 %104 
                              Uniform f32_4* %106 = OpAccessChain %23 %101 
                                       f32_4 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                       f32_2 %109 = OpFAdd %105 %108 
                                                      OpStore %97 %109 
                                       f32_3 %113 = OpLoad %112 
                              Uniform f32_4* %115 = OpAccessChain %23 %114 %31 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                         f32 %118 = OpDot %113 %117 
                                Private f32* %121 = OpAccessChain %47 %119 
                                                      OpStore %121 %118 
                                       f32_3 %122 = OpLoad %112 
                              Uniform f32_4* %123 = OpAccessChain %23 %114 %26 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %127 = OpAccessChain %47 %81 
                                                      OpStore %127 %126 
                                       f32_3 %128 = OpLoad %112 
                              Uniform f32_4* %129 = OpAccessChain %23 %114 %39 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                         f32 %132 = OpDot %128 %131 
                                Private f32* %134 = OpAccessChain %47 %133 
                                                      OpStore %134 %132 
                                       f32_4 %136 = OpLoad %47 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_4 %138 = OpLoad %47 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                         f32 %140 = OpDot %137 %139 
                                                      OpStore %135 %140 
                                         f32 %141 = OpLoad %135 
                                         f32 %142 = OpExtInst %1 32 %141 
                                                      OpStore %135 %142 
                                         f32 %143 = OpLoad %135 
                                       f32_3 %144 = OpCompositeConstruct %143 %143 %143 
                                       f32_4 %145 = OpLoad %47 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFMul %144 %146 
                                       f32_4 %148 = OpLoad %47 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %47 %149 
                                       f32_4 %152 = OpLoad %47 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                                      OpStore %151 %153 
                                       f32_4 %155 = OpLoad %9 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                                      OpStore %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                                      OpStore %157 %158 
                                Private f32* %161 = OpAccessChain %47 %81 
                                         f32 %162 = OpLoad %161 
                                Private f32* %163 = OpAccessChain %47 %81 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFMul %162 %164 
                                Private f32* %166 = OpAccessChain %160 %119 
                                                      OpStore %166 %165 
                                Private f32* %167 = OpAccessChain %47 %119 
                                         f32 %168 = OpLoad %167 
                                Private f32* %169 = OpAccessChain %47 %119 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFMul %168 %170 
                                Private f32* %172 = OpAccessChain %160 %119 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                         f32 %175 = OpFAdd %171 %174 
                                Private f32* %176 = OpAccessChain %160 %119 
                                                      OpStore %176 %175 
                                       f32_4 %178 = OpLoad %47 
                                       f32_4 %179 = OpVectorShuffle %178 %178 1 2 2 0 
                                       f32_4 %180 = OpLoad %47 
                                       f32_4 %181 = OpVectorShuffle %180 %180 0 1 2 2 
                                       f32_4 %182 = OpFMul %179 %181 
                                                      OpStore %177 %182 
                              Uniform f32_4* %185 = OpAccessChain %23 %184 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %177 
                                         f32 %188 = OpDot %186 %187 
                                Private f32* %189 = OpAccessChain %183 %119 
                                                      OpStore %189 %188 
                              Uniform f32_4* %191 = OpAccessChain %23 %190 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpLoad %177 
                                         f32 %194 = OpDot %192 %193 
                                Private f32* %195 = OpAccessChain %183 %81 
                                                      OpStore %195 %194 
                              Uniform f32_4* %197 = OpAccessChain %23 %196 
                                       f32_4 %198 = OpLoad %197 
                                       f32_4 %199 = OpLoad %177 
                                         f32 %200 = OpDot %198 %199 
                                Private f32* %201 = OpAccessChain %183 %133 
                                                      OpStore %201 %200 
                              Uniform f32_4* %203 = OpAccessChain %23 %202 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 1 2 
                                       f32_3 %206 = OpLoad %160 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 0 0 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_3 %209 = OpLoad %183 
                                       f32_3 %210 = OpFAdd %208 %209 
                                                      OpStore %160 %210 
                                Private f32* %213 = OpAccessChain %47 %212 
                                                      OpStore %213 %211 
                              Uniform f32_4* %215 = OpAccessChain %23 %214 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpLoad %47 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %183 %119 
                                                      OpStore %219 %218 
                              Uniform f32_4* %221 = OpAccessChain %23 %220 
                                       f32_4 %222 = OpLoad %221 
                                       f32_4 %223 = OpLoad %47 
                                         f32 %224 = OpDot %222 %223 
                                Private f32* %225 = OpAccessChain %183 %81 
                                                      OpStore %225 %224 
                              Uniform f32_4* %227 = OpAccessChain %23 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_4 %229 = OpLoad %47 
                                         f32 %230 = OpDot %228 %229 
                                Private f32* %231 = OpAccessChain %183 %133 
                                                      OpStore %231 %230 
                                       f32_3 %232 = OpLoad %160 
                                       f32_3 %233 = OpLoad %183 
                                       f32_3 %234 = OpFAdd %232 %233 
                                                      OpStore %160 %234 
                                       f32_3 %235 = OpLoad %160 
                                       f32_3 %238 = OpExtInst %1 40 %235 %237 
                                                      OpStore %160 %238 
                                       f32_3 %240 = OpLoad %160 
                                       f32_3 %241 = OpExtInst %1 30 %240 
                                                      OpStore %239 %241 
                                       f32_3 %242 = OpLoad %239 
                                       f32_3 %245 = OpFMul %242 %244 
                                                      OpStore %239 %245 
                                       f32_3 %246 = OpLoad %239 
                                       f32_3 %247 = OpExtInst %1 29 %246 
                                                      OpStore %239 %247 
                                       f32_3 %248 = OpLoad %239 
                                       f32_3 %251 = OpFMul %248 %250 
                                       f32_3 %254 = OpFAdd %251 %253 
                                                      OpStore %239 %254 
                                       f32_3 %255 = OpLoad %239 
                                       f32_3 %256 = OpExtInst %1 40 %255 %237 
                                                      OpStore %239 %256 
                                       f32_4 %257 = OpLoad %9 
                                       f32_4 %258 = OpVectorShuffle %257 %257 1 1 1 1 
                                       f32_4 %259 = OpFNegate %258 
                              Uniform f32_4* %260 = OpAccessChain %23 %26 
                                       f32_4 %261 = OpLoad %260 
                                       f32_4 %262 = OpFAdd %259 %261 
                                                      OpStore %60 %262 
                                       f32_4 %264 = OpLoad %47 
                                       f32_4 %265 = OpVectorShuffle %264 %264 1 1 1 1 
                                       f32_4 %266 = OpLoad %60 
                                       f32_4 %267 = OpFMul %265 %266 
                                                      OpStore %263 %267 
                                       f32_4 %268 = OpLoad %60 
                                       f32_4 %269 = OpLoad %60 
                                       f32_4 %270 = OpFMul %268 %269 
                                                      OpStore %60 %270 
                                       f32_4 %272 = OpLoad %9 
                                       f32_4 %273 = OpVectorShuffle %272 %272 0 0 0 0 
                                       f32_4 %274 = OpFNegate %273 
                              Uniform f32_4* %275 = OpAccessChain %23 %31 
                                       f32_4 %276 = OpLoad %275 
                                       f32_4 %277 = OpFAdd %274 %276 
                                                      OpStore %271 %277 
                                       f32_4 %278 = OpLoad %9 
                                       f32_4 %279 = OpVectorShuffle %278 %278 2 2 2 2 
                                       f32_4 %280 = OpFNegate %279 
                              Uniform f32_4* %281 = OpAccessChain %23 %39 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFAdd %280 %282 
                                                      OpStore %9 %283 
                                       f32_4 %284 = OpLoad %271 
                                       f32_4 %285 = OpLoad %47 
                                       f32_4 %286 = OpVectorShuffle %285 %285 0 0 0 0 
                                       f32_4 %287 = OpFMul %284 %286 
                                       f32_4 %288 = OpLoad %263 
                                       f32_4 %289 = OpFAdd %287 %288 
                                                      OpStore %263 %289 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpLoad %47 
                                       f32_4 %292 = OpVectorShuffle %291 %291 2 2 2 2 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %263 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %47 %295 
                                       f32_4 %296 = OpLoad %271 
                                       f32_4 %297 = OpLoad %271 
                                       f32_4 %298 = OpFMul %296 %297 
                                       f32_4 %299 = OpLoad %60 
                                       f32_4 %300 = OpFAdd %298 %299 
                                                      OpStore %60 %300 
                                       f32_4 %301 = OpLoad %9 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpFMul %301 %302 
                                       f32_4 %304 = OpLoad %60 
                                       f32_4 %305 = OpFAdd %303 %304 
                                                      OpStore %9 %305 
                                       f32_4 %306 = OpLoad %9 
                                       f32_4 %309 = OpExtInst %1 40 %306 %308 
                                                      OpStore %9 %309 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpExtInst %1 32 %310 
                                                      OpStore %60 %311 
                                       f32_4 %312 = OpLoad %9 
                              Uniform f32_4* %313 = OpAccessChain %23 %49 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpFMul %312 %314 
                                       f32_4 %317 = OpFAdd %315 %316 
                                                      OpStore %9 %317 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpFDiv %316 %318 
                                                      OpStore %9 %319 
                                       f32_4 %320 = OpLoad %47 
                                       f32_4 %321 = OpLoad %60 
                                       f32_4 %322 = OpFMul %320 %321 
                                                      OpStore %47 %322 
                                       f32_4 %323 = OpLoad %47 
                                       f32_4 %325 = OpExtInst %1 40 %323 %324 
                                                      OpStore %47 %325 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpLoad %47 
                                       f32_4 %328 = OpFMul %326 %327 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %9 
                                       f32_3 %330 = OpVectorShuffle %329 %329 1 1 1 
                              Uniform f32_4* %332 = OpAccessChain %23 %331 %26 
                                       f32_4 %333 = OpLoad %332 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFMul %330 %334 
                                       f32_4 %336 = OpLoad %47 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %47 %337 
                              Uniform f32_4* %338 = OpAccessChain %23 %331 %31 
                                       f32_4 %339 = OpLoad %338 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 1 2 
                                       f32_4 %341 = OpLoad %9 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 0 0 
                                       f32_3 %343 = OpFMul %340 %342 
                                       f32_4 %344 = OpLoad %47 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                                       f32_3 %346 = OpFAdd %343 %345 
                                       f32_4 %347 = OpLoad %47 
                                       f32_4 %348 = OpVectorShuffle %347 %346 4 5 6 3 
                                                      OpStore %47 %348 
                              Uniform f32_4* %349 = OpAccessChain %23 %331 %39 
                                       f32_4 %350 = OpLoad %349 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 2 
                                       f32_4 %352 = OpLoad %9 
                                       f32_3 %353 = OpVectorShuffle %352 %352 2 2 2 
                                       f32_3 %354 = OpFMul %351 %353 
                                       f32_4 %355 = OpLoad %47 
                                       f32_3 %356 = OpVectorShuffle %355 %355 0 1 2 
                                       f32_3 %357 = OpFAdd %354 %356 
                                       f32_4 %358 = OpLoad %9 
                                       f32_4 %359 = OpVectorShuffle %358 %357 4 5 6 3 
                                                      OpStore %9 %359 
                              Uniform f32_4* %360 = OpAccessChain %23 %331 %49 
                                       f32_4 %361 = OpLoad %360 
                                       f32_3 %362 = OpVectorShuffle %361 %361 0 1 2 
                                       f32_4 %363 = OpLoad %9 
                                       f32_3 %364 = OpVectorShuffle %363 %363 3 3 3 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %9 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFAdd %365 %367 
                                       f32_4 %369 = OpLoad %9 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %9 %370 
                                       f32_4 %371 = OpLoad %9 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                       f32_3 %373 = OpLoad %239 
                                       f32_3 %374 = OpFAdd %372 %373 
                                       f32_4 %375 = OpLoad %9 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %9 %376 
                                       f32_4 %378 = OpLoad %9 
                                       f32_3 %379 = OpVectorShuffle %378 %378 0 1 2 
                                                      OpStore %377 %379 
                                                      OpStore %380 %324 
                                 Output f32* %382 = OpAccessChain %85 %31 %81 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                 Output f32* %385 = OpAccessChain %85 %31 %81 
                                                      OpStore %385 %384 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 382
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %233 %326 %367 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 RelaxedPrecision 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 RelaxedPrecision 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpMemberDecorate %39 8 Offset 39 
                                                      OpMemberDecorate %39 9 Offset 39 
                                                      OpMemberDecorate %39 10 Offset 39 
                                                      OpMemberDecorate %39 11 RelaxedPrecision 
                                                      OpMemberDecorate %39 11 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %226 SpecId 226 
                                                      OpDecorate %233 Location 233 
                                                      OpDecorate %307 DescriptorSet 307 
                                                      OpDecorate %307 Binding 307 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %326 Location 326 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %364 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %367 Location 367 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeStruct %7 %7 %38 %21 %21 %7 %6 %6 %7 %6 %7 %6 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32; f32_4; f32; f32_4; f32;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 10 
                                              %44 = OpTypePointer Uniform %7 
                                 Private f32* %61 = OpVariable Private 
                                          u32 %62 = OpConstant 3 
                                          f32 %65 = OpConstant 3.67402E-40 
                                              %67 = OpTypeBool 
                                              %68 = OpTypePointer Private %67 
                                Private bool* %69 = OpVariable Private 
                                          f32 %71 = OpConstant 3.67402E-40 
                                          i32 %74 = OpConstant 0 
                                          i32 %75 = OpConstant 1 
                                          i32 %77 = OpConstant -1 
                               Private f32_3* %83 = OpVariable Private 
                                          i32 %86 = OpConstant 8 
                                          u32 %99 = OpConstant 1 
                                         u32 %105 = OpConstant 2 
                                         i32 %116 = OpConstant 9 
                                             %117 = OpTypePointer Uniform %6 
                                             %121 = OpTypePointer Function %6 
                                         f32 %126 = OpConstant 3.67402E-40 
                                         f32 %131 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                         f32 %133 = OpConstant 3.67402E-40 
                                       f32_3 %134 = OpConstantComposite %131 %132 %133 
                                       f32_2 %147 = OpConstantComposite %126 %126 
                                Private f32* %152 = OpVariable Private 
                                         f32 %165 = OpConstant 3.67402E-40 
                              Private f32_3* %167 = OpVariable Private 
                                         i32 %177 = OpConstant 7 
                                         i32 %193 = OpConstant 6 
                                         i32 %200 = OpConstant 11 
                               Private bool* %206 = OpVariable Private 
                                        bool %220 = OpConstantFalse 
                                        bool %226 = OpSpecConstantFalse 
                                             %232 = OpTypePointer Input %21 
                                Input f32_3* %233 = OpVariable Input 
                                         i32 %236 = OpConstant 2 
                                         i32 %258 = OpConstant 3 
                                             %263 = OpTypePointer Function %21 
                                         i32 %273 = OpConstant 4 
                                             %274 = OpTypePointer Uniform %21 
                              Private f32_4* %279 = OpVariable Private 
                                Private f32* %286 = OpVariable Private 
                                         f32 %289 = OpConstant 3.67402E-40 
                                         f32 %291 = OpConstant 3.67402E-40 
                                         f32 %295 = OpConstant 3.67402E-40 
                                             %304 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %305 = OpTypeSampledImage %304 
                                             %306 = OpTypePointer UniformConstant %305 
 UniformConstant read_only Texture3DSampled* %307 = OpVariable UniformConstant 
                                Private f32* %318 = OpVariable Private 
                                Input f32_3* %326 = OpVariable Input 
                              Private f32_3* %331 = OpVariable Private 
                                         i32 %333 = OpConstant 5 
                              Private f32_3* %338 = OpVariable Private 
                              Private f32_4* %362 = OpVariable Private 
                                             %366 = OpTypePointer Output %7 
                               Output f32_4* %367 = OpVariable Output 
                                             %379 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %122 = OpVariable Function 
                             Function f32_3* %264 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %36 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFNegate %50 
                                        f32_3 %52 = OpFAdd %48 %51 
                                                      OpStore %34 %52 
                               Uniform f32_4* %53 = OpAccessChain %41 %43 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 3 3 3 
                                        f32_3 %56 = OpLoad %34 
                                        f32_3 %57 = OpFMul %55 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFAdd %57 %59 
                                                      OpStore %34 %60 
                                 Private f32* %63 = OpAccessChain %9 %62 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFAdd %64 %65 
                                                      OpStore %61 %66 
                                          f32 %70 = OpLoad %61 
                                         bool %72 = OpFOrdLessThan %70 %71 
                                                      OpStore %69 %72 
                                         bool %73 = OpLoad %69 
                                          i32 %76 = OpSelect %73 %75 %74 
                                          i32 %78 = OpIMul %76 %77 
                                         bool %79 = OpINotEqual %78 %74 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpKill
                                              %81 = OpLabel 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                               Uniform f32_4* %87 = OpAccessChain %41 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFNegate %89 
                                        f32_3 %91 = OpFAdd %85 %90 
                                                      OpStore %83 %91 
                                        f32_3 %92 = OpLoad %83 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_3 %94 = OpLoad %83 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %93 %95 
                                        f32_3 %97 = OpLoad %83 
                                        f32_3 %98 = OpVectorShuffle %97 %96 3 4 2 
                                                      OpStore %83 %98 
                                Private f32* %100 = OpAccessChain %83 %99 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %83 %30 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                                      OpStore %61 %104 
                                Private f32* %106 = OpAccessChain %83 %105 
                                         f32 %107 = OpLoad %106 
                                Private f32* %108 = OpAccessChain %83 %105 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %107 %109 
                                         f32 %111 = OpLoad %61 
                                         f32 %112 = OpFAdd %110 %111 
                                                      OpStore %61 %112 
                                         f32 %113 = OpLoad %61 
                                         f32 %114 = OpExtInst %1 31 %113 
                                                      OpStore %61 %114 
                                         f32 %115 = OpLoad %61 
                                Uniform f32* %118 = OpAccessChain %41 %116 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdLessThan %115 %119 
                                                      OpStore %69 %120 
                                        bool %123 = OpLoad %69 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %127 
                                             %124 = OpLabel 
                                                      OpStore %122 %126 
                                                      OpBranch %125 
                                             %127 = OpLabel 
                                                      OpStore %122 %71 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                         f32 %128 = OpLoad %122 
                                                      OpStore %61 %128 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                         f32 %135 = OpDot %130 %134 
                                Private f32* %136 = OpAccessChain %83 %30 
                                                      OpStore %136 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_2 %138 = OpVectorShuffle %137 %137 0 2 
                                       f32_3 %139 = OpLoad %83 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 0 
                                       f32_2 %141 = OpFNegate %140 
                                       f32_2 %142 = OpFAdd %138 %141 
                                       f32_3 %143 = OpLoad %83 
                                       f32_3 %144 = OpVectorShuffle %143 %142 3 4 2 
                                                      OpStore %83 %144 
                                       f32_3 %145 = OpLoad %83 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %148 = OpFMul %146 %147 
                                       f32_2 %149 = OpFAdd %148 %147 
                                       f32_3 %150 = OpLoad %83 
                                       f32_3 %151 = OpVectorShuffle %150 %149 3 4 2 
                                                      OpStore %83 %151 
                                Private f32* %153 = OpAccessChain %83 %30 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpFNegate %154 
                                         f32 %156 = OpFMul %155 %131 
                                         f32 %157 = OpFAdd %156 %126 
                                                      OpStore %152 %157 
                                Private f32* %158 = OpAccessChain %83 %99 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFNegate %159 
                                         f32 %161 = OpFMul %160 %133 
                                         f32 %162 = OpLoad %152 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %152 %163 
                                         f32 %164 = OpLoad %152 
                                         f32 %166 = OpFMul %164 %165 
                                                      OpStore %152 %166 
                                       f32_3 %168 = OpLoad %83 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpExtInst %1 30 %169 
                                       f32_3 %171 = OpLoad %167 
                                       f32_3 %172 = OpVectorShuffle %171 %170 3 1 4 
                                                      OpStore %167 %172 
                                         f32 %173 = OpLoad %152 
                                         f32 %174 = OpExtInst %1 30 %173 
                                Private f32* %175 = OpAccessChain %167 %99 
                                                      OpStore %175 %174 
                                       f32_3 %176 = OpLoad %167 
                                Uniform f32* %178 = OpAccessChain %41 %177 
                                         f32 %179 = OpLoad %178 
                                Uniform f32* %180 = OpAccessChain %41 %177 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %182 = OpAccessChain %41 %177 
                                         f32 %183 = OpLoad %182 
                                       f32_3 %184 = OpCompositeConstruct %179 %181 %183 
                                         f32 %185 = OpCompositeExtract %184 0 
                                         f32 %186 = OpCompositeExtract %184 1 
                                         f32 %187 = OpCompositeExtract %184 2 
                                       f32_3 %188 = OpCompositeConstruct %185 %186 %187 
                                       f32_3 %189 = OpFMul %176 %188 
                                                      OpStore %83 %189 
                                       f32_3 %190 = OpLoad %83 
                                       f32_3 %191 = OpExtInst %1 29 %190 
                                                      OpStore %83 %191 
                                       f32_3 %192 = OpLoad %83 
                                Uniform f32* %194 = OpAccessChain %41 %193 
                                         f32 %195 = OpLoad %194 
                                       f32_3 %196 = OpCompositeConstruct %195 %195 %195 
                                       f32_3 %197 = OpFMul %192 %196 
                                                      OpStore %83 %197 
                                Private f32* %198 = OpAccessChain %9 %62 
                                         f32 %199 = OpLoad %198 
                                Uniform f32* %201 = OpAccessChain %41 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFNegate %202 
                                         f32 %204 = OpFAdd %199 %203 
                                Private f32* %205 = OpAccessChain %20 %30 
                                                      OpStore %205 %204 
                                Private f32* %207 = OpAccessChain %20 %30 
                                         f32 %208 = OpLoad %207 
                                        bool %209 = OpFOrdLessThan %208 %71 
                                                      OpStore %206 %209 
                                        bool %210 = OpLoad %206 
                                         i32 %211 = OpSelect %210 %75 %74 
                                         i32 %212 = OpIMul %211 %77 
                                        bool %213 = OpINotEqual %212 %74 
                                                      OpSelectionMerge %215 None 
                                                      OpBranchConditional %213 %214 %215 
                                             %214 = OpLabel 
                                                      OpKill
                                             %215 = OpLabel 
                                Uniform f32* %217 = OpAccessChain %41 %75 %30 
                                         f32 %218 = OpLoad %217 
                                        bool %219 = OpFOrdEqual %218 %126 
                                                      OpStore %206 %219 
                                                      OpSelectionMerge %222 None 
                                                      OpBranchConditional %220 %221 %222 
                                             %221 = OpLabel 
                                        bool %223 = OpLoad %206 
                                                      OpSelectionMerge %225 None 
                                                      OpBranchConditional %223 %224 %225 
                                             %224 = OpLabel 
                                                      OpBranch %225 
                                             %225 = OpLabel 
                                                      OpBranch %222 
                                             %222 = OpLabel 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %313 
                                             %227 = OpLabel 
                                Uniform f32* %229 = OpAccessChain %41 %75 %99 
                                         f32 %230 = OpLoad %229 
                                        bool %231 = OpFOrdEqual %230 %126 
                                                      OpStore %206 %231 
                                       f32_3 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 1 1 1 
                              Uniform f32_4* %237 = OpAccessChain %41 %236 %75 
                                       f32_4 %238 = OpLoad %237 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                       f32_3 %240 = OpFMul %235 %239 
                                                      OpStore %167 %240 
                              Uniform f32_4* %241 = OpAccessChain %41 %236 %74 
                                       f32_4 %242 = OpLoad %241 
                                       f32_3 %243 = OpVectorShuffle %242 %242 0 1 2 
                                       f32_3 %244 = OpLoad %233 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %243 %245 
                                       f32_3 %247 = OpLoad %167 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %167 %248 
                              Uniform f32_4* %249 = OpAccessChain %41 %236 %236 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                                       f32_3 %252 = OpLoad %233 
                                       f32_3 %253 = OpVectorShuffle %252 %252 2 2 2 
                                       f32_3 %254 = OpFMul %251 %253 
                                       f32_3 %255 = OpLoad %167 
                                       f32_3 %256 = OpFAdd %254 %255 
                                                      OpStore %167 %256 
                                       f32_3 %257 = OpLoad %167 
                              Uniform f32_4* %259 = OpAccessChain %41 %236 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                       f32_3 %262 = OpFAdd %257 %261 
                                                      OpStore %167 %262 
                                        bool %265 = OpLoad %206 
                                                      OpSelectionMerge %267 None 
                                                      OpBranchConditional %265 %266 %269 
                                             %266 = OpLabel 
                                       f32_3 %268 = OpLoad %167 
                                                      OpStore %264 %268 
                                                      OpBranch %267 
                                             %269 = OpLabel 
                                       f32_3 %270 = OpLoad %233 
                                                      OpStore %264 %270 
                                                      OpBranch %267 
                                             %267 = OpLabel 
                                       f32_3 %271 = OpLoad %264 
                                                      OpStore %167 %271 
                                       f32_3 %272 = OpLoad %167 
                              Uniform f32_3* %275 = OpAccessChain %41 %273 
                                       f32_3 %276 = OpLoad %275 
                                       f32_3 %277 = OpFNegate %276 
                                       f32_3 %278 = OpFAdd %272 %277 
                                                      OpStore %167 %278 
                                       f32_3 %280 = OpLoad %167 
                              Uniform f32_3* %281 = OpAccessChain %41 %258 
                                       f32_3 %282 = OpLoad %281 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_4 %284 = OpLoad %279 
                                       f32_4 %285 = OpVectorShuffle %284 %283 0 4 5 6 
                                                      OpStore %279 %285 
                                Private f32* %287 = OpAccessChain %279 %99 
                                         f32 %288 = OpLoad %287 
                                         f32 %290 = OpFMul %288 %289 
                                         f32 %292 = OpFAdd %290 %291 
                                                      OpStore %286 %292 
                                Uniform f32* %293 = OpAccessChain %41 %75 %105 
                                         f32 %294 = OpLoad %293 
                                         f32 %296 = OpFMul %294 %295 
                                         f32 %297 = OpFAdd %296 %291 
                                Private f32* %298 = OpAccessChain %167 %30 
                                                      OpStore %298 %297 
                                         f32 %299 = OpLoad %286 
                                Private f32* %300 = OpAccessChain %167 %30 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpExtInst %1 40 %299 %301 
                                Private f32* %303 = OpAccessChain %279 %30 
                                                      OpStore %303 %302 
                  read_only Texture3DSampled %308 = OpLoad %307 
                                       f32_4 %309 = OpLoad %279 
                                       f32_3 %310 = OpVectorShuffle %309 %309 0 2 3 
                                       f32_4 %311 = OpImageSampleImplicitLod %308 %310 
                                                      OpStore %279 %311 
                                       f32_4 %312 = OpLoad %279 
                                                      OpStore %20 %312 
                                                      OpBranch %228 
                                             %313 = OpLabel 
                                Private f32* %314 = OpAccessChain %20 %30 
                                                      OpStore %314 %126 
                                Private f32* %315 = OpAccessChain %20 %99 
                                                      OpStore %315 %126 
                                Private f32* %316 = OpAccessChain %20 %105 
                                                      OpStore %316 %126 
                                Private f32* %317 = OpAccessChain %20 %62 
                                                      OpStore %317 %126 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_4 %319 = OpLoad %20 
                              Uniform f32_4* %320 = OpAccessChain %41 %74 
                                       f32_4 %321 = OpLoad %320 
                                         f32 %322 = OpDot %319 %321 
                                                      OpStore %318 %322 
                                         f32 %323 = OpLoad %318 
                                         f32 %324 = OpExtInst %1 43 %323 %71 %126 
                                                      OpStore %318 %324 
                                       f32_3 %325 = OpLoad %34 
                                       f32_3 %327 = OpLoad %326 
                                       f32_3 %328 = OpFMul %325 %327 
                                       f32_4 %329 = OpLoad %20 
                                       f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                                      OpStore %20 %330 
                                       f32_3 %332 = OpLoad %34 
                              Uniform f32_4* %334 = OpAccessChain %41 %333 
                                       f32_4 %335 = OpLoad %334 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFMul %332 %336 
                                                      OpStore %331 %337 
                                         f32 %339 = OpLoad %318 
                                       f32_3 %340 = OpCompositeConstruct %339 %339 %339 
                                       f32_3 %341 = OpLoad %331 
                                       f32_3 %342 = OpFMul %340 %341 
                                                      OpStore %338 %342 
                                       f32_3 %343 = OpLoad %331 
                                       f32_3 %344 = OpFNegate %343 
                                         f32 %345 = OpLoad %318 
                                       f32_3 %346 = OpCompositeConstruct %345 %345 %345 
                                       f32_3 %347 = OpFMul %344 %346 
                              Uniform f32_4* %348 = OpAccessChain %41 %43 
                                       f32_4 %349 = OpLoad %348 
                                       f32_3 %350 = OpVectorShuffle %349 %349 0 1 2 
                                       f32_3 %351 = OpFAdd %347 %350 
                                                      OpStore %34 %351 
                              Uniform f32_4* %352 = OpAccessChain %41 %43 
                                       f32_4 %353 = OpLoad %352 
                                       f32_3 %354 = OpVectorShuffle %353 %353 3 3 3 
                                       f32_3 %355 = OpLoad %34 
                                       f32_3 %356 = OpFMul %354 %355 
                                       f32_3 %357 = OpLoad %338 
                                       f32_3 %358 = OpFAdd %356 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_4 %360 = OpVectorShuffle %359 %358 4 5 6 3 
                                                      OpStore %9 %360 
                                Private f32* %361 = OpAccessChain %20 %62 
                                                      OpStore %361 %71 
                                       f32_4 %363 = OpLoad %9 
                                       f32_4 %364 = OpLoad %20 
                                       f32_4 %365 = OpFAdd %363 %364 
                                                      OpStore %362 %365 
                                       f32_3 %368 = OpLoad %83 
                                         f32 %369 = OpLoad %61 
                                       f32_3 %370 = OpCompositeConstruct %369 %369 %369 
                                       f32_3 %371 = OpFMul %368 %370 
                                       f32_4 %372 = OpLoad %362 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_3 %374 = OpFAdd %371 %373 
                                       f32_4 %375 = OpLoad %367 
                                       f32_4 %376 = OpVectorShuffle %375 %374 4 5 6 3 
                                                      OpStore %367 %376 
                                Private f32* %377 = OpAccessChain %362 %62 
                                         f32 %378 = OpLoad %377 
                                 Output f32* %380 = OpAccessChain %367 %62 
                                                      OpStore %380 %378 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" }
  Blend One One, One One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 113445
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
float u_xlat5;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = vec3(u_xlat16_1) * _OverrideColor.xyz + (-u_xlat10_0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb10 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb10){
        u_xlatb10 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb10)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat10 = u_xlat2.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat5);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat10 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat1.x = u_xlat10 * u_xlat10_2.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 291
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %105 %288 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 RelaxedPrecision 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate %146 SpecId 146 
                                                      OpDecorate %224 DescriptorSet 224 
                                                      OpDecorate %224 Binding 224 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %288 Location 288 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeArray %7 %37 
                                              %40 = OpTypeStruct %7 %7 %38 %21 %21 %7 %39 %7 %6 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 7 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %62 = OpVariable Private 
                                          u32 %63 = OpConstant 3 
                                          f32 %66 = OpConstant 3.67402E-40 
                                              %68 = OpTypeBool 
                                              %69 = OpTypePointer Private %68 
                                Private bool* %70 = OpVariable Private 
                                          f32 %72 = OpConstant 3.67402E-40 
                                          i32 %75 = OpConstant 0 
                                          i32 %76 = OpConstant 1 
                                          i32 %78 = OpConstant -1 
                                          i32 %86 = OpConstant 8 
                                              %87 = OpTypePointer Uniform %6 
                              Private f32_3* %103 = OpVariable Private 
                                             %104 = OpTypePointer Input %21 
                                Input f32_3* %105 = OpVariable Input 
                                         i32 %108 = OpConstant 6 
                                         i32 %121 = OpConstant 2 
                                         i32 %131 = OpConstant 3 
                                         f32 %138 = OpConstant 3.67402E-40 
                                        bool %140 = OpConstantFalse 
                                        bool %146 = OpSpecConstantFalse 
                                         u32 %149 = OpConstant 1 
                              Private f32_3* %153 = OpVariable Private 
                                             %181 = OpTypePointer Function %21 
                                         i32 %191 = OpConstant 4 
                                             %192 = OpTypePointer Uniform %21 
                              Private f32_4* %197 = OpVariable Private 
                                         f32 %206 = OpConstant 3.67402E-40 
                                         f32 %208 = OpConstant 3.67402E-40 
                                Private f32* %210 = OpVariable Private 
                                         u32 %211 = OpConstant 2 
                                         f32 %214 = OpConstant 3.67402E-40 
                                             %221 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %222 = OpTypeSampledImage %221 
                                             %223 = OpTypePointer UniformConstant %222 
 UniformConstant read_only Texture3DSampled* %224 = OpVariable UniformConstant 
                              Private f32_3* %235 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                         i32 %259 = OpConstant 5 
                              Private f32_3* %264 = OpVariable Private 
                                             %287 = OpTypePointer Output %7 
                               Output f32_4* %288 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %182 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFAdd %49 %52 
                                                      OpStore %34 %53 
                               Uniform f32_4* %54 = OpAccessChain %42 %44 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_3 %57 = OpLoad %34 
                                        f32_3 %58 = OpFMul %56 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %34 %61 
                                 Private f32* %64 = OpAccessChain %9 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %67 = OpFAdd %65 %66 
                                                      OpStore %62 %67 
                                          f32 %71 = OpLoad %62 
                                         bool %73 = OpFOrdLessThan %71 %72 
                                                      OpStore %70 %73 
                                         bool %74 = OpLoad %70 
                                          i32 %77 = OpSelect %74 %76 %75 
                                          i32 %79 = OpIMul %77 %78 
                                         bool %80 = OpINotEqual %79 %75 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpKill
                                              %82 = OpLabel 
                                 Private f32* %84 = OpAccessChain %9 %63 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %88 = OpAccessChain %42 %86 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %85 %90 
                                 Private f32* %92 = OpAccessChain %20 %30 
                                                      OpStore %92 %91 
                                 Private f32* %93 = OpAccessChain %20 %30 
                                          f32 %94 = OpLoad %93 
                                         bool %95 = OpFOrdLessThan %94 %72 
                                                      OpStore %70 %95 
                                         bool %96 = OpLoad %70 
                                          i32 %97 = OpSelect %96 %76 %75 
                                          i32 %98 = OpIMul %97 %78 
                                         bool %99 = OpINotEqual %98 %75 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                                      OpKill
                                             %101 = OpLabel 
                                       f32_3 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %109 = OpAccessChain %42 %108 %76 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_3 %112 = OpFMul %107 %111 
                                                      OpStore %103 %112 
                              Uniform f32_4* %113 = OpAccessChain %42 %108 %75 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpLoad %105 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 0 0 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_3 %119 = OpLoad %103 
                                       f32_3 %120 = OpFAdd %118 %119 
                                                      OpStore %103 %120 
                              Uniform f32_4* %122 = OpAccessChain %42 %108 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpLoad %105 
                                       f32_3 %126 = OpVectorShuffle %125 %125 2 2 2 
                                       f32_3 %127 = OpFMul %124 %126 
                                       f32_3 %128 = OpLoad %103 
                                       f32_3 %129 = OpFAdd %127 %128 
                                                      OpStore %103 %129 
                                       f32_3 %130 = OpLoad %103 
                              Uniform f32_4* %132 = OpAccessChain %42 %108 %131 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFAdd %130 %134 
                                                      OpStore %103 %135 
                                Uniform f32* %136 = OpAccessChain %42 %76 %30 
                                         f32 %137 = OpLoad %136 
                                        bool %139 = OpFOrdEqual %137 %138 
                                                      OpStore %70 %139 
                                                      OpSelectionMerge %142 None 
                                                      OpBranchConditional %140 %141 %142 
                                             %141 = OpLabel 
                                        bool %143 = OpLoad %70 
                                                      OpSelectionMerge %145 None 
                                                      OpBranchConditional %143 %144 %145 
                                             %144 = OpLabel 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                                      OpBranch %142 
                                             %142 = OpLabel 
                                                      OpSelectionMerge %148 None 
                                                      OpBranchConditional %146 %147 %230 
                                             %147 = OpLabel 
                                Uniform f32* %150 = OpAccessChain %42 %76 %149 
                                         f32 %151 = OpLoad %150 
                                        bool %152 = OpFOrdEqual %151 %138 
                                                      OpStore %70 %152 
                                       f32_3 %154 = OpLoad %105 
                                       f32_3 %155 = OpVectorShuffle %154 %154 1 1 1 
                              Uniform f32_4* %156 = OpAccessChain %42 %121 %76 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpFMul %155 %158 
                                                      OpStore %153 %159 
                              Uniform f32_4* %160 = OpAccessChain %42 %121 %75 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpLoad %105 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 0 0 
                                       f32_3 %165 = OpFMul %162 %164 
                                       f32_3 %166 = OpLoad %153 
                                       f32_3 %167 = OpFAdd %165 %166 
                                                      OpStore %153 %167 
                              Uniform f32_4* %168 = OpAccessChain %42 %121 %121 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpLoad %105 
                                       f32_3 %172 = OpVectorShuffle %171 %171 2 2 2 
                                       f32_3 %173 = OpFMul %170 %172 
                                       f32_3 %174 = OpLoad %153 
                                       f32_3 %175 = OpFAdd %173 %174 
                                                      OpStore %153 %175 
                                       f32_3 %176 = OpLoad %153 
                              Uniform f32_4* %177 = OpAccessChain %42 %121 %131 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpFAdd %176 %179 
                                                      OpStore %153 %180 
                                        bool %183 = OpLoad %70 
                                                      OpSelectionMerge %185 None 
                                                      OpBranchConditional %183 %184 %187 
                                             %184 = OpLabel 
                                       f32_3 %186 = OpLoad %153 
                                                      OpStore %182 %186 
                                                      OpBranch %185 
                                             %187 = OpLabel 
                                       f32_3 %188 = OpLoad %105 
                                                      OpStore %182 %188 
                                                      OpBranch %185 
                                             %185 = OpLabel 
                                       f32_3 %189 = OpLoad %182 
                                                      OpStore %153 %189 
                                       f32_3 %190 = OpLoad %153 
                              Uniform f32_3* %193 = OpAccessChain %42 %191 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFNegate %194 
                                       f32_3 %196 = OpFAdd %190 %195 
                                                      OpStore %153 %196 
                                       f32_3 %198 = OpLoad %153 
                              Uniform f32_3* %199 = OpAccessChain %42 %131 
                                       f32_3 %200 = OpLoad %199 
                                       f32_3 %201 = OpFMul %198 %200 
                                       f32_4 %202 = OpLoad %197 
                                       f32_4 %203 = OpVectorShuffle %202 %201 0 4 5 6 
                                                      OpStore %197 %203 
                                Private f32* %204 = OpAccessChain %197 %149 
                                         f32 %205 = OpLoad %204 
                                         f32 %207 = OpFMul %205 %206 
                                         f32 %209 = OpFAdd %207 %208 
                                                      OpStore %62 %209 
                                Uniform f32* %212 = OpAccessChain %42 %76 %211 
                                         f32 %213 = OpLoad %212 
                                         f32 %215 = OpFMul %213 %214 
                                         f32 %216 = OpFAdd %215 %208 
                                                      OpStore %210 %216 
                                         f32 %217 = OpLoad %62 
                                         f32 %218 = OpLoad %210 
                                         f32 %219 = OpExtInst %1 40 %217 %218 
                                Private f32* %220 = OpAccessChain %197 %30 
                                                      OpStore %220 %219 
                  read_only Texture3DSampled %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %197 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 2 3 
                                       f32_4 %228 = OpImageSampleImplicitLod %225 %227 
                                                      OpStore %197 %228 
                                       f32_4 %229 = OpLoad %197 
                                                      OpStore %20 %229 
                                                      OpBranch %148 
                                             %230 = OpLabel 
                                Private f32* %231 = OpAccessChain %20 %30 
                                                      OpStore %231 %138 
                                Private f32* %232 = OpAccessChain %20 %149 
                                                      OpStore %232 %138 
                                Private f32* %233 = OpAccessChain %20 %211 
                                                      OpStore %233 %138 
                                Private f32* %234 = OpAccessChain %20 %63 
                                                      OpStore %234 %138 
                                                      OpBranch %148 
                                             %148 = OpLabel 
                                       f32_4 %236 = OpLoad %20 
                              Uniform f32_4* %237 = OpAccessChain %42 %75 
                                       f32_4 %238 = OpLoad %237 
                                         f32 %239 = OpDot %236 %238 
                                Private f32* %240 = OpAccessChain %235 %30 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %235 %30 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpExtInst %1 43 %242 %72 %138 
                                Private f32* %244 = OpAccessChain %235 %30 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %103 
                                       f32_3 %246 = OpLoad %103 
                                         f32 %247 = OpDot %245 %246 
                                                      OpStore %62 %247 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                         f32 %250 = OpLoad %62 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                                      OpStore %62 %253 
                                Private f32* %254 = OpAccessChain %235 %30 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpLoad %62 
                                         f32 %257 = OpFMul %255 %256 
                                                      OpStore %62 %257 
                                       f32_3 %258 = OpLoad %34 
                              Uniform f32_4* %260 = OpAccessChain %42 %259 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFMul %258 %262 
                                                      OpStore %235 %263 
                                         f32 %265 = OpLoad %62 
                                       f32_3 %266 = OpCompositeConstruct %265 %265 %265 
                                       f32_3 %267 = OpLoad %235 
                                       f32_3 %268 = OpFMul %266 %267 
                                                      OpStore %264 %268 
                                       f32_3 %269 = OpLoad %235 
                                       f32_3 %270 = OpFNegate %269 
                                         f32 %271 = OpLoad %62 
                                       f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                                       f32_3 %273 = OpFMul %270 %272 
                              Uniform f32_4* %274 = OpAccessChain %42 %44 
                                       f32_4 %275 = OpLoad %274 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_3 %277 = OpFAdd %273 %276 
                                                      OpStore %34 %277 
                              Uniform f32_4* %278 = OpAccessChain %42 %44 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 3 3 3 
                                       f32_3 %281 = OpLoad %34 
                                       f32_3 %282 = OpFMul %280 %281 
                                       f32_3 %283 = OpLoad %264 
                                       f32_3 %284 = OpFAdd %282 %283 
                                       f32_4 %285 = OpLoad %9 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %9 %286 
                                       f32_4 %289 = OpLoad %9 
                                                      OpStore %288 %289 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
float u_xlat2;
vec3 u_xlat4;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = vec3(u_xlat16_1) * _OverrideColor.xyz + (-u_xlat10_0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb1 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb1)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat4.x = u_xlat1.y * 0.25 + 0.75;
        u_xlat2 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat4.x, u_xlat2);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat1.x = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 247
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %121 %244 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %39 0 RelaxedPrecision 
                                                      OpMemberDecorate %39 0 Offset 39 
                                                      OpMemberDecorate %39 1 Offset 39 
                                                      OpMemberDecorate %39 2 Offset 39 
                                                      OpMemberDecorate %39 3 Offset 39 
                                                      OpMemberDecorate %39 4 Offset 39 
                                                      OpMemberDecorate %39 5 RelaxedPrecision 
                                                      OpMemberDecorate %39 5 Offset 39 
                                                      OpMemberDecorate %39 6 Offset 39 
                                                      OpMemberDecorate %39 7 RelaxedPrecision 
                                                      OpMemberDecorate %39 7 Offset 39 
                                                      OpDecorate %39 Block 
                                                      OpDecorate %41 DescriptorSet 41 
                                                      OpDecorate %41 Binding 41 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %112 SpecId 112 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %244 Location 244 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeStruct %7 %7 %38 %21 %21 %7 %7 %6 
                                              %40 = OpTypePointer Uniform %39 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32;}* %41 = OpVariable Uniform 
                                              %42 = OpTypeInt 32 1 
                                          i32 %43 = OpConstant 6 
                                              %44 = OpTypePointer Uniform %7 
                                 Private f32* %61 = OpVariable Private 
                                          u32 %62 = OpConstant 3 
                                          f32 %65 = OpConstant 3.67402E-40 
                                              %67 = OpTypeBool 
                                              %68 = OpTypePointer Private %67 
                                Private bool* %69 = OpVariable Private 
                                          f32 %71 = OpConstant 3.67402E-40 
                                          i32 %74 = OpConstant 0 
                                          i32 %75 = OpConstant 1 
                                          i32 %77 = OpConstant -1 
                                          i32 %85 = OpConstant 7 
                                              %86 = OpTypePointer Uniform %6 
                                         f32 %104 = OpConstant 3.67402E-40 
                                        bool %106 = OpConstantFalse 
                                        bool %112 = OpSpecConstantFalse 
                                         u32 %115 = OpConstant 1 
                              Private f32_3* %119 = OpVariable Private 
                                             %120 = OpTypePointer Input %21 
                                Input f32_3* %121 = OpVariable Input 
                                         i32 %124 = OpConstant 2 
                                         i32 %146 = OpConstant 3 
                                             %151 = OpTypePointer Function %21 
                                         i32 %161 = OpConstant 4 
                                             %162 = OpTypePointer Uniform %21 
                              Private f32_4* %167 = OpVariable Private 
                                         f32 %176 = OpConstant 3.67402E-40 
                                         f32 %178 = OpConstant 3.67402E-40 
                                         u32 %180 = OpConstant 2 
                                         f32 %183 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                                Private f32* %206 = OpVariable Private 
                              Private f32_3* %213 = OpVariable Private 
                                         i32 %215 = OpConstant 5 
                              Private f32_3* %220 = OpVariable Private 
                                             %243 = OpTypePointer Output %7 
                               Output f32_4* %244 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %152 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %45 = OpAccessChain %41 %43 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFMul %36 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFNegate %50 
                                        f32_3 %52 = OpFAdd %48 %51 
                                                      OpStore %34 %52 
                               Uniform f32_4* %53 = OpAccessChain %41 %43 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 3 3 3 
                                        f32_3 %56 = OpLoad %34 
                                        f32_3 %57 = OpFMul %55 %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 0 1 2 
                                        f32_3 %60 = OpFAdd %57 %59 
                                                      OpStore %34 %60 
                                 Private f32* %63 = OpAccessChain %9 %62 
                                          f32 %64 = OpLoad %63 
                                          f32 %66 = OpFAdd %64 %65 
                                                      OpStore %61 %66 
                                          f32 %70 = OpLoad %61 
                                         bool %72 = OpFOrdLessThan %70 %71 
                                                      OpStore %69 %72 
                                         bool %73 = OpLoad %69 
                                          i32 %76 = OpSelect %73 %75 %74 
                                          i32 %78 = OpIMul %76 %77 
                                         bool %79 = OpINotEqual %78 %74 
                                                      OpSelectionMerge %81 None 
                                                      OpBranchConditional %79 %80 %81 
                                              %80 = OpLabel 
                                                      OpKill
                                              %81 = OpLabel 
                                 Private f32* %83 = OpAccessChain %9 %62 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %87 = OpAccessChain %41 %85 
                                          f32 %88 = OpLoad %87 
                                          f32 %89 = OpFNegate %88 
                                          f32 %90 = OpFAdd %84 %89 
                                 Private f32* %91 = OpAccessChain %20 %30 
                                                      OpStore %91 %90 
                                 Private f32* %92 = OpAccessChain %20 %30 
                                          f32 %93 = OpLoad %92 
                                         bool %94 = OpFOrdLessThan %93 %71 
                                                      OpStore %69 %94 
                                         bool %95 = OpLoad %69 
                                          i32 %96 = OpSelect %95 %75 %74 
                                          i32 %97 = OpIMul %96 %77 
                                         bool %98 = OpINotEqual %97 %74 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %100 
                                              %99 = OpLabel 
                                                      OpKill
                                             %100 = OpLabel 
                                Uniform f32* %102 = OpAccessChain %41 %75 %30 
                                         f32 %103 = OpLoad %102 
                                        bool %105 = OpFOrdEqual %103 %104 
                                                      OpStore %69 %105 
                                                      OpSelectionMerge %108 None 
                                                      OpBranchConditional %106 %107 %108 
                                             %107 = OpLabel 
                                        bool %109 = OpLoad %69 
                                                      OpSelectionMerge %111 None 
                                                      OpBranchConditional %109 %110 %111 
                                             %110 = OpLabel 
                                                      OpBranch %111 
                                             %111 = OpLabel 
                                                      OpBranch %108 
                                             %108 = OpLabel 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %201 
                                             %113 = OpLabel 
                                Uniform f32* %116 = OpAccessChain %41 %75 %115 
                                         f32 %117 = OpLoad %116 
                                        bool %118 = OpFOrdEqual %117 %104 
                                                      OpStore %69 %118 
                                       f32_3 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 1 1 1 
                              Uniform f32_4* %125 = OpAccessChain %41 %124 %75 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFMul %123 %127 
                                                      OpStore %119 %128 
                              Uniform f32_4* %129 = OpAccessChain %41 %124 %74 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpLoad %121 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 0 0 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_3 %135 = OpLoad %119 
                                       f32_3 %136 = OpFAdd %134 %135 
                                                      OpStore %119 %136 
                              Uniform f32_4* %137 = OpAccessChain %41 %124 %124 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpLoad %121 
                                       f32_3 %141 = OpVectorShuffle %140 %140 2 2 2 
                                       f32_3 %142 = OpFMul %139 %141 
                                       f32_3 %143 = OpLoad %119 
                                       f32_3 %144 = OpFAdd %142 %143 
                                                      OpStore %119 %144 
                                       f32_3 %145 = OpLoad %119 
                              Uniform f32_4* %147 = OpAccessChain %41 %124 %146 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                       f32_3 %150 = OpFAdd %145 %149 
                                                      OpStore %119 %150 
                                        bool %153 = OpLoad %69 
                                                      OpSelectionMerge %155 None 
                                                      OpBranchConditional %153 %154 %157 
                                             %154 = OpLabel 
                                       f32_3 %156 = OpLoad %119 
                                                      OpStore %152 %156 
                                                      OpBranch %155 
                                             %157 = OpLabel 
                                       f32_3 %158 = OpLoad %121 
                                                      OpStore %152 %158 
                                                      OpBranch %155 
                                             %155 = OpLabel 
                                       f32_3 %159 = OpLoad %152 
                                                      OpStore %119 %159 
                                       f32_3 %160 = OpLoad %119 
                              Uniform f32_3* %163 = OpAccessChain %41 %161 
                                       f32_3 %164 = OpLoad %163 
                                       f32_3 %165 = OpFNegate %164 
                                       f32_3 %166 = OpFAdd %160 %165 
                                                      OpStore %119 %166 
                                       f32_3 %168 = OpLoad %119 
                              Uniform f32_3* %169 = OpAccessChain %41 %146 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %167 
                                       f32_4 %173 = OpVectorShuffle %172 %171 0 4 5 6 
                                                      OpStore %167 %173 
                                Private f32* %174 = OpAccessChain %167 %115 
                                         f32 %175 = OpLoad %174 
                                         f32 %177 = OpFMul %175 %176 
                                         f32 %179 = OpFAdd %177 %178 
                                                      OpStore %61 %179 
                                Uniform f32* %181 = OpAccessChain %41 %75 %180 
                                         f32 %182 = OpLoad %181 
                                         f32 %184 = OpFMul %182 %183 
                                         f32 %185 = OpFAdd %184 %178 
                                Private f32* %186 = OpAccessChain %119 %30 
                                                      OpStore %186 %185 
                                         f32 %187 = OpLoad %61 
                                Private f32* %188 = OpAccessChain %119 %30 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpExtInst %1 40 %187 %189 
                                Private f32* %191 = OpAccessChain %167 %30 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %167 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %167 %199 
                                       f32_4 %200 = OpLoad %167 
                                                      OpStore %20 %200 
                                                      OpBranch %114 
                                             %201 = OpLabel 
                                Private f32* %202 = OpAccessChain %20 %30 
                                                      OpStore %202 %104 
                                Private f32* %203 = OpAccessChain %20 %115 
                                                      OpStore %203 %104 
                                Private f32* %204 = OpAccessChain %20 %180 
                                                      OpStore %204 %104 
                                Private f32* %205 = OpAccessChain %20 %62 
                                                      OpStore %205 %104 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_4 %207 = OpLoad %20 
                              Uniform f32_4* %208 = OpAccessChain %41 %74 
                                       f32_4 %209 = OpLoad %208 
                                         f32 %210 = OpDot %207 %209 
                                                      OpStore %206 %210 
                                         f32 %211 = OpLoad %206 
                                         f32 %212 = OpExtInst %1 43 %211 %71 %104 
                                                      OpStore %206 %212 
                                       f32_3 %214 = OpLoad %34 
                              Uniform f32_4* %216 = OpAccessChain %41 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFMul %214 %218 
                                                      OpStore %213 %219 
                                         f32 %221 = OpLoad %206 
                                       f32_3 %222 = OpCompositeConstruct %221 %221 %221 
                                       f32_3 %223 = OpLoad %213 
                                       f32_3 %224 = OpFMul %222 %223 
                                                      OpStore %220 %224 
                                       f32_3 %225 = OpLoad %213 
                                       f32_3 %226 = OpFNegate %225 
                                         f32 %227 = OpLoad %206 
                                       f32_3 %228 = OpCompositeConstruct %227 %227 %227 
                                       f32_3 %229 = OpFMul %226 %228 
                              Uniform f32_4* %230 = OpAccessChain %41 %43 
                                       f32_4 %231 = OpLoad %230 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %229 %232 
                                                      OpStore %34 %233 
                              Uniform f32_4* %234 = OpAccessChain %41 %43 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 3 3 3 
                                       f32_3 %237 = OpLoad %34 
                                       f32_3 %238 = OpFMul %236 %237 
                                       f32_3 %239 = OpLoad %220 
                                       f32_3 %240 = OpFAdd %238 %239 
                                       f32_4 %241 = OpLoad %9 
                                       f32_4 %242 = OpVectorShuffle %241 %240 4 5 6 3 
                                                      OpStore %9 %242 
                                       f32_4 %245 = OpLoad %9 
                                                      OpStore %244 %245 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat10;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = vec3(u_xlat16_1) * _OverrideColor.xyz + (-u_xlat10_0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat3 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat6.x, u_xlat3);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat2.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlatb6 = 0.0<u_xlat1.z;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat10.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat10.xy);
    u_xlat13 = u_xlat6.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat13 * u_xlat10_3.w;
    u_xlat1.x = u_xlat2.x * u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat5.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 338
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %101 %335 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %36 ArrayStride 36 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpMemberDecorate %38 0 RelaxedPrecision 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 RelaxedPrecision 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpMemberDecorate %38 6 Offset 38 
                                                      OpMemberDecorate %38 7 Offset 38 
                                                      OpMemberDecorate %38 8 RelaxedPrecision 
                                                      OpMemberDecorate %38 8 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate %139 SpecId 139 
                                                      OpDecorate %234 DescriptorSet 234 
                                                      OpDecorate %234 Binding 234 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %275 DescriptorSet 275 
                                                      OpDecorate %275 Binding 275 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %290 DescriptorSet 290 
                                                      OpDecorate %290 Binding 290 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %335 Location 335 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypePointer Private %6 
                                 Private f32* %21 = OpVariable Private 
                                              %22 = OpTypeVector %6 3 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                              %30 = OpTypePointer Private %22 
                               Private f32_3* %31 = OpVariable Private 
                                              %34 = OpTypeInt 32 0 
                                          u32 %35 = OpConstant 4 
                                              %36 = OpTypeArray %7 %35 
                                              %37 = OpTypeArray %7 %35 
                                              %38 = OpTypeStruct %7 %7 %36 %22 %22 %7 %37 %7 %6 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 7 
                                              %43 = OpTypePointer Uniform %7 
                                 Private f32* %60 = OpVariable Private 
                                          u32 %61 = OpConstant 3 
                                          f32 %64 = OpConstant 3.67402E-40 
                                              %66 = OpTypeBool 
                                              %67 = OpTypePointer Private %66 
                                Private bool* %68 = OpVariable Private 
                                          f32 %70 = OpConstant 3.67402E-40 
                                          i32 %73 = OpConstant 0 
                                          i32 %74 = OpConstant 1 
                                          i32 %76 = OpConstant -1 
                                          i32 %84 = OpConstant 8 
                                              %85 = OpTypePointer Uniform %6 
                               Private f32_4* %99 = OpVariable Private 
                                             %100 = OpTypePointer Input %22 
                                Input f32_3* %101 = OpVariable Input 
                                         i32 %104 = OpConstant 6 
                                         i32 %115 = OpConstant 2 
                                         i32 %124 = OpConstant 3 
                                         u32 %128 = OpConstant 0 
                                         f32 %131 = OpConstant 3.67402E-40 
                                        bool %133 = OpConstantFalse 
                                        bool %139 = OpSpecConstantFalse 
                                         u32 %142 = OpConstant 1 
                              Private f32_4* %146 = OpVariable Private 
                                             %185 = OpTypePointer Function %22 
                                         i32 %199 = OpConstant 4 
                                             %200 = OpTypePointer Uniform %22 
                                         f32 %216 = OpConstant 3.67402E-40 
                                         f32 %218 = OpConstant 3.67402E-40 
                                Private f32* %220 = OpVariable Private 
                                         u32 %221 = OpConstant 2 
                                         f32 %224 = OpConstant 3.67402E-40 
                                             %231 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %232 = OpTypeSampledImage %231 
                                             %233 = OpTypePointer UniformConstant %232 
 UniformConstant read_only Texture3DSampled* %234 = OpVariable UniformConstant 
                              Private f32_4* %239 = OpVariable Private 
                                Private f32* %246 = OpVariable Private 
                              Private f32_3* %256 = OpVariable Private 
                                             %257 = OpTypePointer Function %6 
                                             %265 = OpTypePointer Private %15 
                              Private f32_2* %266 = OpVariable Private 
                                       f32_2 %273 = OpConstantComposite %224 %224 
 UniformConstant read_only Texture2DSampled* %275 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %290 = OpVariable UniformConstant 
                                         i32 %306 = OpConstant 5 
                              Private f32_3* %311 = OpVariable Private 
                                             %334 = OpTypePointer Output %7 
                               Output f32_4* %335 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %186 = OpVariable Function 
                               Function f32* %258 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %32 = OpLoad %21 
                                        f32_3 %33 = OpCompositeConstruct %32 %32 %32 
                               Uniform f32_4* %44 = OpAccessChain %40 %42 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %47 = OpFMul %33 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFNegate %49 
                                        f32_3 %51 = OpFAdd %47 %50 
                                                      OpStore %31 %51 
                               Uniform f32_4* %52 = OpAccessChain %40 %42 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 3 3 3 
                                        f32_3 %55 = OpLoad %31 
                                        f32_3 %56 = OpFMul %54 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32_3 %59 = OpFAdd %56 %58 
                                                      OpStore %31 %59 
                                 Private f32* %62 = OpAccessChain %9 %61 
                                          f32 %63 = OpLoad %62 
                                          f32 %65 = OpFAdd %63 %64 
                                                      OpStore %60 %65 
                                          f32 %69 = OpLoad %60 
                                         bool %71 = OpFOrdLessThan %69 %70 
                                                      OpStore %68 %71 
                                         bool %72 = OpLoad %68 
                                          i32 %75 = OpSelect %72 %74 %73 
                                          i32 %77 = OpIMul %75 %76 
                                         bool %78 = OpINotEqual %77 %73 
                                                      OpSelectionMerge %80 None 
                                                      OpBranchConditional %78 %79 %80 
                                              %79 = OpLabel 
                                                      OpKill
                                              %80 = OpLabel 
                                 Private f32* %82 = OpAccessChain %9 %61 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %86 = OpAccessChain %40 %84 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFNegate %87 
                                          f32 %89 = OpFAdd %83 %88 
                                                      OpStore %21 %89 
                                          f32 %90 = OpLoad %21 
                                         bool %91 = OpFOrdLessThan %90 %70 
                                                      OpStore %68 %91 
                                         bool %92 = OpLoad %68 
                                          i32 %93 = OpSelect %92 %74 %73 
                                          i32 %94 = OpIMul %93 %76 
                                         bool %95 = OpINotEqual %94 %73 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %97 
                                              %96 = OpLabel 
                                                      OpKill
                                              %97 = OpLabel 
                                       f32_3 %102 = OpLoad %101 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                              Uniform f32_4* %105 = OpAccessChain %40 %104 %74 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFMul %103 %106 
                                                      OpStore %99 %107 
                              Uniform f32_4* %108 = OpAccessChain %40 %104 %73 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpLoad %101 
                                       f32_4 %111 = OpVectorShuffle %110 %110 0 0 0 0 
                                       f32_4 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %99 
                                       f32_4 %114 = OpFAdd %112 %113 
                                                      OpStore %99 %114 
                              Uniform f32_4* %116 = OpAccessChain %40 %104 %115 
                                       f32_4 %117 = OpLoad %116 
                                       f32_3 %118 = OpLoad %101 
                                       f32_4 %119 = OpVectorShuffle %118 %118 2 2 2 2 
                                       f32_4 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %99 
                                       f32_4 %122 = OpFAdd %120 %121 
                                                      OpStore %99 %122 
                                       f32_4 %123 = OpLoad %99 
                              Uniform f32_4* %125 = OpAccessChain %40 %104 %124 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpFAdd %123 %126 
                                                      OpStore %99 %127 
                                Uniform f32* %129 = OpAccessChain %40 %74 %128 
                                         f32 %130 = OpLoad %129 
                                        bool %132 = OpFOrdEqual %130 %131 
                                                      OpStore %68 %132 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                        bool %136 = OpLoad %68 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %138 
                                             %137 = OpLabel 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %241 
                                             %140 = OpLabel 
                                Uniform f32* %143 = OpAccessChain %40 %74 %142 
                                         f32 %144 = OpLoad %143 
                                        bool %145 = OpFOrdEqual %144 %131 
                                                      OpStore %68 %145 
                                       f32_3 %147 = OpLoad %101 
                                       f32_3 %148 = OpVectorShuffle %147 %147 1 1 1 
                              Uniform f32_4* %149 = OpAccessChain %40 %115 %74 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                                       f32_3 %152 = OpFMul %148 %151 
                                       f32_4 %153 = OpLoad %146 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                      OpStore %146 %154 
                              Uniform f32_4* %155 = OpAccessChain %40 %115 %73 
                                       f32_4 %156 = OpLoad %155 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpLoad %101 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 0 0 
                                       f32_3 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %146 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpFAdd %160 %162 
                                       f32_4 %164 = OpLoad %146 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %146 %165 
                              Uniform f32_4* %166 = OpAccessChain %40 %115 %115 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %101 
                                       f32_3 %170 = OpVectorShuffle %169 %169 2 2 2 
                                       f32_3 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %146 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFAdd %171 %173 
                                       f32_4 %175 = OpLoad %146 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                      OpStore %146 %176 
                                       f32_4 %177 = OpLoad %146 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                              Uniform f32_4* %179 = OpAccessChain %40 %115 %124 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %178 %181 
                                       f32_4 %183 = OpLoad %146 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %146 %184 
                                        bool %187 = OpLoad %68 
                                                      OpSelectionMerge %189 None 
                                                      OpBranchConditional %187 %188 %192 
                                             %188 = OpLabel 
                                       f32_4 %190 = OpLoad %146 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                                      OpStore %186 %191 
                                                      OpBranch %189 
                                             %192 = OpLabel 
                                       f32_3 %193 = OpLoad %101 
                                                      OpStore %186 %193 
                                                      OpBranch %189 
                                             %189 = OpLabel 
                                       f32_3 %194 = OpLoad %186 
                                       f32_4 %195 = OpLoad %146 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %146 %196 
                                       f32_4 %197 = OpLoad %146 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                              Uniform f32_3* %201 = OpAccessChain %40 %199 
                                       f32_3 %202 = OpLoad %201 
                                       f32_3 %203 = OpFNegate %202 
                                       f32_3 %204 = OpFAdd %198 %203 
                                       f32_4 %205 = OpLoad %146 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 5 6 3 
                                                      OpStore %146 %206 
                                       f32_4 %207 = OpLoad %146 
                                       f32_3 %208 = OpVectorShuffle %207 %207 0 1 2 
                              Uniform f32_3* %209 = OpAccessChain %40 %124 
                                       f32_3 %210 = OpLoad %209 
                                       f32_3 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %146 
                                       f32_4 %213 = OpVectorShuffle %212 %211 0 4 5 6 
                                                      OpStore %146 %213 
                                Private f32* %214 = OpAccessChain %146 %142 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %219 = OpFAdd %217 %218 
                                                      OpStore %60 %219 
                                Uniform f32* %222 = OpAccessChain %40 %74 %221 
                                         f32 %223 = OpLoad %222 
                                         f32 %225 = OpFMul %223 %224 
                                         f32 %226 = OpFAdd %225 %218 
                                                      OpStore %220 %226 
                                         f32 %227 = OpLoad %60 
                                         f32 %228 = OpLoad %220 
                                         f32 %229 = OpExtInst %1 40 %227 %228 
                                Private f32* %230 = OpAccessChain %146 %128 
                                                      OpStore %230 %229 
                  read_only Texture3DSampled %235 = OpLoad %234 
                                       f32_4 %236 = OpLoad %146 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 2 3 
                                       f32_4 %238 = OpImageSampleImplicitLod %235 %237 
                                                      OpStore %146 %238 
                                       f32_4 %240 = OpLoad %146 
                                                      OpStore %239 %240 
                                                      OpBranch %141 
                                             %241 = OpLabel 
                                Private f32* %242 = OpAccessChain %239 %128 
                                                      OpStore %242 %131 
                                Private f32* %243 = OpAccessChain %239 %142 
                                                      OpStore %243 %131 
                                Private f32* %244 = OpAccessChain %239 %221 
                                                      OpStore %244 %131 
                                Private f32* %245 = OpAccessChain %239 %61 
                                                      OpStore %245 %131 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                       f32_4 %247 = OpLoad %239 
                              Uniform f32_4* %248 = OpAccessChain %40 %73 
                                       f32_4 %249 = OpLoad %248 
                                         f32 %250 = OpDot %247 %249 
                                                      OpStore %246 %250 
                                         f32 %251 = OpLoad %246 
                                         f32 %252 = OpExtInst %1 43 %251 %70 %131 
                                                      OpStore %246 %252 
                                Private f32* %253 = OpAccessChain %99 %221 
                                         f32 %254 = OpLoad %253 
                                        bool %255 = OpFOrdLessThan %70 %254 
                                                      OpStore %68 %255 
                                        bool %259 = OpLoad %68 
                                                      OpSelectionMerge %261 None 
                                                      OpBranchConditional %259 %260 %262 
                                             %260 = OpLabel 
                                                      OpStore %258 %131 
                                                      OpBranch %261 
                                             %262 = OpLabel 
                                                      OpStore %258 %70 
                                                      OpBranch %261 
                                             %261 = OpLabel 
                                         f32 %263 = OpLoad %258 
                                Private f32* %264 = OpAccessChain %256 %128 
                                                      OpStore %264 %263 
                                       f32_4 %267 = OpLoad %99 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_4 %269 = OpLoad %99 
                                       f32_2 %270 = OpVectorShuffle %269 %269 3 3 
                                       f32_2 %271 = OpFDiv %268 %270 
                                                      OpStore %266 %271 
                                       f32_2 %272 = OpLoad %266 
                                       f32_2 %274 = OpFAdd %272 %273 
                                                      OpStore %266 %274 
                  read_only Texture2DSampled %276 = OpLoad %275 
                                       f32_2 %277 = OpLoad %266 
                                       f32_4 %278 = OpImageSampleImplicitLod %276 %277 
                                         f32 %279 = OpCompositeExtract %278 3 
                                                      OpStore %60 %279 
                                         f32 %280 = OpLoad %60 
                                Private f32* %281 = OpAccessChain %256 %128 
                                         f32 %282 = OpLoad %281 
                                         f32 %283 = OpFMul %280 %282 
                                Private f32* %284 = OpAccessChain %256 %128 
                                                      OpStore %284 %283 
                                       f32_4 %285 = OpLoad %99 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                                       f32_4 %287 = OpLoad %99 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                         f32 %289 = OpDot %286 %288 
                                                      OpStore %60 %289 
                  read_only Texture2DSampled %291 = OpLoad %290 
                                         f32 %292 = OpLoad %60 
                                       f32_2 %293 = OpCompositeConstruct %292 %292 
                                       f32_4 %294 = OpImageSampleImplicitLod %291 %293 
                                         f32 %295 = OpCompositeExtract %294 3 
                                                      OpStore %60 %295 
                                         f32 %296 = OpLoad %60 
                                Private f32* %297 = OpAccessChain %256 %128 
                                         f32 %298 = OpLoad %297 
                                         f32 %299 = OpFMul %296 %298 
                                Private f32* %300 = OpAccessChain %256 %128 
                                                      OpStore %300 %299 
                                         f32 %301 = OpLoad %246 
                                Private f32* %302 = OpAccessChain %256 %128 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpFMul %301 %303 
                                                      OpStore %246 %304 
                                       f32_3 %305 = OpLoad %31 
                              Uniform f32_4* %307 = OpAccessChain %40 %306 
                                       f32_4 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                                       f32_3 %310 = OpFMul %305 %309 
                                                      OpStore %256 %310 
                                         f32 %312 = OpLoad %246 
                                       f32_3 %313 = OpCompositeConstruct %312 %312 %312 
                                       f32_3 %314 = OpLoad %256 
                                       f32_3 %315 = OpFMul %313 %314 
                                                      OpStore %311 %315 
                                       f32_3 %316 = OpLoad %256 
                                       f32_3 %317 = OpFNegate %316 
                                         f32 %318 = OpLoad %246 
                                       f32_3 %319 = OpCompositeConstruct %318 %318 %318 
                                       f32_3 %320 = OpFMul %317 %319 
                              Uniform f32_4* %321 = OpAccessChain %40 %42 
                                       f32_4 %322 = OpLoad %321 
                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                                       f32_3 %324 = OpFAdd %320 %323 
                                                      OpStore %31 %324 
                              Uniform f32_4* %325 = OpAccessChain %40 %42 
                                       f32_4 %326 = OpLoad %325 
                                       f32_3 %327 = OpVectorShuffle %326 %326 3 3 3 
                                       f32_3 %328 = OpLoad %31 
                                       f32_3 %329 = OpFMul %327 %328 
                                       f32_3 %330 = OpLoad %311 
                                       f32_3 %331 = OpFAdd %329 %330 
                                       f32_4 %332 = OpLoad %9 
                                       f32_4 %333 = OpVectorShuffle %332 %331 4 5 6 3 
                                                      OpStore %9 %333 
                                       f32_4 %336 = OpLoad %9 
                                                      OpStore %335 %336 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
vec3 u_xlat5;
float u_xlat6;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = vec3(u_xlat16_1) * _OverrideColor.xyz + (-u_xlat10_0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb13 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb13){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13 = u_xlat2.y * 0.25 + 0.75;
        u_xlat6 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat13, u_xlat6);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat13 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat10_3 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat1.x = u_xlat13 * u_xlat16_1;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat5.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 304
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %105 %301 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 RelaxedPrecision 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate %146 SpecId 146 
                                                      OpDecorate %224 DescriptorSet 224 
                                                      OpDecorate %224 Binding 224 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %257 DescriptorSet 257 
                                                      OpDecorate %257 Binding 257 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %301 Location 301 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeArray %7 %37 
                                              %40 = OpTypeStruct %7 %7 %38 %21 %21 %7 %39 %7 %6 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 7 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %62 = OpVariable Private 
                                          u32 %63 = OpConstant 3 
                                          f32 %66 = OpConstant 3.67402E-40 
                                              %68 = OpTypeBool 
                                              %69 = OpTypePointer Private %68 
                                Private bool* %70 = OpVariable Private 
                                          f32 %72 = OpConstant 3.67402E-40 
                                          i32 %75 = OpConstant 0 
                                          i32 %76 = OpConstant 1 
                                          i32 %78 = OpConstant -1 
                                          i32 %86 = OpConstant 8 
                                              %87 = OpTypePointer Uniform %6 
                              Private f32_3* %103 = OpVariable Private 
                                             %104 = OpTypePointer Input %21 
                                Input f32_3* %105 = OpVariable Input 
                                         i32 %108 = OpConstant 6 
                                         i32 %121 = OpConstant 2 
                                         i32 %131 = OpConstant 3 
                                         f32 %138 = OpConstant 3.67402E-40 
                                        bool %140 = OpConstantFalse 
                                        bool %146 = OpSpecConstantFalse 
                                         u32 %149 = OpConstant 1 
                              Private f32_3* %153 = OpVariable Private 
                                             %181 = OpTypePointer Function %21 
                                         i32 %191 = OpConstant 4 
                                             %192 = OpTypePointer Uniform %21 
                              Private f32_4* %197 = OpVariable Private 
                                         f32 %206 = OpConstant 3.67402E-40 
                                         f32 %208 = OpConstant 3.67402E-40 
                                Private f32* %210 = OpVariable Private 
                                         u32 %211 = OpConstant 2 
                                         f32 %214 = OpConstant 3.67402E-40 
                                             %221 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %222 = OpTypeSampledImage %221 
                                             %223 = OpTypePointer UniformConstant %222 
 UniformConstant read_only Texture3DSampled* %224 = OpVariable UniformConstant 
                              Private f32_3* %235 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %248 = OpVariable UniformConstant 
                                             %254 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %255 = OpTypeSampledImage %254 
                                             %256 = OpTypePointer UniformConstant %255 
UniformConstant read_only TextureCubeSampled* %257 = OpVariable UniformConstant 
                                         i32 %272 = OpConstant 5 
                              Private f32_3* %277 = OpVariable Private 
                                             %300 = OpTypePointer Output %7 
                               Output f32_4* %301 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %182 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFAdd %49 %52 
                                                      OpStore %34 %53 
                               Uniform f32_4* %54 = OpAccessChain %42 %44 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_3 %57 = OpLoad %34 
                                        f32_3 %58 = OpFMul %56 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %34 %61 
                                 Private f32* %64 = OpAccessChain %9 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %67 = OpFAdd %65 %66 
                                                      OpStore %62 %67 
                                          f32 %71 = OpLoad %62 
                                         bool %73 = OpFOrdLessThan %71 %72 
                                                      OpStore %70 %73 
                                         bool %74 = OpLoad %70 
                                          i32 %77 = OpSelect %74 %76 %75 
                                          i32 %79 = OpIMul %77 %78 
                                         bool %80 = OpINotEqual %79 %75 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpKill
                                              %82 = OpLabel 
                                 Private f32* %84 = OpAccessChain %9 %63 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %88 = OpAccessChain %42 %86 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %85 %90 
                                 Private f32* %92 = OpAccessChain %20 %30 
                                                      OpStore %92 %91 
                                 Private f32* %93 = OpAccessChain %20 %30 
                                          f32 %94 = OpLoad %93 
                                         bool %95 = OpFOrdLessThan %94 %72 
                                                      OpStore %70 %95 
                                         bool %96 = OpLoad %70 
                                          i32 %97 = OpSelect %96 %76 %75 
                                          i32 %98 = OpIMul %97 %78 
                                         bool %99 = OpINotEqual %98 %75 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                                      OpKill
                                             %101 = OpLabel 
                                       f32_3 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %109 = OpAccessChain %42 %108 %76 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                       f32_3 %112 = OpFMul %107 %111 
                                                      OpStore %103 %112 
                              Uniform f32_4* %113 = OpAccessChain %42 %108 %75 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpLoad %105 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 0 0 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_3 %119 = OpLoad %103 
                                       f32_3 %120 = OpFAdd %118 %119 
                                                      OpStore %103 %120 
                              Uniform f32_4* %122 = OpAccessChain %42 %108 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpLoad %105 
                                       f32_3 %126 = OpVectorShuffle %125 %125 2 2 2 
                                       f32_3 %127 = OpFMul %124 %126 
                                       f32_3 %128 = OpLoad %103 
                                       f32_3 %129 = OpFAdd %127 %128 
                                                      OpStore %103 %129 
                                       f32_3 %130 = OpLoad %103 
                              Uniform f32_4* %132 = OpAccessChain %42 %108 %131 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFAdd %130 %134 
                                                      OpStore %103 %135 
                                Uniform f32* %136 = OpAccessChain %42 %76 %30 
                                         f32 %137 = OpLoad %136 
                                        bool %139 = OpFOrdEqual %137 %138 
                                                      OpStore %70 %139 
                                                      OpSelectionMerge %142 None 
                                                      OpBranchConditional %140 %141 %142 
                                             %141 = OpLabel 
                                        bool %143 = OpLoad %70 
                                                      OpSelectionMerge %145 None 
                                                      OpBranchConditional %143 %144 %145 
                                             %144 = OpLabel 
                                                      OpBranch %145 
                                             %145 = OpLabel 
                                                      OpBranch %142 
                                             %142 = OpLabel 
                                                      OpSelectionMerge %148 None 
                                                      OpBranchConditional %146 %147 %230 
                                             %147 = OpLabel 
                                Uniform f32* %150 = OpAccessChain %42 %76 %149 
                                         f32 %151 = OpLoad %150 
                                        bool %152 = OpFOrdEqual %151 %138 
                                                      OpStore %70 %152 
                                       f32_3 %154 = OpLoad %105 
                                       f32_3 %155 = OpVectorShuffle %154 %154 1 1 1 
                              Uniform f32_4* %156 = OpAccessChain %42 %121 %76 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpFMul %155 %158 
                                                      OpStore %153 %159 
                              Uniform f32_4* %160 = OpAccessChain %42 %121 %75 
                                       f32_4 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_3 %163 = OpLoad %105 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 0 0 
                                       f32_3 %165 = OpFMul %162 %164 
                                       f32_3 %166 = OpLoad %153 
                                       f32_3 %167 = OpFAdd %165 %166 
                                                      OpStore %153 %167 
                              Uniform f32_4* %168 = OpAccessChain %42 %121 %121 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpLoad %105 
                                       f32_3 %172 = OpVectorShuffle %171 %171 2 2 2 
                                       f32_3 %173 = OpFMul %170 %172 
                                       f32_3 %174 = OpLoad %153 
                                       f32_3 %175 = OpFAdd %173 %174 
                                                      OpStore %153 %175 
                                       f32_3 %176 = OpLoad %153 
                              Uniform f32_4* %177 = OpAccessChain %42 %121 %131 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                                       f32_3 %180 = OpFAdd %176 %179 
                                                      OpStore %153 %180 
                                        bool %183 = OpLoad %70 
                                                      OpSelectionMerge %185 None 
                                                      OpBranchConditional %183 %184 %187 
                                             %184 = OpLabel 
                                       f32_3 %186 = OpLoad %153 
                                                      OpStore %182 %186 
                                                      OpBranch %185 
                                             %187 = OpLabel 
                                       f32_3 %188 = OpLoad %105 
                                                      OpStore %182 %188 
                                                      OpBranch %185 
                                             %185 = OpLabel 
                                       f32_3 %189 = OpLoad %182 
                                                      OpStore %153 %189 
                                       f32_3 %190 = OpLoad %153 
                              Uniform f32_3* %193 = OpAccessChain %42 %191 
                                       f32_3 %194 = OpLoad %193 
                                       f32_3 %195 = OpFNegate %194 
                                       f32_3 %196 = OpFAdd %190 %195 
                                                      OpStore %153 %196 
                                       f32_3 %198 = OpLoad %153 
                              Uniform f32_3* %199 = OpAccessChain %42 %131 
                                       f32_3 %200 = OpLoad %199 
                                       f32_3 %201 = OpFMul %198 %200 
                                       f32_4 %202 = OpLoad %197 
                                       f32_4 %203 = OpVectorShuffle %202 %201 0 4 5 6 
                                                      OpStore %197 %203 
                                Private f32* %204 = OpAccessChain %197 %149 
                                         f32 %205 = OpLoad %204 
                                         f32 %207 = OpFMul %205 %206 
                                         f32 %209 = OpFAdd %207 %208 
                                                      OpStore %62 %209 
                                Uniform f32* %212 = OpAccessChain %42 %76 %211 
                                         f32 %213 = OpLoad %212 
                                         f32 %215 = OpFMul %213 %214 
                                         f32 %216 = OpFAdd %215 %208 
                                                      OpStore %210 %216 
                                         f32 %217 = OpLoad %62 
                                         f32 %218 = OpLoad %210 
                                         f32 %219 = OpExtInst %1 40 %217 %218 
                                Private f32* %220 = OpAccessChain %197 %30 
                                                      OpStore %220 %219 
                  read_only Texture3DSampled %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %197 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 2 3 
                                       f32_4 %228 = OpImageSampleImplicitLod %225 %227 
                                                      OpStore %197 %228 
                                       f32_4 %229 = OpLoad %197 
                                                      OpStore %20 %229 
                                                      OpBranch %148 
                                             %230 = OpLabel 
                                Private f32* %231 = OpAccessChain %20 %30 
                                                      OpStore %231 %138 
                                Private f32* %232 = OpAccessChain %20 %149 
                                                      OpStore %232 %138 
                                Private f32* %233 = OpAccessChain %20 %211 
                                                      OpStore %233 %138 
                                Private f32* %234 = OpAccessChain %20 %63 
                                                      OpStore %234 %138 
                                                      OpBranch %148 
                                             %148 = OpLabel 
                                       f32_4 %236 = OpLoad %20 
                              Uniform f32_4* %237 = OpAccessChain %42 %75 
                                       f32_4 %238 = OpLoad %237 
                                         f32 %239 = OpDot %236 %238 
                                Private f32* %240 = OpAccessChain %235 %30 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %235 %30 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpExtInst %1 43 %242 %72 %138 
                                Private f32* %244 = OpAccessChain %235 %30 
                                                      OpStore %244 %243 
                                       f32_3 %245 = OpLoad %103 
                                       f32_3 %246 = OpLoad %103 
                                         f32 %247 = OpDot %245 %246 
                                                      OpStore %62 %247 
                  read_only Texture2DSampled %249 = OpLoad %248 
                                         f32 %250 = OpLoad %62 
                                       f32_2 %251 = OpCompositeConstruct %250 %250 
                                       f32_4 %252 = OpImageSampleImplicitLod %249 %251 
                                         f32 %253 = OpCompositeExtract %252 3 
                                                      OpStore %62 %253 
                read_only TextureCubeSampled %258 = OpLoad %257 
                                       f32_3 %259 = OpLoad %103 
                                       f32_4 %260 = OpImageSampleImplicitLod %258 %259 
                                         f32 %261 = OpCompositeExtract %260 3 
                                Private f32* %262 = OpAccessChain %103 %30 
                                                      OpStore %262 %261 
                                         f32 %263 = OpLoad %62 
                                Private f32* %264 = OpAccessChain %103 %30 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                                      OpStore %62 %266 
                                Private f32* %267 = OpAccessChain %235 %30 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpLoad %62 
                                         f32 %270 = OpFMul %268 %269 
                                                      OpStore %62 %270 
                                       f32_3 %271 = OpLoad %34 
                              Uniform f32_4* %273 = OpAccessChain %42 %272 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpFMul %271 %275 
                                                      OpStore %235 %276 
                                         f32 %278 = OpLoad %62 
                                       f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %280 = OpLoad %235 
                                       f32_3 %281 = OpFMul %279 %280 
                                                      OpStore %277 %281 
                                       f32_3 %282 = OpLoad %235 
                                       f32_3 %283 = OpFNegate %282 
                                         f32 %284 = OpLoad %62 
                                       f32_3 %285 = OpCompositeConstruct %284 %284 %284 
                                       f32_3 %286 = OpFMul %283 %285 
                              Uniform f32_4* %287 = OpAccessChain %42 %44 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %290 = OpFAdd %286 %289 
                                                      OpStore %34 %290 
                              Uniform f32_4* %291 = OpAccessChain %42 %44 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 3 3 3 
                                       f32_3 %294 = OpLoad %34 
                                       f32_3 %295 = OpFMul %293 %294 
                                       f32_3 %296 = OpLoad %277 
                                       f32_3 %297 = OpFAdd %295 %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %297 4 5 6 3 
                                                      OpStore %9 %299 
                                       f32_4 %302 = OpLoad %9 
                                                      OpStore %301 %302 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _OverrideColor;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.xyz = vec3(u_xlat16_1) * _OverrideColor.xyz + (-u_xlat10_0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = u_xlat10_0.w + (-_Cutoff);
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb7 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb7){
        u_xlatb7 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb7)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat7 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat10, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat7 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat10_2 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat1.x = u_xlat7 * u_xlat10_2.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat1.xxx + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    SV_Target0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %93 %94 %107 %138 %144 %147 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %93 Location 93 
                                                      OpDecorate %94 Location 94 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 0 
                                          i32 %24 = OpConstant 1 
                                              %25 = OpTypePointer Uniform %7 
                                          i32 %36 = OpConstant 2 
                               Private f32_4* %44 = OpVariable Private 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypeVector %6 2 
                                              %92 = OpTypePointer Output %91 
                                Output f32_2* %93 = OpVariable Output 
                                 Input f32_4* %94 = OpVariable Input 
                                             %105 = OpTypeVector %6 3 
                                             %106 = OpTypePointer Input %105 
                                Input f32_3* %107 = OpVariable Input 
                                         u32 %113 = OpConstant 0 
                                             %114 = OpTypePointer Private %6 
                                         u32 %127 = OpConstant 2 
                                Private f32* %129 = OpVariable Private 
                                             %137 = OpTypePointer Output %105 
                               Output f32_3* %138 = OpVariable Output 
                               Output f32_3* %144 = OpVariable Output 
                               Output f32_4* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpFMul %13 %27 
                                                      OpStore %9 %28 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %23 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %21 %23 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %44 %49 
                               Uniform f32_4* %50 = OpAccessChain %21 %23 %46 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %11 
                                        f32_4 %53 = OpVectorShuffle %52 %52 3 3 3 3 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                                        f32_4 %58 = OpLoad %44 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %36 %24 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %57 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %36 %23 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %44 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %57 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %57 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %36 %36 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %44 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %57 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %57 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %36 %46 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %44 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %57 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %23 
                                                      OpStore %90 %88 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                               Uniform f32_4* %97 = OpAccessChain %21 %46 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_2 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %46 
                                       f32_4 %102 = OpLoad %101 
                                       f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                       f32_2 %104 = OpFAdd %100 %103 
                                                      OpStore %93 %104 
                                       f32_3 %108 = OpLoad %107 
                              Uniform f32_4* %109 = OpAccessChain %21 %24 %23 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                         f32 %112 = OpDot %108 %111 
                                Private f32* %115 = OpAccessChain %44 %113 
                                                      OpStore %115 %112 
                                       f32_3 %116 = OpLoad %107 
                              Uniform f32_4* %117 = OpAccessChain %21 %24 %24 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                         f32 %120 = OpDot %116 %119 
                                Private f32* %121 = OpAccessChain %44 %77 
                                                      OpStore %121 %120 
                                       f32_3 %122 = OpLoad %107 
                              Uniform f32_4* %123 = OpAccessChain %21 %24 %36 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                         f32 %126 = OpDot %122 %125 
                                Private f32* %128 = OpAccessChain %44 %127 
                                                      OpStore %128 %126 
                                       f32_4 %130 = OpLoad %44 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_4 %132 = OpLoad %44 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                         f32 %134 = OpDot %131 %133 
                                                      OpStore %129 %134 
                                         f32 %135 = OpLoad %129 
                                         f32 %136 = OpExtInst %1 32 %135 
                                                      OpStore %129 %136 
                                         f32 %139 = OpLoad %129 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                                       f32_4 %141 = OpLoad %44 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %140 %142 
                                                      OpStore %138 %143 
                                       f32_4 %145 = OpLoad %9 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                                      OpStore %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %81 %23 %77 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %81 %23 %77 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 288
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %106 %285 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpDecorate %39 ArrayStride 39 
                                                      OpMemberDecorate %40 0 RelaxedPrecision 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 RelaxedPrecision 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpMemberDecorate %40 6 Offset 40 
                                                      OpMemberDecorate %40 7 Offset 40 
                                                      OpMemberDecorate %40 8 RelaxedPrecision 
                                                      OpMemberDecorate %40 8 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %106 Location 106 
                                                      OpDecorate %147 SpecId 147 
                                                      OpDecorate %225 DescriptorSet 225 
                                                      OpDecorate %225 Binding 225 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 DescriptorSet 246 
                                                      OpDecorate %246 Binding 246 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %285 Location 285 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                               Private f32_4* %20 = OpVariable Private 
                                              %21 = OpTypeVector %6 3 
                                          f32 %24 = OpConstant 3.67402E-40 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                        f32_3 %27 = OpConstantComposite %24 %25 %26 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Private %21 
                               Private f32_3* %34 = OpVariable Private 
                                          u32 %37 = OpConstant 4 
                                              %38 = OpTypeArray %7 %37 
                                              %39 = OpTypeArray %7 %37 
                                              %40 = OpTypeStruct %7 %7 %38 %21 %21 %7 %39 %7 %6 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 7 
                                              %45 = OpTypePointer Uniform %7 
                                 Private f32* %62 = OpVariable Private 
                                          u32 %63 = OpConstant 3 
                                          f32 %66 = OpConstant 3.67402E-40 
                                              %68 = OpTypeBool 
                                              %69 = OpTypePointer Private %68 
                                Private bool* %70 = OpVariable Private 
                                          f32 %72 = OpConstant 3.67402E-40 
                                          i32 %75 = OpConstant 0 
                                          i32 %76 = OpConstant 1 
                                          i32 %78 = OpConstant -1 
                                          i32 %86 = OpConstant 8 
                                              %87 = OpTypePointer Uniform %6 
                                             %103 = OpTypePointer Private %15 
                              Private f32_2* %104 = OpVariable Private 
                                             %105 = OpTypePointer Input %21 
                                Input f32_3* %106 = OpVariable Input 
                                         i32 %109 = OpConstant 6 
                                         i32 %122 = OpConstant 2 
                                         i32 %132 = OpConstant 3 
                                         f32 %139 = OpConstant 3.67402E-40 
                                        bool %141 = OpConstantFalse 
                                        bool %147 = OpSpecConstantFalse 
                                         u32 %150 = OpConstant 1 
                              Private f32_3* %154 = OpVariable Private 
                                             %182 = OpTypePointer Function %21 
                                         i32 %192 = OpConstant 4 
                                             %193 = OpTypePointer Uniform %21 
                              Private f32_4* %198 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %211 = OpVariable Private 
                                         u32 %212 = OpConstant 2 
                                         f32 %215 = OpConstant 3.67402E-40 
                                             %222 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %223 = OpTypeSampledImage %222 
                                             %224 = OpTypePointer UniformConstant %223 
 UniformConstant read_only Texture3DSampled* %225 = OpVariable UniformConstant 
                              Private f32_3* %236 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %246 = OpVariable UniformConstant 
                                         i32 %256 = OpConstant 5 
                              Private f32_3* %261 = OpVariable Private 
                                             %284 = OpTypePointer Output %7 
                               Output f32_4* %285 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %183 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                          f32 %28 = OpDot %23 %27 
                                 Private f32* %32 = OpAccessChain %20 %30 
                                                      OpStore %32 %28 
                                        f32_4 %35 = OpLoad %20 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 0 0 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFMul %36 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFAdd %49 %52 
                                                      OpStore %34 %53 
                               Uniform f32_4* %54 = OpAccessChain %42 %44 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 3 3 3 
                                        f32_3 %57 = OpLoad %34 
                                        f32_3 %58 = OpFMul %56 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                                      OpStore %34 %61 
                                 Private f32* %64 = OpAccessChain %9 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %67 = OpFAdd %65 %66 
                                                      OpStore %62 %67 
                                          f32 %71 = OpLoad %62 
                                         bool %73 = OpFOrdLessThan %71 %72 
                                                      OpStore %70 %73 
                                         bool %74 = OpLoad %70 
                                          i32 %77 = OpSelect %74 %76 %75 
                                          i32 %79 = OpIMul %77 %78 
                                         bool %80 = OpINotEqual %79 %75 
                                                      OpSelectionMerge %82 None 
                                                      OpBranchConditional %80 %81 %82 
                                              %81 = OpLabel 
                                                      OpKill
                                              %82 = OpLabel 
                                 Private f32* %84 = OpAccessChain %9 %63 
                                          f32 %85 = OpLoad %84 
                                 Uniform f32* %88 = OpAccessChain %42 %86 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFNegate %89 
                                          f32 %91 = OpFAdd %85 %90 
                                 Private f32* %92 = OpAccessChain %20 %30 
                                                      OpStore %92 %91 
                                 Private f32* %93 = OpAccessChain %20 %30 
                                          f32 %94 = OpLoad %93 
                                         bool %95 = OpFOrdLessThan %94 %72 
                                                      OpStore %70 %95 
                                         bool %96 = OpLoad %70 
                                          i32 %97 = OpSelect %96 %76 %75 
                                          i32 %98 = OpIMul %97 %78 
                                         bool %99 = OpINotEqual %98 %75 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %101 
                                             %100 = OpLabel 
                                                      OpKill
                                             %101 = OpLabel 
                                       f32_3 %107 = OpLoad %106 
                                       f32_2 %108 = OpVectorShuffle %107 %107 1 1 
                              Uniform f32_4* %110 = OpAccessChain %42 %109 %76 
                                       f32_4 %111 = OpLoad %110 
                                       f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                       f32_2 %113 = OpFMul %108 %112 
                                                      OpStore %104 %113 
                              Uniform f32_4* %114 = OpAccessChain %42 %109 %75 
                                       f32_4 %115 = OpLoad %114 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_3 %117 = OpLoad %106 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 0 
                                       f32_2 %119 = OpFMul %116 %118 
                                       f32_2 %120 = OpLoad %104 
                                       f32_2 %121 = OpFAdd %119 %120 
                                                      OpStore %104 %121 
                              Uniform f32_4* %123 = OpAccessChain %42 %109 %122 
                                       f32_4 %124 = OpLoad %123 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_3 %126 = OpLoad %106 
                                       f32_2 %127 = OpVectorShuffle %126 %126 2 2 
                                       f32_2 %128 = OpFMul %125 %127 
                                       f32_2 %129 = OpLoad %104 
                                       f32_2 %130 = OpFAdd %128 %129 
                                                      OpStore %104 %130 
                                       f32_2 %131 = OpLoad %104 
                              Uniform f32_4* %133 = OpAccessChain %42 %109 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFAdd %131 %135 
                                                      OpStore %104 %136 
                                Uniform f32* %137 = OpAccessChain %42 %76 %30 
                                         f32 %138 = OpLoad %137 
                                        bool %140 = OpFOrdEqual %138 %139 
                                                      OpStore %70 %140 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %143 
                                             %142 = OpLabel 
                                        bool %144 = OpLoad %70 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %144 %145 %146 
                                             %145 = OpLabel 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                                      OpSelectionMerge %149 None 
                                                      OpBranchConditional %147 %148 %231 
                                             %148 = OpLabel 
                                Uniform f32* %151 = OpAccessChain %42 %76 %150 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdEqual %152 %139 
                                                      OpStore %70 %153 
                                       f32_3 %155 = OpLoad %106 
                                       f32_3 %156 = OpVectorShuffle %155 %155 1 1 1 
                              Uniform f32_4* %157 = OpAccessChain %42 %122 %76 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFMul %156 %159 
                                                      OpStore %154 %160 
                              Uniform f32_4* %161 = OpAccessChain %42 %122 %75 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpLoad %106 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 0 0 
                                       f32_3 %166 = OpFMul %163 %165 
                                       f32_3 %167 = OpLoad %154 
                                       f32_3 %168 = OpFAdd %166 %167 
                                                      OpStore %154 %168 
                              Uniform f32_4* %169 = OpAccessChain %42 %122 %122 
                                       f32_4 %170 = OpLoad %169 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpLoad %106 
                                       f32_3 %173 = OpVectorShuffle %172 %172 2 2 2 
                                       f32_3 %174 = OpFMul %171 %173 
                                       f32_3 %175 = OpLoad %154 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %154 %176 
                                       f32_3 %177 = OpLoad %154 
                              Uniform f32_4* %178 = OpAccessChain %42 %122 %132 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_3 %181 = OpFAdd %177 %180 
                                                      OpStore %154 %181 
                                        bool %184 = OpLoad %70 
                                                      OpSelectionMerge %186 None 
                                                      OpBranchConditional %184 %185 %188 
                                             %185 = OpLabel 
                                       f32_3 %187 = OpLoad %154 
                                                      OpStore %183 %187 
                                                      OpBranch %186 
                                             %188 = OpLabel 
                                       f32_3 %189 = OpLoad %106 
                                                      OpStore %183 %189 
                                                      OpBranch %186 
                                             %186 = OpLabel 
                                       f32_3 %190 = OpLoad %183 
                                                      OpStore %154 %190 
                                       f32_3 %191 = OpLoad %154 
                              Uniform f32_3* %194 = OpAccessChain %42 %192 
                                       f32_3 %195 = OpLoad %194 
                                       f32_3 %196 = OpFNegate %195 
                                       f32_3 %197 = OpFAdd %191 %196 
                                                      OpStore %154 %197 
                                       f32_3 %199 = OpLoad %154 
                              Uniform f32_3* %200 = OpAccessChain %42 %132 
                                       f32_3 %201 = OpLoad %200 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %198 
                                       f32_4 %204 = OpVectorShuffle %203 %202 0 4 5 6 
                                                      OpStore %198 %204 
                                Private f32* %205 = OpAccessChain %198 %150 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpFMul %206 %207 
                                         f32 %210 = OpFAdd %208 %209 
                                                      OpStore %62 %210 
                                Uniform f32* %213 = OpAccessChain %42 %76 %212 
                                         f32 %214 = OpLoad %213 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %217 = OpFAdd %216 %209 
                                                      OpStore %211 %217 
                                         f32 %218 = OpLoad %62 
                                         f32 %219 = OpLoad %211 
                                         f32 %220 = OpExtInst %1 40 %218 %219 
                                Private f32* %221 = OpAccessChain %198 %30 
                                                      OpStore %221 %220 
                  read_only Texture3DSampled %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %198 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 2 3 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                                      OpStore %198 %229 
                                       f32_4 %230 = OpLoad %198 
                                                      OpStore %20 %230 
                                                      OpBranch %149 
                                             %231 = OpLabel 
                                Private f32* %232 = OpAccessChain %20 %30 
                                                      OpStore %232 %139 
                                Private f32* %233 = OpAccessChain %20 %150 
                                                      OpStore %233 %139 
                                Private f32* %234 = OpAccessChain %20 %212 
                                                      OpStore %234 %139 
                                Private f32* %235 = OpAccessChain %20 %63 
                                                      OpStore %235 %139 
                                                      OpBranch %149 
                                             %149 = OpLabel 
                                       f32_4 %237 = OpLoad %20 
                              Uniform f32_4* %238 = OpAccessChain %42 %75 
                                       f32_4 %239 = OpLoad %238 
                                         f32 %240 = OpDot %237 %239 
                                Private f32* %241 = OpAccessChain %236 %30 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %236 %30 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpExtInst %1 43 %243 %72 %139 
                                Private f32* %245 = OpAccessChain %236 %30 
                                                      OpStore %245 %244 
                  read_only Texture2DSampled %247 = OpLoad %246 
                                       f32_2 %248 = OpLoad %104 
                                       f32_4 %249 = OpImageSampleImplicitLod %247 %248 
                                         f32 %250 = OpCompositeExtract %249 3 
                                                      OpStore %62 %250 
                                Private f32* %251 = OpAccessChain %236 %30 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpLoad %62 
                                         f32 %254 = OpFMul %252 %253 
                                                      OpStore %62 %254 
                                       f32_3 %255 = OpLoad %34 
                              Uniform f32_4* %257 = OpAccessChain %42 %256 
                                       f32_4 %258 = OpLoad %257 
                                       f32_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                       f32_3 %260 = OpFMul %255 %259 
                                                      OpStore %236 %260 
                                         f32 %262 = OpLoad %62 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpLoad %236 
                                       f32_3 %265 = OpFMul %263 %264 
                                                      OpStore %261 %265 
                                       f32_3 %266 = OpLoad %236 
                                       f32_3 %267 = OpFNegate %266 
                                         f32 %268 = OpLoad %62 
                                       f32_3 %269 = OpCompositeConstruct %268 %268 %268 
                                       f32_3 %270 = OpFMul %267 %269 
                              Uniform f32_4* %271 = OpAccessChain %42 %44 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpFAdd %270 %273 
                                                      OpStore %34 %274 
                              Uniform f32_4* %275 = OpAccessChain %42 %44 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 3 3 3 
                                       f32_3 %278 = OpLoad %34 
                                       f32_3 %279 = OpFMul %277 %278 
                                       f32_3 %280 = OpLoad %261 
                                       f32_3 %281 = OpFAdd %279 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 6 3 
                                                      OpStore %9 %283 
                                       f32_4 %286 = OpLoad %9 
                                                      OpStore %285 %286 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
}
}
 Pass {
  Name "META"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 144407
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 unity_DynamicLightmapST;
uniform 	bvec4 unity_MetaVertexControl;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_TEXCOORD1;
in  vec4 in_TEXCOORD2;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb6;
void main()
{
    u_xlatb0 = 0.0<in_POSITION0.z;
    u_xlat0.z = u_xlatb0 ? 9.99999975e-005 : float(0.0);
    u_xlat0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.x) ? u_xlat0.xyz : in_POSITION0.xyz;
    u_xlatb6 = 0.0<u_xlat0.z;
    u_xlat1.z = u_xlatb6 ? 9.99999975e-005 : float(0.0);
    u_xlat1.xy = in_TEXCOORD2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
    u_xlat0.xyz = (unity_MetaVertexControl.y) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	vec4 _EmissiveColor;
uniform 	float _EmissiveThresholdSensitivity;
uniform 	vec4 _OverrideColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float unity_UseLinearSpace;
uniform 	float _Cutoff;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec2 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
float u_xlat9;
float u_xlat16_9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat9 = u_xlat10_0.w + (-_Cutoff);
    u_xlatb9 = u_xlat9<0.0;
    if((int(u_xlatb9) * int(0xffffffffu))!=0){discard;}
    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.298900008, 0.586600006, 0.114500001));
    u_xlat16_1.xy = (-vec2(u_xlat16_9)) + u_xlat10_0.xz;
    u_xlat16_1.xy = u_xlat16_1.xy + vec2(1.0, 1.0);
    u_xlat16_9 = (-u_xlat16_1.x) * 0.298900008 + 1.0;
    u_xlat16_9 = (-u_xlat16_1.y) * 0.114500001 + u_xlat16_9;
    u_xlat1.xz = log2(u_xlat16_1.xy);
    u_xlat16_9 = u_xlat16_9 * 1.70473921;
    u_xlat1.y = log2(u_xlat16_9);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissivePower);
    u_xlat2.xyz = u_xlat10_0.xyz + (-_EmissiveColor.xyz);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat9 = u_xlat2.y + u_xlat2.x;
    u_xlat9 = u_xlat2.z * u_xlat2.z + u_xlat9;
    u_xlat9 = sqrt(u_xlat9);
    u_xlatb9 = u_xlat9<_EmissiveThresholdSensitivity;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_UseLinearSpace);
    u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat2.xyz;
    u_xlat16_9 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat2.xyz = vec3(u_xlat16_9) * _OverrideColor.xyz + (-u_xlat10_0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat9 = unity_OneOverOutputBoost;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat1.w = 1.0;
    SV_Target0 = (unity_MetaFragmentControl.y) ? u_xlat1 : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 223
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %32 %89 %166 %177 %178 %209 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %32 Location 32 
                                                      OpDecorate %37 ArrayStride 37 
                                                      OpDecorate %38 ArrayStride 38 
                                                      OpMemberDecorate %40 0 Offset 40 
                                                      OpMemberDecorate %40 1 Offset 40 
                                                      OpMemberDecorate %40 2 Offset 40 
                                                      OpMemberDecorate %40 3 Offset 40 
                                                      OpMemberDecorate %40 4 Offset 40 
                                                      OpMemberDecorate %40 5 Offset 40 
                                                      OpDecorate %40 Block 
                                                      OpDecorate %42 DescriptorSet 42 
                                                      OpDecorate %42 Binding 42 
                                                      OpDecorate %89 Location 89 
                                                      OpMemberDecorate %164 0 BuiltIn 164 
                                                      OpMemberDecorate %164 1 BuiltIn 164 
                                                      OpMemberDecorate %164 2 BuiltIn 164 
                                                      OpDecorate %164 Block 
                                                      OpDecorate %177 Location 177 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %209 Location 209 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeBool 
                                               %7 = OpTypePointer Private %6 
                                 Private bool* %8 = OpVariable Private 
                                               %9 = OpTypeFloat 32 
                                          f32 %10 = OpConstant 3.67402E-40 
                                              %11 = OpTypeVector %9 4 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_4* %13 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 2 
                                              %16 = OpTypePointer Input %9 
                                              %20 = OpTypePointer Private %11 
                               Private f32_4* %21 = OpVariable Private 
                                              %22 = OpTypePointer Function %9 
                                          f32 %27 = OpConstant 3.67402E-40 
                                              %30 = OpTypePointer Private %9 
                                 Input f32_4* %32 = OpVariable Input 
                                              %33 = OpTypeVector %9 2 
                                          u32 %36 = OpConstant 4 
                                              %37 = OpTypeArray %11 %36 
                                              %38 = OpTypeArray %11 %36 
                                              %39 = OpTypeVector %14 4 
                                              %40 = OpTypeStruct %37 %38 %11 %11 %39 %11 
                                              %41 = OpTypePointer Uniform %40 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; u32_4; f32_4;}* %42 = OpVariable Uniform 
                                              %43 = OpTypeInt 32 1 
                                          i32 %44 = OpConstant 2 
                                              %45 = OpTypePointer Uniform %11 
                                              %56 = OpTypeVector %9 3 
                                              %57 = OpTypePointer Function %56 
                                          i32 %59 = OpConstant 4 
                                              %60 = OpTypeVector %6 4 
                                              %61 = OpTypePointer Uniform %39 
                                          u32 %65 = OpConstant 0 
                                Private bool* %77 = OpVariable Private 
                               Private f32_4* %81 = OpVariable Private 
                                 Input f32_4* %89 = OpVariable Input 
                                          i32 %92 = OpConstant 3 
                                         i32 %120 = OpConstant 0 
                                         i32 %121 = OpConstant 1 
                                         u32 %162 = OpConstant 1 
                                             %163 = OpTypeArray %9 %162 
                                             %164 = OpTypeStruct %11 %9 %163 
                                             %165 = OpTypePointer Output %164 
        Output struct {f32_4; f32; f32[1];}* %166 = OpVariable Output 
                                             %174 = OpTypePointer Output %11 
                                             %176 = OpTypePointer Output %33 
                               Output f32_2* %177 = OpVariable Output 
                                Input f32_4* %178 = OpVariable Input 
                                         i32 %181 = OpConstant 5 
                               Output f32_4* %209 = OpVariable Output 
                                             %217 = OpTypePointer Output %9 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %23 = OpVariable Function 
                              Function f32_3* %58 = OpVariable Function 
                                Function f32* %82 = OpVariable Function 
                             Function f32_3* %103 = OpVariable Function 
                                   Input f32* %17 = OpAccessChain %13 %15 
                                          f32 %18 = OpLoad %17 
                                         bool %19 = OpFOrdLessThan %10 %18 
                                                      OpStore %8 %19 
                                         bool %24 = OpLoad %8 
                                                      OpSelectionMerge %26 None 
                                                      OpBranchConditional %24 %25 %28 
                                              %25 = OpLabel 
                                                      OpStore %23 %27 
                                                      OpBranch %26 
                                              %28 = OpLabel 
                                                      OpStore %23 %10 
                                                      OpBranch %26 
                                              %26 = OpLabel 
                                          f32 %29 = OpLoad %23 
                                 Private f32* %31 = OpAccessChain %21 %15 
                                                      OpStore %31 %29 
                                        f32_4 %34 = OpLoad %32 
                                        f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               Uniform f32_4* %46 = OpAccessChain %42 %44 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFMul %35 %48 
                               Uniform f32_4* %50 = OpAccessChain %42 %44 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 3 
                                        f32_2 %53 = OpFAdd %49 %52 
                                        f32_4 %54 = OpLoad %21 
                                        f32_4 %55 = OpVectorShuffle %54 %53 4 5 2 3 
                                                      OpStore %21 %55 
                               Uniform u32_4* %62 = OpAccessChain %42 %59 
                                        u32_4 %63 = OpLoad %62 
                                          u32 %64 = OpCompositeExtract %63 0 
                                         bool %66 = OpINotEqual %64 %65 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %66 %67 %71 
                                              %67 = OpLabel 
                                        f32_4 %69 = OpLoad %21 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                                                      OpStore %58 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %13 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %58 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %58 
                                        f32_4 %75 = OpLoad %21 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %21 %76 
                                 Private f32* %78 = OpAccessChain %21 %15 
                                          f32 %79 = OpLoad %78 
                                         bool %80 = OpFOrdLessThan %10 %79 
                                                      OpStore %77 %80 
                                         bool %83 = OpLoad %77 
                                                      OpSelectionMerge %85 None 
                                                      OpBranchConditional %83 %84 %86 
                                              %84 = OpLabel 
                                                      OpStore %82 %27 
                                                      OpBranch %85 
                                              %86 = OpLabel 
                                                      OpStore %82 %10 
                                                      OpBranch %85 
                                              %85 = OpLabel 
                                          f32 %87 = OpLoad %82 
                                 Private f32* %88 = OpAccessChain %81 %15 
                                                      OpStore %88 %87 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                               Uniform f32_4* %93 = OpAccessChain %42 %92 
                                        f32_4 %94 = OpLoad %93 
                                        f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                        f32_2 %96 = OpFMul %91 %95 
                               Uniform f32_4* %97 = OpAccessChain %42 %92 
                                        f32_4 %98 = OpLoad %97 
                                        f32_2 %99 = OpVectorShuffle %98 %98 2 3 
                                       f32_2 %100 = OpFAdd %96 %99 
                                       f32_4 %101 = OpLoad %81 
                                       f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                      OpStore %81 %102 
                              Uniform u32_4* %104 = OpAccessChain %42 %59 
                                       u32_4 %105 = OpLoad %104 
                                         u32 %106 = OpCompositeExtract %105 1 
                                        bool %107 = OpINotEqual %106 %65 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                       f32_4 %110 = OpLoad %81 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                                      OpStore %103 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                       f32_4 %113 = OpLoad %21 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                                      OpStore %103 %114 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                       f32_3 %115 = OpLoad %103 
                                       f32_4 %116 = OpLoad %21 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %21 %117 
                                       f32_4 %118 = OpLoad %21 
                                       f32_4 %119 = OpVectorShuffle %118 %118 1 1 1 1 
                              Uniform f32_4* %122 = OpAccessChain %42 %120 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpFMul %119 %123 
                                                      OpStore %81 %124 
                              Uniform f32_4* %125 = OpAccessChain %42 %120 %120 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %21 
                                       f32_4 %128 = OpVectorShuffle %127 %127 0 0 0 0 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %81 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %81 %131 
                              Uniform f32_4* %132 = OpAccessChain %42 %120 %44 
                                       f32_4 %133 = OpLoad %132 
                                       f32_4 %134 = OpLoad %21 
                                       f32_4 %135 = OpVectorShuffle %134 %134 2 2 2 2 
                                       f32_4 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %81 
                                       f32_4 %138 = OpFAdd %136 %137 
                                                      OpStore %21 %138 
                                       f32_4 %139 = OpLoad %21 
                              Uniform f32_4* %140 = OpAccessChain %42 %120 %92 
                                       f32_4 %141 = OpLoad %140 
                                       f32_4 %142 = OpFAdd %139 %141 
                                                      OpStore %21 %142 
                                       f32_4 %143 = OpLoad %21 
                                       f32_4 %144 = OpVectorShuffle %143 %143 1 1 1 1 
                              Uniform f32_4* %145 = OpAccessChain %42 %121 %121 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %81 %147 
                              Uniform f32_4* %148 = OpAccessChain %42 %121 %120 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %21 
                                       f32_4 %151 = OpVectorShuffle %150 %150 0 0 0 0 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %81 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %81 %154 
                              Uniform f32_4* %155 = OpAccessChain %42 %121 %44 
                                       f32_4 %156 = OpLoad %155 
                                       f32_4 %157 = OpLoad %21 
                                       f32_4 %158 = OpVectorShuffle %157 %157 2 2 2 2 
                                       f32_4 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %81 
                                       f32_4 %161 = OpFAdd %159 %160 
                                                      OpStore %81 %161 
                              Uniform f32_4* %167 = OpAccessChain %42 %121 %92 
                                       f32_4 %168 = OpLoad %167 
                                       f32_4 %169 = OpLoad %21 
                                       f32_4 %170 = OpVectorShuffle %169 %169 3 3 3 3 
                                       f32_4 %171 = OpFMul %168 %170 
                                       f32_4 %172 = OpLoad %81 
                                       f32_4 %173 = OpFAdd %171 %172 
                               Output f32_4* %175 = OpAccessChain %166 %120 
                                                      OpStore %175 %173 
                                       f32_4 %179 = OpLoad %178 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                              Uniform f32_4* %182 = OpAccessChain %42 %181 
                                       f32_4 %183 = OpLoad %182 
                                       f32_2 %184 = OpVectorShuffle %183 %183 0 1 
                                       f32_2 %185 = OpFMul %180 %184 
                              Uniform f32_4* %186 = OpAccessChain %42 %181 
                                       f32_4 %187 = OpLoad %186 
                                       f32_2 %188 = OpVectorShuffle %187 %187 2 3 
                                       f32_2 %189 = OpFAdd %185 %188 
                                                      OpStore %177 %189 
                                       f32_4 %190 = OpLoad %13 
                                       f32_4 %191 = OpVectorShuffle %190 %190 1 1 1 1 
                              Uniform f32_4* %192 = OpAccessChain %42 %120 %121 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpFMul %191 %193 
                                                      OpStore %21 %194 
                              Uniform f32_4* %195 = OpAccessChain %42 %120 %120 
                                       f32_4 %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %13 
                                       f32_4 %198 = OpVectorShuffle %197 %197 0 0 0 0 
                                       f32_4 %199 = OpFMul %196 %198 
                                       f32_4 %200 = OpLoad %21 
                                       f32_4 %201 = OpFAdd %199 %200 
                                                      OpStore %21 %201 
                              Uniform f32_4* %202 = OpAccessChain %42 %120 %44 
                                       f32_4 %203 = OpLoad %202 
                                       f32_4 %204 = OpLoad %13 
                                       f32_4 %205 = OpVectorShuffle %204 %204 2 2 2 2 
                                       f32_4 %206 = OpFMul %203 %205 
                                       f32_4 %207 = OpLoad %21 
                                       f32_4 %208 = OpFAdd %206 %207 
                                                      OpStore %21 %208 
                              Uniform f32_4* %210 = OpAccessChain %42 %120 %92 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %13 
                                       f32_4 %213 = OpVectorShuffle %212 %212 3 3 3 3 
                                       f32_4 %214 = OpFMul %211 %213 
                                       f32_4 %215 = OpLoad %21 
                                       f32_4 %216 = OpFAdd %214 %215 
                                                      OpStore %209 %216 
                                 Output f32* %218 = OpAccessChain %166 %120 %162 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFNegate %219 
                                 Output f32* %221 = OpAccessChain %166 %120 %162 
                                                      OpStore %221 %220 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 321
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %307 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpMemberDecorate %54 0 Offset 54 
                                                      OpMemberDecorate %54 1 Offset 54 
                                                      OpMemberDecorate %54 2 Offset 54 
                                                      OpMemberDecorate %54 3 Offset 54 
                                                      OpMemberDecorate %54 4 Offset 54 
                                                      OpMemberDecorate %54 5 Offset 54 
                                                      OpMemberDecorate %54 6 Offset 54 
                                                      OpMemberDecorate %54 7 Offset 54 
                                                      OpMemberDecorate %54 8 Offset 54 
                                                      OpMemberDecorate %54 9 RelaxedPrecision 
                                                      OpMemberDecorate %54 9 Offset 54 
                                                      OpDecorate %54 Block 
                                                      OpDecorate %56 DescriptorSet 56 
                                                      OpDecorate %56 Binding 56 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %115 RelaxedPrecision 
                                                      OpDecorate %117 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                          u32 %30 = OpConstant 0 
                                              %32 = OpTypeBool 
                                              %33 = OpTypePointer Private %32 
                                Private bool* %34 = OpVariable Private 
                                          f32 %37 = OpConstant 3.67402E-40 
                                              %40 = OpTypeInt 32 1 
                                          i32 %41 = OpConstant 0 
                                          i32 %42 = OpConstant 1 
                                          i32 %44 = OpConstant -1 
                                 Private f32* %50 = OpVariable Private 
                                              %53 = OpTypeVector %23 4 
                                              %54 = OpTypeStruct %6 %6 %7 %6 %7 %53 %6 %6 %6 %6 
                                              %55 = OpTypePointer Uniform %54 
Uniform struct {f32; f32; f32_4; f32; f32_4; u32_4; f32; f32; f32; f32;}* %56 = OpVariable Uniform 
                                          i32 %57 = OpConstant 9 
                                              %58 = OpTypePointer Uniform %6 
                                Private bool* %63 = OpVariable Private 
                                 Private f32* %73 = OpVariable Private 
                                          f32 %76 = OpConstant 3.67402E-40 
                                          f32 %77 = OpConstant 3.67402E-40 
                                          f32 %78 = OpConstant 3.67402E-40 
                                        f32_3 %79 = OpConstantComposite %76 %77 %78 
                               Private f32_4* %81 = OpVariable Private 
                                          f32 %92 = OpConstant 3.67402E-40 
                                        f32_2 %93 = OpConstantComposite %92 %92 
                                         u32 %103 = OpConstant 1 
                                         f32 %116 = OpConstant 3.67402E-40 
                              Private f32_3* %141 = OpVariable Private 
                                         i32 %144 = OpConstant 2 
                                             %145 = OpTypePointer Uniform %7 
                                Private f32* %158 = OpVariable Private 
                                         u32 %164 = OpConstant 2 
                                         i32 %175 = OpConstant 3 
                                             %179 = OpTypePointer Function %6 
                                         f32 %191 = OpConstant 3.67402E-40 
                                       f32_3 %192 = OpConstantComposite %191 %191 %191 
                                         f32 %194 = OpConstant 3.67402E-40 
                                       f32_3 %195 = OpConstantComposite %194 %194 %194 
                                         f32 %200 = OpConstant 3.67402E-40 
                                       f32_3 %201 = OpConstantComposite %200 %200 %200 
                                       f32_4 %206 = OpConstantComposite %37 %37 %37 %37 
                                         i32 %207 = OpConstant 8 
                                             %211 = OpTypeVector %32 4 
                                             %214 = OpTypePointer Function %20 
                                         f32 %227 = OpConstant 3.67402E-40 
                                         f32 %228 = OpConstant 3.67402E-40 
                                         f32 %229 = OpConstant 3.67402E-40 
                                       f32_3 %230 = OpConstantComposite %227 %228 %229 
                                         i32 %234 = OpConstant 4 
                              Private f32_3* %243 = OpVariable Private 
                                         i32 %254 = OpConstant 6 
                                         i32 %266 = OpConstant 7 
                              Private f32_4* %279 = OpVariable Private 
                                         i32 %281 = OpConstant 5 
                                             %282 = OpTypePointer Uniform %53 
                                       f32_3 %291 = OpConstantComposite %37 %37 %37 
                                             %306 = OpTypePointer Output %7 
                               Output f32_4* %307 = OpVariable Output 
                                             %308 = OpTypePointer Function %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %180 = OpVariable Function 
                             Function f32_3* %215 = OpVariable Function 
                             Function f32_3* %280 = OpVariable Function 
                               Function f32* %295 = OpVariable Function 
                             Function f32_4* %309 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                          f32 %29 = OpFAdd %27 %28 
                                 Private f32* %31 = OpAccessChain %22 %30 
                                                      OpStore %31 %29 
                                 Private f32* %35 = OpAccessChain %22 %30 
                                          f32 %36 = OpLoad %35 
                                         bool %38 = OpFOrdLessThan %36 %37 
                                                      OpStore %34 %38 
                                         bool %39 = OpLoad %34 
                                          i32 %43 = OpSelect %39 %42 %41 
                                          i32 %45 = OpIMul %43 %44 
                                         bool %46 = OpINotEqual %45 %41 
                                                      OpSelectionMerge %48 None 
                                                      OpBranchConditional %46 %47 %48 
                                              %47 = OpLabel 
                                                      OpKill
                                              %48 = OpLabel 
                                 Private f32* %51 = OpAccessChain %9 %24 
                                          f32 %52 = OpLoad %51 
                                 Uniform f32* %59 = OpAccessChain %56 %57 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFNegate %60 
                                          f32 %62 = OpFAdd %52 %61 
                                                      OpStore %50 %62 
                                          f32 %64 = OpLoad %50 
                                         bool %65 = OpFOrdLessThan %64 %37 
                                                      OpStore %63 %65 
                                         bool %66 = OpLoad %63 
                                          i32 %67 = OpSelect %66 %42 %41 
                                          i32 %68 = OpIMul %67 %44 
                                         bool %69 = OpINotEqual %68 %41 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                                        f32_4 %74 = OpLoad %9 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                          f32 %80 = OpDot %75 %79 
                                                      OpStore %73 %80 
                                          f32 %82 = OpLoad %73 
                                        f32_2 %83 = OpCompositeConstruct %82 %82 
                                        f32_2 %84 = OpFNegate %83 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 2 
                                        f32_2 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %81 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 2 3 
                                                      OpStore %81 %89 
                                        f32_4 %90 = OpLoad %81 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_2 %94 = OpFMul %91 %93 
                                        f32_2 %95 = OpFAdd %94 %93 
                                        f32_4 %96 = OpLoad %81 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %81 %97 
                                 Private f32* %98 = OpAccessChain %81 %30 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFNegate %99 
                                         f32 %101 = OpFMul %100 %76 
                                         f32 %102 = OpFAdd %101 %92 
                                                      OpStore %73 %102 
                                Private f32* %104 = OpAccessChain %81 %103 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                         f32 %107 = OpFMul %106 %78 
                                         f32 %108 = OpLoad %73 
                                         f32 %109 = OpFAdd %107 %108 
                                                      OpStore %73 %109 
                                       f32_4 %110 = OpLoad %81 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_2 %112 = OpExtInst %1 30 %111 
                                       f32_3 %113 = OpLoad %22 
                                       f32_3 %114 = OpVectorShuffle %113 %112 3 1 4 
                                                      OpStore %22 %114 
                                         f32 %115 = OpLoad %73 
                                         f32 %117 = OpFMul %115 %116 
                                                      OpStore %73 %117 
                                         f32 %118 = OpLoad %73 
                                         f32 %119 = OpExtInst %1 30 %118 
                                Private f32* %120 = OpAccessChain %22 %103 
                                                      OpStore %120 %119 
                                       f32_3 %121 = OpLoad %22 
                                Uniform f32* %122 = OpAccessChain %56 %42 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %124 = OpAccessChain %56 %42 
                                         f32 %125 = OpLoad %124 
                                Uniform f32* %126 = OpAccessChain %56 %42 
                                         f32 %127 = OpLoad %126 
                                       f32_3 %128 = OpCompositeConstruct %123 %125 %127 
                                         f32 %129 = OpCompositeExtract %128 0 
                                         f32 %130 = OpCompositeExtract %128 1 
                                         f32 %131 = OpCompositeExtract %128 2 
                                       f32_3 %132 = OpCompositeConstruct %129 %130 %131 
                                       f32_3 %133 = OpFMul %121 %132 
                                                      OpStore %22 %133 
                                       f32_3 %134 = OpLoad %22 
                                       f32_3 %135 = OpExtInst %1 29 %134 
                                                      OpStore %22 %135 
                                       f32_3 %136 = OpLoad %22 
                                Uniform f32* %137 = OpAccessChain %56 %41 
                                         f32 %138 = OpLoad %137 
                                       f32_3 %139 = OpCompositeConstruct %138 %138 %138 
                                       f32_3 %140 = OpFMul %136 %139 
                                                      OpStore %22 %140 
                                       f32_4 %142 = OpLoad %9 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                              Uniform f32_4* %146 = OpAccessChain %56 %144 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFNegate %148 
                                       f32_3 %150 = OpFAdd %143 %149 
                                                      OpStore %141 %150 
                                       f32_3 %151 = OpLoad %141 
                                       f32_2 %152 = OpVectorShuffle %151 %151 0 1 
                                       f32_3 %153 = OpLoad %141 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFMul %152 %154 
                                       f32_3 %156 = OpLoad %141 
                                       f32_3 %157 = OpVectorShuffle %156 %155 3 4 2 
                                                      OpStore %141 %157 
                                Private f32* %159 = OpAccessChain %141 %103 
                                         f32 %160 = OpLoad %159 
                                Private f32* %161 = OpAccessChain %141 %30 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFAdd %160 %162 
                                                      OpStore %158 %163 
                                Private f32* %165 = OpAccessChain %141 %164 
                                         f32 %166 = OpLoad %165 
                                Private f32* %167 = OpAccessChain %141 %164 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                         f32 %170 = OpLoad %158 
                                         f32 %171 = OpFAdd %169 %170 
                                                      OpStore %158 %171 
                                         f32 %172 = OpLoad %158 
                                         f32 %173 = OpExtInst %1 31 %172 
                                                      OpStore %158 %173 
                                         f32 %174 = OpLoad %158 
                                Uniform f32* %176 = OpAccessChain %56 %175 
                                         f32 %177 = OpLoad %176 
                                        bool %178 = OpFOrdLessThan %174 %177 
                                                      OpStore %63 %178 
                                        bool %181 = OpLoad %63 
                                                      OpSelectionMerge %183 None 
                                                      OpBranchConditional %181 %182 %184 
                                             %182 = OpLabel 
                                                      OpStore %180 %92 
                                                      OpBranch %183 
                                             %184 = OpLabel 
                                                      OpStore %180 %37 
                                                      OpBranch %183 
                                             %183 = OpLabel 
                                         f32 %185 = OpLoad %180 
                                                      OpStore %158 %185 
                                         f32 %186 = OpLoad %158 
                                       f32_3 %187 = OpCompositeConstruct %186 %186 %186 
                                       f32_3 %188 = OpLoad %22 
                                       f32_3 %189 = OpFMul %187 %188 
                                                      OpStore %22 %189 
                                       f32_3 %190 = OpLoad %22 
                                       f32_3 %193 = OpFMul %190 %192 
                                       f32_3 %196 = OpFAdd %193 %195 
                                                      OpStore %141 %196 
                                       f32_3 %197 = OpLoad %22 
                                       f32_3 %198 = OpLoad %141 
                                       f32_3 %199 = OpFMul %197 %198 
                                       f32_3 %202 = OpFAdd %199 %201 
                                                      OpStore %141 %202 
                                       f32_3 %203 = OpLoad %22 
                                       f32_3 %204 = OpLoad %141 
                                       f32_3 %205 = OpFMul %203 %204 
                                                      OpStore %141 %205 
                                Uniform f32* %208 = OpAccessChain %56 %207 
                                         f32 %209 = OpLoad %208 
                                       f32_4 %210 = OpCompositeConstruct %209 %209 %209 %209 
                                      bool_4 %212 = OpFOrdNotEqual %206 %210 
                                        bool %213 = OpAny %212 
                                                      OpStore %63 %213 
                                        bool %216 = OpLoad %63 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %216 %217 %220 
                                             %217 = OpLabel 
                                       f32_3 %219 = OpLoad %22 
                                                      OpStore %215 %219 
                                                      OpBranch %218 
                                             %220 = OpLabel 
                                       f32_3 %221 = OpLoad %141 
                                                      OpStore %215 %221 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                       f32_3 %222 = OpLoad %215 
                                       f32_4 %223 = OpLoad %81 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 6 3 
                                                      OpStore %81 %224 
                                       f32_4 %225 = OpLoad %9 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                         f32 %231 = OpDot %226 %230 
                                                      OpStore %50 %231 
                                         f32 %232 = OpLoad %50 
                                       f32_3 %233 = OpCompositeConstruct %232 %232 %232 
                              Uniform f32_4* %235 = OpAccessChain %56 %234 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpFMul %233 %237 
                                       f32_4 %239 = OpLoad %9 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 1 2 
                                       f32_3 %241 = OpFNegate %240 
                                       f32_3 %242 = OpFAdd %238 %241 
                                                      OpStore %141 %242 
                              Uniform f32_4* %244 = OpAccessChain %56 %234 
                                       f32_4 %245 = OpLoad %244 
                                       f32_3 %246 = OpVectorShuffle %245 %245 3 3 3 
                                       f32_3 %247 = OpLoad %141 
                                       f32_3 %248 = OpFMul %246 %247 
                                       f32_4 %249 = OpLoad %9 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpFAdd %248 %250 
                                                      OpStore %243 %251 
                                       f32_3 %252 = OpLoad %243 
                                       f32_3 %253 = OpExtInst %1 30 %252 
                                                      OpStore %243 %253 
                                Uniform f32* %255 = OpAccessChain %56 %254 
                                         f32 %256 = OpLoad %255 
                                                      OpStore %158 %256 
                                         f32 %257 = OpLoad %158 
                                         f32 %258 = OpExtInst %1 43 %257 %37 %92 
                                                      OpStore %158 %258 
                                       f32_3 %259 = OpLoad %243 
                                         f32 %260 = OpLoad %158 
                                       f32_3 %261 = OpCompositeConstruct %260 %260 %260 
                                       f32_3 %262 = OpFMul %259 %261 
                                                      OpStore %243 %262 
                                       f32_3 %263 = OpLoad %243 
                                       f32_3 %264 = OpExtInst %1 29 %263 
                                                      OpStore %243 %264 
                                       f32_3 %265 = OpLoad %243 
                                Uniform f32* %267 = OpAccessChain %56 %266 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %269 = OpAccessChain %56 %266 
                                         f32 %270 = OpLoad %269 
                                Uniform f32* %271 = OpAccessChain %56 %266 
                                         f32 %272 = OpLoad %271 
                                       f32_3 %273 = OpCompositeConstruct %268 %270 %272 
                                         f32 %274 = OpCompositeExtract %273 0 
                                         f32 %275 = OpCompositeExtract %273 1 
                                         f32 %276 = OpCompositeExtract %273 2 
                                       f32_3 %277 = OpCompositeConstruct %274 %275 %276 
                                       f32_3 %278 = OpExtInst %1 37 %265 %277 
                                                      OpStore %243 %278 
                              Uniform u32_4* %283 = OpAccessChain %56 %281 
                                       u32_4 %284 = OpLoad %283 
                                         u32 %285 = OpCompositeExtract %284 0 
                                        bool %286 = OpINotEqual %285 %30 
                                                      OpSelectionMerge %288 None 
                                                      OpBranchConditional %286 %287 %290 
                                             %287 = OpLabel 
                                       f32_3 %289 = OpLoad %243 
                                                      OpStore %280 %289 
                                                      OpBranch %288 
                                             %290 = OpLabel 
                                                      OpStore %280 %291 
                                                      OpBranch %288 
                                             %288 = OpLabel 
                                       f32_3 %292 = OpLoad %280 
                                       f32_4 %293 = OpLoad %279 
                                       f32_4 %294 = OpVectorShuffle %293 %292 4 5 6 3 
                                                      OpStore %279 %294 
                              Uniform u32_4* %296 = OpAccessChain %56 %281 
                                       u32_4 %297 = OpLoad %296 
                                         u32 %298 = OpCompositeExtract %297 0 
                                        bool %299 = OpINotEqual %298 %30 
                                                      OpSelectionMerge %301 None 
                                                      OpBranchConditional %299 %300 %302 
                                             %300 = OpLabel 
                                                      OpStore %295 %92 
                                                      OpBranch %301 
                                             %302 = OpLabel 
                                                      OpStore %295 %37 
                                                      OpBranch %301 
                                             %301 = OpLabel 
                                         f32 %303 = OpLoad %295 
                                Private f32* %304 = OpAccessChain %279 %24 
                                                      OpStore %304 %303 
                                Private f32* %305 = OpAccessChain %81 %24 
                                                      OpStore %305 %92 
                              Uniform u32_4* %310 = OpAccessChain %56 %281 
                                       u32_4 %311 = OpLoad %310 
                                         u32 %312 = OpCompositeExtract %311 1 
                                        bool %313 = OpINotEqual %312 %30 
                                                      OpSelectionMerge %315 None 
                                                      OpBranchConditional %313 %314 %317 
                                             %314 = OpLabel 
                                       f32_4 %316 = OpLoad %81 
                                                      OpStore %309 %316 
                                                      OpBranch %315 
                                             %317 = OpLabel 
                                       f32_4 %318 = OpLoad %279 
                                                      OpStore %309 %318 
                                                      OpBranch %315 
                                             %315 = OpLabel 
                                       f32_4 %319 = OpLoad %309 
                                                      OpStore %307 %319 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
Fallback "tk2d/BlendVertexColor"
}