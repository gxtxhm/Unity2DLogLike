//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/HighPriestAfterImage" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_DashColor ("Dash Color", Color) = (1,0,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Opacity ("Opacity", Float) = 1
_EmissivePower ("Emissive Power", Float) = 0
_EmissiveColorPower ("Emissive Color Power", Float) = 7
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 52799
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
uniform 	vec4 _DashColor;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    u_xlat1.w = u_xlat10_0.w * _Opacity;
    u_xlat2.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = log2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb15){
        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15 = u_xlat3.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat17);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat15 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat1 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(vec3(_Opacity, _Opacity, _Opacity)) + u_xlat0.xyz;
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
; Bound: 307
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %130 %243 %283 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %43 ArrayStride 43 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpMemberDecorate %44 6 Offset 44 
                                                      OpMemberDecorate %44 7 Offset 44 
                                                      OpMemberDecorate %44 8 Offset 44 
                                                      OpMemberDecorate %44 9 Offset 44 
                                                      OpMemberDecorate %44 10 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %121 SpecId 121 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %283 Location 283 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
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
                               Private f32_4* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypeInt 32 0 
                                          u32 %36 = OpConstant 0 
                                              %38 = OpTypePointer Private %22 
                               Private f32_3* %39 = OpVariable Private 
                                          u32 %42 = OpConstant 4 
                                              %43 = OpTypeArray %7 %42 
                                              %44 = OpTypeStruct %7 %7 %43 %22 %22 %7 %7 %6 %6 %6 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32; f32; f32_4;}* %46 = OpVariable Uniform 
                                              %47 = OpTypeInt 32 1 
                                          i32 %48 = OpConstant 6 
                                              %49 = OpTypePointer Uniform %7 
                               Private f32_4* %59 = OpVariable Private 
                                          u32 %60 = OpConstant 3 
                                          i32 %63 = OpConstant 9 
                                              %64 = OpTypePointer Uniform %6 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %72 = OpConstant 10 
                                          i32 %87 = OpConstant 8 
                                         i32 %103 = OpConstant 7 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                        bool %115 = OpConstantFalse 
                                        bool %121 = OpSpecConstantFalse 
                                         u32 %124 = OpConstant 1 
                              Private f32_4* %128 = OpVariable Private 
                                             %129 = OpTypePointer Input %22 
                                Input f32_3* %130 = OpVariable Input 
                                         i32 %133 = OpConstant 2 
                                         i32 %140 = OpConstant 0 
                                         i32 %165 = OpConstant 3 
                                             %172 = OpTypePointer Function %22 
                                         i32 %186 = OpConstant 4 
                                             %187 = OpTypePointer Uniform %22 
                                Private f32* %201 = OpVariable Private 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                Private f32* %234 = OpVariable Private 
                                         f32 %240 = OpConstant 3.67402E-40 
                                Input f32_3* %243 = OpVariable Input 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %250 = OpConstant 5 
                              Private f32_3* %255 = OpVariable Private 
                                             %282 = OpTypePointer Output %7 
                               Output f32_4* %283 = OpVariable Output 
                                             %304 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                 Private f32* %37 = OpAccessChain %30 %36 
                                                      OpStore %37 %34 
                                        f32_4 %40 = OpLoad %30 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 0 0 
                               Uniform f32_4* %50 = OpAccessChain %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                        f32_3 %53 = OpFNegate %52 
                                        f32_3 %54 = OpFMul %41 %53 
                               Uniform f32_4* %55 = OpAccessChain %46 %48 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_3 %58 = OpFAdd %54 %57 
                                                      OpStore %39 %58 
                                 Private f32* %61 = OpAccessChain %9 %60 
                                          f32 %62 = OpLoad %61 
                                 Uniform f32* %65 = OpAccessChain %46 %63 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %62 %66 
                                 Private f32* %68 = OpAccessChain %59 %60 
                                                      OpStore %68 %67 
                                        f32_3 %70 = OpLoad %39 
                                        f32_3 %71 = OpFNegate %70 
                               Uniform f32_4* %73 = OpAccessChain %46 %72 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %71 %75 
                                                      OpStore %69 %76 
                               Uniform f32_4* %77 = OpAccessChain %46 %72 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 3 3 3 
                                        f32_3 %80 = OpLoad %69 
                                        f32_3 %81 = OpFMul %79 %80 
                                        f32_3 %82 = OpLoad %39 
                                        f32_3 %83 = OpFAdd %81 %82 
                                                      OpStore %39 %83 
                                        f32_3 %84 = OpLoad %39 
                                        f32_3 %85 = OpExtInst %1 30 %84 
                                                      OpStore %69 %85 
                                        f32_3 %86 = OpLoad %69 
                                 Uniform f32* %88 = OpAccessChain %46 %87 
                                          f32 %89 = OpLoad %88 
                                 Uniform f32* %90 = OpAccessChain %46 %87 
                                          f32 %91 = OpLoad %90 
                                 Uniform f32* %92 = OpAccessChain %46 %87 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %89 %91 %93 
                                          f32 %95 = OpCompositeExtract %94 0 
                                          f32 %96 = OpCompositeExtract %94 1 
                                          f32 %97 = OpCompositeExtract %94 2 
                                        f32_3 %98 = OpCompositeConstruct %95 %96 %97 
                                        f32_3 %99 = OpFMul %86 %98 
                                                      OpStore %69 %99 
                                       f32_3 %100 = OpLoad %69 
                                       f32_3 %101 = OpExtInst %1 29 %100 
                                                      OpStore %69 %101 
                                       f32_3 %102 = OpLoad %69 
                                Uniform f32* %104 = OpAccessChain %46 %103 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
                                       f32_3 %107 = OpFMul %102 %106 
                                                      OpStore %69 %107 
                                Uniform f32* %112 = OpAccessChain %46 %111 %36 
                                         f32 %113 = OpLoad %112 
                                        bool %114 = OpFOrdEqual %113 %33 
                                                      OpStore %110 %114 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %117 
                                             %116 = OpLabel 
                                        bool %118 = OpLoad %110 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpBranch %120 
                                             %120 = OpLabel 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %229 
                                             %122 = OpLabel 
                                Uniform f32* %125 = OpAccessChain %46 %111 %124 
                                         f32 %126 = OpLoad %125 
                                        bool %127 = OpFOrdEqual %126 %33 
                                                      OpStore %110 %127 
                                       f32_3 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 1 1 1 
                              Uniform f32_4* %134 = OpAccessChain %46 %133 %111 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFMul %132 %136 
                                       f32_4 %138 = OpLoad %128 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %128 %139 
                              Uniform f32_4* %141 = OpAccessChain %46 %133 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %130 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %128 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %146 %148 
                                       f32_4 %150 = OpLoad %128 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %128 %151 
                              Uniform f32_4* %152 = OpAccessChain %46 %133 %133 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpVectorShuffle %155 %155 2 2 2 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %128 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %128 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %128 %162 
                                       f32_4 %163 = OpLoad %128 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %46 %133 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %164 %168 
                                       f32_4 %170 = OpLoad %128 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %128 %171 
                                        bool %174 = OpLoad %110 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %128 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %130 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %128 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %128 %183 
                                       f32_4 %184 = OpLoad %128 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %46 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %128 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %128 %193 
                                       f32_4 %194 = OpLoad %128 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %196 = OpAccessChain %46 %165 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %128 
                                       f32_4 %200 = OpVectorShuffle %199 %198 0 4 5 6 
                                                      OpStore %128 %200 
                                Private f32* %202 = OpAccessChain %128 %124 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %201 %207 
                                Uniform f32* %210 = OpAccessChain %46 %111 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %201 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %128 %36 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %128 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %128 %226 
                                       f32_4 %228 = OpLoad %128 
                                                      OpStore %227 %228 
                                                      OpBranch %123 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %36 
                                                      OpStore %230 %33 
                                Private f32* %231 = OpAccessChain %227 %124 
                                                      OpStore %231 %33 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %33 
                                Private f32* %233 = OpAccessChain %227 %60 
                                                      OpStore %233 %33 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_4 %235 = OpLoad %227 
                              Uniform f32_4* %236 = OpAccessChain %46 %140 
                                       f32_4 %237 = OpLoad %236 
                                         f32 %238 = OpDot %235 %237 
                                                      OpStore %234 %238 
                                         f32 %239 = OpLoad %234 
                                         f32 %241 = OpExtInst %1 43 %239 %240 %33 
                                                      OpStore %234 %241 
                                       f32_3 %242 = OpLoad %39 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %227 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %227 %247 
                                       f32_3 %249 = OpLoad %39 
                              Uniform f32_4* %251 = OpAccessChain %46 %250 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpFMul %249 %253 
                                                      OpStore %248 %254 
                                         f32 %256 = OpLoad %234 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %255 %259 
                                       f32_3 %260 = OpLoad %248 
                                       f32_3 %261 = OpFNegate %260 
                                         f32 %262 = OpLoad %234 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpFMul %261 %263 
                              Uniform f32_4* %265 = OpAccessChain %46 %72 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFAdd %264 %267 
                                                      OpStore %39 %268 
                              Uniform f32_4* %269 = OpAccessChain %46 %72 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 3 3 3 
                                       f32_3 %272 = OpLoad %39 
                                       f32_3 %273 = OpFMul %271 %272 
                                       f32_3 %274 = OpLoad %255 
                                       f32_3 %275 = OpFAdd %273 %274 
                                       f32_4 %276 = OpLoad %59 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %59 %277 
                                Private f32* %278 = OpAccessChain %227 %60 
                                                      OpStore %278 %240 
                                       f32_4 %279 = OpLoad %59 
                                       f32_4 %280 = OpLoad %227 
                                       f32_4 %281 = OpFAdd %279 %280 
                                                      OpStore %30 %281 
                                       f32_3 %284 = OpLoad %69 
                                Uniform f32* %285 = OpAccessChain %46 %63 
                                         f32 %286 = OpLoad %285 
                                Uniform f32* %287 = OpAccessChain %46 %63 
                                         f32 %288 = OpLoad %287 
                                Uniform f32* %289 = OpAccessChain %46 %63 
                                         f32 %290 = OpLoad %289 
                                       f32_3 %291 = OpCompositeConstruct %286 %288 %290 
                                         f32 %292 = OpCompositeExtract %291 0 
                                         f32 %293 = OpCompositeExtract %291 1 
                                         f32 %294 = OpCompositeExtract %291 2 
                                       f32_3 %295 = OpCompositeConstruct %292 %293 %294 
                                       f32_3 %296 = OpFMul %284 %295 
                                       f32_4 %297 = OpLoad %30 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpFAdd %296 %298 
                                       f32_4 %300 = OpLoad %283 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %283 %301 
                                Private f32* %302 = OpAccessChain %30 %60 
                                         f32 %303 = OpLoad %302 
                                 Output f32* %305 = OpAccessChain %283 %60 
                                                      OpStore %305 %303 
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
uniform 	vec4 _DashColor;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    u_xlat1.w = u_xlat10_0.w * _Opacity;
    u_xlat2.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = log2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb15){
        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15 = u_xlat3.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat17);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat15 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat1 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(vec3(_Opacity, _Opacity, _Opacity)) + u_xlat0.xyz;
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
; Bound: 307
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %130 %243 %283 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %43 ArrayStride 43 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpMemberDecorate %44 6 Offset 44 
                                                      OpMemberDecorate %44 7 Offset 44 
                                                      OpMemberDecorate %44 8 Offset 44 
                                                      OpMemberDecorate %44 9 Offset 44 
                                                      OpMemberDecorate %44 10 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %121 SpecId 121 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %283 Location 283 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
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
                               Private f32_4* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypeInt 32 0 
                                          u32 %36 = OpConstant 0 
                                              %38 = OpTypePointer Private %22 
                               Private f32_3* %39 = OpVariable Private 
                                          u32 %42 = OpConstant 4 
                                              %43 = OpTypeArray %7 %42 
                                              %44 = OpTypeStruct %7 %7 %43 %22 %22 %7 %7 %6 %6 %6 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32; f32; f32_4;}* %46 = OpVariable Uniform 
                                              %47 = OpTypeInt 32 1 
                                          i32 %48 = OpConstant 6 
                                              %49 = OpTypePointer Uniform %7 
                               Private f32_4* %59 = OpVariable Private 
                                          u32 %60 = OpConstant 3 
                                          i32 %63 = OpConstant 9 
                                              %64 = OpTypePointer Uniform %6 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %72 = OpConstant 10 
                                          i32 %87 = OpConstant 8 
                                         i32 %103 = OpConstant 7 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                        bool %115 = OpConstantFalse 
                                        bool %121 = OpSpecConstantFalse 
                                         u32 %124 = OpConstant 1 
                              Private f32_4* %128 = OpVariable Private 
                                             %129 = OpTypePointer Input %22 
                                Input f32_3* %130 = OpVariable Input 
                                         i32 %133 = OpConstant 2 
                                         i32 %140 = OpConstant 0 
                                         i32 %165 = OpConstant 3 
                                             %172 = OpTypePointer Function %22 
                                         i32 %186 = OpConstant 4 
                                             %187 = OpTypePointer Uniform %22 
                                Private f32* %201 = OpVariable Private 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                Private f32* %234 = OpVariable Private 
                                         f32 %240 = OpConstant 3.67402E-40 
                                Input f32_3* %243 = OpVariable Input 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %250 = OpConstant 5 
                              Private f32_3* %255 = OpVariable Private 
                                             %282 = OpTypePointer Output %7 
                               Output f32_4* %283 = OpVariable Output 
                                             %304 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                 Private f32* %37 = OpAccessChain %30 %36 
                                                      OpStore %37 %34 
                                        f32_4 %40 = OpLoad %30 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 0 0 
                               Uniform f32_4* %50 = OpAccessChain %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                        f32_3 %53 = OpFNegate %52 
                                        f32_3 %54 = OpFMul %41 %53 
                               Uniform f32_4* %55 = OpAccessChain %46 %48 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_3 %58 = OpFAdd %54 %57 
                                                      OpStore %39 %58 
                                 Private f32* %61 = OpAccessChain %9 %60 
                                          f32 %62 = OpLoad %61 
                                 Uniform f32* %65 = OpAccessChain %46 %63 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %62 %66 
                                 Private f32* %68 = OpAccessChain %59 %60 
                                                      OpStore %68 %67 
                                        f32_3 %70 = OpLoad %39 
                                        f32_3 %71 = OpFNegate %70 
                               Uniform f32_4* %73 = OpAccessChain %46 %72 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %71 %75 
                                                      OpStore %69 %76 
                               Uniform f32_4* %77 = OpAccessChain %46 %72 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 3 3 3 
                                        f32_3 %80 = OpLoad %69 
                                        f32_3 %81 = OpFMul %79 %80 
                                        f32_3 %82 = OpLoad %39 
                                        f32_3 %83 = OpFAdd %81 %82 
                                                      OpStore %39 %83 
                                        f32_3 %84 = OpLoad %39 
                                        f32_3 %85 = OpExtInst %1 30 %84 
                                                      OpStore %69 %85 
                                        f32_3 %86 = OpLoad %69 
                                 Uniform f32* %88 = OpAccessChain %46 %87 
                                          f32 %89 = OpLoad %88 
                                 Uniform f32* %90 = OpAccessChain %46 %87 
                                          f32 %91 = OpLoad %90 
                                 Uniform f32* %92 = OpAccessChain %46 %87 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %89 %91 %93 
                                          f32 %95 = OpCompositeExtract %94 0 
                                          f32 %96 = OpCompositeExtract %94 1 
                                          f32 %97 = OpCompositeExtract %94 2 
                                        f32_3 %98 = OpCompositeConstruct %95 %96 %97 
                                        f32_3 %99 = OpFMul %86 %98 
                                                      OpStore %69 %99 
                                       f32_3 %100 = OpLoad %69 
                                       f32_3 %101 = OpExtInst %1 29 %100 
                                                      OpStore %69 %101 
                                       f32_3 %102 = OpLoad %69 
                                Uniform f32* %104 = OpAccessChain %46 %103 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
                                       f32_3 %107 = OpFMul %102 %106 
                                                      OpStore %69 %107 
                                Uniform f32* %112 = OpAccessChain %46 %111 %36 
                                         f32 %113 = OpLoad %112 
                                        bool %114 = OpFOrdEqual %113 %33 
                                                      OpStore %110 %114 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %117 
                                             %116 = OpLabel 
                                        bool %118 = OpLoad %110 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpBranch %120 
                                             %120 = OpLabel 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %229 
                                             %122 = OpLabel 
                                Uniform f32* %125 = OpAccessChain %46 %111 %124 
                                         f32 %126 = OpLoad %125 
                                        bool %127 = OpFOrdEqual %126 %33 
                                                      OpStore %110 %127 
                                       f32_3 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 1 1 1 
                              Uniform f32_4* %134 = OpAccessChain %46 %133 %111 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFMul %132 %136 
                                       f32_4 %138 = OpLoad %128 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %128 %139 
                              Uniform f32_4* %141 = OpAccessChain %46 %133 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %130 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %128 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %146 %148 
                                       f32_4 %150 = OpLoad %128 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %128 %151 
                              Uniform f32_4* %152 = OpAccessChain %46 %133 %133 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpVectorShuffle %155 %155 2 2 2 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %128 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %128 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %128 %162 
                                       f32_4 %163 = OpLoad %128 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %46 %133 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %164 %168 
                                       f32_4 %170 = OpLoad %128 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %128 %171 
                                        bool %174 = OpLoad %110 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %128 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %130 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %128 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %128 %183 
                                       f32_4 %184 = OpLoad %128 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %46 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %128 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %128 %193 
                                       f32_4 %194 = OpLoad %128 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %196 = OpAccessChain %46 %165 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %128 
                                       f32_4 %200 = OpVectorShuffle %199 %198 0 4 5 6 
                                                      OpStore %128 %200 
                                Private f32* %202 = OpAccessChain %128 %124 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %201 %207 
                                Uniform f32* %210 = OpAccessChain %46 %111 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %201 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %128 %36 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %128 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %128 %226 
                                       f32_4 %228 = OpLoad %128 
                                                      OpStore %227 %228 
                                                      OpBranch %123 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %36 
                                                      OpStore %230 %33 
                                Private f32* %231 = OpAccessChain %227 %124 
                                                      OpStore %231 %33 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %33 
                                Private f32* %233 = OpAccessChain %227 %60 
                                                      OpStore %233 %33 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_4 %235 = OpLoad %227 
                              Uniform f32_4* %236 = OpAccessChain %46 %140 
                                       f32_4 %237 = OpLoad %236 
                                         f32 %238 = OpDot %235 %237 
                                                      OpStore %234 %238 
                                         f32 %239 = OpLoad %234 
                                         f32 %241 = OpExtInst %1 43 %239 %240 %33 
                                                      OpStore %234 %241 
                                       f32_3 %242 = OpLoad %39 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %227 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %227 %247 
                                       f32_3 %249 = OpLoad %39 
                              Uniform f32_4* %251 = OpAccessChain %46 %250 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpFMul %249 %253 
                                                      OpStore %248 %254 
                                         f32 %256 = OpLoad %234 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %255 %259 
                                       f32_3 %260 = OpLoad %248 
                                       f32_3 %261 = OpFNegate %260 
                                         f32 %262 = OpLoad %234 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpFMul %261 %263 
                              Uniform f32_4* %265 = OpAccessChain %46 %72 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFAdd %264 %267 
                                                      OpStore %39 %268 
                              Uniform f32_4* %269 = OpAccessChain %46 %72 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 3 3 3 
                                       f32_3 %272 = OpLoad %39 
                                       f32_3 %273 = OpFMul %271 %272 
                                       f32_3 %274 = OpLoad %255 
                                       f32_3 %275 = OpFAdd %273 %274 
                                       f32_4 %276 = OpLoad %59 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %59 %277 
                                Private f32* %278 = OpAccessChain %227 %60 
                                                      OpStore %278 %240 
                                       f32_4 %279 = OpLoad %59 
                                       f32_4 %280 = OpLoad %227 
                                       f32_4 %281 = OpFAdd %279 %280 
                                                      OpStore %30 %281 
                                       f32_3 %284 = OpLoad %69 
                                Uniform f32* %285 = OpAccessChain %46 %63 
                                         f32 %286 = OpLoad %285 
                                Uniform f32* %287 = OpAccessChain %46 %63 
                                         f32 %288 = OpLoad %287 
                                Uniform f32* %289 = OpAccessChain %46 %63 
                                         f32 %290 = OpLoad %289 
                                       f32_3 %291 = OpCompositeConstruct %286 %288 %290 
                                         f32 %292 = OpCompositeExtract %291 0 
                                         f32 %293 = OpCompositeExtract %291 1 
                                         f32 %294 = OpCompositeExtract %291 2 
                                       f32_3 %295 = OpCompositeConstruct %292 %293 %294 
                                       f32_3 %296 = OpFMul %284 %295 
                                       f32_4 %297 = OpLoad %30 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpFAdd %296 %298 
                                       f32_4 %300 = OpLoad %283 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %283 %301 
                                Private f32* %302 = OpAccessChain %30 %60 
                                         f32 %303 = OpLoad %302 
                                 Output f32* %305 = OpAccessChain %283 %60 
                                                      OpStore %305 %303 
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
uniform 	vec4 _DashColor;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat15;
bool u_xlatb15;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    u_xlat1.w = u_xlat10_0.w * _Opacity;
    u_xlat2.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = log2(u_xlat0.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_EmissivePower);
    u_xlatb15 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb15){
        u_xlatb15 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb15)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat15 = u_xlat3.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat15, u_xlat17);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat15 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat3.xyz = u_xlat0.xyz * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat15) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat4.xyz;
    u_xlat3.w = 0.0;
    u_xlat0 = u_xlat1 + u_xlat3;
    SV_Target0.xyz = u_xlat2.xyz * vec3(vec3(_Opacity, _Opacity, _Opacity)) + u_xlat0.xyz;
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
; Bound: 307
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %130 %243 %283 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %43 ArrayStride 43 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpMemberDecorate %44 6 Offset 44 
                                                      OpMemberDecorate %44 7 Offset 44 
                                                      OpMemberDecorate %44 8 Offset 44 
                                                      OpMemberDecorate %44 9 Offset 44 
                                                      OpMemberDecorate %44 10 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %121 SpecId 121 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate %222 DescriptorSet 222 
                                                      OpDecorate %222 Binding 222 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %243 Location 243 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %283 Location 283 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
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
                               Private f32_4* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypeInt 32 0 
                                          u32 %36 = OpConstant 0 
                                              %38 = OpTypePointer Private %22 
                               Private f32_3* %39 = OpVariable Private 
                                          u32 %42 = OpConstant 4 
                                              %43 = OpTypeArray %7 %42 
                                              %44 = OpTypeStruct %7 %7 %43 %22 %22 %7 %7 %6 %6 %6 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32; f32; f32_4;}* %46 = OpVariable Uniform 
                                              %47 = OpTypeInt 32 1 
                                          i32 %48 = OpConstant 6 
                                              %49 = OpTypePointer Uniform %7 
                               Private f32_4* %59 = OpVariable Private 
                                          u32 %60 = OpConstant 3 
                                          i32 %63 = OpConstant 9 
                                              %64 = OpTypePointer Uniform %6 
                               Private f32_3* %69 = OpVariable Private 
                                          i32 %72 = OpConstant 10 
                                          i32 %87 = OpConstant 8 
                                         i32 %103 = OpConstant 7 
                                             %108 = OpTypeBool 
                                             %109 = OpTypePointer Private %108 
                               Private bool* %110 = OpVariable Private 
                                         i32 %111 = OpConstant 1 
                                        bool %115 = OpConstantFalse 
                                        bool %121 = OpSpecConstantFalse 
                                         u32 %124 = OpConstant 1 
                              Private f32_4* %128 = OpVariable Private 
                                             %129 = OpTypePointer Input %22 
                                Input f32_3* %130 = OpVariable Input 
                                         i32 %133 = OpConstant 2 
                                         i32 %140 = OpConstant 0 
                                         i32 %165 = OpConstant 3 
                                             %172 = OpTypePointer Function %22 
                                         i32 %186 = OpConstant 4 
                                             %187 = OpTypePointer Uniform %22 
                                Private f32* %201 = OpVariable Private 
                                         f32 %204 = OpConstant 3.67402E-40 
                                         f32 %206 = OpConstant 3.67402E-40 
                                Private f32* %208 = OpVariable Private 
                                         u32 %209 = OpConstant 2 
                                         f32 %212 = OpConstant 3.67402E-40 
                                             %219 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %220 = OpTypeSampledImage %219 
                                             %221 = OpTypePointer UniformConstant %220 
 UniformConstant read_only Texture3DSampled* %222 = OpVariable UniformConstant 
                              Private f32_4* %227 = OpVariable Private 
                                Private f32* %234 = OpVariable Private 
                                         f32 %240 = OpConstant 3.67402E-40 
                                Input f32_3* %243 = OpVariable Input 
                              Private f32_3* %248 = OpVariable Private 
                                         i32 %250 = OpConstant 5 
                              Private f32_3* %255 = OpVariable Private 
                                             %282 = OpTypePointer Output %7 
                               Output f32_4* %283 = OpVariable Output 
                                             %304 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %173 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                 Private f32* %37 = OpAccessChain %30 %36 
                                                      OpStore %37 %34 
                                        f32_4 %40 = OpLoad %30 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 0 0 
                               Uniform f32_4* %50 = OpAccessChain %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                        f32_3 %53 = OpFNegate %52 
                                        f32_3 %54 = OpFMul %41 %53 
                               Uniform f32_4* %55 = OpAccessChain %46 %48 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_3 %58 = OpFAdd %54 %57 
                                                      OpStore %39 %58 
                                 Private f32* %61 = OpAccessChain %9 %60 
                                          f32 %62 = OpLoad %61 
                                 Uniform f32* %65 = OpAccessChain %46 %63 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %62 %66 
                                 Private f32* %68 = OpAccessChain %59 %60 
                                                      OpStore %68 %67 
                                        f32_3 %70 = OpLoad %39 
                                        f32_3 %71 = OpFNegate %70 
                               Uniform f32_4* %73 = OpAccessChain %46 %72 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFAdd %71 %75 
                                                      OpStore %69 %76 
                               Uniform f32_4* %77 = OpAccessChain %46 %72 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 3 3 3 
                                        f32_3 %80 = OpLoad %69 
                                        f32_3 %81 = OpFMul %79 %80 
                                        f32_3 %82 = OpLoad %39 
                                        f32_3 %83 = OpFAdd %81 %82 
                                                      OpStore %39 %83 
                                        f32_3 %84 = OpLoad %39 
                                        f32_3 %85 = OpExtInst %1 30 %84 
                                                      OpStore %69 %85 
                                        f32_3 %86 = OpLoad %69 
                                 Uniform f32* %88 = OpAccessChain %46 %87 
                                          f32 %89 = OpLoad %88 
                                 Uniform f32* %90 = OpAccessChain %46 %87 
                                          f32 %91 = OpLoad %90 
                                 Uniform f32* %92 = OpAccessChain %46 %87 
                                          f32 %93 = OpLoad %92 
                                        f32_3 %94 = OpCompositeConstruct %89 %91 %93 
                                          f32 %95 = OpCompositeExtract %94 0 
                                          f32 %96 = OpCompositeExtract %94 1 
                                          f32 %97 = OpCompositeExtract %94 2 
                                        f32_3 %98 = OpCompositeConstruct %95 %96 %97 
                                        f32_3 %99 = OpFMul %86 %98 
                                                      OpStore %69 %99 
                                       f32_3 %100 = OpLoad %69 
                                       f32_3 %101 = OpExtInst %1 29 %100 
                                                      OpStore %69 %101 
                                       f32_3 %102 = OpLoad %69 
                                Uniform f32* %104 = OpAccessChain %46 %103 
                                         f32 %105 = OpLoad %104 
                                       f32_3 %106 = OpCompositeConstruct %105 %105 %105 
                                       f32_3 %107 = OpFMul %102 %106 
                                                      OpStore %69 %107 
                                Uniform f32* %112 = OpAccessChain %46 %111 %36 
                                         f32 %113 = OpLoad %112 
                                        bool %114 = OpFOrdEqual %113 %33 
                                                      OpStore %110 %114 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %117 
                                             %116 = OpLabel 
                                        bool %118 = OpLoad %110 
                                                      OpSelectionMerge %120 None 
                                                      OpBranchConditional %118 %119 %120 
                                             %119 = OpLabel 
                                                      OpBranch %120 
                                             %120 = OpLabel 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                                      OpSelectionMerge %123 None 
                                                      OpBranchConditional %121 %122 %229 
                                             %122 = OpLabel 
                                Uniform f32* %125 = OpAccessChain %46 %111 %124 
                                         f32 %126 = OpLoad %125 
                                        bool %127 = OpFOrdEqual %126 %33 
                                                      OpStore %110 %127 
                                       f32_3 %131 = OpLoad %130 
                                       f32_3 %132 = OpVectorShuffle %131 %131 1 1 1 
                              Uniform f32_4* %134 = OpAccessChain %46 %133 %111 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFMul %132 %136 
                                       f32_4 %138 = OpLoad %128 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %128 %139 
                              Uniform f32_4* %141 = OpAccessChain %46 %133 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpLoad %130 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 0 0 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %128 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFAdd %146 %148 
                                       f32_4 %150 = OpLoad %128 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %128 %151 
                              Uniform f32_4* %152 = OpAccessChain %46 %133 %133 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %130 
                                       f32_3 %156 = OpVectorShuffle %155 %155 2 2 2 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %128 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %128 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %128 %162 
                                       f32_4 %163 = OpLoad %128 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %166 = OpAccessChain %46 %133 %165 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFAdd %164 %168 
                                       f32_4 %170 = OpLoad %128 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 6 3 
                                                      OpStore %128 %171 
                                        bool %174 = OpLoad %110 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %179 
                                             %175 = OpLabel 
                                       f32_4 %177 = OpLoad %128 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                                      OpStore %173 %178 
                                                      OpBranch %176 
                                             %179 = OpLabel 
                                       f32_3 %180 = OpLoad %130 
                                                      OpStore %173 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                       f32_3 %181 = OpLoad %173 
                                       f32_4 %182 = OpLoad %128 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 6 3 
                                                      OpStore %128 %183 
                                       f32_4 %184 = OpLoad %128 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_3* %188 = OpAccessChain %46 %186 
                                       f32_3 %189 = OpLoad %188 
                                       f32_3 %190 = OpFNegate %189 
                                       f32_3 %191 = OpFAdd %185 %190 
                                       f32_4 %192 = OpLoad %128 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %128 %193 
                                       f32_4 %194 = OpLoad %128 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 1 2 
                              Uniform f32_3* %196 = OpAccessChain %46 %165 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFMul %195 %197 
                                       f32_4 %199 = OpLoad %128 
                                       f32_4 %200 = OpVectorShuffle %199 %198 0 4 5 6 
                                                      OpStore %128 %200 
                                Private f32* %202 = OpAccessChain %128 %124 
                                         f32 %203 = OpLoad %202 
                                         f32 %205 = OpFMul %203 %204 
                                         f32 %207 = OpFAdd %205 %206 
                                                      OpStore %201 %207 
                                Uniform f32* %210 = OpAccessChain %46 %111 %209 
                                         f32 %211 = OpLoad %210 
                                         f32 %213 = OpFMul %211 %212 
                                         f32 %214 = OpFAdd %213 %206 
                                                      OpStore %208 %214 
                                         f32 %215 = OpLoad %201 
                                         f32 %216 = OpLoad %208 
                                         f32 %217 = OpExtInst %1 40 %215 %216 
                                Private f32* %218 = OpAccessChain %128 %36 
                                                      OpStore %218 %217 
                  read_only Texture3DSampled %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %128 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 2 3 
                                       f32_4 %226 = OpImageSampleImplicitLod %223 %225 
                                                      OpStore %128 %226 
                                       f32_4 %228 = OpLoad %128 
                                                      OpStore %227 %228 
                                                      OpBranch %123 
                                             %229 = OpLabel 
                                Private f32* %230 = OpAccessChain %227 %36 
                                                      OpStore %230 %33 
                                Private f32* %231 = OpAccessChain %227 %124 
                                                      OpStore %231 %33 
                                Private f32* %232 = OpAccessChain %227 %209 
                                                      OpStore %232 %33 
                                Private f32* %233 = OpAccessChain %227 %60 
                                                      OpStore %233 %33 
                                                      OpBranch %123 
                                             %123 = OpLabel 
                                       f32_4 %235 = OpLoad %227 
                              Uniform f32_4* %236 = OpAccessChain %46 %140 
                                       f32_4 %237 = OpLoad %236 
                                         f32 %238 = OpDot %235 %237 
                                                      OpStore %234 %238 
                                         f32 %239 = OpLoad %234 
                                         f32 %241 = OpExtInst %1 43 %239 %240 %33 
                                                      OpStore %234 %241 
                                       f32_3 %242 = OpLoad %39 
                                       f32_3 %244 = OpLoad %243 
                                       f32_3 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %227 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %227 %247 
                                       f32_3 %249 = OpLoad %39 
                              Uniform f32_4* %251 = OpAccessChain %46 %250 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                                       f32_3 %254 = OpFMul %249 %253 
                                                      OpStore %248 %254 
                                         f32 %256 = OpLoad %234 
                                       f32_3 %257 = OpCompositeConstruct %256 %256 %256 
                                       f32_3 %258 = OpLoad %248 
                                       f32_3 %259 = OpFMul %257 %258 
                                                      OpStore %255 %259 
                                       f32_3 %260 = OpLoad %248 
                                       f32_3 %261 = OpFNegate %260 
                                         f32 %262 = OpLoad %234 
                                       f32_3 %263 = OpCompositeConstruct %262 %262 %262 
                                       f32_3 %264 = OpFMul %261 %263 
                              Uniform f32_4* %265 = OpAccessChain %46 %72 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFAdd %264 %267 
                                                      OpStore %39 %268 
                              Uniform f32_4* %269 = OpAccessChain %46 %72 
                                       f32_4 %270 = OpLoad %269 
                                       f32_3 %271 = OpVectorShuffle %270 %270 3 3 3 
                                       f32_3 %272 = OpLoad %39 
                                       f32_3 %273 = OpFMul %271 %272 
                                       f32_3 %274 = OpLoad %255 
                                       f32_3 %275 = OpFAdd %273 %274 
                                       f32_4 %276 = OpLoad %59 
                                       f32_4 %277 = OpVectorShuffle %276 %275 4 5 6 3 
                                                      OpStore %59 %277 
                                Private f32* %278 = OpAccessChain %227 %60 
                                                      OpStore %278 %240 
                                       f32_4 %279 = OpLoad %59 
                                       f32_4 %280 = OpLoad %227 
                                       f32_4 %281 = OpFAdd %279 %280 
                                                      OpStore %30 %281 
                                       f32_3 %284 = OpLoad %69 
                                Uniform f32* %285 = OpAccessChain %46 %63 
                                         f32 %286 = OpLoad %285 
                                Uniform f32* %287 = OpAccessChain %46 %63 
                                         f32 %288 = OpLoad %287 
                                Uniform f32* %289 = OpAccessChain %46 %63 
                                         f32 %290 = OpLoad %289 
                                       f32_3 %291 = OpCompositeConstruct %286 %288 %290 
                                         f32 %292 = OpCompositeExtract %291 0 
                                         f32 %293 = OpCompositeExtract %291 1 
                                         f32 %294 = OpCompositeExtract %291 2 
                                       f32_3 %295 = OpCompositeConstruct %292 %293 %294 
                                       f32_3 %296 = OpFMul %284 %295 
                                       f32_4 %297 = OpLoad %30 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpFAdd %296 %298 
                                       f32_4 %300 = OpLoad %283 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 6 3 
                                                      OpStore %283 %301 
                                Private f32* %302 = OpAccessChain %30 %60 
                                         f32 %303 = OpLoad %302 
                                 Output f32* %305 = OpAccessChain %283 %60 
                                                      OpStore %305 %303 
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 102475
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
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    SV_Target0.w = u_xlat10_0.w * _Opacity;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat10);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xx);
    u_xlat9 = u_xlat9 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 295
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %84 %292 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %43 0 RelaxedPrecision 
                                                      OpMemberDecorate %43 0 Offset 43 
                                                      OpMemberDecorate %43 1 Offset 43 
                                                      OpMemberDecorate %43 2 Offset 43 
                                                      OpMemberDecorate %43 3 Offset 43 
                                                      OpMemberDecorate %43 4 Offset 43 
                                                      OpMemberDecorate %43 5 RelaxedPrecision 
                                                      OpMemberDecorate %43 5 Offset 43 
                                                      OpMemberDecorate %43 6 Offset 43 
                                                      OpMemberDecorate %43 7 Offset 43 
                                                      OpMemberDecorate %43 8 Offset 43 
                                                      OpMemberDecorate %43 9 Offset 43 
                                                      OpDecorate %43 Block 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %130 SpecId 130 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %252 DescriptorSet 252 
                                                      OpDecorate %252 Binding 252 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %292 Location 292 
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
                                 Private f32* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypePointer Private %22 
                               Private f32_3* %36 = OpVariable Private 
                                              %39 = OpTypeInt 32 0 
                                          u32 %40 = OpConstant 4 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeArray %7 %40 
                                              %43 = OpTypeStruct %7 %7 %41 %22 %22 %7 %42 %7 %6 %7 
                                              %44 = OpTypePointer Uniform %43 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %45 = OpVariable Uniform 
                                              %46 = OpTypeInt 32 1 
                                          i32 %47 = OpConstant 7 
                                              %48 = OpTypePointer Uniform %7 
                               Private f32_4* %58 = OpVariable Private 
                                          u32 %59 = OpConstant 3 
                                          i32 %62 = OpConstant 8 
                                              %63 = OpTypePointer Uniform %6 
                               Private f32_3* %68 = OpVariable Private 
                                          i32 %71 = OpConstant 9 
                                              %83 = OpTypePointer Input %22 
                                 Input f32_3* %84 = OpVariable Input 
                                          i32 %87 = OpConstant 6 
                                          i32 %88 = OpConstant 1 
                                          i32 %93 = OpConstant 0 
                                         i32 %102 = OpConstant 2 
                                         i32 %112 = OpConstant 3 
                                             %117 = OpTypeBool 
                                             %118 = OpTypePointer Private %117 
                               Private bool* %119 = OpVariable Private 
                                         u32 %120 = OpConstant 0 
                                        bool %124 = OpConstantFalse 
                                        bool %130 = OpSpecConstantFalse 
                                         u32 %133 = OpConstant 1 
                              Private f32_4* %137 = OpVariable Private 
                                             %176 = OpTypePointer Function %22 
                                         i32 %190 = OpConstant 4 
                                             %191 = OpTypePointer Uniform %22 
                                Private f32* %205 = OpVariable Private 
                                         f32 %208 = OpConstant 3.67402E-40 
                                         f32 %210 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         u32 %213 = OpConstant 2 
                                         f32 %216 = OpConstant 3.67402E-40 
                                             %223 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %224 = OpTypeSampledImage %223 
                                             %225 = OpTypePointer UniformConstant %224 
 UniformConstant read_only Texture3DSampled* %226 = OpVariable UniformConstant 
                              Private f32_4* %231 = OpVariable Private 
                              Private f32_3* %238 = OpVariable Private 
                                         f32 %246 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %252 = OpVariable UniformConstant 
                                         i32 %263 = OpConstant 5 
                              Private f32_3* %268 = OpVariable Private 
                                             %291 = OpTypePointer Output %7 
                               Output f32_4* %292 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %177 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                                      OpStore %30 %34 
                                          f32 %37 = OpLoad %30 
                                        f32_3 %38 = OpCompositeConstruct %37 %37 %37 
                               Uniform f32_4* %49 = OpAccessChain %45 %47 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFMul %38 %52 
                               Uniform f32_4* %54 = OpAccessChain %45 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %53 %56 
                                                      OpStore %36 %57 
                                 Private f32* %60 = OpAccessChain %9 %59 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %64 = OpAccessChain %45 %62 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFMul %61 %65 
                                 Private f32* %67 = OpAccessChain %58 %59 
                                                      OpStore %67 %66 
                                        f32_3 %69 = OpLoad %36 
                                        f32_3 %70 = OpFNegate %69 
                               Uniform f32_4* %72 = OpAccessChain %45 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %70 %74 
                                                      OpStore %68 %75 
                               Uniform f32_4* %76 = OpAccessChain %45 %71 
                                        f32_4 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 3 3 3 
                                        f32_3 %79 = OpLoad %68 
                                        f32_3 %80 = OpFMul %78 %79 
                                        f32_3 %81 = OpLoad %36 
                                        f32_3 %82 = OpFAdd %80 %81 
                                                      OpStore %36 %82 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %45 %87 %88 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFMul %86 %91 
                                                      OpStore %68 %92 
                               Uniform f32_4* %94 = OpAccessChain %45 %87 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpLoad %84 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 0 0 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_3 %100 = OpLoad %68 
                                       f32_3 %101 = OpFAdd %99 %100 
                                                      OpStore %68 %101 
                              Uniform f32_4* %103 = OpAccessChain %45 %87 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpLoad %84 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_3 %109 = OpLoad %68 
                                       f32_3 %110 = OpFAdd %108 %109 
                                                      OpStore %68 %110 
                                       f32_3 %111 = OpLoad %68 
                              Uniform f32_4* %113 = OpAccessChain %45 %87 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %111 %115 
                                                      OpStore %68 %116 
                                Uniform f32* %121 = OpAccessChain %45 %88 %120 
                                         f32 %122 = OpLoad %121 
                                        bool %123 = OpFOrdEqual %122 %33 
                                                      OpStore %119 %123 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %126 
                                             %125 = OpLabel 
                                        bool %127 = OpLoad %119 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %129 
                                             %128 = OpLabel 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %233 
                                             %131 = OpLabel 
                                Uniform f32* %134 = OpAccessChain %45 %88 %133 
                                         f32 %135 = OpLoad %134 
                                        bool %136 = OpFOrdEqual %135 %33 
                                                      OpStore %119 %136 
                                       f32_3 %138 = OpLoad %84 
                                       f32_3 %139 = OpVectorShuffle %138 %138 1 1 1 
                              Uniform f32_4* %140 = OpAccessChain %45 %102 %88 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %139 %142 
                                       f32_4 %144 = OpLoad %137 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %137 %145 
                              Uniform f32_4* %146 = OpAccessChain %45 %102 %93 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpLoad %84 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 0 0 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %137 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %137 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %137 %156 
                              Uniform f32_4* %157 = OpAccessChain %45 %102 %102 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %84 
                                       f32_3 %161 = OpVectorShuffle %160 %160 2 2 2 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_4 %163 = OpLoad %137 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %137 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %137 %167 
                                       f32_4 %168 = OpLoad %137 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %45 %102 %112 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFAdd %169 %172 
                                       f32_4 %174 = OpLoad %137 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %137 %175 
                                        bool %178 = OpLoad %119 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %183 
                                             %179 = OpLabel 
                                       f32_4 %181 = OpLoad %137 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                                      OpStore %177 %182 
                                                      OpBranch %180 
                                             %183 = OpLabel 
                                       f32_3 %184 = OpLoad %84 
                                                      OpStore %177 %184 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                       f32_3 %185 = OpLoad %177 
                                       f32_4 %186 = OpLoad %137 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %137 %187 
                                       f32_4 %188 = OpLoad %137 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                              Uniform f32_3* %192 = OpAccessChain %45 %190 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFNegate %193 
                                       f32_3 %195 = OpFAdd %189 %194 
                                       f32_4 %196 = OpLoad %137 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %137 %197 
                                       f32_4 %198 = OpLoad %137 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_3* %200 = OpAccessChain %45 %112 
                                       f32_3 %201 = OpLoad %200 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %137 
                                       f32_4 %204 = OpVectorShuffle %203 %202 0 4 5 6 
                                                      OpStore %137 %204 
                                Private f32* %206 = OpAccessChain %137 %133 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %211 = OpFAdd %209 %210 
                                                      OpStore %205 %211 
                                Uniform f32* %214 = OpAccessChain %45 %88 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %218 = OpFAdd %217 %210 
                                                      OpStore %212 %218 
                                         f32 %219 = OpLoad %205 
                                         f32 %220 = OpLoad %212 
                                         f32 %221 = OpExtInst %1 40 %219 %220 
                                Private f32* %222 = OpAccessChain %137 %120 
                                                      OpStore %222 %221 
                  read_only Texture3DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %137 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                                      OpStore %137 %230 
                                       f32_4 %232 = OpLoad %137 
                                                      OpStore %231 %232 
                                                      OpBranch %132 
                                             %233 = OpLabel 
                                Private f32* %234 = OpAccessChain %231 %120 
                                                      OpStore %234 %33 
                                Private f32* %235 = OpAccessChain %231 %133 
                                                      OpStore %235 %33 
                                Private f32* %236 = OpAccessChain %231 %213 
                                                      OpStore %236 %33 
                                Private f32* %237 = OpAccessChain %231 %59 
                                                      OpStore %237 %33 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                       f32_4 %239 = OpLoad %231 
                              Uniform f32_4* %240 = OpAccessChain %45 %93 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %238 %120 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %238 %120 
                                         f32 %245 = OpLoad %244 
                                         f32 %247 = OpExtInst %1 43 %245 %246 %33 
                                Private f32* %248 = OpAccessChain %238 %120 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %68 
                                       f32_3 %250 = OpLoad %68 
                                         f32 %251 = OpDot %249 %250 
                                                      OpStore %205 %251 
                  read_only Texture2DSampled %253 = OpLoad %252 
                                         f32 %254 = OpLoad %205 
                                       f32_2 %255 = OpCompositeConstruct %254 %254 
                                       f32_4 %256 = OpImageSampleImplicitLod %253 %255 
                                         f32 %257 = OpCompositeExtract %256 3 
                                                      OpStore %205 %257 
                                Private f32* %258 = OpAccessChain %238 %120 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpLoad %205 
                                         f32 %261 = OpFMul %259 %260 
                                                      OpStore %205 %261 
                                       f32_3 %262 = OpLoad %36 
                              Uniform f32_4* %264 = OpAccessChain %45 %263 
                                       f32_4 %265 = OpLoad %264 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFMul %262 %266 
                                                      OpStore %238 %267 
                                         f32 %269 = OpLoad %205 
                                       f32_3 %270 = OpCompositeConstruct %269 %269 %269 
                                       f32_3 %271 = OpLoad %238 
                                       f32_3 %272 = OpFMul %270 %271 
                                                      OpStore %268 %272 
                                       f32_3 %273 = OpLoad %238 
                                       f32_3 %274 = OpFNegate %273 
                                         f32 %275 = OpLoad %205 
                                       f32_3 %276 = OpCompositeConstruct %275 %275 %275 
                                       f32_3 %277 = OpFMul %274 %276 
                              Uniform f32_4* %278 = OpAccessChain %45 %71 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %281 = OpFAdd %277 %280 
                                                      OpStore %36 %281 
                              Uniform f32_4* %282 = OpAccessChain %45 %71 
                                       f32_4 %283 = OpLoad %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 3 3 3 
                                       f32_3 %285 = OpLoad %36 
                                       f32_3 %286 = OpFMul %284 %285 
                                       f32_3 %287 = OpLoad %268 
                                       f32_3 %288 = OpFAdd %286 %287 
                                       f32_4 %289 = OpLoad %58 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %58 %290 
                                       f32_4 %293 = OpLoad %58 
                                                      OpStore %292 %293 
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
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
float u_xlat3;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    SV_Target0.w = u_xlat10_0.w * _Opacity;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlatb6 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb6){
        u_xlatb6 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat6 = u_xlat1.y * 0.25 + 0.75;
        u_xlat3 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat6, u_xlat3);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat6 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat6) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 253
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %107 %250 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 RelaxedPrecision 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpMemberDecorate %42 5 RelaxedPrecision 
                                                      OpMemberDecorate %42 5 Offset 42 
                                                      OpMemberDecorate %42 6 Offset 42 
                                                      OpMemberDecorate %42 7 Offset 42 
                                                      OpMemberDecorate %42 8 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %99 SpecId 99 
                                                      OpDecorate %107 Location 107 
                                                      OpDecorate %199 DescriptorSet 199 
                                                      OpDecorate %199 Binding 199 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %250 Location 250 
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
                                 Private f32* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypePointer Private %22 
                               Private f32_3* %36 = OpVariable Private 
                                              %39 = OpTypeInt 32 0 
                                          u32 %40 = OpConstant 4 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeStruct %7 %7 %41 %22 %22 %7 %7 %6 %7 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4; f32; f32_4;}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 6 
                                              %47 = OpTypePointer Uniform %7 
                               Private f32_4* %57 = OpVariable Private 
                                          u32 %58 = OpConstant 3 
                                          i32 %61 = OpConstant 7 
                                              %62 = OpTypePointer Uniform %6 
                               Private f32_4* %67 = OpVariable Private 
                                          i32 %70 = OpConstant 8 
                                              %85 = OpTypeBool 
                                              %86 = OpTypePointer Private %85 
                                Private bool* %87 = OpVariable Private 
                                          i32 %88 = OpConstant 1 
                                          u32 %89 = OpConstant 0 
                                         bool %93 = OpConstantFalse 
                                         bool %99 = OpSpecConstantFalse 
                                         u32 %102 = OpConstant 1 
                                             %106 = OpTypePointer Input %22 
                                Input f32_3* %107 = OpVariable Input 
                                         i32 %110 = OpConstant 2 
                                         i32 %117 = OpConstant 0 
                                         i32 %142 = OpConstant 3 
                                             %149 = OpTypePointer Function %22 
                                         i32 %163 = OpConstant 4 
                                             %164 = OpTypePointer Uniform %22 
                                Private f32* %178 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                                         f32 %183 = OpConstant 3.67402E-40 
                                Private f32* %185 = OpVariable Private 
                                         u32 %186 = OpConstant 2 
                                         f32 %189 = OpConstant 3.67402E-40 
                                             %196 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %197 = OpTypeSampledImage %196 
                                             %198 = OpTypePointer UniformConstant %197 
 UniformConstant read_only Texture3DSampled* %199 = OpVariable UniformConstant 
                              Private f32_4* %204 = OpVariable Private 
                                Private f32* %211 = OpVariable Private 
                                         f32 %217 = OpConstant 3.67402E-40 
                              Private f32_3* %219 = OpVariable Private 
                                         i32 %221 = OpConstant 5 
                              Private f32_3* %226 = OpVariable Private 
                                             %249 = OpTypePointer Output %7 
                               Output f32_4* %250 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %150 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                                      OpStore %30 %34 
                                          f32 %37 = OpLoad %30 
                                        f32_3 %38 = OpCompositeConstruct %37 %37 %37 
                               Uniform f32_4* %48 = OpAccessChain %44 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFNegate %50 
                                        f32_3 %52 = OpFMul %38 %51 
                               Uniform f32_4* %53 = OpAccessChain %44 %46 
                                        f32_4 %54 = OpLoad %53 
                                        f32_3 %55 = OpVectorShuffle %54 %54 0 1 2 
                                        f32_3 %56 = OpFAdd %52 %55 
                                                      OpStore %36 %56 
                                 Private f32* %59 = OpAccessChain %9 %58 
                                          f32 %60 = OpLoad %59 
                                 Uniform f32* %63 = OpAccessChain %44 %61 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %60 %64 
                                 Private f32* %66 = OpAccessChain %57 %58 
                                                      OpStore %66 %65 
                                        f32_3 %68 = OpLoad %36 
                                        f32_3 %69 = OpFNegate %68 
                               Uniform f32_4* %71 = OpAccessChain %44 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %69 %73 
                                        f32_4 %75 = OpLoad %67 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %67 %76 
                               Uniform f32_4* %77 = OpAccessChain %44 %70 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 3 3 3 
                                        f32_4 %80 = OpLoad %67 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpFMul %79 %81 
                                        f32_3 %83 = OpLoad %36 
                                        f32_3 %84 = OpFAdd %82 %83 
                                                      OpStore %36 %84 
                                 Uniform f32* %90 = OpAccessChain %44 %88 %89 
                                          f32 %91 = OpLoad %90 
                                         bool %92 = OpFOrdEqual %91 %33 
                                                      OpStore %87 %92 
                                                      OpSelectionMerge %95 None 
                                                      OpBranchConditional %93 %94 %95 
                                              %94 = OpLabel 
                                         bool %96 = OpLoad %87 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %96 %97 %98 
                                              %97 = OpLabel 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                                      OpBranch %95 
                                              %95 = OpLabel 
                                                      OpSelectionMerge %101 None 
                                                      OpBranchConditional %99 %100 %206 
                                             %100 = OpLabel 
                                Uniform f32* %103 = OpAccessChain %44 %88 %102 
                                         f32 %104 = OpLoad %103 
                                        bool %105 = OpFOrdEqual %104 %33 
                                                      OpStore %87 %105 
                                       f32_3 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 1 1 1 
                              Uniform f32_4* %111 = OpAccessChain %44 %110 %88 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %109 %113 
                                       f32_4 %115 = OpLoad %67 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %67 %116 
                              Uniform f32_4* %118 = OpAccessChain %44 %110 %117 
                                       f32_4 %119 = OpLoad %118 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpLoad %107 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 0 0 
                                       f32_3 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %67 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %67 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %67 %128 
                              Uniform f32_4* %129 = OpAccessChain %44 %110 %110 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpLoad %107 
                                       f32_3 %133 = OpVectorShuffle %132 %132 2 2 2 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %67 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %67 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %67 %139 
                                       f32_4 %140 = OpLoad %67 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_4* %143 = OpAccessChain %44 %110 %142 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_3 %146 = OpFAdd %141 %145 
                                       f32_4 %147 = OpLoad %67 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %67 %148 
                                        bool %151 = OpLoad %87 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %156 
                                             %152 = OpLabel 
                                       f32_4 %154 = OpLoad %67 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                                      OpStore %150 %155 
                                                      OpBranch %153 
                                             %156 = OpLabel 
                                       f32_3 %157 = OpLoad %107 
                                                      OpStore %150 %157 
                                                      OpBranch %153 
                                             %153 = OpLabel 
                                       f32_3 %158 = OpLoad %150 
                                       f32_4 %159 = OpLoad %67 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                      OpStore %67 %160 
                                       f32_4 %161 = OpLoad %67 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                              Uniform f32_3* %165 = OpAccessChain %44 %163 
                                       f32_3 %166 = OpLoad %165 
                                       f32_3 %167 = OpFNegate %166 
                                       f32_3 %168 = OpFAdd %162 %167 
                                       f32_4 %169 = OpLoad %67 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %67 %170 
                                       f32_4 %171 = OpLoad %67 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_3* %173 = OpAccessChain %44 %142 
                                       f32_3 %174 = OpLoad %173 
                                       f32_3 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %67 
                                       f32_4 %177 = OpVectorShuffle %176 %175 0 4 5 6 
                                                      OpStore %67 %177 
                                Private f32* %179 = OpAccessChain %67 %102 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpFMul %180 %181 
                                         f32 %184 = OpFAdd %182 %183 
                                                      OpStore %178 %184 
                                Uniform f32* %187 = OpAccessChain %44 %88 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %190 = OpFMul %188 %189 
                                         f32 %191 = OpFAdd %190 %183 
                                                      OpStore %185 %191 
                                         f32 %192 = OpLoad %178 
                                         f32 %193 = OpLoad %185 
                                         f32 %194 = OpExtInst %1 40 %192 %193 
                                Private f32* %195 = OpAccessChain %67 %89 
                                                      OpStore %195 %194 
                  read_only Texture3DSampled %200 = OpLoad %199 
                                       f32_4 %201 = OpLoad %67 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 2 3 
                                       f32_4 %203 = OpImageSampleImplicitLod %200 %202 
                                                      OpStore %67 %203 
                                       f32_4 %205 = OpLoad %67 
                                                      OpStore %204 %205 
                                                      OpBranch %101 
                                             %206 = OpLabel 
                                Private f32* %207 = OpAccessChain %204 %89 
                                                      OpStore %207 %33 
                                Private f32* %208 = OpAccessChain %204 %102 
                                                      OpStore %208 %33 
                                Private f32* %209 = OpAccessChain %204 %186 
                                                      OpStore %209 %33 
                                Private f32* %210 = OpAccessChain %204 %58 
                                                      OpStore %210 %33 
                                                      OpBranch %101 
                                             %101 = OpLabel 
                                       f32_4 %212 = OpLoad %204 
                              Uniform f32_4* %213 = OpAccessChain %44 %117 
                                       f32_4 %214 = OpLoad %213 
                                         f32 %215 = OpDot %212 %214 
                                                      OpStore %211 %215 
                                         f32 %216 = OpLoad %211 
                                         f32 %218 = OpExtInst %1 43 %216 %217 %33 
                                                      OpStore %211 %218 
                                       f32_3 %220 = OpLoad %36 
                              Uniform f32_4* %222 = OpAccessChain %44 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFMul %220 %224 
                                                      OpStore %219 %225 
                                         f32 %227 = OpLoad %211 
                                       f32_3 %228 = OpCompositeConstruct %227 %227 %227 
                                       f32_3 %229 = OpLoad %219 
                                       f32_3 %230 = OpFMul %228 %229 
                                                      OpStore %226 %230 
                                       f32_3 %231 = OpLoad %219 
                                       f32_3 %232 = OpFNegate %231 
                                         f32 %233 = OpLoad %211 
                                       f32_3 %234 = OpCompositeConstruct %233 %233 %233 
                                       f32_3 %235 = OpFMul %232 %234 
                              Uniform f32_4* %236 = OpAccessChain %44 %70 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpFAdd %235 %238 
                                                      OpStore %36 %239 
                              Uniform f32_4* %240 = OpAccessChain %44 %70 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 3 3 3 
                                       f32_3 %243 = OpLoad %36 
                                       f32_3 %244 = OpFMul %242 %243 
                                       f32_3 %245 = OpLoad %226 
                                       f32_3 %246 = OpFAdd %244 %245 
                                       f32_4 %247 = OpLoad %57 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %57 %248 
                                       f32_4 %251 = OpLoad %57 
                                                      OpStore %250 %251 
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
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat10_3;
vec2 u_xlat6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    SV_Target0.w = u_xlat10_0.w * _Opacity;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb12)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat2.y * 0.25 + 0.75;
        u_xlat6.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat12, u_xlat6.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb2 = 0.0<u_xlat1.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat1.xy / u_xlat1.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_3 = texture(_LightTexture0, u_xlat6.xy);
    u_xlat13 = u_xlat2.x * u_xlat10_3.w;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat1.xx);
    u_xlat1.x = u_xlat13 * u_xlat10_2.w;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat12) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 330
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %87 %327 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %43 0 RelaxedPrecision 
                                                      OpMemberDecorate %43 0 Offset 43 
                                                      OpMemberDecorate %43 1 Offset 43 
                                                      OpMemberDecorate %43 2 Offset 43 
                                                      OpMemberDecorate %43 3 Offset 43 
                                                      OpMemberDecorate %43 4 Offset 43 
                                                      OpMemberDecorate %43 5 RelaxedPrecision 
                                                      OpMemberDecorate %43 5 Offset 43 
                                                      OpMemberDecorate %43 6 Offset 43 
                                                      OpMemberDecorate %43 7 Offset 43 
                                                      OpMemberDecorate %43 8 Offset 43 
                                                      OpMemberDecorate %43 9 Offset 43 
                                                      OpDecorate %43 Block 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %129 SpecId 129 
                                                      OpDecorate %225 DescriptorSet 225 
                                                      OpDecorate %225 Binding 225 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %267 DescriptorSet 267 
                                                      OpDecorate %267 Binding 267 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %282 DescriptorSet 282 
                                                      OpDecorate %282 Binding 282 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %327 Location 327 
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
                                 Private f32* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypePointer Private %22 
                               Private f32_3* %36 = OpVariable Private 
                                              %39 = OpTypeInt 32 0 
                                          u32 %40 = OpConstant 4 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeArray %7 %40 
                                              %43 = OpTypeStruct %7 %7 %41 %22 %22 %7 %42 %7 %6 %7 
                                              %44 = OpTypePointer Uniform %43 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %45 = OpVariable Uniform 
                                              %46 = OpTypeInt 32 1 
                                          i32 %47 = OpConstant 7 
                                              %48 = OpTypePointer Uniform %7 
                               Private f32_4* %58 = OpVariable Private 
                                          u32 %59 = OpConstant 3 
                                          i32 %62 = OpConstant 8 
                                              %63 = OpTypePointer Uniform %6 
                               Private f32_4* %68 = OpVariable Private 
                                          i32 %71 = OpConstant 9 
                                              %86 = OpTypePointer Input %22 
                                 Input f32_3* %87 = OpVariable Input 
                                          i32 %90 = OpConstant 6 
                                          i32 %91 = OpConstant 1 
                                          i32 %95 = OpConstant 0 
                                         i32 %103 = OpConstant 2 
                                         i32 %112 = OpConstant 3 
                                             %116 = OpTypeBool 
                                             %117 = OpTypePointer Private %116 
                               Private bool* %118 = OpVariable Private 
                                         u32 %119 = OpConstant 0 
                                        bool %123 = OpConstantFalse 
                                        bool %129 = OpSpecConstantFalse 
                                         u32 %132 = OpConstant 1 
                              Private f32_4* %136 = OpVariable Private 
                                             %175 = OpTypePointer Function %22 
                                         i32 %189 = OpConstant 4 
                                             %190 = OpTypePointer Uniform %22 
                                Private f32* %204 = OpVariable Private 
                                         f32 %207 = OpConstant 3.67402E-40 
                                         f32 %209 = OpConstant 3.67402E-40 
                                Private f32* %211 = OpVariable Private 
                                         u32 %212 = OpConstant 2 
                                         f32 %215 = OpConstant 3.67402E-40 
                                             %222 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %223 = OpTypeSampledImage %222 
                                             %224 = OpTypePointer UniformConstant %223 
 UniformConstant read_only Texture3DSampled* %225 = OpVariable UniformConstant 
                              Private f32_4* %230 = OpVariable Private 
                                Private f32* %237 = OpVariable Private 
                                         f32 %243 = OpConstant 3.67402E-40 
                              Private f32_3* %248 = OpVariable Private 
                                             %249 = OpTypePointer Function %6 
                                             %257 = OpTypePointer Private %15 
                              Private f32_2* %258 = OpVariable Private 
                                       f32_2 %265 = OpConstantComposite %215 %215 
 UniformConstant read_only Texture2DSampled* %267 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %282 = OpVariable UniformConstant 
                                         i32 %298 = OpConstant 5 
                              Private f32_3* %303 = OpVariable Private 
                                             %326 = OpTypePointer Output %7 
                               Output f32_4* %327 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %176 = OpVariable Function 
                               Function f32* %250 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                                      OpStore %30 %34 
                                          f32 %37 = OpLoad %30 
                                        f32_3 %38 = OpCompositeConstruct %37 %37 %37 
                               Uniform f32_4* %49 = OpAccessChain %45 %47 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFMul %38 %52 
                               Uniform f32_4* %54 = OpAccessChain %45 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %53 %56 
                                                      OpStore %36 %57 
                                 Private f32* %60 = OpAccessChain %9 %59 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %64 = OpAccessChain %45 %62 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFMul %61 %65 
                                 Private f32* %67 = OpAccessChain %58 %59 
                                                      OpStore %67 %66 
                                        f32_3 %69 = OpLoad %36 
                                        f32_3 %70 = OpFNegate %69 
                               Uniform f32_4* %72 = OpAccessChain %45 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %70 %74 
                                        f32_4 %76 = OpLoad %68 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %68 %77 
                               Uniform f32_4* %78 = OpAccessChain %45 %71 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %68 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_3 %84 = OpLoad %36 
                                        f32_3 %85 = OpFAdd %83 %84 
                                                      OpStore %36 %85 
                                        f32_3 %88 = OpLoad %87 
                                        f32_4 %89 = OpVectorShuffle %88 %88 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %45 %90 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %89 %93 
                                                      OpStore %68 %94 
                               Uniform f32_4* %96 = OpAccessChain %45 %90 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_3 %98 = OpLoad %87 
                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %68 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %68 %102 
                              Uniform f32_4* %104 = OpAccessChain %45 %90 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpLoad %87 
                                       f32_4 %107 = OpVectorShuffle %106 %106 2 2 2 2 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %68 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %68 %110 
                                       f32_4 %111 = OpLoad %68 
                              Uniform f32_4* %113 = OpAccessChain %45 %90 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpFAdd %111 %114 
                                                      OpStore %68 %115 
                                Uniform f32* %120 = OpAccessChain %45 %91 %119 
                                         f32 %121 = OpLoad %120 
                                        bool %122 = OpFOrdEqual %121 %33 
                                                      OpStore %118 %122 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %123 %124 %125 
                                             %124 = OpLabel 
                                        bool %126 = OpLoad %118 
                                                      OpSelectionMerge %128 None 
                                                      OpBranchConditional %126 %127 %128 
                                             %127 = OpLabel 
                                                      OpBranch %128 
                                             %128 = OpLabel 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %232 
                                             %130 = OpLabel 
                                Uniform f32* %133 = OpAccessChain %45 %91 %132 
                                         f32 %134 = OpLoad %133 
                                        bool %135 = OpFOrdEqual %134 %33 
                                                      OpStore %118 %135 
                                       f32_3 %137 = OpLoad %87 
                                       f32_3 %138 = OpVectorShuffle %137 %137 1 1 1 
                              Uniform f32_4* %139 = OpAccessChain %45 %103 %91 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFMul %138 %141 
                                       f32_4 %143 = OpLoad %136 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %136 %144 
                              Uniform f32_4* %145 = OpAccessChain %45 %103 %95 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpLoad %87 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 0 0 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %136 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %136 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %136 %155 
                              Uniform f32_4* %156 = OpAccessChain %45 %103 %103 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpLoad %87 
                                       f32_3 %160 = OpVectorShuffle %159 %159 2 2 2 
                                       f32_3 %161 = OpFMul %158 %160 
                                       f32_4 %162 = OpLoad %136 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                       f32_3 %164 = OpFAdd %161 %163 
                                       f32_4 %165 = OpLoad %136 
                                       f32_4 %166 = OpVectorShuffle %165 %164 4 5 6 3 
                                                      OpStore %136 %166 
                                       f32_4 %167 = OpLoad %136 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                              Uniform f32_4* %169 = OpAccessChain %45 %103 %112 
                                       f32_4 %170 = OpLoad %169 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFAdd %168 %171 
                                       f32_4 %173 = OpLoad %136 
                                       f32_4 %174 = OpVectorShuffle %173 %172 4 5 6 3 
                                                      OpStore %136 %174 
                                        bool %177 = OpLoad %118 
                                                      OpSelectionMerge %179 None 
                                                      OpBranchConditional %177 %178 %182 
                                             %178 = OpLabel 
                                       f32_4 %180 = OpLoad %136 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                                      OpStore %176 %181 
                                                      OpBranch %179 
                                             %182 = OpLabel 
                                       f32_3 %183 = OpLoad %87 
                                                      OpStore %176 %183 
                                                      OpBranch %179 
                                             %179 = OpLabel 
                                       f32_3 %184 = OpLoad %176 
                                       f32_4 %185 = OpLoad %136 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                                      OpStore %136 %186 
                                       f32_4 %187 = OpLoad %136 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_3* %191 = OpAccessChain %45 %189 
                                       f32_3 %192 = OpLoad %191 
                                       f32_3 %193 = OpFNegate %192 
                                       f32_3 %194 = OpFAdd %188 %193 
                                       f32_4 %195 = OpLoad %136 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %136 %196 
                                       f32_4 %197 = OpLoad %136 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                              Uniform f32_3* %199 = OpAccessChain %45 %112 
                                       f32_3 %200 = OpLoad %199 
                                       f32_3 %201 = OpFMul %198 %200 
                                       f32_4 %202 = OpLoad %136 
                                       f32_4 %203 = OpVectorShuffle %202 %201 0 4 5 6 
                                                      OpStore %136 %203 
                                Private f32* %205 = OpAccessChain %136 %132 
                                         f32 %206 = OpLoad %205 
                                         f32 %208 = OpFMul %206 %207 
                                         f32 %210 = OpFAdd %208 %209 
                                                      OpStore %204 %210 
                                Uniform f32* %213 = OpAccessChain %45 %91 %212 
                                         f32 %214 = OpLoad %213 
                                         f32 %216 = OpFMul %214 %215 
                                         f32 %217 = OpFAdd %216 %209 
                                                      OpStore %211 %217 
                                         f32 %218 = OpLoad %204 
                                         f32 %219 = OpLoad %211 
                                         f32 %220 = OpExtInst %1 40 %218 %219 
                                Private f32* %221 = OpAccessChain %136 %119 
                                                      OpStore %221 %220 
                  read_only Texture3DSampled %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %136 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 2 3 
                                       f32_4 %229 = OpImageSampleImplicitLod %226 %228 
                                                      OpStore %136 %229 
                                       f32_4 %231 = OpLoad %136 
                                                      OpStore %230 %231 
                                                      OpBranch %131 
                                             %232 = OpLabel 
                                Private f32* %233 = OpAccessChain %230 %119 
                                                      OpStore %233 %33 
                                Private f32* %234 = OpAccessChain %230 %132 
                                                      OpStore %234 %33 
                                Private f32* %235 = OpAccessChain %230 %212 
                                                      OpStore %235 %33 
                                Private f32* %236 = OpAccessChain %230 %59 
                                                      OpStore %236 %33 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                       f32_4 %238 = OpLoad %230 
                              Uniform f32_4* %239 = OpAccessChain %45 %95 
                                       f32_4 %240 = OpLoad %239 
                                         f32 %241 = OpDot %238 %240 
                                                      OpStore %237 %241 
                                         f32 %242 = OpLoad %237 
                                         f32 %244 = OpExtInst %1 43 %242 %243 %33 
                                                      OpStore %237 %244 
                                Private f32* %245 = OpAccessChain %68 %212 
                                         f32 %246 = OpLoad %245 
                                        bool %247 = OpFOrdLessThan %243 %246 
                                                      OpStore %118 %247 
                                        bool %251 = OpLoad %118 
                                                      OpSelectionMerge %253 None 
                                                      OpBranchConditional %251 %252 %254 
                                             %252 = OpLabel 
                                                      OpStore %250 %33 
                                                      OpBranch %253 
                                             %254 = OpLabel 
                                                      OpStore %250 %243 
                                                      OpBranch %253 
                                             %253 = OpLabel 
                                         f32 %255 = OpLoad %250 
                                Private f32* %256 = OpAccessChain %248 %119 
                                                      OpStore %256 %255 
                                       f32_4 %259 = OpLoad %68 
                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
                                       f32_4 %261 = OpLoad %68 
                                       f32_2 %262 = OpVectorShuffle %261 %261 3 3 
                                       f32_2 %263 = OpFDiv %260 %262 
                                                      OpStore %258 %263 
                                       f32_2 %264 = OpLoad %258 
                                       f32_2 %266 = OpFAdd %264 %265 
                                                      OpStore %258 %266 
                  read_only Texture2DSampled %268 = OpLoad %267 
                                       f32_2 %269 = OpLoad %258 
                                       f32_4 %270 = OpImageSampleImplicitLod %268 %269 
                                         f32 %271 = OpCompositeExtract %270 3 
                                                      OpStore %204 %271 
                                         f32 %272 = OpLoad %204 
                                Private f32* %273 = OpAccessChain %248 %119 
                                         f32 %274 = OpLoad %273 
                                         f32 %275 = OpFMul %272 %274 
                                Private f32* %276 = OpAccessChain %248 %119 
                                                      OpStore %276 %275 
                                       f32_4 %277 = OpLoad %68 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_4 %279 = OpLoad %68 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                         f32 %281 = OpDot %278 %280 
                                                      OpStore %204 %281 
                  read_only Texture2DSampled %283 = OpLoad %282 
                                         f32 %284 = OpLoad %204 
                                       f32_2 %285 = OpCompositeConstruct %284 %284 
                                       f32_4 %286 = OpImageSampleImplicitLod %283 %285 
                                         f32 %287 = OpCompositeExtract %286 3 
                                                      OpStore %204 %287 
                                         f32 %288 = OpLoad %204 
                                Private f32* %289 = OpAccessChain %248 %119 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFMul %288 %290 
                                Private f32* %292 = OpAccessChain %248 %119 
                                                      OpStore %292 %291 
                                         f32 %293 = OpLoad %237 
                                Private f32* %294 = OpAccessChain %248 %119 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFMul %293 %295 
                                                      OpStore %237 %296 
                                       f32_3 %297 = OpLoad %36 
                              Uniform f32_4* %299 = OpAccessChain %45 %298 
                                       f32_4 %300 = OpLoad %299 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpFMul %297 %301 
                                                      OpStore %248 %302 
                                         f32 %304 = OpLoad %237 
                                       f32_3 %305 = OpCompositeConstruct %304 %304 %304 
                                       f32_3 %306 = OpLoad %248 
                                       f32_3 %307 = OpFMul %305 %306 
                                                      OpStore %303 %307 
                                       f32_3 %308 = OpLoad %248 
                                       f32_3 %309 = OpFNegate %308 
                                         f32 %310 = OpLoad %237 
                                       f32_3 %311 = OpCompositeConstruct %310 %310 %310 
                                       f32_3 %312 = OpFMul %309 %311 
                              Uniform f32_4* %313 = OpAccessChain %45 %71 
                                       f32_4 %314 = OpLoad %313 
                                       f32_3 %315 = OpVectorShuffle %314 %314 0 1 2 
                                       f32_3 %316 = OpFAdd %312 %315 
                                                      OpStore %36 %316 
                              Uniform f32_4* %317 = OpAccessChain %45 %71 
                                       f32_4 %318 = OpLoad %317 
                                       f32_3 %319 = OpVectorShuffle %318 %318 3 3 3 
                                       f32_3 %320 = OpLoad %36 
                                       f32_3 %321 = OpFMul %319 %320 
                                       f32_3 %322 = OpLoad %303 
                                       f32_3 %323 = OpFAdd %321 %322 
                                       f32_4 %324 = OpLoad %58 
                                       f32_4 %325 = OpVectorShuffle %324 %323 4 5 6 3 
                                                      OpStore %58 %325 
                                       f32_4 %328 = OpLoad %58 
                                                      OpStore %327 %328 
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
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat16_1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat10_2;
float u_xlat9;
bool u_xlatb9;
float u_xlat10;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    SV_Target0.w = u_xlat10_0.w * _Opacity;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat10);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10_2 = texture(_LightTextureB0, vec2(u_xlat10));
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xyz);
    u_xlat16_1 = u_xlat10_1.w * u_xlat10_2.w;
    u_xlat9 = u_xlat9 * u_xlat16_1;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 308
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %84 %305 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %43 0 RelaxedPrecision 
                                                      OpMemberDecorate %43 0 Offset 43 
                                                      OpMemberDecorate %43 1 Offset 43 
                                                      OpMemberDecorate %43 2 Offset 43 
                                                      OpMemberDecorate %43 3 Offset 43 
                                                      OpMemberDecorate %43 4 Offset 43 
                                                      OpMemberDecorate %43 5 RelaxedPrecision 
                                                      OpMemberDecorate %43 5 Offset 43 
                                                      OpMemberDecorate %43 6 Offset 43 
                                                      OpMemberDecorate %43 7 Offset 43 
                                                      OpMemberDecorate %43 8 Offset 43 
                                                      OpMemberDecorate %43 9 Offset 43 
                                                      OpDecorate %43 Block 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %130 SpecId 130 
                                                      OpDecorate %226 DescriptorSet 226 
                                                      OpDecorate %226 Binding 226 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %252 DescriptorSet 252 
                                                      OpDecorate %252 Binding 252 
                                                      OpDecorate %261 DescriptorSet 261 
                                                      OpDecorate %261 Binding 261 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %305 Location 305 
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
                                 Private f32* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypePointer Private %22 
                               Private f32_3* %36 = OpVariable Private 
                                              %39 = OpTypeInt 32 0 
                                          u32 %40 = OpConstant 4 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeArray %7 %40 
                                              %43 = OpTypeStruct %7 %7 %41 %22 %22 %7 %42 %7 %6 %7 
                                              %44 = OpTypePointer Uniform %43 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %45 = OpVariable Uniform 
                                              %46 = OpTypeInt 32 1 
                                          i32 %47 = OpConstant 7 
                                              %48 = OpTypePointer Uniform %7 
                               Private f32_4* %58 = OpVariable Private 
                                          u32 %59 = OpConstant 3 
                                          i32 %62 = OpConstant 8 
                                              %63 = OpTypePointer Uniform %6 
                               Private f32_3* %68 = OpVariable Private 
                                          i32 %71 = OpConstant 9 
                                              %83 = OpTypePointer Input %22 
                                 Input f32_3* %84 = OpVariable Input 
                                          i32 %87 = OpConstant 6 
                                          i32 %88 = OpConstant 1 
                                          i32 %93 = OpConstant 0 
                                         i32 %102 = OpConstant 2 
                                         i32 %112 = OpConstant 3 
                                             %117 = OpTypeBool 
                                             %118 = OpTypePointer Private %117 
                               Private bool* %119 = OpVariable Private 
                                         u32 %120 = OpConstant 0 
                                        bool %124 = OpConstantFalse 
                                        bool %130 = OpSpecConstantFalse 
                                         u32 %133 = OpConstant 1 
                              Private f32_4* %137 = OpVariable Private 
                                             %176 = OpTypePointer Function %22 
                                         i32 %190 = OpConstant 4 
                                             %191 = OpTypePointer Uniform %22 
                                Private f32* %205 = OpVariable Private 
                                         f32 %208 = OpConstant 3.67402E-40 
                                         f32 %210 = OpConstant 3.67402E-40 
                                Private f32* %212 = OpVariable Private 
                                         u32 %213 = OpConstant 2 
                                         f32 %216 = OpConstant 3.67402E-40 
                                             %223 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %224 = OpTypeSampledImage %223 
                                             %225 = OpTypePointer UniformConstant %224 
 UniformConstant read_only Texture3DSampled* %226 = OpVariable UniformConstant 
                              Private f32_4* %231 = OpVariable Private 
                              Private f32_3* %238 = OpVariable Private 
                                         f32 %246 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %252 = OpVariable UniformConstant 
                                             %258 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %259 = OpTypeSampledImage %258 
                                             %260 = OpTypePointer UniformConstant %259 
UniformConstant read_only TextureCubeSampled* %261 = OpVariable UniformConstant 
                                         i32 %276 = OpConstant 5 
                              Private f32_3* %281 = OpVariable Private 
                                             %304 = OpTypePointer Output %7 
                               Output f32_4* %305 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %177 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                                      OpStore %30 %34 
                                          f32 %37 = OpLoad %30 
                                        f32_3 %38 = OpCompositeConstruct %37 %37 %37 
                               Uniform f32_4* %49 = OpAccessChain %45 %47 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFMul %38 %52 
                               Uniform f32_4* %54 = OpAccessChain %45 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %53 %56 
                                                      OpStore %36 %57 
                                 Private f32* %60 = OpAccessChain %9 %59 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %64 = OpAccessChain %45 %62 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFMul %61 %65 
                                 Private f32* %67 = OpAccessChain %58 %59 
                                                      OpStore %67 %66 
                                        f32_3 %69 = OpLoad %36 
                                        f32_3 %70 = OpFNegate %69 
                               Uniform f32_4* %72 = OpAccessChain %45 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %70 %74 
                                                      OpStore %68 %75 
                               Uniform f32_4* %76 = OpAccessChain %45 %71 
                                        f32_4 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 3 3 3 
                                        f32_3 %79 = OpLoad %68 
                                        f32_3 %80 = OpFMul %78 %79 
                                        f32_3 %81 = OpLoad %36 
                                        f32_3 %82 = OpFAdd %80 %81 
                                                      OpStore %36 %82 
                                        f32_3 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 1 1 1 
                               Uniform f32_4* %89 = OpAccessChain %45 %87 %88 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFMul %86 %91 
                                                      OpStore %68 %92 
                               Uniform f32_4* %94 = OpAccessChain %45 %87 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpLoad %84 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 0 0 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_3 %100 = OpLoad %68 
                                       f32_3 %101 = OpFAdd %99 %100 
                                                      OpStore %68 %101 
                              Uniform f32_4* %103 = OpAccessChain %45 %87 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpLoad %84 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_3 %109 = OpLoad %68 
                                       f32_3 %110 = OpFAdd %108 %109 
                                                      OpStore %68 %110 
                                       f32_3 %111 = OpLoad %68 
                              Uniform f32_4* %113 = OpAccessChain %45 %87 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFAdd %111 %115 
                                                      OpStore %68 %116 
                                Uniform f32* %121 = OpAccessChain %45 %88 %120 
                                         f32 %122 = OpLoad %121 
                                        bool %123 = OpFOrdEqual %122 %33 
                                                      OpStore %119 %123 
                                                      OpSelectionMerge %126 None 
                                                      OpBranchConditional %124 %125 %126 
                                             %125 = OpLabel 
                                        bool %127 = OpLoad %119 
                                                      OpSelectionMerge %129 None 
                                                      OpBranchConditional %127 %128 %129 
                                             %128 = OpLabel 
                                                      OpBranch %129 
                                             %129 = OpLabel 
                                                      OpBranch %126 
                                             %126 = OpLabel 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %233 
                                             %131 = OpLabel 
                                Uniform f32* %134 = OpAccessChain %45 %88 %133 
                                         f32 %135 = OpLoad %134 
                                        bool %136 = OpFOrdEqual %135 %33 
                                                      OpStore %119 %136 
                                       f32_3 %138 = OpLoad %84 
                                       f32_3 %139 = OpVectorShuffle %138 %138 1 1 1 
                              Uniform f32_4* %140 = OpAccessChain %45 %102 %88 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpFMul %139 %142 
                                       f32_4 %144 = OpLoad %137 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 6 3 
                                                      OpStore %137 %145 
                              Uniform f32_4* %146 = OpAccessChain %45 %102 %93 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpLoad %84 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 0 0 
                                       f32_3 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %137 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFAdd %151 %153 
                                       f32_4 %155 = OpLoad %137 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %137 %156 
                              Uniform f32_4* %157 = OpAccessChain %45 %102 %102 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %84 
                                       f32_3 %161 = OpVectorShuffle %160 %160 2 2 2 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_4 %163 = OpLoad %137 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %137 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %137 %167 
                                       f32_4 %168 = OpLoad %137 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %45 %102 %112 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                                       f32_3 %173 = OpFAdd %169 %172 
                                       f32_4 %174 = OpLoad %137 
                                       f32_4 %175 = OpVectorShuffle %174 %173 4 5 6 3 
                                                      OpStore %137 %175 
                                        bool %178 = OpLoad %119 
                                                      OpSelectionMerge %180 None 
                                                      OpBranchConditional %178 %179 %183 
                                             %179 = OpLabel 
                                       f32_4 %181 = OpLoad %137 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                                      OpStore %177 %182 
                                                      OpBranch %180 
                                             %183 = OpLabel 
                                       f32_3 %184 = OpLoad %84 
                                                      OpStore %177 %184 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                       f32_3 %185 = OpLoad %177 
                                       f32_4 %186 = OpLoad %137 
                                       f32_4 %187 = OpVectorShuffle %186 %185 4 5 6 3 
                                                      OpStore %137 %187 
                                       f32_4 %188 = OpLoad %137 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                              Uniform f32_3* %192 = OpAccessChain %45 %190 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFNegate %193 
                                       f32_3 %195 = OpFAdd %189 %194 
                                       f32_4 %196 = OpLoad %137 
                                       f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                      OpStore %137 %197 
                                       f32_4 %198 = OpLoad %137 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_3* %200 = OpAccessChain %45 %112 
                                       f32_3 %201 = OpLoad %200 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %137 
                                       f32_4 %204 = OpVectorShuffle %203 %202 0 4 5 6 
                                                      OpStore %137 %204 
                                Private f32* %206 = OpAccessChain %137 %133 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %211 = OpFAdd %209 %210 
                                                      OpStore %205 %211 
                                Uniform f32* %214 = OpAccessChain %45 %88 %213 
                                         f32 %215 = OpLoad %214 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %218 = OpFAdd %217 %210 
                                                      OpStore %212 %218 
                                         f32 %219 = OpLoad %205 
                                         f32 %220 = OpLoad %212 
                                         f32 %221 = OpExtInst %1 40 %219 %220 
                                Private f32* %222 = OpAccessChain %137 %120 
                                                      OpStore %222 %221 
                  read_only Texture3DSampled %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %137 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 2 3 
                                       f32_4 %230 = OpImageSampleImplicitLod %227 %229 
                                                      OpStore %137 %230 
                                       f32_4 %232 = OpLoad %137 
                                                      OpStore %231 %232 
                                                      OpBranch %132 
                                             %233 = OpLabel 
                                Private f32* %234 = OpAccessChain %231 %120 
                                                      OpStore %234 %33 
                                Private f32* %235 = OpAccessChain %231 %133 
                                                      OpStore %235 %33 
                                Private f32* %236 = OpAccessChain %231 %213 
                                                      OpStore %236 %33 
                                Private f32* %237 = OpAccessChain %231 %59 
                                                      OpStore %237 %33 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                       f32_4 %239 = OpLoad %231 
                              Uniform f32_4* %240 = OpAccessChain %45 %93 
                                       f32_4 %241 = OpLoad %240 
                                         f32 %242 = OpDot %239 %241 
                                Private f32* %243 = OpAccessChain %238 %120 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %238 %120 
                                         f32 %245 = OpLoad %244 
                                         f32 %247 = OpExtInst %1 43 %245 %246 %33 
                                Private f32* %248 = OpAccessChain %238 %120 
                                                      OpStore %248 %247 
                                       f32_3 %249 = OpLoad %68 
                                       f32_3 %250 = OpLoad %68 
                                         f32 %251 = OpDot %249 %250 
                                                      OpStore %205 %251 
                  read_only Texture2DSampled %253 = OpLoad %252 
                                         f32 %254 = OpLoad %205 
                                       f32_2 %255 = OpCompositeConstruct %254 %254 
                                       f32_4 %256 = OpImageSampleImplicitLod %253 %255 
                                         f32 %257 = OpCompositeExtract %256 3 
                                                      OpStore %205 %257 
                read_only TextureCubeSampled %262 = OpLoad %261 
                                       f32_3 %263 = OpLoad %68 
                                       f32_4 %264 = OpImageSampleImplicitLod %262 %263 
                                         f32 %265 = OpCompositeExtract %264 3 
                                Private f32* %266 = OpAccessChain %68 %120 
                                                      OpStore %266 %265 
                                         f32 %267 = OpLoad %205 
                                Private f32* %268 = OpAccessChain %68 %120 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFMul %267 %269 
                                                      OpStore %205 %270 
                                Private f32* %271 = OpAccessChain %238 %120 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpLoad %205 
                                         f32 %274 = OpFMul %272 %273 
                                                      OpStore %205 %274 
                                       f32_3 %275 = OpLoad %36 
                              Uniform f32_4* %277 = OpAccessChain %45 %276 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                                       f32_3 %280 = OpFMul %275 %279 
                                                      OpStore %238 %280 
                                         f32 %282 = OpLoad %205 
                                       f32_3 %283 = OpCompositeConstruct %282 %282 %282 
                                       f32_3 %284 = OpLoad %238 
                                       f32_3 %285 = OpFMul %283 %284 
                                                      OpStore %281 %285 
                                       f32_3 %286 = OpLoad %238 
                                       f32_3 %287 = OpFNegate %286 
                                         f32 %288 = OpLoad %205 
                                       f32_3 %289 = OpCompositeConstruct %288 %288 %288 
                                       f32_3 %290 = OpFMul %287 %289 
                              Uniform f32_4* %291 = OpAccessChain %45 %71 
                                       f32_4 %292 = OpLoad %291 
                                       f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                       f32_3 %294 = OpFAdd %290 %293 
                                                      OpStore %36 %294 
                              Uniform f32_4* %295 = OpAccessChain %45 %71 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 3 3 3 
                                       f32_3 %298 = OpLoad %36 
                                       f32_3 %299 = OpFMul %297 %298 
                                       f32_3 %300 = OpLoad %281 
                                       f32_3 %301 = OpFAdd %299 %300 
                                       f32_4 %302 = OpLoad %58 
                                       f32_4 %303 = OpVectorShuffle %302 %301 4 5 6 3 
                                                      OpStore %58 %303 
                                       f32_4 %306 = OpLoad %58 
                                                      OpStore %305 %306 
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
uniform 	vec4 _DashColor;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    SV_Target0.w = u_xlat10_0.w * _Opacity;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb9 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb9){
        u_xlatb9 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb9)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat9 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat9 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat10_1 = texture(_LightTexture0, u_xlat1.xy);
    u_xlat9 = u_xlat9 * u_xlat10_1.w;
    u_xlat0.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 303
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %84 %300 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %43 0 RelaxedPrecision 
                                                      OpMemberDecorate %43 0 Offset 43 
                                                      OpMemberDecorate %43 1 Offset 43 
                                                      OpMemberDecorate %43 2 Offset 43 
                                                      OpMemberDecorate %43 3 Offset 43 
                                                      OpMemberDecorate %43 4 Offset 43 
                                                      OpMemberDecorate %43 5 RelaxedPrecision 
                                                      OpMemberDecorate %43 5 Offset 43 
                                                      OpMemberDecorate %43 6 Offset 43 
                                                      OpMemberDecorate %43 7 Offset 43 
                                                      OpMemberDecorate %43 8 Offset 43 
                                                      OpMemberDecorate %43 9 Offset 43 
                                                      OpDecorate %43 Block 
                                                      OpDecorate %45 DescriptorSet 45 
                                                      OpDecorate %45 Binding 45 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %141 SpecId 141 
                                                      OpDecorate %237 DescriptorSet 237 
                                                      OpDecorate %237 Binding 237 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %260 DescriptorSet 260 
                                                      OpDecorate %260 Binding 260 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %300 Location 300 
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
                                 Private f32* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                              %35 = OpTypePointer Private %22 
                               Private f32_3* %36 = OpVariable Private 
                                              %39 = OpTypeInt 32 0 
                                          u32 %40 = OpConstant 4 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeArray %7 %40 
                                              %43 = OpTypeStruct %7 %7 %41 %22 %22 %7 %42 %7 %6 %7 
                                              %44 = OpTypePointer Uniform %43 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32_4; f32; f32_4;}* %45 = OpVariable Uniform 
                                              %46 = OpTypeInt 32 1 
                                          i32 %47 = OpConstant 7 
                                              %48 = OpTypePointer Uniform %7 
                               Private f32_4* %58 = OpVariable Private 
                                          u32 %59 = OpConstant 3 
                                          i32 %62 = OpConstant 8 
                                              %63 = OpTypePointer Uniform %6 
                               Private f32_3* %68 = OpVariable Private 
                                          i32 %71 = OpConstant 9 
                                              %83 = OpTypePointer Input %22 
                                 Input f32_3* %84 = OpVariable Input 
                                          i32 %87 = OpConstant 6 
                                          i32 %88 = OpConstant 1 
                                          i32 %95 = OpConstant 0 
                                         i32 %107 = OpConstant 2 
                                         i32 %121 = OpConstant 3 
                                             %128 = OpTypeBool 
                                             %129 = OpTypePointer Private %128 
                               Private bool* %130 = OpVariable Private 
                                         u32 %131 = OpConstant 0 
                                        bool %135 = OpConstantFalse 
                                        bool %141 = OpSpecConstantFalse 
                                         u32 %144 = OpConstant 1 
                              Private f32_4* %148 = OpVariable Private 
                                             %187 = OpTypePointer Function %22 
                                         i32 %201 = OpConstant 4 
                                             %202 = OpTypePointer Uniform %22 
                                Private f32* %216 = OpVariable Private 
                                         f32 %219 = OpConstant 3.67402E-40 
                                         f32 %221 = OpConstant 3.67402E-40 
                                Private f32* %223 = OpVariable Private 
                                         u32 %224 = OpConstant 2 
                                         f32 %227 = OpConstant 3.67402E-40 
                                             %234 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %235 = OpTypeSampledImage %234 
                                             %236 = OpTypePointer UniformConstant %235 
 UniformConstant read_only Texture3DSampled* %237 = OpVariable UniformConstant 
                              Private f32_4* %242 = OpVariable Private 
                              Private f32_3* %249 = OpVariable Private 
                                         f32 %257 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %260 = OpVariable UniformConstant 
                                         i32 %271 = OpConstant 5 
                              Private f32_3* %276 = OpVariable Private 
                                             %299 = OpTypePointer Output %7 
                               Output f32_4* %300 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %188 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %29 = OpDot %24 %28 
                                                      OpStore %21 %29 
                                          f32 %31 = OpLoad %21 
                                          f32 %32 = OpFNegate %31 
                                          f32 %34 = OpFAdd %32 %33 
                                                      OpStore %30 %34 
                                          f32 %37 = OpLoad %30 
                                        f32_3 %38 = OpCompositeConstruct %37 %37 %37 
                               Uniform f32_4* %49 = OpAccessChain %45 %47 
                                        f32_4 %50 = OpLoad %49 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFNegate %51 
                                        f32_3 %53 = OpFMul %38 %52 
                               Uniform f32_4* %54 = OpAccessChain %45 %47 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                        f32_3 %57 = OpFAdd %53 %56 
                                                      OpStore %36 %57 
                                 Private f32* %60 = OpAccessChain %9 %59 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %64 = OpAccessChain %45 %62 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFMul %61 %65 
                                 Private f32* %67 = OpAccessChain %58 %59 
                                                      OpStore %67 %66 
                                        f32_3 %69 = OpLoad %36 
                                        f32_3 %70 = OpFNegate %69 
                               Uniform f32_4* %72 = OpAccessChain %45 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %70 %74 
                                                      OpStore %68 %75 
                               Uniform f32_4* %76 = OpAccessChain %45 %71 
                                        f32_4 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 3 3 3 
                                        f32_3 %79 = OpLoad %68 
                                        f32_3 %80 = OpFMul %78 %79 
                                        f32_3 %81 = OpLoad %36 
                                        f32_3 %82 = OpFAdd %80 %81 
                                                      OpStore %36 %82 
                                        f32_3 %85 = OpLoad %84 
                                        f32_2 %86 = OpVectorShuffle %85 %85 1 1 
                               Uniform f32_4* %89 = OpAccessChain %45 %87 %88 
                                        f32_4 %90 = OpLoad %89 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 1 
                                        f32_2 %92 = OpFMul %86 %91 
                                        f32_3 %93 = OpLoad %68 
                                        f32_3 %94 = OpVectorShuffle %93 %92 3 4 2 
                                                      OpStore %68 %94 
                               Uniform f32_4* %96 = OpAccessChain %45 %87 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_3 %99 = OpLoad %84 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_3 %102 = OpLoad %68 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_3 %105 = OpLoad %68 
                                       f32_3 %106 = OpVectorShuffle %105 %104 3 4 2 
                                                      OpStore %68 %106 
                              Uniform f32_4* %108 = OpAccessChain %45 %87 %107 
                                       f32_4 %109 = OpLoad %108 
                                       f32_2 %110 = OpVectorShuffle %109 %109 0 1 
                                       f32_3 %111 = OpLoad %84 
                                       f32_2 %112 = OpVectorShuffle %111 %111 2 2 
                                       f32_2 %113 = OpFMul %110 %112 
                                       f32_3 %114 = OpLoad %68 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFAdd %113 %115 
                                       f32_3 %117 = OpLoad %68 
                                       f32_3 %118 = OpVectorShuffle %117 %116 3 4 2 
                                                      OpStore %68 %118 
                                       f32_3 %119 = OpLoad %68 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                              Uniform f32_4* %122 = OpAccessChain %45 %87 %121 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpFAdd %120 %124 
                                       f32_3 %126 = OpLoad %68 
                                       f32_3 %127 = OpVectorShuffle %126 %125 3 4 2 
                                                      OpStore %68 %127 
                                Uniform f32* %132 = OpAccessChain %45 %88 %131 
                                         f32 %133 = OpLoad %132 
                                        bool %134 = OpFOrdEqual %133 %33 
                                                      OpStore %130 %134 
                                                      OpSelectionMerge %137 None 
                                                      OpBranchConditional %135 %136 %137 
                                             %136 = OpLabel 
                                        bool %138 = OpLoad %130 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %140 
                                             %139 = OpLabel 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                                      OpBranch %137 
                                             %137 = OpLabel 
                                                      OpSelectionMerge %143 None 
                                                      OpBranchConditional %141 %142 %244 
                                             %142 = OpLabel 
                                Uniform f32* %145 = OpAccessChain %45 %88 %144 
                                         f32 %146 = OpLoad %145 
                                        bool %147 = OpFOrdEqual %146 %33 
                                                      OpStore %130 %147 
                                       f32_3 %149 = OpLoad %84 
                                       f32_3 %150 = OpVectorShuffle %149 %149 1 1 1 
                              Uniform f32_4* %151 = OpAccessChain %45 %107 %88 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                       f32_3 %154 = OpFMul %150 %153 
                                       f32_4 %155 = OpLoad %148 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 6 3 
                                                      OpStore %148 %156 
                              Uniform f32_4* %157 = OpAccessChain %45 %107 %95 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpLoad %84 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 0 0 
                                       f32_3 %162 = OpFMul %159 %161 
                                       f32_4 %163 = OpLoad %148 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %148 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %148 %167 
                              Uniform f32_4* %168 = OpAccessChain %45 %107 %107 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpLoad %84 
                                       f32_3 %172 = OpVectorShuffle %171 %171 2 2 2 
                                       f32_3 %173 = OpFMul %170 %172 
                                       f32_4 %174 = OpLoad %148 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFAdd %173 %175 
                                       f32_4 %177 = OpLoad %148 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %148 %178 
                                       f32_4 %179 = OpLoad %148 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                              Uniform f32_4* %181 = OpAccessChain %45 %107 %121 
                                       f32_4 %182 = OpLoad %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFAdd %180 %183 
                                       f32_4 %185 = OpLoad %148 
                                       f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                                      OpStore %148 %186 
                                        bool %189 = OpLoad %130 
                                                      OpSelectionMerge %191 None 
                                                      OpBranchConditional %189 %190 %194 
                                             %190 = OpLabel 
                                       f32_4 %192 = OpLoad %148 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                                      OpStore %188 %193 
                                                      OpBranch %191 
                                             %194 = OpLabel 
                                       f32_3 %195 = OpLoad %84 
                                                      OpStore %188 %195 
                                                      OpBranch %191 
                                             %191 = OpLabel 
                                       f32_3 %196 = OpLoad %188 
                                       f32_4 %197 = OpLoad %148 
                                       f32_4 %198 = OpVectorShuffle %197 %196 4 5 6 3 
                                                      OpStore %148 %198 
                                       f32_4 %199 = OpLoad %148 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_3* %203 = OpAccessChain %45 %201 
                                       f32_3 %204 = OpLoad %203 
                                       f32_3 %205 = OpFNegate %204 
                                       f32_3 %206 = OpFAdd %200 %205 
                                       f32_4 %207 = OpLoad %148 
                                       f32_4 %208 = OpVectorShuffle %207 %206 4 5 6 3 
                                                      OpStore %148 %208 
                                       f32_4 %209 = OpLoad %148 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 1 2 
                              Uniform f32_3* %211 = OpAccessChain %45 %121 
                                       f32_3 %212 = OpLoad %211 
                                       f32_3 %213 = OpFMul %210 %212 
                                       f32_4 %214 = OpLoad %148 
                                       f32_4 %215 = OpVectorShuffle %214 %213 0 4 5 6 
                                                      OpStore %148 %215 
                                Private f32* %217 = OpAccessChain %148 %144 
                                         f32 %218 = OpLoad %217 
                                         f32 %220 = OpFMul %218 %219 
                                         f32 %222 = OpFAdd %220 %221 
                                                      OpStore %216 %222 
                                Uniform f32* %225 = OpAccessChain %45 %88 %224 
                                         f32 %226 = OpLoad %225 
                                         f32 %228 = OpFMul %226 %227 
                                         f32 %229 = OpFAdd %228 %221 
                                                      OpStore %223 %229 
                                         f32 %230 = OpLoad %216 
                                         f32 %231 = OpLoad %223 
                                         f32 %232 = OpExtInst %1 40 %230 %231 
                                Private f32* %233 = OpAccessChain %148 %131 
                                                      OpStore %233 %232 
                  read_only Texture3DSampled %238 = OpLoad %237 
                                       f32_4 %239 = OpLoad %148 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 2 3 
                                       f32_4 %241 = OpImageSampleImplicitLod %238 %240 
                                                      OpStore %148 %241 
                                       f32_4 %243 = OpLoad %148 
                                                      OpStore %242 %243 
                                                      OpBranch %143 
                                             %244 = OpLabel 
                                Private f32* %245 = OpAccessChain %242 %131 
                                                      OpStore %245 %33 
                                Private f32* %246 = OpAccessChain %242 %144 
                                                      OpStore %246 %33 
                                Private f32* %247 = OpAccessChain %242 %224 
                                                      OpStore %247 %33 
                                Private f32* %248 = OpAccessChain %242 %59 
                                                      OpStore %248 %33 
                                                      OpBranch %143 
                                             %143 = OpLabel 
                                       f32_4 %250 = OpLoad %242 
                              Uniform f32_4* %251 = OpAccessChain %45 %95 
                                       f32_4 %252 = OpLoad %251 
                                         f32 %253 = OpDot %250 %252 
                                Private f32* %254 = OpAccessChain %249 %131 
                                                      OpStore %254 %253 
                                Private f32* %255 = OpAccessChain %249 %131 
                                         f32 %256 = OpLoad %255 
                                         f32 %258 = OpExtInst %1 43 %256 %257 %33 
                                Private f32* %259 = OpAccessChain %249 %131 
                                                      OpStore %259 %258 
                  read_only Texture2DSampled %261 = OpLoad %260 
                                       f32_3 %262 = OpLoad %68 
                                       f32_2 %263 = OpVectorShuffle %262 %262 0 1 
                                       f32_4 %264 = OpImageSampleImplicitLod %261 %263 
                                         f32 %265 = OpCompositeExtract %264 3 
                                                      OpStore %216 %265 
                                Private f32* %266 = OpAccessChain %249 %131 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpLoad %216 
                                         f32 %269 = OpFMul %267 %268 
                                                      OpStore %216 %269 
                                       f32_3 %270 = OpLoad %36 
                              Uniform f32_4* %272 = OpAccessChain %45 %271 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFMul %270 %274 
                                                      OpStore %249 %275 
                                         f32 %277 = OpLoad %216 
                                       f32_3 %278 = OpCompositeConstruct %277 %277 %277 
                                       f32_3 %279 = OpLoad %249 
                                       f32_3 %280 = OpFMul %278 %279 
                                                      OpStore %276 %280 
                                       f32_3 %281 = OpLoad %249 
                                       f32_3 %282 = OpFNegate %281 
                                         f32 %283 = OpLoad %216 
                                       f32_3 %284 = OpCompositeConstruct %283 %283 %283 
                                       f32_3 %285 = OpFMul %282 %284 
                              Uniform f32_4* %286 = OpAccessChain %45 %71 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_3 %289 = OpFAdd %285 %288 
                                                      OpStore %36 %289 
                              Uniform f32_4* %290 = OpAccessChain %45 %71 
                                       f32_4 %291 = OpLoad %290 
                                       f32_3 %292 = OpVectorShuffle %291 %291 3 3 3 
                                       f32_3 %293 = OpLoad %36 
                                       f32_3 %294 = OpFMul %292 %293 
                                       f32_3 %295 = OpLoad %276 
                                       f32_3 %296 = OpFAdd %294 %295 
                                       f32_4 %297 = OpLoad %58 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %58 %298 
                                       f32_4 %301 = OpLoad %58 
                                                      OpStore %300 %301 
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "META" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  Lighting On
  GpuProgramID 168366
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

uniform 	vec4 _DashColor;
uniform 	float _EmissivePower;
uniform 	float _EmissiveColorPower;
uniform 	float _Opacity;
uniform 	vec4 _OverrideColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform 	float unity_UseLinearSpace;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = (-u_xlat16_0) + 1.0;
    u_xlat0.xyz = vec3(u_xlat16_0) * (-_DashColor.xyz) + _DashColor.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_EmissiveColorPower, _EmissiveColorPower, _EmissiveColorPower));
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(_EmissivePower);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Opacity, _Opacity, _Opacity));
    u_xlat2.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlatb9 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(unity_UseLinearSpace);
    u_xlat1.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat2.xyz;
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
; Bound: 223
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %209 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpMemberDecorate %45 0 Offset 45 
                                                      OpMemberDecorate %45 1 Offset 45 
                                                      OpMemberDecorate %45 2 Offset 45 
                                                      OpMemberDecorate %45 3 Offset 45 
                                                      OpMemberDecorate %45 4 Offset 45 
                                                      OpMemberDecorate %45 5 Offset 45 
                                                      OpMemberDecorate %45 6 Offset 45 
                                                      OpMemberDecorate %45 7 Offset 45 
                                                      OpMemberDecorate %45 8 Offset 45 
                                                      OpDecorate %45 Block 
                                                      OpDecorate %47 DescriptorSet 47 
                                                      OpDecorate %47 Binding 47 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %209 Location 209 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
  UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 2 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_2* %17 = OpVariable Input 
                                              %19 = OpTypeVector %6 4 
                                              %22 = OpTypePointer Private %19 
                               Private f32_4* %23 = OpVariable Private 
                                          f32 %25 = OpConstant 3.67402E-40 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                        f32_3 %28 = OpConstantComposite %25 %26 %27 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                               Private f32_4* %34 = OpVariable Private 
                                          f32 %38 = OpConstant 3.67402E-40 
                               Private f32_3* %41 = OpVariable Private 
                                              %44 = OpTypeVector %30 4 
                                              %45 = OpTypeStruct %19 %6 %6 %6 %19 %44 %6 %6 %6 
                                              %46 = OpTypePointer Uniform %45 
Uniform struct {f32_4; f32; f32; f32; f32_4; u32_4; f32; f32; f32;}* %47 = OpVariable Uniform 
                                              %48 = OpTypeInt 32 1 
                                          i32 %49 = OpConstant 0 
                                              %50 = OpTypePointer Uniform %19 
                               Private f32_3* %60 = OpVariable Private 
                                          i32 %63 = OpConstant 4 
                                          i32 %78 = OpConstant 2 
                                              %79 = OpTypePointer Uniform %6 
                                          i32 %95 = OpConstant 1 
                                         i32 %101 = OpConstant 3 
                              Private f32_3* %114 = OpVariable Private 
                                         f32 %116 = OpConstant 3.67402E-40 
                                       f32_3 %117 = OpConstantComposite %116 %116 %116 
                                         f32 %119 = OpConstant 3.67402E-40 
                                       f32_3 %120 = OpConstantComposite %119 %119 %119 
                                         f32 %125 = OpConstant 3.67402E-40 
                                       f32_3 %126 = OpConstantComposite %125 %125 %125 
                                             %131 = OpTypeBool 
                                             %132 = OpTypePointer Private %131 
                               Private bool* %133 = OpVariable Private 
                                         f32 %134 = OpConstant 3.67402E-40 
                                       f32_4 %135 = OpConstantComposite %134 %134 %134 %134 
                                         i32 %136 = OpConstant 8 
                                             %140 = OpTypeVector %131 4 
                                             %143 = OpTypePointer Function %7 
                                Private f32* %154 = OpVariable Private 
                                         i32 %155 = OpConstant 6 
                                         i32 %167 = OpConstant 7 
                                         i32 %181 = OpConstant 5 
                                             %182 = OpTypePointer Uniform %44 
                                       f32_3 %191 = OpConstantComposite %134 %134 %134 
                                             %195 = OpTypePointer Function %6 
                                         u32 %205 = OpConstant 3 
                                             %208 = OpTypePointer Output %19 
                               Output f32_4* %209 = OpVariable Output 
                                             %210 = OpTypePointer Function %19 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %144 = OpVariable Function 
                             Function f32_3* %180 = OpVariable Function 
                               Function f32* %196 = OpVariable Function 
                             Function f32_4* %211 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                        f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                      OpStore %9 %21 
                                        f32_3 %24 = OpLoad %9 
                                          f32 %29 = OpDot %24 %28 
                                 Private f32* %33 = OpAccessChain %23 %31 
                                                      OpStore %33 %29 
                                 Private f32* %35 = OpAccessChain %23 %31 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %39 = OpFAdd %37 %38 
                                 Private f32* %40 = OpAccessChain %34 %31 
                                                      OpStore %40 %39 
                                        f32_4 %42 = OpLoad %34 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 0 0 
                               Uniform f32_4* %51 = OpAccessChain %47 %49 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFNegate %53 
                                        f32_3 %55 = OpFMul %43 %54 
                               Uniform f32_4* %56 = OpAccessChain %47 %49 
                                        f32_4 %57 = OpLoad %56 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                        f32_3 %59 = OpFAdd %55 %58 
                                                      OpStore %41 %59 
                                        f32_3 %61 = OpLoad %41 
                                        f32_3 %62 = OpFNegate %61 
                               Uniform f32_4* %64 = OpAccessChain %47 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                                        f32_3 %67 = OpFAdd %62 %66 
                                                      OpStore %60 %67 
                               Uniform f32_4* %68 = OpAccessChain %47 %63 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 3 3 3 
                                        f32_3 %71 = OpLoad %60 
                                        f32_3 %72 = OpFMul %70 %71 
                                        f32_3 %73 = OpLoad %41 
                                        f32_3 %74 = OpFAdd %72 %73 
                                                      OpStore %41 %74 
                                        f32_3 %75 = OpLoad %41 
                                        f32_3 %76 = OpExtInst %1 30 %75 
                                                      OpStore %41 %76 
                                        f32_3 %77 = OpLoad %41 
                                 Uniform f32* %80 = OpAccessChain %47 %78 
                                          f32 %81 = OpLoad %80 
                                 Uniform f32* %82 = OpAccessChain %47 %78 
                                          f32 %83 = OpLoad %82 
                                 Uniform f32* %84 = OpAccessChain %47 %78 
                                          f32 %85 = OpLoad %84 
                                        f32_3 %86 = OpCompositeConstruct %81 %83 %85 
                                          f32 %87 = OpCompositeExtract %86 0 
                                          f32 %88 = OpCompositeExtract %86 1 
                                          f32 %89 = OpCompositeExtract %86 2 
                                        f32_3 %90 = OpCompositeConstruct %87 %88 %89 
                                        f32_3 %91 = OpFMul %77 %90 
                                                      OpStore %60 %91 
                                        f32_3 %92 = OpLoad %60 
                                        f32_3 %93 = OpExtInst %1 29 %92 
                                                      OpStore %60 %93 
                                        f32_3 %94 = OpLoad %60 
                                 Uniform f32* %96 = OpAccessChain %47 %95 
                                          f32 %97 = OpLoad %96 
                                        f32_3 %98 = OpCompositeConstruct %97 %97 %97 
                                        f32_3 %99 = OpFMul %94 %98 
                                                      OpStore %60 %99 
                                       f32_3 %100 = OpLoad %60 
                                Uniform f32* %102 = OpAccessChain %47 %101 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %47 %101 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %106 = OpAccessChain %47 %101 
                                         f32 %107 = OpLoad %106 
                                       f32_3 %108 = OpCompositeConstruct %103 %105 %107 
                                         f32 %109 = OpCompositeExtract %108 0 
                                         f32 %110 = OpCompositeExtract %108 1 
                                         f32 %111 = OpCompositeExtract %108 2 
                                       f32_3 %112 = OpCompositeConstruct %109 %110 %111 
                                       f32_3 %113 = OpFMul %100 %112 
                                                      OpStore %60 %113 
                                       f32_3 %115 = OpLoad %60 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_3 %121 = OpFAdd %118 %120 
                                                      OpStore %114 %121 
                                       f32_3 %122 = OpLoad %60 
                                       f32_3 %123 = OpLoad %114 
                                       f32_3 %124 = OpFMul %122 %123 
                                       f32_3 %127 = OpFAdd %124 %126 
                                                      OpStore %114 %127 
                                       f32_3 %128 = OpLoad %60 
                                       f32_3 %129 = OpLoad %114 
                                       f32_3 %130 = OpFMul %128 %129 
                                                      OpStore %114 %130 
                                Uniform f32* %137 = OpAccessChain %47 %136 
                                         f32 %138 = OpLoad %137 
                                       f32_4 %139 = OpCompositeConstruct %138 %138 %138 %138 
                                      bool_4 %141 = OpFOrdNotEqual %135 %139 
                                        bool %142 = OpAny %141 
                                                      OpStore %133 %142 
                                        bool %145 = OpLoad %133 
                                                      OpSelectionMerge %147 None 
                                                      OpBranchConditional %145 %146 %149 
                                             %146 = OpLabel 
                                       f32_3 %148 = OpLoad %60 
                                                      OpStore %144 %148 
                                                      OpBranch %147 
                                             %149 = OpLabel 
                                       f32_3 %150 = OpLoad %114 
                                                      OpStore %144 %150 
                                                      OpBranch %147 
                                             %147 = OpLabel 
                                       f32_3 %151 = OpLoad %144 
                                       f32_4 %152 = OpLoad %23 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 6 3 
                                                      OpStore %23 %153 
                                Uniform f32* %156 = OpAccessChain %47 %155 
                                         f32 %157 = OpLoad %156 
                                                      OpStore %154 %157 
                                         f32 %158 = OpLoad %154 
                                         f32 %159 = OpExtInst %1 43 %158 %134 %38 
                                                      OpStore %154 %159 
                                       f32_3 %160 = OpLoad %41 
                                         f32 %161 = OpLoad %154 
                                       f32_3 %162 = OpCompositeConstruct %161 %161 %161 
                                       f32_3 %163 = OpFMul %160 %162 
                                                      OpStore %41 %163 
                                       f32_3 %164 = OpLoad %41 
                                       f32_3 %165 = OpExtInst %1 29 %164 
                                                      OpStore %41 %165 
                                       f32_3 %166 = OpLoad %41 
                                Uniform f32* %168 = OpAccessChain %47 %167 
                                         f32 %169 = OpLoad %168 
                                Uniform f32* %170 = OpAccessChain %47 %167 
                                         f32 %171 = OpLoad %170 
                                Uniform f32* %172 = OpAccessChain %47 %167 
                                         f32 %173 = OpLoad %172 
                                       f32_3 %174 = OpCompositeConstruct %169 %171 %173 
                                         f32 %175 = OpCompositeExtract %174 0 
                                         f32 %176 = OpCompositeExtract %174 1 
                                         f32 %177 = OpCompositeExtract %174 2 
                                       f32_3 %178 = OpCompositeConstruct %175 %176 %177 
                                       f32_3 %179 = OpExtInst %1 37 %166 %178 
                                                      OpStore %41 %179 
                              Uniform u32_4* %183 = OpAccessChain %47 %181 
                                       u32_4 %184 = OpLoad %183 
                                         u32 %185 = OpCompositeExtract %184 0 
                                        bool %186 = OpINotEqual %185 %31 
                                                      OpSelectionMerge %188 None 
                                                      OpBranchConditional %186 %187 %190 
                                             %187 = OpLabel 
                                       f32_3 %189 = OpLoad %41 
                                                      OpStore %180 %189 
                                                      OpBranch %188 
                                             %190 = OpLabel 
                                                      OpStore %180 %191 
                                                      OpBranch %188 
                                             %188 = OpLabel 
                                       f32_3 %192 = OpLoad %180 
                                       f32_4 %193 = OpLoad %34 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
                                                      OpStore %34 %194 
                              Uniform u32_4* %197 = OpAccessChain %47 %181 
                                       u32_4 %198 = OpLoad %197 
                                         u32 %199 = OpCompositeExtract %198 0 
                                        bool %200 = OpINotEqual %199 %31 
                                                      OpSelectionMerge %202 None 
                                                      OpBranchConditional %200 %201 %203 
                                             %201 = OpLabel 
                                                      OpStore %196 %38 
                                                      OpBranch %202 
                                             %203 = OpLabel 
                                                      OpStore %196 %134 
                                                      OpBranch %202 
                                             %202 = OpLabel 
                                         f32 %204 = OpLoad %196 
                                Private f32* %206 = OpAccessChain %34 %205 
                                                      OpStore %206 %204 
                                Private f32* %207 = OpAccessChain %23 %205 
                                                      OpStore %207 %38 
                              Uniform u32_4* %212 = OpAccessChain %47 %181 
                                       u32_4 %213 = OpLoad %212 
                                         u32 %214 = OpCompositeExtract %213 1 
                                        bool %215 = OpINotEqual %214 %31 
                                                      OpSelectionMerge %217 None 
                                                      OpBranchConditional %215 %216 %219 
                                             %216 = OpLabel 
                                       f32_4 %218 = OpLoad %23 
                                                      OpStore %211 %218 
                                                      OpBranch %217 
                                             %219 = OpLabel 
                                       f32_4 %220 = OpLoad %34 
                                                      OpStore %211 %220 
                                                      OpBranch %217 
                                             %217 = OpLabel 
                                       f32_4 %221 = OpLoad %211 
                                                      OpStore %209 %221 
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