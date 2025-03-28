//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/LitTk2dCustomFalloffTintableTilted" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_MaxValue ("Max Value", Float) = 1
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
  GpuProgramID 36199
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
out vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat1.w = u_xlat10_0.w;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlatb12 = u_xlat1.y>=u_xlat1.z;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.x>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat2.xyw;
    u_xlat3.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat3.wyx;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat2 = vec4(u_xlat12) * u_xlat2 + u_xlat3;
    u_xlat12 = min(u_xlat2.y, u_xlat2.w);
    u_xlat12 = (-u_xlat12) + u_xlat2.x;
    u_xlat1.x = (-u_xlat2.y) + u_xlat2.w;
    u_xlat5 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = u_xlat1.x + u_xlat2.z;
    u_xlat5 = u_xlat2.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat5;
    u_xlatb5 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat5 = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat16_4 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat4.x = u_xlat5 * u_xlat16_4 + u_xlat10_0.z;
    u_xlatb8 = u_xlat10_0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat4.x) + u_xlat10_0.x;
    u_xlat0 = u_xlat8 * u_xlat0 + u_xlat4.x;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat2.x);
    u_xlat1.xyz = abs(u_xlat1.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * vec3(u_xlat0);
    SV_Target0.w = u_xlat1.w;
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
; Bound: 484
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %76 %192 %475 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %67 SpecId 67 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %169 DescriptorSet 169 
                                                      OpDecorate %169 Binding 169 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %475 Location 475 
                                                      OpDecorate %480 RelaxedPrecision 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 7 
                                              %33 = OpTypePointer Uniform %7 
                                              %51 = OpTypeBool 
                                              %52 = OpTypePointer Private %51 
                                Private bool* %53 = OpVariable Private 
                                          i32 %54 = OpConstant 1 
                                          u32 %55 = OpConstant 0 
                                              %56 = OpTypePointer Uniform %6 
                                          f32 %59 = OpConstant 3.67402E-40 
                                         bool %61 = OpConstantFalse 
                                         bool %67 = OpSpecConstantFalse 
                                          u32 %70 = OpConstant 1 
                               Private f32_4* %74 = OpVariable Private 
                                              %75 = OpTypePointer Input %21 
                                 Input f32_3* %76 = OpVariable Input 
                                          i32 %79 = OpConstant 2 
                                          i32 %86 = OpConstant 0 
                                         i32 %111 = OpConstant 3 
                                             %118 = OpTypePointer Function %21 
                                         i32 %132 = OpConstant 4 
                                             %133 = OpTypePointer Uniform %21 
                                             %147 = OpTypePointer Private %6 
                                Private f32* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %153 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %166 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %167 = OpTypeSampledImage %166 
                                             %168 = OpTypePointer UniformConstant %167 
 UniformConstant read_only Texture3DSampled* %169 = OpVariable UniformConstant 
                              Private f32_4* %174 = OpVariable Private 
                                         u32 %180 = OpConstant 3 
                                Private f32* %182 = OpVariable Private 
                                         f32 %188 = OpConstant 3.67402E-40 
                                Input f32_3* %192 = OpVariable Input 
                                             %197 = OpTypePointer Private %21 
                              Private f32_3* %198 = OpVariable Private 
                                         i32 %201 = OpConstant 5 
                              Private f32_3* %206 = OpVariable Private 
                              Private f32_4* %236 = OpVariable Private 
                               Private bool* %240 = OpVariable Private 
                                Private f32* %246 = OpVariable Private 
                                             %247 = OpTypePointer Function %6 
                                             %254 = OpTypePointer Private %15 
                              Private f32_2* %255 = OpVariable Private 
                              Private f32_2* %262 = OpVariable Private 
                                         f32 %264 = OpConstant 3.67402E-40 
                                         f32 %279 = OpConstant 3.67402E-40 
                                       f32_2 %280 = OpConstantComposite %264 %279 
                              Private f32_4* %295 = OpVariable Private 
                              Private f32_4* %305 = OpVariable Private 
                              Private f32_3* %319 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                                Private f32* %350 = OpVariable Private 
                                         f32 %352 = OpConstant 3.67402E-40 
                                         f32 %354 = OpConstant 3.67402E-40 
                               Private bool* %369 = OpVariable Private 
                                Private f32* %382 = OpVariable Private 
                              Private f32_3* %389 = OpVariable Private 
                               Private bool* %398 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                              Private f32_3* %411 = OpVariable Private 
                                         i32 %429 = OpConstant 6 
                                         f32 %443 = OpConstant 3.67402E-40 
                                       f32_3 %444 = OpConstantComposite %59 %279 %443 
                                       f32_3 %449 = OpConstantComposite %352 %352 %352 
                                         f32 %451 = OpConstant 3.67402E-40 
                                       f32_3 %452 = OpConstantComposite %451 %451 %451 
                                       f32_3 %456 = OpConstantComposite %264 %264 %264 
                                       f32_3 %468 = OpConstantComposite %59 %59 %59 
                                             %474 = OpTypePointer Output %7 
                               Output f32_4* %475 = OpVariable Output 
                                             %481 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %119 = OpVariable Function 
                               Function f32* %248 = OpVariable Function 
                               Function f32* %289 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %405 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %40 = OpAccessChain %30 %32 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 3 3 3 
                                        f32_4 %43 = OpLoad %20 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_3 %45 = OpFMul %42 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %20 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %20 %50 
                                 Uniform f32* %57 = OpAccessChain %30 %54 %55 
                                          f32 %58 = OpLoad %57 
                                         bool %60 = OpFOrdEqual %58 %59 
                                                      OpStore %53 %60 
                                                      OpSelectionMerge %63 None 
                                                      OpBranchConditional %61 %62 %63 
                                              %62 = OpLabel 
                                         bool %64 = OpLoad %53 
                                                      OpSelectionMerge %66 None 
                                                      OpBranchConditional %64 %65 %66 
                                              %65 = OpLabel 
                                                      OpBranch %66 
                                              %66 = OpLabel 
                                                      OpBranch %63 
                                              %63 = OpLabel 
                                                      OpSelectionMerge %69 None 
                                                      OpBranchConditional %67 %68 %176 
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %30 %54 %70 
                                          f32 %72 = OpLoad %71 
                                         bool %73 = OpFOrdEqual %72 %59 
                                                      OpStore %53 %73 
                                        f32_3 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 1 1 1 
                               Uniform f32_4* %80 = OpAccessChain %30 %79 %54 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %78 %82 
                                        f32_4 %84 = OpLoad %74 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %74 %85 
                               Uniform f32_4* %87 = OpAccessChain %30 %79 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %76 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %74 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %74 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %74 %97 
                               Uniform f32_4* %98 = OpAccessChain %30 %79 %79 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpVectorShuffle %101 %101 2 2 2 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %74 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %74 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %74 %108 
                                       f32_4 %109 = OpLoad %74 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                              Uniform f32_4* %112 = OpAccessChain %30 %79 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                       f32_4 %116 = OpLoad %74 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %74 %117 
                                        bool %120 = OpLoad %53 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %125 
                                             %121 = OpLabel 
                                       f32_4 %123 = OpLoad %74 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                      OpStore %119 %124 
                                                      OpBranch %122 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %76 
                                                      OpStore %119 %126 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_3 %127 = OpLoad %119 
                                       f32_4 %128 = OpLoad %74 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %74 %129 
                                       f32_4 %130 = OpLoad %74 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %30 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %74 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %74 %139 
                                       f32_4 %140 = OpLoad %74 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %142 = OpAccessChain %30 %111 
                                       f32_3 %143 = OpLoad %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %74 
                                       f32_4 %146 = OpVectorShuffle %145 %144 0 4 5 6 
                                                      OpStore %74 %146 
                                Private f32* %149 = OpAccessChain %74 %70 
                                         f32 %150 = OpLoad %149 
                                         f32 %152 = OpFMul %150 %151 
                                         f32 %154 = OpFAdd %152 %153 
                                                      OpStore %148 %154 
                                Uniform f32* %157 = OpAccessChain %30 %54 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %153 
                                                      OpStore %155 %161 
                                         f32 %162 = OpLoad %148 
                                         f32 %163 = OpLoad %155 
                                         f32 %164 = OpExtInst %1 40 %162 %163 
                                Private f32* %165 = OpAccessChain %74 %55 
                                                      OpStore %165 %164 
                  read_only Texture3DSampled %170 = OpLoad %169 
                                       f32_4 %171 = OpLoad %74 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 2 3 
                                       f32_4 %173 = OpImageSampleImplicitLod %170 %172 
                                                      OpStore %74 %173 
                                       f32_4 %175 = OpLoad %74 
                                                      OpStore %174 %175 
                                                      OpBranch %69 
                                             %176 = OpLabel 
                                Private f32* %177 = OpAccessChain %174 %55 
                                                      OpStore %177 %59 
                                Private f32* %178 = OpAccessChain %174 %70 
                                                      OpStore %178 %59 
                                Private f32* %179 = OpAccessChain %174 %156 
                                                      OpStore %179 %59 
                                Private f32* %181 = OpAccessChain %174 %180 
                                                      OpStore %181 %59 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                       f32_4 %183 = OpLoad %174 
                              Uniform f32_4* %184 = OpAccessChain %30 %86 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                                      OpStore %182 %186 
                                         f32 %187 = OpLoad %182 
                                         f32 %189 = OpExtInst %1 43 %187 %188 %59 
                                                      OpStore %182 %189 
                                       f32_4 %190 = OpLoad %20 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %174 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %174 %196 
                                       f32_4 %199 = OpLoad %20 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_4* %202 = OpAccessChain %30 %201 
                                       f32_4 %203 = OpLoad %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFMul %200 %204 
                                                      OpStore %198 %205 
                                         f32 %207 = OpLoad %182 
                                       f32_3 %208 = OpCompositeConstruct %207 %207 %207 
                                       f32_3 %209 = OpLoad %198 
                                       f32_3 %210 = OpFMul %208 %209 
                                                      OpStore %206 %210 
                                       f32_3 %211 = OpLoad %198 
                                       f32_3 %212 = OpFNegate %211 
                                         f32 %213 = OpLoad %182 
                                       f32_3 %214 = OpCompositeConstruct %213 %213 %213 
                                       f32_3 %215 = OpFMul %212 %214 
                              Uniform f32_4* %216 = OpAccessChain %30 %32 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %215 %218 
                                       f32_4 %220 = OpLoad %20 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %20 %221 
                              Uniform f32_4* %222 = OpAccessChain %30 %32 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 3 3 3 
                                       f32_4 %225 = OpLoad %20 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %224 %226 
                                       f32_3 %228 = OpLoad %206 
                                       f32_3 %229 = OpFAdd %227 %228 
                                       f32_4 %230 = OpLoad %20 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %20 %231 
                                Private f32* %232 = OpAccessChain %174 %180 
                                                      OpStore %232 %188 
                                Private f32* %233 = OpAccessChain %9 %180 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %20 %180 
                                                      OpStore %235 %234 
                                       f32_4 %237 = OpLoad %20 
                                       f32_4 %238 = OpLoad %174 
                                       f32_4 %239 = OpFAdd %237 %238 
                                                      OpStore %236 %239 
                                Private f32* %241 = OpAccessChain %236 %70 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %236 %156 
                                         f32 %244 = OpLoad %243 
                                        bool %245 = OpFOrdGreaterThanEqual %242 %244 
                                                      OpStore %240 %245 
                                        bool %249 = OpLoad %240 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %249 %250 %252 
                                             %250 = OpLabel 
                                                      OpStore %248 %59 
                                                      OpBranch %251 
                                             %252 = OpLabel 
                                                      OpStore %248 %188 
                                                      OpBranch %251 
                                             %251 = OpLabel 
                                         f32 %253 = OpLoad %248 
                                                      OpStore %246 %253 
                                       f32_4 %256 = OpLoad %236 
                                       f32_2 %257 = OpVectorShuffle %256 %256 2 1 
                                       f32_2 %258 = OpFNegate %257 
                                       f32_4 %259 = OpLoad %236 
                                       f32_2 %260 = OpVectorShuffle %259 %259 1 2 
                                       f32_2 %261 = OpFAdd %258 %260 
                                                      OpStore %255 %261 
                                Private f32* %263 = OpAccessChain %262 %55 
                                                      OpStore %263 %59 
                                Private f32* %265 = OpAccessChain %262 %70 
                                                      OpStore %265 %264 
                                         f32 %266 = OpLoad %246 
                                       f32_2 %267 = OpCompositeConstruct %266 %266 
                                       f32_2 %268 = OpLoad %255 
                                       f32_2 %269 = OpFMul %267 %268 
                                       f32_4 %270 = OpLoad %236 
                                       f32_2 %271 = OpVectorShuffle %270 %270 2 1 
                                       f32_2 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %74 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 2 3 
                                                      OpStore %74 %274 
                                         f32 %275 = OpLoad %246 
                                       f32_2 %276 = OpCompositeConstruct %275 %275 
                                       f32_2 %277 = OpLoad %262 
                                       f32_2 %278 = OpFMul %276 %277 
                                       f32_2 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %74 
                                       f32_4 %283 = OpVectorShuffle %282 %281 0 1 4 5 
                                                      OpStore %74 %283 
                                Private f32* %284 = OpAccessChain %236 %55 
                                         f32 %285 = OpLoad %284 
                                Private f32* %286 = OpAccessChain %74 %55 
                                         f32 %287 = OpLoad %286 
                                        bool %288 = OpFOrdGreaterThanEqual %285 %287 
                                                      OpStore %240 %288 
                                        bool %290 = OpLoad %240 
                                                      OpSelectionMerge %292 None 
                                                      OpBranchConditional %290 %291 %293 
                                             %291 = OpLabel 
                                                      OpStore %289 %59 
                                                      OpBranch %292 
                                             %293 = OpLabel 
                                                      OpStore %289 %188 
                                                      OpBranch %292 
                                             %292 = OpLabel 
                                         f32 %294 = OpLoad %289 
                                                      OpStore %246 %294 
                                       f32_4 %296 = OpLoad %74 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 3 
                                       f32_3 %298 = OpFNegate %297 
                                       f32_4 %299 = OpLoad %295 
                                       f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
                                                      OpStore %295 %300 
                                Private f32* %301 = OpAccessChain %236 %55 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %295 %180 
                                                      OpStore %304 %303 
                                Private f32* %306 = OpAccessChain %236 %55 
                                         f32 %307 = OpLoad %306 
                                Private f32* %308 = OpAccessChain %295 %55 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpFAdd %307 %309 
                                Private f32* %311 = OpAccessChain %305 %55 
                                                      OpStore %311 %310 
                                       f32_4 %312 = OpLoad %74 
                                       f32_3 %313 = OpVectorShuffle %312 %312 1 2 0 
                                       f32_4 %314 = OpLoad %295 
                                       f32_3 %315 = OpVectorShuffle %314 %314 1 2 3 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %305 
                                       f32_4 %318 = OpVectorShuffle %317 %316 0 4 5 6 
                                                      OpStore %305 %318 
                                         f32 %320 = OpLoad %246 
                                       f32_3 %321 = OpCompositeConstruct %320 %320 %320 
                                       f32_4 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %74 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 3 
                                       f32_3 %327 = OpFAdd %324 %326 
                                                      OpStore %319 %327 
                                         f32 %328 = OpLoad %246 
                                Private f32* %329 = OpAccessChain %305 %180 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpFMul %328 %330 
                                Private f32* %332 = OpAccessChain %236 %55 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFAdd %331 %333 
                                                      OpStore %246 %334 
                                Private f32* %336 = OpAccessChain %319 %70 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpLoad %246 
                                         f32 %339 = OpExtInst %1 37 %337 %338 
                                                      OpStore %335 %339 
                                         f32 %340 = OpLoad %335 
                                         f32 %341 = OpFNegate %340 
                                Private f32* %342 = OpAccessChain %319 %55 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %341 %343 
                                                      OpStore %335 %344 
                                Private f32* %345 = OpAccessChain %319 %70 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFNegate %346 
                                         f32 %348 = OpLoad %246 
                                         f32 %349 = OpFAdd %347 %348 
                                                      OpStore %246 %349 
                                         f32 %351 = OpLoad %335 
                                         f32 %353 = OpFMul %351 %352 
                                         f32 %355 = OpFAdd %353 %354 
                                                      OpStore %350 %355 
                                         f32 %356 = OpLoad %246 
                                         f32 %357 = OpLoad %350 
                                         f32 %358 = OpFDiv %356 %357 
                                                      OpStore %246 %358 
                                         f32 %359 = OpLoad %246 
                                Private f32* %360 = OpAccessChain %319 %156 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFAdd %359 %361 
                                                      OpStore %246 %362 
                                Private f32* %363 = OpAccessChain %319 %55 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFAdd %364 %354 
                                                      OpStore %350 %365 
                                         f32 %366 = OpLoad %335 
                                         f32 %367 = OpLoad %350 
                                         f32 %368 = OpFDiv %366 %367 
                                                      OpStore %350 %368 
                                Private f32* %370 = OpAccessChain %9 %70 
                                         f32 %371 = OpLoad %370 
                                Private f32* %372 = OpAccessChain %9 %156 
                                         f32 %373 = OpLoad %372 
                                        bool %374 = OpFOrdGreaterThanEqual %371 %373 
                                                      OpStore %369 %374 
                                        bool %376 = OpLoad %369 
                                                      OpSelectionMerge %378 None 
                                                      OpBranchConditional %376 %377 %379 
                                             %377 = OpLabel 
                                                      OpStore %375 %59 
                                                      OpBranch %378 
                                             %379 = OpLabel 
                                                      OpStore %375 %188 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                         f32 %380 = OpLoad %375 
                                Private f32* %381 = OpAccessChain %262 %55 
                                                      OpStore %381 %380 
                                Private f32* %383 = OpAccessChain %9 %156 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFNegate %384 
                                Private f32* %386 = OpAccessChain %9 %70 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                                      OpStore %382 %388 
                                Private f32* %390 = OpAccessChain %262 %55 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpLoad %382 
                                         f32 %393 = OpFMul %391 %392 
                                Private f32* %394 = OpAccessChain %9 %156 
                                         f32 %395 = OpLoad %394 
                                         f32 %396 = OpFAdd %393 %395 
                                Private f32* %397 = OpAccessChain %389 %55 
                                                      OpStore %397 %396 
                                Private f32* %399 = OpAccessChain %9 %55 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %389 %55 
                                         f32 %402 = OpLoad %401 
                                        bool %403 = OpFOrdGreaterThanEqual %400 %402 
                                                      OpStore %398 %403 
                                        bool %406 = OpLoad %398 
                                                      OpSelectionMerge %408 None 
                                                      OpBranchConditional %406 %407 %409 
                                             %407 = OpLabel 
                                                      OpStore %405 %59 
                                                      OpBranch %408 
                                             %409 = OpLabel 
                                                      OpStore %405 %188 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         f32 %410 = OpLoad %405 
                                                      OpStore %404 %410 
                                Private f32* %412 = OpAccessChain %389 %55 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFNegate %413 
                                Private f32* %415 = OpAccessChain %9 %55 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFAdd %414 %416 
                                Private f32* %418 = OpAccessChain %411 %55 
                                                      OpStore %418 %417 
                                         f32 %419 = OpLoad %404 
                                Private f32* %420 = OpAccessChain %411 %55 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFMul %419 %421 
                                Private f32* %423 = OpAccessChain %389 %55 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFAdd %422 %424 
                                Private f32* %426 = OpAccessChain %411 %55 
                                                      OpStore %426 %425 
                                Private f32* %427 = OpAccessChain %411 %55 
                                         f32 %428 = OpLoad %427 
                                Uniform f32* %430 = OpAccessChain %30 %429 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFMul %428 %431 
                                Private f32* %433 = OpAccessChain %411 %55 
                                                      OpStore %433 %432 
                                Private f32* %434 = OpAccessChain %411 %55 
                                         f32 %435 = OpLoad %434 
                                Private f32* %436 = OpAccessChain %319 %55 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpExtInst %1 37 %435 %437 
                                Private f32* %439 = OpAccessChain %411 %55 
                                                      OpStore %439 %438 
                                         f32 %440 = OpLoad %246 
                                       f32_3 %441 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %442 = OpExtInst %1 4 %441 
                                       f32_3 %445 = OpFAdd %442 %444 
                                                      OpStore %389 %445 
                                       f32_3 %446 = OpLoad %389 
                                       f32_3 %447 = OpExtInst %1 10 %446 
                                                      OpStore %389 %447 
                                       f32_3 %448 = OpLoad %389 
                                       f32_3 %450 = OpFMul %448 %449 
                                       f32_3 %453 = OpFAdd %450 %452 
                                                      OpStore %389 %453 
                                       f32_3 %454 = OpLoad %389 
                                       f32_3 %455 = OpExtInst %1 4 %454 
                                       f32_3 %457 = OpFAdd %455 %456 
                                                      OpStore %389 %457 
                                       f32_3 %458 = OpLoad %389 
                                       f32_3 %459 = OpCompositeConstruct %188 %188 %188 
                                       f32_3 %460 = OpCompositeConstruct %59 %59 %59 
                                       f32_3 %461 = OpExtInst %1 43 %458 %459 %460 
                                                      OpStore %389 %461 
                                       f32_3 %462 = OpLoad %389 
                                       f32_3 %463 = OpFAdd %462 %456 
                                                      OpStore %389 %463 
                                         f32 %464 = OpLoad %350 
                                       f32_3 %465 = OpCompositeConstruct %464 %464 %464 
                                       f32_3 %466 = OpLoad %389 
                                       f32_3 %467 = OpFMul %465 %466 
                                       f32_3 %469 = OpFAdd %467 %468 
                                                      OpStore %389 %469 
                                       f32_3 %470 = OpLoad %389 
                                       f32_3 %471 = OpLoad %411 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 0 0 
                                       f32_3 %473 = OpFMul %470 %472 
                                                      OpStore %411 %473 
                                       f32_3 %476 = OpLoad %411 
                                       f32_4 %477 = OpLoad %475 
                                       f32_4 %478 = OpVectorShuffle %477 %476 4 5 6 3 
                                                      OpStore %475 %478 
                                Private f32* %479 = OpAccessChain %236 %180 
                                         f32 %480 = OpLoad %479 
                                 Output f32* %482 = OpAccessChain %475 %180 
                                                      OpStore %482 %480 
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
out vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat1.w = u_xlat10_0.w;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlatb12 = u_xlat1.y>=u_xlat1.z;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.x>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat2.xyw;
    u_xlat3.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat3.wyx;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat2 = vec4(u_xlat12) * u_xlat2 + u_xlat3;
    u_xlat12 = min(u_xlat2.y, u_xlat2.w);
    u_xlat12 = (-u_xlat12) + u_xlat2.x;
    u_xlat1.x = (-u_xlat2.y) + u_xlat2.w;
    u_xlat5 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = u_xlat1.x + u_xlat2.z;
    u_xlat5 = u_xlat2.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat5;
    u_xlatb5 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat5 = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat16_4 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat4.x = u_xlat5 * u_xlat16_4 + u_xlat10_0.z;
    u_xlatb8 = u_xlat10_0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat4.x) + u_xlat10_0.x;
    u_xlat0 = u_xlat8 * u_xlat0 + u_xlat4.x;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat2.x);
    u_xlat1.xyz = abs(u_xlat1.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * vec3(u_xlat0);
    SV_Target0.w = u_xlat1.w;
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
; Bound: 484
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %76 %192 %475 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %67 SpecId 67 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %169 DescriptorSet 169 
                                                      OpDecorate %169 Binding 169 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %475 Location 475 
                                                      OpDecorate %480 RelaxedPrecision 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 7 
                                              %33 = OpTypePointer Uniform %7 
                                              %51 = OpTypeBool 
                                              %52 = OpTypePointer Private %51 
                                Private bool* %53 = OpVariable Private 
                                          i32 %54 = OpConstant 1 
                                          u32 %55 = OpConstant 0 
                                              %56 = OpTypePointer Uniform %6 
                                          f32 %59 = OpConstant 3.67402E-40 
                                         bool %61 = OpConstantFalse 
                                         bool %67 = OpSpecConstantFalse 
                                          u32 %70 = OpConstant 1 
                               Private f32_4* %74 = OpVariable Private 
                                              %75 = OpTypePointer Input %21 
                                 Input f32_3* %76 = OpVariable Input 
                                          i32 %79 = OpConstant 2 
                                          i32 %86 = OpConstant 0 
                                         i32 %111 = OpConstant 3 
                                             %118 = OpTypePointer Function %21 
                                         i32 %132 = OpConstant 4 
                                             %133 = OpTypePointer Uniform %21 
                                             %147 = OpTypePointer Private %6 
                                Private f32* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %153 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %166 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %167 = OpTypeSampledImage %166 
                                             %168 = OpTypePointer UniformConstant %167 
 UniformConstant read_only Texture3DSampled* %169 = OpVariable UniformConstant 
                              Private f32_4* %174 = OpVariable Private 
                                         u32 %180 = OpConstant 3 
                                Private f32* %182 = OpVariable Private 
                                         f32 %188 = OpConstant 3.67402E-40 
                                Input f32_3* %192 = OpVariable Input 
                                             %197 = OpTypePointer Private %21 
                              Private f32_3* %198 = OpVariable Private 
                                         i32 %201 = OpConstant 5 
                              Private f32_3* %206 = OpVariable Private 
                              Private f32_4* %236 = OpVariable Private 
                               Private bool* %240 = OpVariable Private 
                                Private f32* %246 = OpVariable Private 
                                             %247 = OpTypePointer Function %6 
                                             %254 = OpTypePointer Private %15 
                              Private f32_2* %255 = OpVariable Private 
                              Private f32_2* %262 = OpVariable Private 
                                         f32 %264 = OpConstant 3.67402E-40 
                                         f32 %279 = OpConstant 3.67402E-40 
                                       f32_2 %280 = OpConstantComposite %264 %279 
                              Private f32_4* %295 = OpVariable Private 
                              Private f32_4* %305 = OpVariable Private 
                              Private f32_3* %319 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                                Private f32* %350 = OpVariable Private 
                                         f32 %352 = OpConstant 3.67402E-40 
                                         f32 %354 = OpConstant 3.67402E-40 
                               Private bool* %369 = OpVariable Private 
                                Private f32* %382 = OpVariable Private 
                              Private f32_3* %389 = OpVariable Private 
                               Private bool* %398 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                              Private f32_3* %411 = OpVariable Private 
                                         i32 %429 = OpConstant 6 
                                         f32 %443 = OpConstant 3.67402E-40 
                                       f32_3 %444 = OpConstantComposite %59 %279 %443 
                                       f32_3 %449 = OpConstantComposite %352 %352 %352 
                                         f32 %451 = OpConstant 3.67402E-40 
                                       f32_3 %452 = OpConstantComposite %451 %451 %451 
                                       f32_3 %456 = OpConstantComposite %264 %264 %264 
                                       f32_3 %468 = OpConstantComposite %59 %59 %59 
                                             %474 = OpTypePointer Output %7 
                               Output f32_4* %475 = OpVariable Output 
                                             %481 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %119 = OpVariable Function 
                               Function f32* %248 = OpVariable Function 
                               Function f32* %289 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %405 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %40 = OpAccessChain %30 %32 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 3 3 3 
                                        f32_4 %43 = OpLoad %20 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_3 %45 = OpFMul %42 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %20 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %20 %50 
                                 Uniform f32* %57 = OpAccessChain %30 %54 %55 
                                          f32 %58 = OpLoad %57 
                                         bool %60 = OpFOrdEqual %58 %59 
                                                      OpStore %53 %60 
                                                      OpSelectionMerge %63 None 
                                                      OpBranchConditional %61 %62 %63 
                                              %62 = OpLabel 
                                         bool %64 = OpLoad %53 
                                                      OpSelectionMerge %66 None 
                                                      OpBranchConditional %64 %65 %66 
                                              %65 = OpLabel 
                                                      OpBranch %66 
                                              %66 = OpLabel 
                                                      OpBranch %63 
                                              %63 = OpLabel 
                                                      OpSelectionMerge %69 None 
                                                      OpBranchConditional %67 %68 %176 
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %30 %54 %70 
                                          f32 %72 = OpLoad %71 
                                         bool %73 = OpFOrdEqual %72 %59 
                                                      OpStore %53 %73 
                                        f32_3 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 1 1 1 
                               Uniform f32_4* %80 = OpAccessChain %30 %79 %54 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %78 %82 
                                        f32_4 %84 = OpLoad %74 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %74 %85 
                               Uniform f32_4* %87 = OpAccessChain %30 %79 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %76 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %74 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %74 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %74 %97 
                               Uniform f32_4* %98 = OpAccessChain %30 %79 %79 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpVectorShuffle %101 %101 2 2 2 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %74 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %74 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %74 %108 
                                       f32_4 %109 = OpLoad %74 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                              Uniform f32_4* %112 = OpAccessChain %30 %79 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                       f32_4 %116 = OpLoad %74 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %74 %117 
                                        bool %120 = OpLoad %53 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %125 
                                             %121 = OpLabel 
                                       f32_4 %123 = OpLoad %74 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                      OpStore %119 %124 
                                                      OpBranch %122 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %76 
                                                      OpStore %119 %126 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_3 %127 = OpLoad %119 
                                       f32_4 %128 = OpLoad %74 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %74 %129 
                                       f32_4 %130 = OpLoad %74 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %30 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %74 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %74 %139 
                                       f32_4 %140 = OpLoad %74 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %142 = OpAccessChain %30 %111 
                                       f32_3 %143 = OpLoad %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %74 
                                       f32_4 %146 = OpVectorShuffle %145 %144 0 4 5 6 
                                                      OpStore %74 %146 
                                Private f32* %149 = OpAccessChain %74 %70 
                                         f32 %150 = OpLoad %149 
                                         f32 %152 = OpFMul %150 %151 
                                         f32 %154 = OpFAdd %152 %153 
                                                      OpStore %148 %154 
                                Uniform f32* %157 = OpAccessChain %30 %54 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %153 
                                                      OpStore %155 %161 
                                         f32 %162 = OpLoad %148 
                                         f32 %163 = OpLoad %155 
                                         f32 %164 = OpExtInst %1 40 %162 %163 
                                Private f32* %165 = OpAccessChain %74 %55 
                                                      OpStore %165 %164 
                  read_only Texture3DSampled %170 = OpLoad %169 
                                       f32_4 %171 = OpLoad %74 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 2 3 
                                       f32_4 %173 = OpImageSampleImplicitLod %170 %172 
                                                      OpStore %74 %173 
                                       f32_4 %175 = OpLoad %74 
                                                      OpStore %174 %175 
                                                      OpBranch %69 
                                             %176 = OpLabel 
                                Private f32* %177 = OpAccessChain %174 %55 
                                                      OpStore %177 %59 
                                Private f32* %178 = OpAccessChain %174 %70 
                                                      OpStore %178 %59 
                                Private f32* %179 = OpAccessChain %174 %156 
                                                      OpStore %179 %59 
                                Private f32* %181 = OpAccessChain %174 %180 
                                                      OpStore %181 %59 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                       f32_4 %183 = OpLoad %174 
                              Uniform f32_4* %184 = OpAccessChain %30 %86 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                                      OpStore %182 %186 
                                         f32 %187 = OpLoad %182 
                                         f32 %189 = OpExtInst %1 43 %187 %188 %59 
                                                      OpStore %182 %189 
                                       f32_4 %190 = OpLoad %20 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %174 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %174 %196 
                                       f32_4 %199 = OpLoad %20 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_4* %202 = OpAccessChain %30 %201 
                                       f32_4 %203 = OpLoad %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFMul %200 %204 
                                                      OpStore %198 %205 
                                         f32 %207 = OpLoad %182 
                                       f32_3 %208 = OpCompositeConstruct %207 %207 %207 
                                       f32_3 %209 = OpLoad %198 
                                       f32_3 %210 = OpFMul %208 %209 
                                                      OpStore %206 %210 
                                       f32_3 %211 = OpLoad %198 
                                       f32_3 %212 = OpFNegate %211 
                                         f32 %213 = OpLoad %182 
                                       f32_3 %214 = OpCompositeConstruct %213 %213 %213 
                                       f32_3 %215 = OpFMul %212 %214 
                              Uniform f32_4* %216 = OpAccessChain %30 %32 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %215 %218 
                                       f32_4 %220 = OpLoad %20 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %20 %221 
                              Uniform f32_4* %222 = OpAccessChain %30 %32 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 3 3 3 
                                       f32_4 %225 = OpLoad %20 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %224 %226 
                                       f32_3 %228 = OpLoad %206 
                                       f32_3 %229 = OpFAdd %227 %228 
                                       f32_4 %230 = OpLoad %20 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %20 %231 
                                Private f32* %232 = OpAccessChain %174 %180 
                                                      OpStore %232 %188 
                                Private f32* %233 = OpAccessChain %9 %180 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %20 %180 
                                                      OpStore %235 %234 
                                       f32_4 %237 = OpLoad %20 
                                       f32_4 %238 = OpLoad %174 
                                       f32_4 %239 = OpFAdd %237 %238 
                                                      OpStore %236 %239 
                                Private f32* %241 = OpAccessChain %236 %70 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %236 %156 
                                         f32 %244 = OpLoad %243 
                                        bool %245 = OpFOrdGreaterThanEqual %242 %244 
                                                      OpStore %240 %245 
                                        bool %249 = OpLoad %240 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %249 %250 %252 
                                             %250 = OpLabel 
                                                      OpStore %248 %59 
                                                      OpBranch %251 
                                             %252 = OpLabel 
                                                      OpStore %248 %188 
                                                      OpBranch %251 
                                             %251 = OpLabel 
                                         f32 %253 = OpLoad %248 
                                                      OpStore %246 %253 
                                       f32_4 %256 = OpLoad %236 
                                       f32_2 %257 = OpVectorShuffle %256 %256 2 1 
                                       f32_2 %258 = OpFNegate %257 
                                       f32_4 %259 = OpLoad %236 
                                       f32_2 %260 = OpVectorShuffle %259 %259 1 2 
                                       f32_2 %261 = OpFAdd %258 %260 
                                                      OpStore %255 %261 
                                Private f32* %263 = OpAccessChain %262 %55 
                                                      OpStore %263 %59 
                                Private f32* %265 = OpAccessChain %262 %70 
                                                      OpStore %265 %264 
                                         f32 %266 = OpLoad %246 
                                       f32_2 %267 = OpCompositeConstruct %266 %266 
                                       f32_2 %268 = OpLoad %255 
                                       f32_2 %269 = OpFMul %267 %268 
                                       f32_4 %270 = OpLoad %236 
                                       f32_2 %271 = OpVectorShuffle %270 %270 2 1 
                                       f32_2 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %74 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 2 3 
                                                      OpStore %74 %274 
                                         f32 %275 = OpLoad %246 
                                       f32_2 %276 = OpCompositeConstruct %275 %275 
                                       f32_2 %277 = OpLoad %262 
                                       f32_2 %278 = OpFMul %276 %277 
                                       f32_2 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %74 
                                       f32_4 %283 = OpVectorShuffle %282 %281 0 1 4 5 
                                                      OpStore %74 %283 
                                Private f32* %284 = OpAccessChain %236 %55 
                                         f32 %285 = OpLoad %284 
                                Private f32* %286 = OpAccessChain %74 %55 
                                         f32 %287 = OpLoad %286 
                                        bool %288 = OpFOrdGreaterThanEqual %285 %287 
                                                      OpStore %240 %288 
                                        bool %290 = OpLoad %240 
                                                      OpSelectionMerge %292 None 
                                                      OpBranchConditional %290 %291 %293 
                                             %291 = OpLabel 
                                                      OpStore %289 %59 
                                                      OpBranch %292 
                                             %293 = OpLabel 
                                                      OpStore %289 %188 
                                                      OpBranch %292 
                                             %292 = OpLabel 
                                         f32 %294 = OpLoad %289 
                                                      OpStore %246 %294 
                                       f32_4 %296 = OpLoad %74 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 3 
                                       f32_3 %298 = OpFNegate %297 
                                       f32_4 %299 = OpLoad %295 
                                       f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
                                                      OpStore %295 %300 
                                Private f32* %301 = OpAccessChain %236 %55 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %295 %180 
                                                      OpStore %304 %303 
                                Private f32* %306 = OpAccessChain %236 %55 
                                         f32 %307 = OpLoad %306 
                                Private f32* %308 = OpAccessChain %295 %55 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpFAdd %307 %309 
                                Private f32* %311 = OpAccessChain %305 %55 
                                                      OpStore %311 %310 
                                       f32_4 %312 = OpLoad %74 
                                       f32_3 %313 = OpVectorShuffle %312 %312 1 2 0 
                                       f32_4 %314 = OpLoad %295 
                                       f32_3 %315 = OpVectorShuffle %314 %314 1 2 3 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %305 
                                       f32_4 %318 = OpVectorShuffle %317 %316 0 4 5 6 
                                                      OpStore %305 %318 
                                         f32 %320 = OpLoad %246 
                                       f32_3 %321 = OpCompositeConstruct %320 %320 %320 
                                       f32_4 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %74 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 3 
                                       f32_3 %327 = OpFAdd %324 %326 
                                                      OpStore %319 %327 
                                         f32 %328 = OpLoad %246 
                                Private f32* %329 = OpAccessChain %305 %180 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpFMul %328 %330 
                                Private f32* %332 = OpAccessChain %236 %55 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFAdd %331 %333 
                                                      OpStore %246 %334 
                                Private f32* %336 = OpAccessChain %319 %70 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpLoad %246 
                                         f32 %339 = OpExtInst %1 37 %337 %338 
                                                      OpStore %335 %339 
                                         f32 %340 = OpLoad %335 
                                         f32 %341 = OpFNegate %340 
                                Private f32* %342 = OpAccessChain %319 %55 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %341 %343 
                                                      OpStore %335 %344 
                                Private f32* %345 = OpAccessChain %319 %70 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFNegate %346 
                                         f32 %348 = OpLoad %246 
                                         f32 %349 = OpFAdd %347 %348 
                                                      OpStore %246 %349 
                                         f32 %351 = OpLoad %335 
                                         f32 %353 = OpFMul %351 %352 
                                         f32 %355 = OpFAdd %353 %354 
                                                      OpStore %350 %355 
                                         f32 %356 = OpLoad %246 
                                         f32 %357 = OpLoad %350 
                                         f32 %358 = OpFDiv %356 %357 
                                                      OpStore %246 %358 
                                         f32 %359 = OpLoad %246 
                                Private f32* %360 = OpAccessChain %319 %156 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFAdd %359 %361 
                                                      OpStore %246 %362 
                                Private f32* %363 = OpAccessChain %319 %55 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFAdd %364 %354 
                                                      OpStore %350 %365 
                                         f32 %366 = OpLoad %335 
                                         f32 %367 = OpLoad %350 
                                         f32 %368 = OpFDiv %366 %367 
                                                      OpStore %350 %368 
                                Private f32* %370 = OpAccessChain %9 %70 
                                         f32 %371 = OpLoad %370 
                                Private f32* %372 = OpAccessChain %9 %156 
                                         f32 %373 = OpLoad %372 
                                        bool %374 = OpFOrdGreaterThanEqual %371 %373 
                                                      OpStore %369 %374 
                                        bool %376 = OpLoad %369 
                                                      OpSelectionMerge %378 None 
                                                      OpBranchConditional %376 %377 %379 
                                             %377 = OpLabel 
                                                      OpStore %375 %59 
                                                      OpBranch %378 
                                             %379 = OpLabel 
                                                      OpStore %375 %188 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                         f32 %380 = OpLoad %375 
                                Private f32* %381 = OpAccessChain %262 %55 
                                                      OpStore %381 %380 
                                Private f32* %383 = OpAccessChain %9 %156 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFNegate %384 
                                Private f32* %386 = OpAccessChain %9 %70 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                                      OpStore %382 %388 
                                Private f32* %390 = OpAccessChain %262 %55 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpLoad %382 
                                         f32 %393 = OpFMul %391 %392 
                                Private f32* %394 = OpAccessChain %9 %156 
                                         f32 %395 = OpLoad %394 
                                         f32 %396 = OpFAdd %393 %395 
                                Private f32* %397 = OpAccessChain %389 %55 
                                                      OpStore %397 %396 
                                Private f32* %399 = OpAccessChain %9 %55 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %389 %55 
                                         f32 %402 = OpLoad %401 
                                        bool %403 = OpFOrdGreaterThanEqual %400 %402 
                                                      OpStore %398 %403 
                                        bool %406 = OpLoad %398 
                                                      OpSelectionMerge %408 None 
                                                      OpBranchConditional %406 %407 %409 
                                             %407 = OpLabel 
                                                      OpStore %405 %59 
                                                      OpBranch %408 
                                             %409 = OpLabel 
                                                      OpStore %405 %188 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         f32 %410 = OpLoad %405 
                                                      OpStore %404 %410 
                                Private f32* %412 = OpAccessChain %389 %55 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFNegate %413 
                                Private f32* %415 = OpAccessChain %9 %55 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFAdd %414 %416 
                                Private f32* %418 = OpAccessChain %411 %55 
                                                      OpStore %418 %417 
                                         f32 %419 = OpLoad %404 
                                Private f32* %420 = OpAccessChain %411 %55 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFMul %419 %421 
                                Private f32* %423 = OpAccessChain %389 %55 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFAdd %422 %424 
                                Private f32* %426 = OpAccessChain %411 %55 
                                                      OpStore %426 %425 
                                Private f32* %427 = OpAccessChain %411 %55 
                                         f32 %428 = OpLoad %427 
                                Uniform f32* %430 = OpAccessChain %30 %429 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFMul %428 %431 
                                Private f32* %433 = OpAccessChain %411 %55 
                                                      OpStore %433 %432 
                                Private f32* %434 = OpAccessChain %411 %55 
                                         f32 %435 = OpLoad %434 
                                Private f32* %436 = OpAccessChain %319 %55 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpExtInst %1 37 %435 %437 
                                Private f32* %439 = OpAccessChain %411 %55 
                                                      OpStore %439 %438 
                                         f32 %440 = OpLoad %246 
                                       f32_3 %441 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %442 = OpExtInst %1 4 %441 
                                       f32_3 %445 = OpFAdd %442 %444 
                                                      OpStore %389 %445 
                                       f32_3 %446 = OpLoad %389 
                                       f32_3 %447 = OpExtInst %1 10 %446 
                                                      OpStore %389 %447 
                                       f32_3 %448 = OpLoad %389 
                                       f32_3 %450 = OpFMul %448 %449 
                                       f32_3 %453 = OpFAdd %450 %452 
                                                      OpStore %389 %453 
                                       f32_3 %454 = OpLoad %389 
                                       f32_3 %455 = OpExtInst %1 4 %454 
                                       f32_3 %457 = OpFAdd %455 %456 
                                                      OpStore %389 %457 
                                       f32_3 %458 = OpLoad %389 
                                       f32_3 %459 = OpCompositeConstruct %188 %188 %188 
                                       f32_3 %460 = OpCompositeConstruct %59 %59 %59 
                                       f32_3 %461 = OpExtInst %1 43 %458 %459 %460 
                                                      OpStore %389 %461 
                                       f32_3 %462 = OpLoad %389 
                                       f32_3 %463 = OpFAdd %462 %456 
                                                      OpStore %389 %463 
                                         f32 %464 = OpLoad %350 
                                       f32_3 %465 = OpCompositeConstruct %464 %464 %464 
                                       f32_3 %466 = OpLoad %389 
                                       f32_3 %467 = OpFMul %465 %466 
                                       f32_3 %469 = OpFAdd %467 %468 
                                                      OpStore %389 %469 
                                       f32_3 %470 = OpLoad %389 
                                       f32_3 %471 = OpLoad %411 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 0 0 
                                       f32_3 %473 = OpFMul %470 %472 
                                                      OpStore %411 %473 
                                       f32_3 %476 = OpLoad %411 
                                       f32_4 %477 = OpLoad %475 
                                       f32_4 %478 = OpVectorShuffle %477 %476 4 5 6 3 
                                                      OpStore %475 %478 
                                Private f32* %479 = OpAccessChain %236 %180 
                                         f32 %480 = OpLoad %479 
                                 Output f32* %482 = OpAccessChain %475 %180 
                                                      OpStore %482 %480 
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
out vec4 vs_TEXCOORD5;
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
    vs_TEXCOORD5 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
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
    u_xlat2.xyz = u_xlat1.xyz * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat3.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat13) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat2.w = 0.0;
    u_xlat1.w = u_xlat10_0.w;
    u_xlat1 = u_xlat1 + u_xlat2;
    u_xlatb12 = u_xlat1.y>=u_xlat1.z;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.x>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat3.xyz = u_xlat2.xyw;
    u_xlat3.w = u_xlat1.x;
    u_xlat2.xyw = u_xlat3.wyx;
    u_xlat2 = (-u_xlat3) + u_xlat2;
    u_xlat2 = vec4(u_xlat12) * u_xlat2 + u_xlat3;
    u_xlat12 = min(u_xlat2.y, u_xlat2.w);
    u_xlat12 = (-u_xlat12) + u_xlat2.x;
    u_xlat1.x = (-u_xlat2.y) + u_xlat2.w;
    u_xlat5 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat1.x = u_xlat1.x / u_xlat5;
    u_xlat1.x = u_xlat1.x + u_xlat2.z;
    u_xlat5 = u_xlat2.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat5;
    u_xlatb5 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat5 = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat16_4 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat4.x = u_xlat5 * u_xlat16_4 + u_xlat10_0.z;
    u_xlatb8 = u_xlat10_0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat4.x) + u_xlat10_0.x;
    u_xlat0 = u_xlat8 * u_xlat0 + u_xlat4.x;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat2.x);
    u_xlat1.xyz = abs(u_xlat1.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * vec3(u_xlat0);
    SV_Target0.w = u_xlat1.w;
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
; Bound: 484
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %76 %192 %475 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %67 SpecId 67 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %169 DescriptorSet 169 
                                                      OpDecorate %169 Binding 169 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 Location 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                                      OpDecorate %388 RelaxedPrecision 
                                                      OpDecorate %392 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %475 RelaxedPrecision 
                                                      OpDecorate %475 Location 475 
                                                      OpDecorate %480 RelaxedPrecision 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 7 
                                              %33 = OpTypePointer Uniform %7 
                                              %51 = OpTypeBool 
                                              %52 = OpTypePointer Private %51 
                                Private bool* %53 = OpVariable Private 
                                          i32 %54 = OpConstant 1 
                                          u32 %55 = OpConstant 0 
                                              %56 = OpTypePointer Uniform %6 
                                          f32 %59 = OpConstant 3.67402E-40 
                                         bool %61 = OpConstantFalse 
                                         bool %67 = OpSpecConstantFalse 
                                          u32 %70 = OpConstant 1 
                               Private f32_4* %74 = OpVariable Private 
                                              %75 = OpTypePointer Input %21 
                                 Input f32_3* %76 = OpVariable Input 
                                          i32 %79 = OpConstant 2 
                                          i32 %86 = OpConstant 0 
                                         i32 %111 = OpConstant 3 
                                             %118 = OpTypePointer Function %21 
                                         i32 %132 = OpConstant 4 
                                             %133 = OpTypePointer Uniform %21 
                                             %147 = OpTypePointer Private %6 
                                Private f32* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %153 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %166 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %167 = OpTypeSampledImage %166 
                                             %168 = OpTypePointer UniformConstant %167 
 UniformConstant read_only Texture3DSampled* %169 = OpVariable UniformConstant 
                              Private f32_4* %174 = OpVariable Private 
                                         u32 %180 = OpConstant 3 
                                Private f32* %182 = OpVariable Private 
                                         f32 %188 = OpConstant 3.67402E-40 
                                Input f32_3* %192 = OpVariable Input 
                                             %197 = OpTypePointer Private %21 
                              Private f32_3* %198 = OpVariable Private 
                                         i32 %201 = OpConstant 5 
                              Private f32_3* %206 = OpVariable Private 
                              Private f32_4* %236 = OpVariable Private 
                               Private bool* %240 = OpVariable Private 
                                Private f32* %246 = OpVariable Private 
                                             %247 = OpTypePointer Function %6 
                                             %254 = OpTypePointer Private %15 
                              Private f32_2* %255 = OpVariable Private 
                              Private f32_2* %262 = OpVariable Private 
                                         f32 %264 = OpConstant 3.67402E-40 
                                         f32 %279 = OpConstant 3.67402E-40 
                                       f32_2 %280 = OpConstantComposite %264 %279 
                              Private f32_4* %295 = OpVariable Private 
                              Private f32_4* %305 = OpVariable Private 
                              Private f32_3* %319 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                                Private f32* %350 = OpVariable Private 
                                         f32 %352 = OpConstant 3.67402E-40 
                                         f32 %354 = OpConstant 3.67402E-40 
                               Private bool* %369 = OpVariable Private 
                                Private f32* %382 = OpVariable Private 
                              Private f32_3* %389 = OpVariable Private 
                               Private bool* %398 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                              Private f32_3* %411 = OpVariable Private 
                                         i32 %429 = OpConstant 6 
                                         f32 %443 = OpConstant 3.67402E-40 
                                       f32_3 %444 = OpConstantComposite %59 %279 %443 
                                       f32_3 %449 = OpConstantComposite %352 %352 %352 
                                         f32 %451 = OpConstant 3.67402E-40 
                                       f32_3 %452 = OpConstantComposite %451 %451 %451 
                                       f32_3 %456 = OpConstantComposite %264 %264 %264 
                                       f32_3 %468 = OpConstantComposite %59 %59 %59 
                                             %474 = OpTypePointer Output %7 
                               Output f32_4* %475 = OpVariable Output 
                                             %481 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %119 = OpVariable Function 
                               Function f32* %248 = OpVariable Function 
                               Function f32* %289 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %405 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %40 = OpAccessChain %30 %32 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 3 3 3 
                                        f32_4 %43 = OpLoad %20 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_3 %45 = OpFMul %42 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %20 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %20 %50 
                                 Uniform f32* %57 = OpAccessChain %30 %54 %55 
                                          f32 %58 = OpLoad %57 
                                         bool %60 = OpFOrdEqual %58 %59 
                                                      OpStore %53 %60 
                                                      OpSelectionMerge %63 None 
                                                      OpBranchConditional %61 %62 %63 
                                              %62 = OpLabel 
                                         bool %64 = OpLoad %53 
                                                      OpSelectionMerge %66 None 
                                                      OpBranchConditional %64 %65 %66 
                                              %65 = OpLabel 
                                                      OpBranch %66 
                                              %66 = OpLabel 
                                                      OpBranch %63 
                                              %63 = OpLabel 
                                                      OpSelectionMerge %69 None 
                                                      OpBranchConditional %67 %68 %176 
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %30 %54 %70 
                                          f32 %72 = OpLoad %71 
                                         bool %73 = OpFOrdEqual %72 %59 
                                                      OpStore %53 %73 
                                        f32_3 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 1 1 1 
                               Uniform f32_4* %80 = OpAccessChain %30 %79 %54 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %78 %82 
                                        f32_4 %84 = OpLoad %74 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %74 %85 
                               Uniform f32_4* %87 = OpAccessChain %30 %79 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %76 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %74 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %74 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %74 %97 
                               Uniform f32_4* %98 = OpAccessChain %30 %79 %79 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpVectorShuffle %101 %101 2 2 2 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %74 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %74 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %74 %108 
                                       f32_4 %109 = OpLoad %74 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                              Uniform f32_4* %112 = OpAccessChain %30 %79 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                       f32_4 %116 = OpLoad %74 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %74 %117 
                                        bool %120 = OpLoad %53 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %125 
                                             %121 = OpLabel 
                                       f32_4 %123 = OpLoad %74 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                      OpStore %119 %124 
                                                      OpBranch %122 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %76 
                                                      OpStore %119 %126 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_3 %127 = OpLoad %119 
                                       f32_4 %128 = OpLoad %74 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %74 %129 
                                       f32_4 %130 = OpLoad %74 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %30 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %74 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %74 %139 
                                       f32_4 %140 = OpLoad %74 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %142 = OpAccessChain %30 %111 
                                       f32_3 %143 = OpLoad %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %74 
                                       f32_4 %146 = OpVectorShuffle %145 %144 0 4 5 6 
                                                      OpStore %74 %146 
                                Private f32* %149 = OpAccessChain %74 %70 
                                         f32 %150 = OpLoad %149 
                                         f32 %152 = OpFMul %150 %151 
                                         f32 %154 = OpFAdd %152 %153 
                                                      OpStore %148 %154 
                                Uniform f32* %157 = OpAccessChain %30 %54 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %153 
                                                      OpStore %155 %161 
                                         f32 %162 = OpLoad %148 
                                         f32 %163 = OpLoad %155 
                                         f32 %164 = OpExtInst %1 40 %162 %163 
                                Private f32* %165 = OpAccessChain %74 %55 
                                                      OpStore %165 %164 
                  read_only Texture3DSampled %170 = OpLoad %169 
                                       f32_4 %171 = OpLoad %74 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 2 3 
                                       f32_4 %173 = OpImageSampleImplicitLod %170 %172 
                                                      OpStore %74 %173 
                                       f32_4 %175 = OpLoad %74 
                                                      OpStore %174 %175 
                                                      OpBranch %69 
                                             %176 = OpLabel 
                                Private f32* %177 = OpAccessChain %174 %55 
                                                      OpStore %177 %59 
                                Private f32* %178 = OpAccessChain %174 %70 
                                                      OpStore %178 %59 
                                Private f32* %179 = OpAccessChain %174 %156 
                                                      OpStore %179 %59 
                                Private f32* %181 = OpAccessChain %174 %180 
                                                      OpStore %181 %59 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                       f32_4 %183 = OpLoad %174 
                              Uniform f32_4* %184 = OpAccessChain %30 %86 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                                      OpStore %182 %186 
                                         f32 %187 = OpLoad %182 
                                         f32 %189 = OpExtInst %1 43 %187 %188 %59 
                                                      OpStore %182 %189 
                                       f32_4 %190 = OpLoad %20 
                                       f32_3 %191 = OpVectorShuffle %190 %190 0 1 2 
                                       f32_3 %193 = OpLoad %192 
                                       f32_3 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %174 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %174 %196 
                                       f32_4 %199 = OpLoad %20 
                                       f32_3 %200 = OpVectorShuffle %199 %199 0 1 2 
                              Uniform f32_4* %202 = OpAccessChain %30 %201 
                                       f32_4 %203 = OpLoad %202 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFMul %200 %204 
                                                      OpStore %198 %205 
                                         f32 %207 = OpLoad %182 
                                       f32_3 %208 = OpCompositeConstruct %207 %207 %207 
                                       f32_3 %209 = OpLoad %198 
                                       f32_3 %210 = OpFMul %208 %209 
                                                      OpStore %206 %210 
                                       f32_3 %211 = OpLoad %198 
                                       f32_3 %212 = OpFNegate %211 
                                         f32 %213 = OpLoad %182 
                                       f32_3 %214 = OpCompositeConstruct %213 %213 %213 
                                       f32_3 %215 = OpFMul %212 %214 
                              Uniform f32_4* %216 = OpAccessChain %30 %32 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %215 %218 
                                       f32_4 %220 = OpLoad %20 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %20 %221 
                              Uniform f32_4* %222 = OpAccessChain %30 %32 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 3 3 3 
                                       f32_4 %225 = OpLoad %20 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_3 %227 = OpFMul %224 %226 
                                       f32_3 %228 = OpLoad %206 
                                       f32_3 %229 = OpFAdd %227 %228 
                                       f32_4 %230 = OpLoad %20 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %20 %231 
                                Private f32* %232 = OpAccessChain %174 %180 
                                                      OpStore %232 %188 
                                Private f32* %233 = OpAccessChain %9 %180 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %20 %180 
                                                      OpStore %235 %234 
                                       f32_4 %237 = OpLoad %20 
                                       f32_4 %238 = OpLoad %174 
                                       f32_4 %239 = OpFAdd %237 %238 
                                                      OpStore %236 %239 
                                Private f32* %241 = OpAccessChain %236 %70 
                                         f32 %242 = OpLoad %241 
                                Private f32* %243 = OpAccessChain %236 %156 
                                         f32 %244 = OpLoad %243 
                                        bool %245 = OpFOrdGreaterThanEqual %242 %244 
                                                      OpStore %240 %245 
                                        bool %249 = OpLoad %240 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %249 %250 %252 
                                             %250 = OpLabel 
                                                      OpStore %248 %59 
                                                      OpBranch %251 
                                             %252 = OpLabel 
                                                      OpStore %248 %188 
                                                      OpBranch %251 
                                             %251 = OpLabel 
                                         f32 %253 = OpLoad %248 
                                                      OpStore %246 %253 
                                       f32_4 %256 = OpLoad %236 
                                       f32_2 %257 = OpVectorShuffle %256 %256 2 1 
                                       f32_2 %258 = OpFNegate %257 
                                       f32_4 %259 = OpLoad %236 
                                       f32_2 %260 = OpVectorShuffle %259 %259 1 2 
                                       f32_2 %261 = OpFAdd %258 %260 
                                                      OpStore %255 %261 
                                Private f32* %263 = OpAccessChain %262 %55 
                                                      OpStore %263 %59 
                                Private f32* %265 = OpAccessChain %262 %70 
                                                      OpStore %265 %264 
                                         f32 %266 = OpLoad %246 
                                       f32_2 %267 = OpCompositeConstruct %266 %266 
                                       f32_2 %268 = OpLoad %255 
                                       f32_2 %269 = OpFMul %267 %268 
                                       f32_4 %270 = OpLoad %236 
                                       f32_2 %271 = OpVectorShuffle %270 %270 2 1 
                                       f32_2 %272 = OpFAdd %269 %271 
                                       f32_4 %273 = OpLoad %74 
                                       f32_4 %274 = OpVectorShuffle %273 %272 4 5 2 3 
                                                      OpStore %74 %274 
                                         f32 %275 = OpLoad %246 
                                       f32_2 %276 = OpCompositeConstruct %275 %275 
                                       f32_2 %277 = OpLoad %262 
                                       f32_2 %278 = OpFMul %276 %277 
                                       f32_2 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %74 
                                       f32_4 %283 = OpVectorShuffle %282 %281 0 1 4 5 
                                                      OpStore %74 %283 
                                Private f32* %284 = OpAccessChain %236 %55 
                                         f32 %285 = OpLoad %284 
                                Private f32* %286 = OpAccessChain %74 %55 
                                         f32 %287 = OpLoad %286 
                                        bool %288 = OpFOrdGreaterThanEqual %285 %287 
                                                      OpStore %240 %288 
                                        bool %290 = OpLoad %240 
                                                      OpSelectionMerge %292 None 
                                                      OpBranchConditional %290 %291 %293 
                                             %291 = OpLabel 
                                                      OpStore %289 %59 
                                                      OpBranch %292 
                                             %293 = OpLabel 
                                                      OpStore %289 %188 
                                                      OpBranch %292 
                                             %292 = OpLabel 
                                         f32 %294 = OpLoad %289 
                                                      OpStore %246 %294 
                                       f32_4 %296 = OpLoad %74 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 3 
                                       f32_3 %298 = OpFNegate %297 
                                       f32_4 %299 = OpLoad %295 
                                       f32_4 %300 = OpVectorShuffle %299 %298 4 5 6 3 
                                                      OpStore %295 %300 
                                Private f32* %301 = OpAccessChain %236 %55 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %295 %180 
                                                      OpStore %304 %303 
                                Private f32* %306 = OpAccessChain %236 %55 
                                         f32 %307 = OpLoad %306 
                                Private f32* %308 = OpAccessChain %295 %55 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpFAdd %307 %309 
                                Private f32* %311 = OpAccessChain %305 %55 
                                                      OpStore %311 %310 
                                       f32_4 %312 = OpLoad %74 
                                       f32_3 %313 = OpVectorShuffle %312 %312 1 2 0 
                                       f32_4 %314 = OpLoad %295 
                                       f32_3 %315 = OpVectorShuffle %314 %314 1 2 3 
                                       f32_3 %316 = OpFAdd %313 %315 
                                       f32_4 %317 = OpLoad %305 
                                       f32_4 %318 = OpVectorShuffle %317 %316 0 4 5 6 
                                                      OpStore %305 %318 
                                         f32 %320 = OpLoad %246 
                                       f32_3 %321 = OpCompositeConstruct %320 %320 %320 
                                       f32_4 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %74 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 3 
                                       f32_3 %327 = OpFAdd %324 %326 
                                                      OpStore %319 %327 
                                         f32 %328 = OpLoad %246 
                                Private f32* %329 = OpAccessChain %305 %180 
                                         f32 %330 = OpLoad %329 
                                         f32 %331 = OpFMul %328 %330 
                                Private f32* %332 = OpAccessChain %236 %55 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpFAdd %331 %333 
                                                      OpStore %246 %334 
                                Private f32* %336 = OpAccessChain %319 %70 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpLoad %246 
                                         f32 %339 = OpExtInst %1 37 %337 %338 
                                                      OpStore %335 %339 
                                         f32 %340 = OpLoad %335 
                                         f32 %341 = OpFNegate %340 
                                Private f32* %342 = OpAccessChain %319 %55 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %341 %343 
                                                      OpStore %335 %344 
                                Private f32* %345 = OpAccessChain %319 %70 
                                         f32 %346 = OpLoad %345 
                                         f32 %347 = OpFNegate %346 
                                         f32 %348 = OpLoad %246 
                                         f32 %349 = OpFAdd %347 %348 
                                                      OpStore %246 %349 
                                         f32 %351 = OpLoad %335 
                                         f32 %353 = OpFMul %351 %352 
                                         f32 %355 = OpFAdd %353 %354 
                                                      OpStore %350 %355 
                                         f32 %356 = OpLoad %246 
                                         f32 %357 = OpLoad %350 
                                         f32 %358 = OpFDiv %356 %357 
                                                      OpStore %246 %358 
                                         f32 %359 = OpLoad %246 
                                Private f32* %360 = OpAccessChain %319 %156 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFAdd %359 %361 
                                                      OpStore %246 %362 
                                Private f32* %363 = OpAccessChain %319 %55 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFAdd %364 %354 
                                                      OpStore %350 %365 
                                         f32 %366 = OpLoad %335 
                                         f32 %367 = OpLoad %350 
                                         f32 %368 = OpFDiv %366 %367 
                                                      OpStore %350 %368 
                                Private f32* %370 = OpAccessChain %9 %70 
                                         f32 %371 = OpLoad %370 
                                Private f32* %372 = OpAccessChain %9 %156 
                                         f32 %373 = OpLoad %372 
                                        bool %374 = OpFOrdGreaterThanEqual %371 %373 
                                                      OpStore %369 %374 
                                        bool %376 = OpLoad %369 
                                                      OpSelectionMerge %378 None 
                                                      OpBranchConditional %376 %377 %379 
                                             %377 = OpLabel 
                                                      OpStore %375 %59 
                                                      OpBranch %378 
                                             %379 = OpLabel 
                                                      OpStore %375 %188 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                         f32 %380 = OpLoad %375 
                                Private f32* %381 = OpAccessChain %262 %55 
                                                      OpStore %381 %380 
                                Private f32* %383 = OpAccessChain %9 %156 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFNegate %384 
                                Private f32* %386 = OpAccessChain %9 %70 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                                      OpStore %382 %388 
                                Private f32* %390 = OpAccessChain %262 %55 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpLoad %382 
                                         f32 %393 = OpFMul %391 %392 
                                Private f32* %394 = OpAccessChain %9 %156 
                                         f32 %395 = OpLoad %394 
                                         f32 %396 = OpFAdd %393 %395 
                                Private f32* %397 = OpAccessChain %389 %55 
                                                      OpStore %397 %396 
                                Private f32* %399 = OpAccessChain %9 %55 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %389 %55 
                                         f32 %402 = OpLoad %401 
                                        bool %403 = OpFOrdGreaterThanEqual %400 %402 
                                                      OpStore %398 %403 
                                        bool %406 = OpLoad %398 
                                                      OpSelectionMerge %408 None 
                                                      OpBranchConditional %406 %407 %409 
                                             %407 = OpLabel 
                                                      OpStore %405 %59 
                                                      OpBranch %408 
                                             %409 = OpLabel 
                                                      OpStore %405 %188 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         f32 %410 = OpLoad %405 
                                                      OpStore %404 %410 
                                Private f32* %412 = OpAccessChain %389 %55 
                                         f32 %413 = OpLoad %412 
                                         f32 %414 = OpFNegate %413 
                                Private f32* %415 = OpAccessChain %9 %55 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFAdd %414 %416 
                                Private f32* %418 = OpAccessChain %411 %55 
                                                      OpStore %418 %417 
                                         f32 %419 = OpLoad %404 
                                Private f32* %420 = OpAccessChain %411 %55 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpFMul %419 %421 
                                Private f32* %423 = OpAccessChain %389 %55 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFAdd %422 %424 
                                Private f32* %426 = OpAccessChain %411 %55 
                                                      OpStore %426 %425 
                                Private f32* %427 = OpAccessChain %411 %55 
                                         f32 %428 = OpLoad %427 
                                Uniform f32* %430 = OpAccessChain %30 %429 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFMul %428 %431 
                                Private f32* %433 = OpAccessChain %411 %55 
                                                      OpStore %433 %432 
                                Private f32* %434 = OpAccessChain %411 %55 
                                         f32 %435 = OpLoad %434 
                                Private f32* %436 = OpAccessChain %319 %55 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpExtInst %1 37 %435 %437 
                                Private f32* %439 = OpAccessChain %411 %55 
                                                      OpStore %439 %438 
                                         f32 %440 = OpLoad %246 
                                       f32_3 %441 = OpCompositeConstruct %440 %440 %440 
                                       f32_3 %442 = OpExtInst %1 4 %441 
                                       f32_3 %445 = OpFAdd %442 %444 
                                                      OpStore %389 %445 
                                       f32_3 %446 = OpLoad %389 
                                       f32_3 %447 = OpExtInst %1 10 %446 
                                                      OpStore %389 %447 
                                       f32_3 %448 = OpLoad %389 
                                       f32_3 %450 = OpFMul %448 %449 
                                       f32_3 %453 = OpFAdd %450 %452 
                                                      OpStore %389 %453 
                                       f32_3 %454 = OpLoad %389 
                                       f32_3 %455 = OpExtInst %1 4 %454 
                                       f32_3 %457 = OpFAdd %455 %456 
                                                      OpStore %389 %457 
                                       f32_3 %458 = OpLoad %389 
                                       f32_3 %459 = OpCompositeConstruct %188 %188 %188 
                                       f32_3 %460 = OpCompositeConstruct %59 %59 %59 
                                       f32_3 %461 = OpExtInst %1 43 %458 %459 %460 
                                                      OpStore %389 %461 
                                       f32_3 %462 = OpLoad %389 
                                       f32_3 %463 = OpFAdd %462 %456 
                                                      OpStore %389 %463 
                                         f32 %464 = OpLoad %350 
                                       f32_3 %465 = OpCompositeConstruct %464 %464 %464 
                                       f32_3 %466 = OpLoad %389 
                                       f32_3 %467 = OpFMul %465 %466 
                                       f32_3 %469 = OpFAdd %467 %468 
                                                      OpStore %389 %469 
                                       f32_3 %470 = OpLoad %389 
                                       f32_3 %471 = OpLoad %411 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 0 0 
                                       f32_3 %473 = OpFMul %470 %472 
                                                      OpStore %411 %473 
                                       f32_3 %476 = OpLoad %411 
                                       f32_4 %477 = OpLoad %475 
                                       f32_4 %478 = OpVectorShuffle %477 %476 4 5 6 3 
                                                      OpStore %475 %478 
                                Private f32* %479 = OpAccessChain %236 %180 
                                         f32 %480 = OpLoad %479 
                                 Output f32* %482 = OpAccessChain %475 %180 
                                                      OpStore %482 %480 
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
  GpuProgramID 106649
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat16_5;
float u_xlat6;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb16)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat3.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat16, u_xlat17);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat16 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat16 = u_xlat16 * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat16) + _OverrideColor.xyz;
    u_xlat1.xyw = _OverrideColor.www * u_xlat1.yzx + u_xlat2.yzx;
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat2.xxxx * u_xlat4 + u_xlat3;
    u_xlatb3 = u_xlat1.w>=u_xlat2.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = u_xlat3.xxxx * u_xlat2 + u_xlat1;
    u_xlat2.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat2.x = u_xlat1.x + (-u_xlat2.x);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat16 = u_xlat2.x * 6.0 + 1.00000001e-010;
    u_xlat6 = u_xlat6 / u_xlat16;
    u_xlat6 = u_xlat6 + u_xlat1.z;
    u_xlat11 = u_xlat1.x + 1.00000001e-010;
    u_xlat11 = u_xlat2.x / u_xlat11;
    u_xlatb16 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat16_5 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat5 = u_xlat16 * u_xlat16_5 + u_xlat10_0.z;
    u_xlatb10 = u_xlat10_0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat5) + u_xlat10_0.x;
    u_xlat0 = u_xlat10 * u_xlat0 + u_xlat5;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat1.x);
    u_xlat1.xyw = abs(vec3(u_xlat6)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyw = fract(u_xlat1.xyw);
    u_xlat1.xyw = u_xlat1.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyw = abs(u_xlat1.xyw) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    u_xlat1.xyw = u_xlat1.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat11) * u_xlat1.xyw + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
; Bound: 516
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %513 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpMemberDecorate %29 8 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %113 SpecId 113 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %240 DescriptorSet 240 
                                                      OpDecorate %240 Binding 240 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 Location 513 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %6 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 8 
                                              %34 = OpTypePointer Uniform %7 
                               Private f32_4* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %21 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 6 
                                          i32 %58 = OpConstant 1 
                                          i32 %65 = OpConstant 0 
                                          i32 %77 = OpConstant 2 
                                          i32 %91 = OpConstant 3 
                                              %98 = OpTypeBool 
                                              %99 = OpTypePointer Private %98 
                               Private bool* %100 = OpVariable Private 
                                         u32 %101 = OpConstant 0 
                                             %102 = OpTypePointer Uniform %6 
                                         f32 %105 = OpConstant 3.67402E-40 
                                        bool %107 = OpConstantFalse 
                                        bool %113 = OpSpecConstantFalse 
                                         u32 %116 = OpConstant 1 
                              Private f32_4* %120 = OpVariable Private 
                                             %159 = OpTypePointer Function %21 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %21 
                                             %188 = OpTypePointer Private %6 
                                Private f32* %189 = OpVariable Private 
                                         f32 %192 = OpConstant 3.67402E-40 
                                         f32 %194 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         u32 %197 = OpConstant 2 
                                         f32 %200 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                                         u32 %221 = OpConstant 3 
                                             %223 = OpTypePointer Private %21 
                              Private f32_3* %224 = OpVariable Private 
                                         f32 %232 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %240 = OpVariable UniformConstant 
                                         i32 %252 = OpConstant 5 
                              Private f32_3* %257 = OpVariable Private 
                               Private bool* %284 = OpVariable Private 
                                             %290 = OpTypePointer Function %6 
                                         f32 %302 = OpConstant 3.67402E-40 
                                         f32 %304 = OpConstant 3.67402E-40 
                              Private f32_4* %306 = OpVariable Private 
                               Private bool* %323 = OpVariable Private 
                                Private f32* %329 = OpVariable Private 
                              Private f32_3* %367 = OpVariable Private 
                                         f32 %377 = OpConstant 3.67402E-40 
                                         f32 %379 = OpConstant 3.67402E-40 
                                Private f32* %392 = OpVariable Private 
                                Private f32* %436 = OpVariable Private 
                                         i32 %449 = OpConstant 7 
                                         f32 %461 = OpConstant 3.67402E-40 
                                       f32_3 %462 = OpConstantComposite %105 %304 %461 
                                       f32_3 %473 = OpConstantComposite %377 %377 %377 
                                         f32 %475 = OpConstant 3.67402E-40 
                                       f32_3 %476 = OpConstantComposite %475 %475 %475 
                                       f32_3 %483 = OpConstantComposite %302 %302 %302 
                                       f32_3 %504 = OpConstantComposite %105 %105 %105 
                                             %512 = OpTypePointer Output %7 
                               Output f32_4* %513 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %160 = OpVariable Function 
                               Function f32* %291 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                               Function f32* %405 = OpVariable Function 
                               Function f32* %429 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %41 = OpAccessChain %31 %33 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_4 %44 = OpLoad %20 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpFMul %43 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %20 %51 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %31 %57 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                        f32_4 %63 = OpLoad %52 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %52 %64 
                               Uniform f32_4* %66 = OpAccessChain %31 %57 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpLoad %54 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                                        f32_3 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %52 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %52 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %52 %76 
                               Uniform f32_4* %78 = OpAccessChain %31 %57 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpLoad %54 
                                        f32_3 %82 = OpVectorShuffle %81 %81 2 2 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %52 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %52 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %52 %88 
                                        f32_4 %89 = OpLoad %52 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %31 %57 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %90 %94 
                                        f32_4 %96 = OpLoad %52 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %52 %97 
                                Uniform f32* %103 = OpAccessChain %31 %58 %101 
                                         f32 %104 = OpLoad %103 
                                        bool %106 = OpFOrdEqual %104 %105 
                                                      OpStore %100 %106 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %109 
                                             %108 = OpLabel 
                                        bool %110 = OpLoad %100 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %217 
                                             %114 = OpLabel 
                                Uniform f32* %117 = OpAccessChain %31 %58 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %119 = OpFOrdEqual %118 %105 
                                                      OpStore %100 %119 
                                       f32_3 %121 = OpLoad %54 
                                       f32_3 %122 = OpVectorShuffle %121 %121 1 1 1 
                              Uniform f32_4* %123 = OpAccessChain %31 %77 %58 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %120 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %120 %128 
                              Uniform f32_4* %129 = OpAccessChain %31 %77 %65 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpLoad %54 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 0 0 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %120 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %120 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %120 %139 
                              Uniform f32_4* %140 = OpAccessChain %31 %77 %77 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpLoad %54 
                                       f32_3 %144 = OpVectorShuffle %143 %143 2 2 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %120 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %145 %147 
                                       f32_4 %149 = OpLoad %120 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %120 %150 
                                       f32_4 %151 = OpLoad %120 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %31 %77 %91 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %152 %155 
                                       f32_4 %157 = OpLoad %120 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %120 %158 
                                        bool %161 = OpLoad %100 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %161 %162 %166 
                                             %162 = OpLabel 
                                       f32_4 %164 = OpLoad %120 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                                      OpStore %160 %165 
                                                      OpBranch %163 
                                             %166 = OpLabel 
                                       f32_3 %167 = OpLoad %54 
                                                      OpStore %160 %167 
                                                      OpBranch %163 
                                             %163 = OpLabel 
                                       f32_3 %168 = OpLoad %160 
                                       f32_4 %169 = OpLoad %120 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %120 %170 
                                       f32_4 %171 = OpLoad %120 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_3* %175 = OpAccessChain %31 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                       f32_4 %179 = OpLoad %120 
                                       f32_4 %180 = OpVectorShuffle %179 %178 4 5 6 3 
                                                      OpStore %120 %180 
                                       f32_4 %181 = OpLoad %120 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_3* %183 = OpAccessChain %31 %91 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %120 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 4 5 6 
                                                      OpStore %120 %187 
                                Private f32* %190 = OpAccessChain %120 %116 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpFMul %191 %192 
                                         f32 %195 = OpFAdd %193 %194 
                                                      OpStore %189 %195 
                                Uniform f32* %198 = OpAccessChain %31 %58 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpFMul %199 %200 
                                         f32 %202 = OpFAdd %201 %194 
                                                      OpStore %196 %202 
                                         f32 %203 = OpLoad %189 
                                         f32 %204 = OpLoad %196 
                                         f32 %205 = OpExtInst %1 40 %203 %204 
                                Private f32* %206 = OpAccessChain %120 %101 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %120 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %120 %214 
                                       f32_4 %216 = OpLoad %120 
                                                      OpStore %215 %216 
                                                      OpBranch %115 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %101 
                                                      OpStore %218 %105 
                                Private f32* %219 = OpAccessChain %215 %116 
                                                      OpStore %219 %105 
                                Private f32* %220 = OpAccessChain %215 %197 
                                                      OpStore %220 %105 
                                Private f32* %222 = OpAccessChain %215 %221 
                                                      OpStore %222 %105 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                       f32_4 %225 = OpLoad %215 
                              Uniform f32_4* %226 = OpAccessChain %31 %65 
                                       f32_4 %227 = OpLoad %226 
                                         f32 %228 = OpDot %225 %227 
                                Private f32* %229 = OpAccessChain %224 %101 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %224 %101 
                                         f32 %231 = OpLoad %230 
                                         f32 %233 = OpExtInst %1 43 %231 %232 %105 
                                Private f32* %234 = OpAccessChain %224 %101 
                                                      OpStore %234 %233 
                                       f32_4 %235 = OpLoad %52 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_4 %237 = OpLoad %52 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                         f32 %239 = OpDot %236 %238 
                                                      OpStore %189 %239 
                  read_only Texture2DSampled %241 = OpLoad %240 
                                         f32 %242 = OpLoad %189 
                                       f32_2 %243 = OpCompositeConstruct %242 %242 
                                       f32_4 %244 = OpImageSampleImplicitLod %241 %243 
                                         f32 %245 = OpCompositeExtract %244 3 
                                                      OpStore %189 %245 
                                Private f32* %246 = OpAccessChain %224 %101 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpLoad %189 
                                         f32 %249 = OpFMul %247 %248 
                                                      OpStore %189 %249 
                                       f32_4 %250 = OpLoad %20 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %253 = OpAccessChain %31 %252 
                                       f32_4 %254 = OpLoad %253 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFMul %251 %255 
                                                      OpStore %224 %256 
                                         f32 %258 = OpLoad %189 
                                       f32_3 %259 = OpCompositeConstruct %258 %258 %258 
                                       f32_3 %260 = OpLoad %224 
                                       f32_3 %261 = OpFMul %259 %260 
                                                      OpStore %257 %261 
                                       f32_3 %262 = OpLoad %224 
                                       f32_3 %263 = OpFNegate %262 
                                         f32 %264 = OpLoad %189 
                                       f32_3 %265 = OpCompositeConstruct %264 %264 %264 
                                       f32_3 %266 = OpFMul %263 %265 
                              Uniform f32_4* %267 = OpAccessChain %31 %33 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpFAdd %266 %269 
                                       f32_4 %271 = OpLoad %20 
                                       f32_4 %272 = OpVectorShuffle %271 %270 4 5 6 3 
                                                      OpStore %20 %272 
                              Uniform f32_4* %273 = OpAccessChain %31 %33 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 3 3 3 
                                       f32_4 %276 = OpLoad %20 
                                       f32_3 %277 = OpVectorShuffle %276 %276 1 2 0 
                                       f32_3 %278 = OpFMul %275 %277 
                                       f32_3 %279 = OpLoad %257 
                                       f32_3 %280 = OpVectorShuffle %279 %279 1 2 0 
                                       f32_3 %281 = OpFAdd %278 %280 
                                       f32_4 %282 = OpLoad %20 
                                       f32_4 %283 = OpVectorShuffle %282 %281 4 5 2 6 
                                                      OpStore %20 %283 
                                Private f32* %285 = OpAccessChain %20 %101 
                                         f32 %286 = OpLoad %285 
                                Private f32* %287 = OpAccessChain %20 %116 
                                         f32 %288 = OpLoad %287 
                                        bool %289 = OpFOrdGreaterThanEqual %286 %288 
                                                      OpStore %284 %289 
                                        bool %292 = OpLoad %284 
                                                      OpSelectionMerge %294 None 
                                                      OpBranchConditional %292 %293 %295 
                                             %293 = OpLabel 
                                                      OpStore %291 %105 
                                                      OpBranch %294 
                                             %295 = OpLabel 
                                                      OpStore %291 %232 
                                                      OpBranch %294 
                                             %294 = OpLabel 
                                         f32 %296 = OpLoad %291 
                                Private f32* %297 = OpAccessChain %52 %101 
                                                      OpStore %297 %296 
                                       f32_4 %298 = OpLoad %20 
                                       f32_2 %299 = OpVectorShuffle %298 %298 1 0 
                                       f32_4 %300 = OpLoad %120 
                                       f32_4 %301 = OpVectorShuffle %300 %299 4 5 2 3 
                                                      OpStore %120 %301 
                                Private f32* %303 = OpAccessChain %120 %197 
                                                      OpStore %303 %302 
                                Private f32* %305 = OpAccessChain %120 %221 
                                                      OpStore %305 %304 
                                       f32_4 %307 = OpLoad %20 
                                       f32_2 %308 = OpVectorShuffle %307 %307 0 1 
                                       f32_4 %309 = OpLoad %120 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                                       f32_2 %311 = OpFNegate %310 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %306 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 2 3 
                                                      OpStore %306 %314 
                                Private f32* %315 = OpAccessChain %306 %197 
                                                      OpStore %315 %105 
                                Private f32* %316 = OpAccessChain %306 %221 
                                                      OpStore %316 %302 
                                       f32_4 %317 = OpLoad %52 
                                       f32_4 %318 = OpVectorShuffle %317 %317 0 0 0 0 
                                       f32_4 %319 = OpLoad %306 
                                       f32_4 %320 = OpFMul %318 %319 
                                       f32_4 %321 = OpLoad %120 
                                       f32_4 %322 = OpFAdd %320 %321 
                                                      OpStore %52 %322 
                                Private f32* %324 = OpAccessChain %20 %221 
                                         f32 %325 = OpLoad %324 
                                Private f32* %326 = OpAccessChain %52 %101 
                                         f32 %327 = OpLoad %326 
                                        bool %328 = OpFOrdGreaterThanEqual %325 %327 
                                                      OpStore %323 %328 
                                        bool %331 = OpLoad %323 
                                                      OpSelectionMerge %333 None 
                                                      OpBranchConditional %331 %332 %334 
                                             %332 = OpLabel 
                                                      OpStore %330 %105 
                                                      OpBranch %333 
                                             %334 = OpLabel 
                                                      OpStore %330 %232 
                                                      OpBranch %333 
                                             %333 = OpLabel 
                                         f32 %335 = OpLoad %330 
                                                      OpStore %329 %335 
                                       f32_4 %336 = OpLoad %52 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 3 
                                       f32_4 %338 = OpLoad %20 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %20 %339 
                                       f32_4 %340 = OpLoad %20 
                                       f32_3 %341 = OpVectorShuffle %340 %340 3 1 0 
                                       f32_4 %342 = OpLoad %52 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 2 6 
                                                      OpStore %52 %343 
                                       f32_4 %344 = OpLoad %20 
                                       f32_4 %345 = OpFNegate %344 
                                       f32_4 %346 = OpLoad %52 
                                       f32_4 %347 = OpFAdd %345 %346 
                                                      OpStore %52 %347 
                                         f32 %348 = OpLoad %329 
                                       f32_4 %349 = OpCompositeConstruct %348 %348 %348 %348 
                                       f32_4 %350 = OpLoad %52 
                                       f32_4 %351 = OpFMul %349 %350 
                                       f32_4 %352 = OpLoad %20 
                                       f32_4 %353 = OpFAdd %351 %352 
                                                      OpStore %20 %353 
                                Private f32* %354 = OpAccessChain %20 %116 
                                         f32 %355 = OpLoad %354 
                                Private f32* %356 = OpAccessChain %20 %221 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpExtInst %1 37 %355 %357 
                                Private f32* %359 = OpAccessChain %52 %101 
                                                      OpStore %359 %358 
                                Private f32* %360 = OpAccessChain %20 %101 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %52 %101 
                                         f32 %363 = OpLoad %362 
                                         f32 %364 = OpFNegate %363 
                                         f32 %365 = OpFAdd %361 %364 
                                Private f32* %366 = OpAccessChain %52 %101 
                                                      OpStore %366 %365 
                                Private f32* %368 = OpAccessChain %20 %116 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpFNegate %369 
                                Private f32* %371 = OpAccessChain %20 %221 
                                         f32 %372 = OpLoad %371 
                                         f32 %373 = OpFAdd %370 %372 
                                Private f32* %374 = OpAccessChain %367 %101 
                                                      OpStore %374 %373 
                                Private f32* %375 = OpAccessChain %52 %101 
                                         f32 %376 = OpLoad %375 
                                         f32 %378 = OpFMul %376 %377 
                                         f32 %380 = OpFAdd %378 %379 
                                                      OpStore %189 %380 
                                Private f32* %381 = OpAccessChain %367 %101 
                                         f32 %382 = OpLoad %381 
                                         f32 %383 = OpLoad %189 
                                         f32 %384 = OpFDiv %382 %383 
                                Private f32* %385 = OpAccessChain %367 %101 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %367 %101 
                                         f32 %387 = OpLoad %386 
                                Private f32* %388 = OpAccessChain %20 %197 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFAdd %387 %389 
                                Private f32* %391 = OpAccessChain %367 %101 
                                                      OpStore %391 %390 
                                Private f32* %393 = OpAccessChain %20 %101 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpFAdd %394 %379 
                                                      OpStore %392 %395 
                                Private f32* %396 = OpAccessChain %52 %101 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpLoad %392 
                                         f32 %399 = OpFDiv %397 %398 
                                                      OpStore %392 %399 
                                Private f32* %400 = OpAccessChain %9 %116 
                                         f32 %401 = OpLoad %400 
                                Private f32* %402 = OpAccessChain %9 %197 
                                         f32 %403 = OpLoad %402 
                                        bool %404 = OpFOrdGreaterThanEqual %401 %403 
                                                      OpStore %100 %404 
                                        bool %406 = OpLoad %100 
                                                      OpSelectionMerge %408 None 
                                                      OpBranchConditional %406 %407 %409 
                                             %407 = OpLabel 
                                                      OpStore %405 %105 
                                                      OpBranch %408 
                                             %409 = OpLabel 
                                                      OpStore %405 %232 
                                                      OpBranch %408 
                                             %408 = OpLabel 
                                         f32 %410 = OpLoad %405 
                                                      OpStore %189 %410 
                                Private f32* %411 = OpAccessChain %9 %197 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFNegate %412 
                                Private f32* %414 = OpAccessChain %9 %116 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                Private f32* %417 = OpAccessChain %52 %101 
                                                      OpStore %417 %416 
                                         f32 %418 = OpLoad %189 
                                Private f32* %419 = OpAccessChain %52 %101 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFMul %418 %420 
                                Private f32* %422 = OpAccessChain %9 %197 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFAdd %421 %423 
                                                      OpStore %189 %424 
                                Private f32* %425 = OpAccessChain %9 %101 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpLoad %189 
                                        bool %428 = OpFOrdGreaterThanEqual %426 %427 
                                                      OpStore %284 %428 
                                        bool %430 = OpLoad %284 
                                                      OpSelectionMerge %432 None 
                                                      OpBranchConditional %430 %431 %433 
                                             %431 = OpLabel 
                                                      OpStore %429 %105 
                                                      OpBranch %432 
                                             %433 = OpLabel 
                                                      OpStore %429 %232 
                                                      OpBranch %432 
                                             %432 = OpLabel 
                                         f32 %434 = OpLoad %429 
                                Private f32* %435 = OpAccessChain %52 %101 
                                                      OpStore %435 %434 
                                Private f32* %437 = OpAccessChain %9 %101 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpLoad %189 
                                         f32 %440 = OpFNegate %439 
                                         f32 %441 = OpFAdd %438 %440 
                                                      OpStore %436 %441 
                                Private f32* %442 = OpAccessChain %52 %101 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpLoad %436 
                                         f32 %445 = OpFMul %443 %444 
                                         f32 %446 = OpLoad %189 
                                         f32 %447 = OpFAdd %445 %446 
                                                      OpStore %189 %447 
                                         f32 %448 = OpLoad %189 
                                Uniform f32* %450 = OpAccessChain %31 %449 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFMul %448 %451 
                                                      OpStore %189 %452 
                                         f32 %453 = OpLoad %189 
                                Private f32* %454 = OpAccessChain %20 %101 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpExtInst %1 37 %453 %455 
                                Private f32* %457 = OpAccessChain %20 %101 
                                                      OpStore %457 %456 
                                       f32_3 %458 = OpLoad %367 
                                       f32_3 %459 = OpVectorShuffle %458 %458 0 0 0 
                                       f32_3 %460 = OpExtInst %1 4 %459 
                                       f32_3 %463 = OpFAdd %460 %462 
                                       f32_4 %464 = OpLoad %52 
                                       f32_4 %465 = OpVectorShuffle %464 %463 4 5 6 3 
                                                      OpStore %52 %465 
                                       f32_4 %466 = OpLoad %52 
                                       f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
                                       f32_3 %468 = OpExtInst %1 10 %467 
                                       f32_4 %469 = OpLoad %52 
                                       f32_4 %470 = OpVectorShuffle %469 %468 4 5 6 3 
                                                      OpStore %52 %470 
                                       f32_4 %471 = OpLoad %52 
                                       f32_3 %472 = OpVectorShuffle %471 %471 0 1 2 
                                       f32_3 %474 = OpFMul %472 %473 
                                       f32_3 %477 = OpFAdd %474 %476 
                                       f32_4 %478 = OpLoad %52 
                                       f32_4 %479 = OpVectorShuffle %478 %477 4 5 6 3 
                                                      OpStore %52 %479 
                                       f32_4 %480 = OpLoad %52 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                                       f32_3 %482 = OpExtInst %1 4 %481 
                                       f32_3 %484 = OpFAdd %482 %483 
                                       f32_4 %485 = OpLoad %52 
                                       f32_4 %486 = OpVectorShuffle %485 %484 4 5 6 3 
                                                      OpStore %52 %486 
                                       f32_4 %487 = OpLoad %52 
                                       f32_3 %488 = OpVectorShuffle %487 %487 0 1 2 
                                       f32_3 %489 = OpCompositeConstruct %232 %232 %232 
                                       f32_3 %490 = OpCompositeConstruct %105 %105 %105 
                                       f32_3 %491 = OpExtInst %1 43 %488 %489 %490 
                                       f32_4 %492 = OpLoad %52 
                                       f32_4 %493 = OpVectorShuffle %492 %491 4 5 6 3 
                                                      OpStore %52 %493 
                                       f32_4 %494 = OpLoad %52 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpFAdd %495 %483 
                                       f32_4 %497 = OpLoad %52 
                                       f32_4 %498 = OpVectorShuffle %497 %496 4 5 6 3 
                                                      OpStore %52 %498 
                                         f32 %499 = OpLoad %392 
                                       f32_3 %500 = OpCompositeConstruct %499 %499 %499 
                                       f32_4 %501 = OpLoad %52 
                                       f32_3 %502 = OpVectorShuffle %501 %501 0 1 2 
                                       f32_3 %503 = OpFMul %500 %502 
                                       f32_3 %505 = OpFAdd %503 %504 
                                                      OpStore %367 %505 
                                       f32_3 %506 = OpLoad %367 
                                       f32_4 %507 = OpLoad %20 
                                       f32_3 %508 = OpVectorShuffle %507 %507 0 0 0 
                                       f32_3 %509 = OpFMul %506 %508 
                                       f32_4 %510 = OpLoad %9 
                                       f32_4 %511 = OpVectorShuffle %510 %509 4 5 6 3 
                                                      OpStore %9 %511 
                                       f32_4 %514 = OpLoad %9 
                                                      OpStore %513 %514 
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat16_5;
float u_xlat6;
float u_xlat7;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb16)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat2.y * 0.25 + 0.75;
        u_xlat7 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat16, u_xlat7);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat16 = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat16) + _OverrideColor.xyz;
    u_xlat1.xyw = _OverrideColor.www * u_xlat1.yzx + u_xlat2.yzx;
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat2.xxxx * u_xlat4 + u_xlat3;
    u_xlatb3 = u_xlat1.w>=u_xlat2.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = u_xlat3.xxxx * u_xlat2 + u_xlat1;
    u_xlat2.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat2.x = u_xlat1.x + (-u_xlat2.x);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat16 = u_xlat2.x * 6.0 + 1.00000001e-010;
    u_xlat6 = u_xlat6 / u_xlat16;
    u_xlat6 = u_xlat6 + u_xlat1.z;
    u_xlat11 = u_xlat1.x + 1.00000001e-010;
    u_xlat11 = u_xlat2.x / u_xlat11;
    u_xlatb16 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat16_5 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat5 = u_xlat16 * u_xlat16_5 + u_xlat10_0.z;
    u_xlatb10 = u_xlat10_0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat5) + u_xlat10_0.x;
    u_xlat0 = u_xlat10 * u_xlat0 + u_xlat5;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat1.x);
    u_xlat1.xyw = abs(vec3(u_xlat6)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyw = fract(u_xlat1.xyw);
    u_xlat1.xyw = u_xlat1.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyw = abs(u_xlat1.xyw) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    u_xlat1.xyw = u_xlat1.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat11) * u_xlat1.xyw + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
; Bound: 440
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %76 %437 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpMemberDecorate %28 0 RelaxedPrecision 
                                                      OpMemberDecorate %28 0 Offset 28 
                                                      OpMemberDecorate %28 1 Offset 28 
                                                      OpMemberDecorate %28 2 Offset 28 
                                                      OpMemberDecorate %28 3 Offset 28 
                                                      OpMemberDecorate %28 4 Offset 28 
                                                      OpMemberDecorate %28 5 RelaxedPrecision 
                                                      OpMemberDecorate %28 5 Offset 28 
                                                      OpMemberDecorate %28 6 Offset 28 
                                                      OpMemberDecorate %28 7 Offset 28 
                                                      OpDecorate %28 Block 
                                                      OpDecorate %30 DescriptorSet 30 
                                                      OpDecorate %30 Binding 30 
                                                      OpDecorate %67 SpecId 67 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %169 DescriptorSet 169 
                                                      OpDecorate %169 Binding 169 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %437 RelaxedPrecision 
                                                      OpDecorate %437 Location 437 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeStruct %7 %7 %27 %21 %21 %7 %6 %7 
                                              %29 = OpTypePointer Uniform %28 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32; f32_4;}* %30 = OpVariable Uniform 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 7 
                                              %33 = OpTypePointer Uniform %7 
                                              %51 = OpTypeBool 
                                              %52 = OpTypePointer Private %51 
                                Private bool* %53 = OpVariable Private 
                                          i32 %54 = OpConstant 1 
                                          u32 %55 = OpConstant 0 
                                              %56 = OpTypePointer Uniform %6 
                                          f32 %59 = OpConstant 3.67402E-40 
                                         bool %61 = OpConstantFalse 
                                         bool %67 = OpSpecConstantFalse 
                                          u32 %70 = OpConstant 1 
                               Private f32_4* %74 = OpVariable Private 
                                              %75 = OpTypePointer Input %21 
                                 Input f32_3* %76 = OpVariable Input 
                                          i32 %79 = OpConstant 2 
                                          i32 %86 = OpConstant 0 
                                         i32 %111 = OpConstant 3 
                                             %118 = OpTypePointer Function %21 
                                         i32 %132 = OpConstant 4 
                                             %133 = OpTypePointer Uniform %21 
                                             %147 = OpTypePointer Private %6 
                                Private f32* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %153 = OpConstant 3.67402E-40 
                                Private f32* %155 = OpVariable Private 
                                         u32 %156 = OpConstant 2 
                                         f32 %159 = OpConstant 3.67402E-40 
                                             %166 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %167 = OpTypeSampledImage %166 
                                             %168 = OpTypePointer UniformConstant %167 
 UniformConstant read_only Texture3DSampled* %169 = OpVariable UniformConstant 
                              Private f32_4* %174 = OpVariable Private 
                                         u32 %180 = OpConstant 3 
                                Private f32* %182 = OpVariable Private 
                                         f32 %188 = OpConstant 3.67402E-40 
                                             %190 = OpTypePointer Private %21 
                              Private f32_3* %191 = OpVariable Private 
                                         i32 %194 = OpConstant 5 
                              Private f32_3* %199 = OpVariable Private 
                               Private bool* %226 = OpVariable Private 
                              Private f32_3* %232 = OpVariable Private 
                                             %233 = OpTypePointer Function %6 
                                         f32 %245 = OpConstant 3.67402E-40 
                                         f32 %247 = OpConstant 3.67402E-40 
                              Private f32_4* %249 = OpVariable Private 
                              Private f32_3* %309 = OpVariable Private 
                                         f32 %319 = OpConstant 3.67402E-40 
                                         f32 %321 = OpConstant 3.67402E-40 
                                Private f32* %334 = OpVariable Private 
                                Private f32* %378 = OpVariable Private 
                                         i32 %391 = OpConstant 6 
                                         f32 %403 = OpConstant 3.67402E-40 
                                       f32_3 %404 = OpConstantComposite %59 %247 %403 
                                       f32_3 %409 = OpConstantComposite %319 %319 %319 
                                         f32 %411 = OpConstant 3.67402E-40 
                                       f32_3 %412 = OpConstantComposite %411 %411 %411 
                                       f32_3 %416 = OpConstantComposite %245 %245 %245 
                                       f32_3 %428 = OpConstantComposite %59 %59 %59 
                                             %436 = OpTypePointer Output %7 
                               Output f32_4* %437 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %119 = OpVariable Function 
                               Function f32* %234 = OpVariable Function 
                               Function f32* %271 = OpVariable Function 
                               Function f32* %347 = OpVariable Function 
                               Function f32* %371 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %34 = OpAccessChain %30 %32 
                                        f32_4 %35 = OpLoad %34 
                                        f32_3 %36 = OpVectorShuffle %35 %35 0 1 2 
                                        f32_3 %37 = OpFAdd %24 %36 
                                        f32_4 %38 = OpLoad %20 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %20 %39 
                               Uniform f32_4* %40 = OpAccessChain %30 %32 
                                        f32_4 %41 = OpLoad %40 
                                        f32_3 %42 = OpVectorShuffle %41 %41 3 3 3 
                                        f32_4 %43 = OpLoad %20 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_3 %45 = OpFMul %42 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %20 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %20 %50 
                                 Uniform f32* %57 = OpAccessChain %30 %54 %55 
                                          f32 %58 = OpLoad %57 
                                         bool %60 = OpFOrdEqual %58 %59 
                                                      OpStore %53 %60 
                                                      OpSelectionMerge %63 None 
                                                      OpBranchConditional %61 %62 %63 
                                              %62 = OpLabel 
                                         bool %64 = OpLoad %53 
                                                      OpSelectionMerge %66 None 
                                                      OpBranchConditional %64 %65 %66 
                                              %65 = OpLabel 
                                                      OpBranch %66 
                                              %66 = OpLabel 
                                                      OpBranch %63 
                                              %63 = OpLabel 
                                                      OpSelectionMerge %69 None 
                                                      OpBranchConditional %67 %68 %176 
                                              %68 = OpLabel 
                                 Uniform f32* %71 = OpAccessChain %30 %54 %70 
                                          f32 %72 = OpLoad %71 
                                         bool %73 = OpFOrdEqual %72 %59 
                                                      OpStore %53 %73 
                                        f32_3 %77 = OpLoad %76 
                                        f32_3 %78 = OpVectorShuffle %77 %77 1 1 1 
                               Uniform f32_4* %80 = OpAccessChain %30 %79 %54 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %78 %82 
                                        f32_4 %84 = OpLoad %74 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %74 %85 
                               Uniform f32_4* %87 = OpAccessChain %30 %79 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpLoad %76 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %74 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %74 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %74 %97 
                               Uniform f32_4* %98 = OpAccessChain %30 %79 %79 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpLoad %76 
                                       f32_3 %102 = OpVectorShuffle %101 %101 2 2 2 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %74 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %74 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %74 %108 
                                       f32_4 %109 = OpLoad %74 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                              Uniform f32_4* %112 = OpAccessChain %30 %79 %111 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                                       f32_3 %115 = OpFAdd %110 %114 
                                       f32_4 %116 = OpLoad %74 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                      OpStore %74 %117 
                                        bool %120 = OpLoad %53 
                                                      OpSelectionMerge %122 None 
                                                      OpBranchConditional %120 %121 %125 
                                             %121 = OpLabel 
                                       f32_4 %123 = OpLoad %74 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                                      OpStore %119 %124 
                                                      OpBranch %122 
                                             %125 = OpLabel 
                                       f32_3 %126 = OpLoad %76 
                                                      OpStore %119 %126 
                                                      OpBranch %122 
                                             %122 = OpLabel 
                                       f32_3 %127 = OpLoad %119 
                                       f32_4 %128 = OpLoad %74 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %74 %129 
                                       f32_4 %130 = OpLoad %74 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %30 %132 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFNegate %135 
                                       f32_3 %137 = OpFAdd %131 %136 
                                       f32_4 %138 = OpLoad %74 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %74 %139 
                                       f32_4 %140 = OpLoad %74 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                              Uniform f32_3* %142 = OpAccessChain %30 %111 
                                       f32_3 %143 = OpLoad %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %74 
                                       f32_4 %146 = OpVectorShuffle %145 %144 0 4 5 6 
                                                      OpStore %74 %146 
                                Private f32* %149 = OpAccessChain %74 %70 
                                         f32 %150 = OpLoad %149 
                                         f32 %152 = OpFMul %150 %151 
                                         f32 %154 = OpFAdd %152 %153 
                                                      OpStore %148 %154 
                                Uniform f32* %157 = OpAccessChain %30 %54 %156 
                                         f32 %158 = OpLoad %157 
                                         f32 %160 = OpFMul %158 %159 
                                         f32 %161 = OpFAdd %160 %153 
                                                      OpStore %155 %161 
                                         f32 %162 = OpLoad %148 
                                         f32 %163 = OpLoad %155 
                                         f32 %164 = OpExtInst %1 40 %162 %163 
                                Private f32* %165 = OpAccessChain %74 %55 
                                                      OpStore %165 %164 
                  read_only Texture3DSampled %170 = OpLoad %169 
                                       f32_4 %171 = OpLoad %74 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 2 3 
                                       f32_4 %173 = OpImageSampleImplicitLod %170 %172 
                                                      OpStore %74 %173 
                                       f32_4 %175 = OpLoad %74 
                                                      OpStore %174 %175 
                                                      OpBranch %69 
                                             %176 = OpLabel 
                                Private f32* %177 = OpAccessChain %174 %55 
                                                      OpStore %177 %59 
                                Private f32* %178 = OpAccessChain %174 %70 
                                                      OpStore %178 %59 
                                Private f32* %179 = OpAccessChain %174 %156 
                                                      OpStore %179 %59 
                                Private f32* %181 = OpAccessChain %174 %180 
                                                      OpStore %181 %59 
                                                      OpBranch %69 
                                              %69 = OpLabel 
                                       f32_4 %183 = OpLoad %174 
                              Uniform f32_4* %184 = OpAccessChain %30 %86 
                                       f32_4 %185 = OpLoad %184 
                                         f32 %186 = OpDot %183 %185 
                                                      OpStore %182 %186 
                                         f32 %187 = OpLoad %182 
                                         f32 %189 = OpExtInst %1 43 %187 %188 %59 
                                                      OpStore %182 %189 
                                       f32_4 %192 = OpLoad %20 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                              Uniform f32_4* %195 = OpAccessChain %30 %194 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %198 = OpFMul %193 %197 
                                                      OpStore %191 %198 
                                         f32 %200 = OpLoad %182 
                                       f32_3 %201 = OpCompositeConstruct %200 %200 %200 
                                       f32_3 %202 = OpLoad %191 
                                       f32_3 %203 = OpFMul %201 %202 
                                                      OpStore %199 %203 
                                       f32_3 %204 = OpLoad %191 
                                       f32_3 %205 = OpFNegate %204 
                                         f32 %206 = OpLoad %182 
                                       f32_3 %207 = OpCompositeConstruct %206 %206 %206 
                                       f32_3 %208 = OpFMul %205 %207 
                              Uniform f32_4* %209 = OpAccessChain %30 %32 
                                       f32_4 %210 = OpLoad %209 
                                       f32_3 %211 = OpVectorShuffle %210 %210 0 1 2 
                                       f32_3 %212 = OpFAdd %208 %211 
                                       f32_4 %213 = OpLoad %20 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 6 3 
                                                      OpStore %20 %214 
                              Uniform f32_4* %215 = OpAccessChain %30 %32 
                                       f32_4 %216 = OpLoad %215 
                                       f32_3 %217 = OpVectorShuffle %216 %216 3 3 3 
                                       f32_4 %218 = OpLoad %20 
                                       f32_3 %219 = OpVectorShuffle %218 %218 1 2 0 
                                       f32_3 %220 = OpFMul %217 %219 
                                       f32_3 %221 = OpLoad %199 
                                       f32_3 %222 = OpVectorShuffle %221 %221 1 2 0 
                                       f32_3 %223 = OpFAdd %220 %222 
                                       f32_4 %224 = OpLoad %20 
                                       f32_4 %225 = OpVectorShuffle %224 %223 4 5 2 6 
                                                      OpStore %20 %225 
                                Private f32* %227 = OpAccessChain %20 %55 
                                         f32 %228 = OpLoad %227 
                                Private f32* %229 = OpAccessChain %20 %70 
                                         f32 %230 = OpLoad %229 
                                        bool %231 = OpFOrdGreaterThanEqual %228 %230 
                                                      OpStore %226 %231 
                                        bool %235 = OpLoad %226 
                                                      OpSelectionMerge %237 None 
                                                      OpBranchConditional %235 %236 %238 
                                             %236 = OpLabel 
                                                      OpStore %234 %59 
                                                      OpBranch %237 
                                             %238 = OpLabel 
                                                      OpStore %234 %188 
                                                      OpBranch %237 
                                             %237 = OpLabel 
                                         f32 %239 = OpLoad %234 
                                Private f32* %240 = OpAccessChain %232 %55 
                                                      OpStore %240 %239 
                                       f32_4 %241 = OpLoad %20 
                                       f32_2 %242 = OpVectorShuffle %241 %241 1 0 
                                       f32_4 %243 = OpLoad %74 
                                       f32_4 %244 = OpVectorShuffle %243 %242 4 5 2 3 
                                                      OpStore %74 %244 
                                Private f32* %246 = OpAccessChain %74 %156 
                                                      OpStore %246 %245 
                                Private f32* %248 = OpAccessChain %74 %180 
                                                      OpStore %248 %247 
                                       f32_4 %250 = OpLoad %20 
                                       f32_2 %251 = OpVectorShuffle %250 %250 0 1 
                                       f32_4 %252 = OpLoad %74 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpFNegate %253 
                                       f32_2 %255 = OpFAdd %251 %254 
                                       f32_4 %256 = OpLoad %249 
                                       f32_4 %257 = OpVectorShuffle %256 %255 4 5 2 3 
                                                      OpStore %249 %257 
                                Private f32* %258 = OpAccessChain %249 %156 
                                                      OpStore %258 %59 
                                Private f32* %259 = OpAccessChain %249 %180 
                                                      OpStore %259 %245 
                                       f32_3 %260 = OpLoad %232 
                                       f32_4 %261 = OpVectorShuffle %260 %260 0 0 0 0 
                                       f32_4 %262 = OpLoad %249 
                                       f32_4 %263 = OpFMul %261 %262 
                                       f32_4 %264 = OpLoad %74 
                                       f32_4 %265 = OpFAdd %263 %264 
                                                      OpStore %74 %265 
                                Private f32* %266 = OpAccessChain %20 %180 
                                         f32 %267 = OpLoad %266 
                                Private f32* %268 = OpAccessChain %74 %55 
                                         f32 %269 = OpLoad %268 
                                        bool %270 = OpFOrdGreaterThanEqual %267 %269 
                                                      OpStore %226 %270 
                                        bool %272 = OpLoad %226 
                                                      OpSelectionMerge %274 None 
                                                      OpBranchConditional %272 %273 %275 
                                             %273 = OpLabel 
                                                      OpStore %271 %59 
                                                      OpBranch %274 
                                             %275 = OpLabel 
                                                      OpStore %271 %188 
                                                      OpBranch %274 
                                             %274 = OpLabel 
                                         f32 %276 = OpLoad %271 
                                Private f32* %277 = OpAccessChain %232 %55 
                                                      OpStore %277 %276 
                                       f32_4 %278 = OpLoad %74 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 3 
                                       f32_4 %280 = OpLoad %20 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %20 %281 
                                       f32_4 %282 = OpLoad %20 
                                       f32_3 %283 = OpVectorShuffle %282 %282 3 1 0 
                                       f32_4 %284 = OpLoad %74 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 2 6 
                                                      OpStore %74 %285 
                                       f32_4 %286 = OpLoad %20 
                                       f32_4 %287 = OpFNegate %286 
                                       f32_4 %288 = OpLoad %74 
                                       f32_4 %289 = OpFAdd %287 %288 
                                                      OpStore %74 %289 
                                       f32_3 %290 = OpLoad %232 
                                       f32_4 %291 = OpVectorShuffle %290 %290 0 0 0 0 
                                       f32_4 %292 = OpLoad %74 
                                       f32_4 %293 = OpFMul %291 %292 
                                       f32_4 %294 = OpLoad %20 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %20 %295 
                                Private f32* %296 = OpAccessChain %20 %70 
                                         f32 %297 = OpLoad %296 
                                Private f32* %298 = OpAccessChain %20 %180 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpExtInst %1 37 %297 %299 
                                Private f32* %301 = OpAccessChain %232 %55 
                                                      OpStore %301 %300 
                                Private f32* %302 = OpAccessChain %20 %55 
                                         f32 %303 = OpLoad %302 
                                Private f32* %304 = OpAccessChain %232 %55 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFNegate %305 
                                         f32 %307 = OpFAdd %303 %306 
                                Private f32* %308 = OpAccessChain %232 %55 
                                                      OpStore %308 %307 
                                Private f32* %310 = OpAccessChain %20 %70 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                Private f32* %313 = OpAccessChain %20 %180 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFAdd %312 %314 
                                Private f32* %316 = OpAccessChain %309 %55 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %232 %55 
                                         f32 %318 = OpLoad %317 
                                         f32 %320 = OpFMul %318 %319 
                                         f32 %322 = OpFAdd %320 %321 
                                                      OpStore %148 %322 
                                Private f32* %323 = OpAccessChain %309 %55 
                                         f32 %324 = OpLoad %323 
                                         f32 %325 = OpLoad %148 
                                         f32 %326 = OpFDiv %324 %325 
                                Private f32* %327 = OpAccessChain %309 %55 
                                                      OpStore %327 %326 
                                Private f32* %328 = OpAccessChain %309 %55 
                                         f32 %329 = OpLoad %328 
                                Private f32* %330 = OpAccessChain %20 %156 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFAdd %329 %331 
                                Private f32* %333 = OpAccessChain %309 %55 
                                                      OpStore %333 %332 
                                Private f32* %335 = OpAccessChain %20 %55 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFAdd %336 %321 
                                                      OpStore %334 %337 
                                Private f32* %338 = OpAccessChain %232 %55 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpLoad %334 
                                         f32 %341 = OpFDiv %339 %340 
                                                      OpStore %334 %341 
                                Private f32* %342 = OpAccessChain %9 %70 
                                         f32 %343 = OpLoad %342 
                                Private f32* %344 = OpAccessChain %9 %156 
                                         f32 %345 = OpLoad %344 
                                        bool %346 = OpFOrdGreaterThanEqual %343 %345 
                                                      OpStore %53 %346 
                                        bool %348 = OpLoad %53 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %348 %349 %351 
                                             %349 = OpLabel 
                                                      OpStore %347 %59 
                                                      OpBranch %350 
                                             %351 = OpLabel 
                                                      OpStore %347 %188 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                         f32 %352 = OpLoad %347 
                                                      OpStore %148 %352 
                                Private f32* %353 = OpAccessChain %9 %156 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFNegate %354 
                                Private f32* %356 = OpAccessChain %9 %70 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFAdd %355 %357 
                                Private f32* %359 = OpAccessChain %232 %55 
                                                      OpStore %359 %358 
                                         f32 %360 = OpLoad %148 
                                Private f32* %361 = OpAccessChain %232 %55 
                                         f32 %362 = OpLoad %361 
                                         f32 %363 = OpFMul %360 %362 
                                Private f32* %364 = OpAccessChain %9 %156 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                                      OpStore %148 %366 
                                Private f32* %367 = OpAccessChain %9 %55 
                                         f32 %368 = OpLoad %367 
                                         f32 %369 = OpLoad %148 
                                        bool %370 = OpFOrdGreaterThanEqual %368 %369 
                                                      OpStore %226 %370 
                                        bool %372 = OpLoad %226 
                                                      OpSelectionMerge %374 None 
                                                      OpBranchConditional %372 %373 %375 
                                             %373 = OpLabel 
                                                      OpStore %371 %59 
                                                      OpBranch %374 
                                             %375 = OpLabel 
                                                      OpStore %371 %188 
                                                      OpBranch %374 
                                             %374 = OpLabel 
                                         f32 %376 = OpLoad %371 
                                Private f32* %377 = OpAccessChain %232 %55 
                                                      OpStore %377 %376 
                                Private f32* %379 = OpAccessChain %9 %55 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpLoad %148 
                                         f32 %382 = OpFNegate %381 
                                         f32 %383 = OpFAdd %380 %382 
                                                      OpStore %378 %383 
                                Private f32* %384 = OpAccessChain %232 %55 
                                         f32 %385 = OpLoad %384 
                                         f32 %386 = OpLoad %378 
                                         f32 %387 = OpFMul %385 %386 
                                         f32 %388 = OpLoad %148 
                                         f32 %389 = OpFAdd %387 %388 
                                                      OpStore %148 %389 
                                         f32 %390 = OpLoad %148 
                                Uniform f32* %392 = OpAccessChain %30 %391 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFMul %390 %393 
                                                      OpStore %148 %394 
                                         f32 %395 = OpLoad %148 
                                Private f32* %396 = OpAccessChain %20 %55 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpExtInst %1 37 %395 %397 
                                Private f32* %399 = OpAccessChain %20 %55 
                                                      OpStore %399 %398 
                                       f32_3 %400 = OpLoad %309 
                                       f32_3 %401 = OpVectorShuffle %400 %400 0 0 0 
                                       f32_3 %402 = OpExtInst %1 4 %401 
                                       f32_3 %405 = OpFAdd %402 %404 
                                                      OpStore %232 %405 
                                       f32_3 %406 = OpLoad %232 
                                       f32_3 %407 = OpExtInst %1 10 %406 
                                                      OpStore %232 %407 
                                       f32_3 %408 = OpLoad %232 
                                       f32_3 %410 = OpFMul %408 %409 
                                       f32_3 %413 = OpFAdd %410 %412 
                                                      OpStore %232 %413 
                                       f32_3 %414 = OpLoad %232 
                                       f32_3 %415 = OpExtInst %1 4 %414 
                                       f32_3 %417 = OpFAdd %415 %416 
                                                      OpStore %232 %417 
                                       f32_3 %418 = OpLoad %232 
                                       f32_3 %419 = OpCompositeConstruct %188 %188 %188 
                                       f32_3 %420 = OpCompositeConstruct %59 %59 %59 
                                       f32_3 %421 = OpExtInst %1 43 %418 %419 %420 
                                                      OpStore %232 %421 
                                       f32_3 %422 = OpLoad %232 
                                       f32_3 %423 = OpFAdd %422 %416 
                                                      OpStore %232 %423 
                                         f32 %424 = OpLoad %334 
                                       f32_3 %425 = OpCompositeConstruct %424 %424 %424 
                                       f32_3 %426 = OpLoad %232 
                                       f32_3 %427 = OpFMul %425 %426 
                                       f32_3 %429 = OpFAdd %427 %428 
                                                      OpStore %309 %429 
                                       f32_3 %430 = OpLoad %309 
                                       f32_4 %431 = OpLoad %20 
                                       f32_3 %432 = OpVectorShuffle %431 %431 0 0 0 
                                       f32_3 %433 = OpFMul %430 %432 
                                       f32_4 %434 = OpLoad %9 
                                       f32_4 %435 = OpVectorShuffle %434 %433 4 5 6 3 
                                                      OpStore %9 %435 
                                       f32_4 %438 = OpLoad %9 
                                                      OpStore %437 %438 
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat10_4;
float u_xlat5;
float u_xlat16_5;
float u_xlat6;
vec2 u_xlat8;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat2 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb16)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat3.y * 0.25 + 0.75;
        u_xlat8.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat16, u_xlat8.x);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat16 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlatb3 = 0.0<u_xlat2.z;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat10_4 = texture(_LightTexture0, u_xlat8.xy);
    u_xlat17 = u_xlat3.x * u_xlat10_4.w;
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat2.x = u_xlat17 * u_xlat10_3.w;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat16) + _OverrideColor.xyz;
    u_xlat1.xyw = _OverrideColor.www * u_xlat1.yzx + u_xlat2.yzx;
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat2.xxxx * u_xlat4 + u_xlat3;
    u_xlatb3 = u_xlat1.w>=u_xlat2.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = u_xlat3.xxxx * u_xlat2 + u_xlat1;
    u_xlat2.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat2.x = u_xlat1.x + (-u_xlat2.x);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat16 = u_xlat2.x * 6.0 + 1.00000001e-010;
    u_xlat6 = u_xlat6 / u_xlat16;
    u_xlat6 = u_xlat6 + u_xlat1.z;
    u_xlat11 = u_xlat1.x + 1.00000001e-010;
    u_xlat11 = u_xlat2.x / u_xlat11;
    u_xlatb16 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat16_5 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat5 = u_xlat16 * u_xlat16_5 + u_xlat10_0.z;
    u_xlatb10 = u_xlat10_0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat5) + u_xlat10_0.x;
    u_xlat0 = u_xlat10 * u_xlat0 + u_xlat5;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat1.x);
    u_xlat1.xyw = abs(vec3(u_xlat6)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyw = fract(u_xlat1.xyw);
    u_xlat1.xyw = u_xlat1.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyw = abs(u_xlat1.xyw) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    u_xlat1.xyw = u_xlat1.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat11) * u_xlat1.xyw + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
; Bound: 534
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %531 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpMemberDecorate %29 8 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %98 SpecId 98 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %239 DescriptorSet 239 
                                                      OpDecorate %239 Binding 239 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %254 DescriptorSet 254 
                                                      OpDecorate %254 Binding 254 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %531 Location 531 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %6 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 8 
                                              %34 = OpTypePointer Uniform %7 
                               Private f32_4* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %21 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 6 
                                          i32 %58 = OpConstant 1 
                                          i32 %62 = OpConstant 0 
                                          i32 %70 = OpConstant 2 
                                          i32 %79 = OpConstant 3 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                          u32 %86 = OpConstant 0 
                                              %87 = OpTypePointer Uniform %6 
                                          f32 %90 = OpConstant 3.67402E-40 
                                         bool %92 = OpConstantFalse 
                                         bool %98 = OpSpecConstantFalse 
                                         u32 %101 = OpConstant 1 
                              Private f32_4* %105 = OpVariable Private 
                                             %144 = OpTypePointer Function %21 
                                         i32 %158 = OpConstant 4 
                                             %159 = OpTypePointer Uniform %21 
                                             %173 = OpTypePointer Private %6 
                                Private f32* %174 = OpVariable Private 
                                         f32 %177 = OpConstant 3.67402E-40 
                                         f32 %179 = OpConstant 3.67402E-40 
                                Private f32* %181 = OpVariable Private 
                                         u32 %182 = OpConstant 2 
                                         f32 %185 = OpConstant 3.67402E-40 
                                             %192 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %193 = OpTypeSampledImage %192 
                                             %194 = OpTypePointer UniformConstant %193 
 UniformConstant read_only Texture3DSampled* %195 = OpVariable UniformConstant 
                              Private f32_4* %200 = OpVariable Private 
                                         u32 %206 = OpConstant 3 
                                Private f32* %208 = OpVariable Private 
                                         f32 %214 = OpConstant 3.67402E-40 
                                             %219 = OpTypePointer Private %21 
                              Private f32_3* %220 = OpVariable Private 
                                             %221 = OpTypePointer Function %6 
                                             %229 = OpTypePointer Private %15 
                              Private f32_2* %230 = OpVariable Private 
                                       f32_2 %237 = OpConstantComposite %185 %185 
 UniformConstant read_only Texture2DSampled* %239 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %254 = OpVariable UniformConstant 
                                         i32 %271 = OpConstant 5 
                              Private f32_3* %276 = OpVariable Private 
                               Private bool* %303 = OpVariable Private 
                                         f32 %320 = OpConstant 3.67402E-40 
                                         f32 %322 = OpConstant 3.67402E-40 
                              Private f32_4* %324 = OpVariable Private 
                               Private bool* %341 = OpVariable Private 
                              Private f32_3* %385 = OpVariable Private 
                                         f32 %395 = OpConstant 3.67402E-40 
                                         f32 %397 = OpConstant 3.67402E-40 
                                Private f32* %410 = OpVariable Private 
                                Private f32* %454 = OpVariable Private 
                                         i32 %467 = OpConstant 7 
                                         f32 %479 = OpConstant 3.67402E-40 
                                       f32_3 %480 = OpConstantComposite %90 %322 %479 
                                       f32_3 %491 = OpConstantComposite %395 %395 %395 
                                         f32 %493 = OpConstant 3.67402E-40 
                                       f32_3 %494 = OpConstantComposite %493 %493 %493 
                                       f32_3 %501 = OpConstantComposite %320 %320 %320 
                                       f32_3 %522 = OpConstantComposite %90 %90 %90 
                                             %530 = OpTypePointer Output %7 
                               Output f32_4* %531 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %145 = OpVariable Function 
                               Function f32* %222 = OpVariable Function 
                               Function f32* %309 = OpVariable Function 
                               Function f32* %347 = OpVariable Function 
                               Function f32* %423 = OpVariable Function 
                               Function f32* %447 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %41 = OpAccessChain %31 %33 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_4 %44 = OpLoad %20 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpFMul %43 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %20 %51 
                                        f32_3 %55 = OpLoad %54 
                                        f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %31 %57 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_4 %61 = OpFMul %56 %60 
                                                      OpStore %52 %61 
                               Uniform f32_4* %63 = OpAccessChain %31 %57 %62 
                                        f32_4 %64 = OpLoad %63 
                                        f32_3 %65 = OpLoad %54 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %52 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %52 %69 
                               Uniform f32_4* %71 = OpAccessChain %31 %57 %70 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpLoad %54 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %52 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %52 %77 
                                        f32_4 %78 = OpLoad %52 
                               Uniform f32_4* %80 = OpAccessChain %31 %57 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %78 %81 
                                                      OpStore %52 %82 
                                 Uniform f32* %88 = OpAccessChain %31 %58 %86 
                                          f32 %89 = OpLoad %88 
                                         bool %91 = OpFOrdEqual %89 %90 
                                                      OpStore %85 %91 
                                                      OpSelectionMerge %94 None 
                                                      OpBranchConditional %92 %93 %94 
                                              %93 = OpLabel 
                                         bool %95 = OpLoad %85 
                                                      OpSelectionMerge %97 None 
                                                      OpBranchConditional %95 %96 %97 
                                              %96 = OpLabel 
                                                      OpBranch %97 
                                              %97 = OpLabel 
                                                      OpBranch %94 
                                              %94 = OpLabel 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %202 
                                              %99 = OpLabel 
                                Uniform f32* %102 = OpAccessChain %31 %58 %101 
                                         f32 %103 = OpLoad %102 
                                        bool %104 = OpFOrdEqual %103 %90 
                                                      OpStore %85 %104 
                                       f32_3 %106 = OpLoad %54 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %108 = OpAccessChain %31 %70 %58 
                                       f32_4 %109 = OpLoad %108 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFMul %107 %110 
                                       f32_4 %112 = OpLoad %105 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %105 %113 
                              Uniform f32_4* %114 = OpAccessChain %31 %70 %62 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                       f32_3 %117 = OpLoad %54 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 0 0 
                                       f32_3 %119 = OpFMul %116 %118 
                                       f32_4 %120 = OpLoad %105 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %122 = OpFAdd %119 %121 
                                       f32_4 %123 = OpLoad %105 
                                       f32_4 %124 = OpVectorShuffle %123 %122 4 5 6 3 
                                                      OpStore %105 %124 
                              Uniform f32_4* %125 = OpAccessChain %31 %70 %70 
                                       f32_4 %126 = OpLoad %125 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpLoad %54 
                                       f32_3 %129 = OpVectorShuffle %128 %128 2 2 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %105 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %105 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %105 %135 
                                       f32_4 %136 = OpLoad %105 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %31 %70 %79 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFAdd %137 %140 
                                       f32_4 %142 = OpLoad %105 
                                       f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                      OpStore %105 %143 
                                        bool %146 = OpLoad %85 
                                                      OpSelectionMerge %148 None 
                                                      OpBranchConditional %146 %147 %151 
                                             %147 = OpLabel 
                                       f32_4 %149 = OpLoad %105 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                                      OpStore %145 %150 
                                                      OpBranch %148 
                                             %151 = OpLabel 
                                       f32_3 %152 = OpLoad %54 
                                                      OpStore %145 %152 
                                                      OpBranch %148 
                                             %148 = OpLabel 
                                       f32_3 %153 = OpLoad %145 
                                       f32_4 %154 = OpLoad %105 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %105 %155 
                                       f32_4 %156 = OpLoad %105 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                              Uniform f32_3* %160 = OpAccessChain %31 %158 
                                       f32_3 %161 = OpLoad %160 
                                       f32_3 %162 = OpFNegate %161 
                                       f32_3 %163 = OpFAdd %157 %162 
                                       f32_4 %164 = OpLoad %105 
                                       f32_4 %165 = OpVectorShuffle %164 %163 4 5 6 3 
                                                      OpStore %105 %165 
                                       f32_4 %166 = OpLoad %105 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                              Uniform f32_3* %168 = OpAccessChain %31 %79 
                                       f32_3 %169 = OpLoad %168 
                                       f32_3 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %105 
                                       f32_4 %172 = OpVectorShuffle %171 %170 0 4 5 6 
                                                      OpStore %105 %172 
                                Private f32* %175 = OpAccessChain %105 %101 
                                         f32 %176 = OpLoad %175 
                                         f32 %178 = OpFMul %176 %177 
                                         f32 %180 = OpFAdd %178 %179 
                                                      OpStore %174 %180 
                                Uniform f32* %183 = OpAccessChain %31 %58 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %186 = OpFMul %184 %185 
                                         f32 %187 = OpFAdd %186 %179 
                                                      OpStore %181 %187 
                                         f32 %188 = OpLoad %174 
                                         f32 %189 = OpLoad %181 
                                         f32 %190 = OpExtInst %1 40 %188 %189 
                                Private f32* %191 = OpAccessChain %105 %86 
                                                      OpStore %191 %190 
                  read_only Texture3DSampled %196 = OpLoad %195 
                                       f32_4 %197 = OpLoad %105 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 2 3 
                                       f32_4 %199 = OpImageSampleImplicitLod %196 %198 
                                                      OpStore %105 %199 
                                       f32_4 %201 = OpLoad %105 
                                                      OpStore %200 %201 
                                                      OpBranch %100 
                                             %202 = OpLabel 
                                Private f32* %203 = OpAccessChain %200 %86 
                                                      OpStore %203 %90 
                                Private f32* %204 = OpAccessChain %200 %101 
                                                      OpStore %204 %90 
                                Private f32* %205 = OpAccessChain %200 %182 
                                                      OpStore %205 %90 
                                Private f32* %207 = OpAccessChain %200 %206 
                                                      OpStore %207 %90 
                                                      OpBranch %100 
                                             %100 = OpLabel 
                                       f32_4 %209 = OpLoad %200 
                              Uniform f32_4* %210 = OpAccessChain %31 %62 
                                       f32_4 %211 = OpLoad %210 
                                         f32 %212 = OpDot %209 %211 
                                                      OpStore %208 %212 
                                         f32 %213 = OpLoad %208 
                                         f32 %215 = OpExtInst %1 43 %213 %214 %90 
                                                      OpStore %208 %215 
                                Private f32* %216 = OpAccessChain %52 %182 
                                         f32 %217 = OpLoad %216 
                                        bool %218 = OpFOrdLessThan %214 %217 
                                                      OpStore %85 %218 
                                        bool %223 = OpLoad %85 
                                                      OpSelectionMerge %225 None 
                                                      OpBranchConditional %223 %224 %226 
                                             %224 = OpLabel 
                                                      OpStore %222 %90 
                                                      OpBranch %225 
                                             %226 = OpLabel 
                                                      OpStore %222 %214 
                                                      OpBranch %225 
                                             %225 = OpLabel 
                                         f32 %227 = OpLoad %222 
                                Private f32* %228 = OpAccessChain %220 %86 
                                                      OpStore %228 %227 
                                       f32_4 %231 = OpLoad %52 
                                       f32_2 %232 = OpVectorShuffle %231 %231 0 1 
                                       f32_4 %233 = OpLoad %52 
                                       f32_2 %234 = OpVectorShuffle %233 %233 3 3 
                                       f32_2 %235 = OpFDiv %232 %234 
                                                      OpStore %230 %235 
                                       f32_2 %236 = OpLoad %230 
                                       f32_2 %238 = OpFAdd %236 %237 
                                                      OpStore %230 %238 
                  read_only Texture2DSampled %240 = OpLoad %239 
                                       f32_2 %241 = OpLoad %230 
                                       f32_4 %242 = OpImageSampleImplicitLod %240 %241 
                                         f32 %243 = OpCompositeExtract %242 3 
                                                      OpStore %174 %243 
                                         f32 %244 = OpLoad %174 
                                Private f32* %245 = OpAccessChain %220 %86 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFMul %244 %246 
                                Private f32* %248 = OpAccessChain %220 %86 
                                                      OpStore %248 %247 
                                       f32_4 %249 = OpLoad %52 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_4 %251 = OpLoad %52 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                         f32 %253 = OpDot %250 %252 
                                                      OpStore %174 %253 
                  read_only Texture2DSampled %255 = OpLoad %254 
                                         f32 %256 = OpLoad %174 
                                       f32_2 %257 = OpCompositeConstruct %256 %256 
                                       f32_4 %258 = OpImageSampleImplicitLod %255 %257 
                                         f32 %259 = OpCompositeExtract %258 3 
                                                      OpStore %174 %259 
                                         f32 %260 = OpLoad %174 
                                Private f32* %261 = OpAccessChain %220 %86 
                                         f32 %262 = OpLoad %261 
                                         f32 %263 = OpFMul %260 %262 
                                Private f32* %264 = OpAccessChain %220 %86 
                                                      OpStore %264 %263 
                                         f32 %265 = OpLoad %208 
                                Private f32* %266 = OpAccessChain %220 %86 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                                      OpStore %208 %268 
                                       f32_4 %269 = OpLoad %20 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %272 = OpAccessChain %31 %271 
                                       f32_4 %273 = OpLoad %272 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpFMul %270 %274 
                                                      OpStore %220 %275 
                                         f32 %277 = OpLoad %208 
                                       f32_3 %278 = OpCompositeConstruct %277 %277 %277 
                                       f32_3 %279 = OpLoad %220 
                                       f32_3 %280 = OpFMul %278 %279 
                                                      OpStore %276 %280 
                                       f32_3 %281 = OpLoad %220 
                                       f32_3 %282 = OpFNegate %281 
                                         f32 %283 = OpLoad %208 
                                       f32_3 %284 = OpCompositeConstruct %283 %283 %283 
                                       f32_3 %285 = OpFMul %282 %284 
                              Uniform f32_4* %286 = OpAccessChain %31 %33 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                       f32_3 %289 = OpFAdd %285 %288 
                                       f32_4 %290 = OpLoad %20 
                                       f32_4 %291 = OpVectorShuffle %290 %289 4 5 6 3 
                                                      OpStore %20 %291 
                              Uniform f32_4* %292 = OpAccessChain %31 %33 
                                       f32_4 %293 = OpLoad %292 
                                       f32_3 %294 = OpVectorShuffle %293 %293 3 3 3 
                                       f32_4 %295 = OpLoad %20 
                                       f32_3 %296 = OpVectorShuffle %295 %295 1 2 0 
                                       f32_3 %297 = OpFMul %294 %296 
                                       f32_3 %298 = OpLoad %276 
                                       f32_3 %299 = OpVectorShuffle %298 %298 1 2 0 
                                       f32_3 %300 = OpFAdd %297 %299 
                                       f32_4 %301 = OpLoad %20 
                                       f32_4 %302 = OpVectorShuffle %301 %300 4 5 2 6 
                                                      OpStore %20 %302 
                                Private f32* %304 = OpAccessChain %20 %86 
                                         f32 %305 = OpLoad %304 
                                Private f32* %306 = OpAccessChain %20 %101 
                                         f32 %307 = OpLoad %306 
                                        bool %308 = OpFOrdGreaterThanEqual %305 %307 
                                                      OpStore %303 %308 
                                        bool %310 = OpLoad %303 
                                                      OpSelectionMerge %312 None 
                                                      OpBranchConditional %310 %311 %313 
                                             %311 = OpLabel 
                                                      OpStore %309 %90 
                                                      OpBranch %312 
                                             %313 = OpLabel 
                                                      OpStore %309 %214 
                                                      OpBranch %312 
                                             %312 = OpLabel 
                                         f32 %314 = OpLoad %309 
                                Private f32* %315 = OpAccessChain %52 %86 
                                                      OpStore %315 %314 
                                       f32_4 %316 = OpLoad %20 
                                       f32_2 %317 = OpVectorShuffle %316 %316 1 0 
                                       f32_4 %318 = OpLoad %105 
                                       f32_4 %319 = OpVectorShuffle %318 %317 4 5 2 3 
                                                      OpStore %105 %319 
                                Private f32* %321 = OpAccessChain %105 %182 
                                                      OpStore %321 %320 
                                Private f32* %323 = OpAccessChain %105 %206 
                                                      OpStore %323 %322 
                                       f32_4 %325 = OpLoad %20 
                                       f32_2 %326 = OpVectorShuffle %325 %325 0 1 
                                       f32_4 %327 = OpLoad %105 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                       f32_2 %329 = OpFNegate %328 
                                       f32_2 %330 = OpFAdd %326 %329 
                                       f32_4 %331 = OpLoad %324 
                                       f32_4 %332 = OpVectorShuffle %331 %330 4 5 2 3 
                                                      OpStore %324 %332 
                                Private f32* %333 = OpAccessChain %324 %182 
                                                      OpStore %333 %90 
                                Private f32* %334 = OpAccessChain %324 %206 
                                                      OpStore %334 %320 
                                       f32_4 %335 = OpLoad %52 
                                       f32_4 %336 = OpVectorShuffle %335 %335 0 0 0 0 
                                       f32_4 %337 = OpLoad %324 
                                       f32_4 %338 = OpFMul %336 %337 
                                       f32_4 %339 = OpLoad %105 
                                       f32_4 %340 = OpFAdd %338 %339 
                                                      OpStore %52 %340 
                                Private f32* %342 = OpAccessChain %20 %206 
                                         f32 %343 = OpLoad %342 
                                Private f32* %344 = OpAccessChain %52 %86 
                                         f32 %345 = OpLoad %344 
                                        bool %346 = OpFOrdGreaterThanEqual %343 %345 
                                                      OpStore %341 %346 
                                        bool %348 = OpLoad %341 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %348 %349 %351 
                                             %349 = OpLabel 
                                                      OpStore %347 %90 
                                                      OpBranch %350 
                                             %351 = OpLabel 
                                                      OpStore %347 %214 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                         f32 %352 = OpLoad %347 
                                Private f32* %353 = OpAccessChain %230 %86 
                                                      OpStore %353 %352 
                                       f32_4 %354 = OpLoad %52 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 3 
                                       f32_4 %356 = OpLoad %20 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 6 3 
                                                      OpStore %20 %357 
                                       f32_4 %358 = OpLoad %20 
                                       f32_3 %359 = OpVectorShuffle %358 %358 3 1 0 
                                       f32_4 %360 = OpLoad %52 
                                       f32_4 %361 = OpVectorShuffle %360 %359 4 5 2 6 
                                                      OpStore %52 %361 
                                       f32_4 %362 = OpLoad %20 
                                       f32_4 %363 = OpFNegate %362 
                                       f32_4 %364 = OpLoad %52 
                                       f32_4 %365 = OpFAdd %363 %364 
                                                      OpStore %52 %365 
                                       f32_2 %366 = OpLoad %230 
                                       f32_4 %367 = OpVectorShuffle %366 %366 0 0 0 0 
                                       f32_4 %368 = OpLoad %52 
                                       f32_4 %369 = OpFMul %367 %368 
                                       f32_4 %370 = OpLoad %20 
                                       f32_4 %371 = OpFAdd %369 %370 
                                                      OpStore %20 %371 
                                Private f32* %372 = OpAccessChain %20 %101 
                                         f32 %373 = OpLoad %372 
                                Private f32* %374 = OpAccessChain %20 %206 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpExtInst %1 37 %373 %375 
                                Private f32* %377 = OpAccessChain %52 %86 
                                                      OpStore %377 %376 
                                Private f32* %378 = OpAccessChain %20 %86 
                                         f32 %379 = OpLoad %378 
                                Private f32* %380 = OpAccessChain %52 %86 
                                         f32 %381 = OpLoad %380 
                                         f32 %382 = OpFNegate %381 
                                         f32 %383 = OpFAdd %379 %382 
                                Private f32* %384 = OpAccessChain %52 %86 
                                                      OpStore %384 %383 
                                Private f32* %386 = OpAccessChain %20 %101 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFNegate %387 
                                Private f32* %389 = OpAccessChain %20 %206 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFAdd %388 %390 
                                Private f32* %392 = OpAccessChain %385 %86 
                                                      OpStore %392 %391 
                                Private f32* %393 = OpAccessChain %52 %86 
                                         f32 %394 = OpLoad %393 
                                         f32 %396 = OpFMul %394 %395 
                                         f32 %398 = OpFAdd %396 %397 
                                                      OpStore %174 %398 
                                Private f32* %399 = OpAccessChain %385 %86 
                                         f32 %400 = OpLoad %399 
                                         f32 %401 = OpLoad %174 
                                         f32 %402 = OpFDiv %400 %401 
                                Private f32* %403 = OpAccessChain %385 %86 
                                                      OpStore %403 %402 
                                Private f32* %404 = OpAccessChain %385 %86 
                                         f32 %405 = OpLoad %404 
                                Private f32* %406 = OpAccessChain %20 %182 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpFAdd %405 %407 
                                Private f32* %409 = OpAccessChain %385 %86 
                                                      OpStore %409 %408 
                                Private f32* %411 = OpAccessChain %20 %86 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFAdd %412 %397 
                                                      OpStore %410 %413 
                                Private f32* %414 = OpAccessChain %52 %86 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpLoad %410 
                                         f32 %417 = OpFDiv %415 %416 
                                                      OpStore %410 %417 
                                Private f32* %418 = OpAccessChain %9 %101 
                                         f32 %419 = OpLoad %418 
                                Private f32* %420 = OpAccessChain %9 %182 
                                         f32 %421 = OpLoad %420 
                                        bool %422 = OpFOrdGreaterThanEqual %419 %421 
                                                      OpStore %85 %422 
                                        bool %424 = OpLoad %85 
                                                      OpSelectionMerge %426 None 
                                                      OpBranchConditional %424 %425 %427 
                                             %425 = OpLabel 
                                                      OpStore %423 %90 
                                                      OpBranch %426 
                                             %427 = OpLabel 
                                                      OpStore %423 %214 
                                                      OpBranch %426 
                                             %426 = OpLabel 
                                         f32 %428 = OpLoad %423 
                                                      OpStore %174 %428 
                                Private f32* %429 = OpAccessChain %9 %182 
                                         f32 %430 = OpLoad %429 
                                         f32 %431 = OpFNegate %430 
                                Private f32* %432 = OpAccessChain %9 %101 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFAdd %431 %433 
                                Private f32* %435 = OpAccessChain %52 %86 
                                                      OpStore %435 %434 
                                         f32 %436 = OpLoad %174 
                                Private f32* %437 = OpAccessChain %52 %86 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFMul %436 %438 
                                Private f32* %440 = OpAccessChain %9 %182 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %174 %442 
                                Private f32* %443 = OpAccessChain %9 %86 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpLoad %174 
                                        bool %446 = OpFOrdGreaterThanEqual %444 %445 
                                                      OpStore %303 %446 
                                        bool %448 = OpLoad %303 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %451 
                                             %449 = OpLabel 
                                                      OpStore %447 %90 
                                                      OpBranch %450 
                                             %451 = OpLabel 
                                                      OpStore %447 %214 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                                         f32 %452 = OpLoad %447 
                                Private f32* %453 = OpAccessChain %52 %86 
                                                      OpStore %453 %452 
                                Private f32* %455 = OpAccessChain %9 %86 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpLoad %174 
                                         f32 %458 = OpFNegate %457 
                                         f32 %459 = OpFAdd %456 %458 
                                                      OpStore %454 %459 
                                Private f32* %460 = OpAccessChain %52 %86 
                                         f32 %461 = OpLoad %460 
                                         f32 %462 = OpLoad %454 
                                         f32 %463 = OpFMul %461 %462 
                                         f32 %464 = OpLoad %174 
                                         f32 %465 = OpFAdd %463 %464 
                                                      OpStore %174 %465 
                                         f32 %466 = OpLoad %174 
                                Uniform f32* %468 = OpAccessChain %31 %467 
                                         f32 %469 = OpLoad %468 
                                         f32 %470 = OpFMul %466 %469 
                                                      OpStore %174 %470 
                                         f32 %471 = OpLoad %174 
                                Private f32* %472 = OpAccessChain %20 %86 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpExtInst %1 37 %471 %473 
                                Private f32* %475 = OpAccessChain %20 %86 
                                                      OpStore %475 %474 
                                       f32_3 %476 = OpLoad %385 
                                       f32_3 %477 = OpVectorShuffle %476 %476 0 0 0 
                                       f32_3 %478 = OpExtInst %1 4 %477 
                                       f32_3 %481 = OpFAdd %478 %480 
                                       f32_4 %482 = OpLoad %52 
                                       f32_4 %483 = OpVectorShuffle %482 %481 4 5 6 3 
                                                      OpStore %52 %483 
                                       f32_4 %484 = OpLoad %52 
                                       f32_3 %485 = OpVectorShuffle %484 %484 0 1 2 
                                       f32_3 %486 = OpExtInst %1 10 %485 
                                       f32_4 %487 = OpLoad %52 
                                       f32_4 %488 = OpVectorShuffle %487 %486 4 5 6 3 
                                                      OpStore %52 %488 
                                       f32_4 %489 = OpLoad %52 
                                       f32_3 %490 = OpVectorShuffle %489 %489 0 1 2 
                                       f32_3 %492 = OpFMul %490 %491 
                                       f32_3 %495 = OpFAdd %492 %494 
                                       f32_4 %496 = OpLoad %52 
                                       f32_4 %497 = OpVectorShuffle %496 %495 4 5 6 3 
                                                      OpStore %52 %497 
                                       f32_4 %498 = OpLoad %52 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
                                       f32_3 %500 = OpExtInst %1 4 %499 
                                       f32_3 %502 = OpFAdd %500 %501 
                                       f32_4 %503 = OpLoad %52 
                                       f32_4 %504 = OpVectorShuffle %503 %502 4 5 6 3 
                                                      OpStore %52 %504 
                                       f32_4 %505 = OpLoad %52 
                                       f32_3 %506 = OpVectorShuffle %505 %505 0 1 2 
                                       f32_3 %507 = OpCompositeConstruct %214 %214 %214 
                                       f32_3 %508 = OpCompositeConstruct %90 %90 %90 
                                       f32_3 %509 = OpExtInst %1 43 %506 %507 %508 
                                       f32_4 %510 = OpLoad %52 
                                       f32_4 %511 = OpVectorShuffle %510 %509 4 5 6 3 
                                                      OpStore %52 %511 
                                       f32_4 %512 = OpLoad %52 
                                       f32_3 %513 = OpVectorShuffle %512 %512 0 1 2 
                                       f32_3 %514 = OpFAdd %513 %501 
                                       f32_4 %515 = OpLoad %52 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 5 6 3 
                                                      OpStore %52 %516 
                                         f32 %517 = OpLoad %410 
                                       f32_3 %518 = OpCompositeConstruct %517 %517 %517 
                                       f32_4 %519 = OpLoad %52 
                                       f32_3 %520 = OpVectorShuffle %519 %519 0 1 2 
                                       f32_3 %521 = OpFMul %518 %520 
                                       f32_3 %523 = OpFAdd %521 %522 
                                                      OpStore %385 %523 
                                       f32_3 %524 = OpLoad %385 
                                       f32_4 %525 = OpLoad %20 
                                       f32_3 %526 = OpVectorShuffle %525 %525 0 0 0 
                                       f32_3 %527 = OpFMul %524 %526 
                                       f32_4 %528 = OpLoad %9 
                                       f32_4 %529 = OpVectorShuffle %528 %527 4 5 6 3 
                                                      OpStore %9 %529 
                                       f32_4 %532 = OpLoad %9 
                                                      OpStore %531 %532 
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat16_5;
float u_xlat6;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb16)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat3.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat16, u_xlat17);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat16 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10_3 = texture(_LightTextureB0, vec2(u_xlat17));
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xyz);
    u_xlat16_2 = u_xlat10_2.w * u_xlat10_3.w;
    u_xlat16 = u_xlat16 * u_xlat16_2;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat16) + _OverrideColor.xyz;
    u_xlat1.xyw = _OverrideColor.www * u_xlat1.yzx + u_xlat2.yzx;
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat2.xxxx * u_xlat4 + u_xlat3;
    u_xlatb3 = u_xlat1.w>=u_xlat2.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = u_xlat3.xxxx * u_xlat2 + u_xlat1;
    u_xlat2.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat2.x = u_xlat1.x + (-u_xlat2.x);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat16 = u_xlat2.x * 6.0 + 1.00000001e-010;
    u_xlat6 = u_xlat6 / u_xlat16;
    u_xlat6 = u_xlat6 + u_xlat1.z;
    u_xlat11 = u_xlat1.x + 1.00000001e-010;
    u_xlat11 = u_xlat2.x / u_xlat11;
    u_xlatb16 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat16_5 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat5 = u_xlat16 * u_xlat16_5 + u_xlat10_0.z;
    u_xlatb10 = u_xlat10_0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat5) + u_xlat10_0.x;
    u_xlat0 = u_xlat10 * u_xlat0 + u_xlat5;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat1.x);
    u_xlat1.xyw = abs(vec3(u_xlat6)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyw = fract(u_xlat1.xyw);
    u_xlat1.xyw = u_xlat1.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyw = abs(u_xlat1.xyw) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    u_xlat1.xyw = u_xlat1.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat11) * u_xlat1.xyw + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
; Bound: 530
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %527 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpMemberDecorate %29 8 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %113 SpecId 113 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %240 DescriptorSet 240 
                                                      OpDecorate %240 Binding 240 
                                                      OpDecorate %249 DescriptorSet 249 
                                                      OpDecorate %249 Binding 249 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %527 Location 527 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %6 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 8 
                                              %34 = OpTypePointer Uniform %7 
                               Private f32_4* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %21 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 6 
                                          i32 %58 = OpConstant 1 
                                          i32 %65 = OpConstant 0 
                                          i32 %77 = OpConstant 2 
                                          i32 %91 = OpConstant 3 
                                              %98 = OpTypeBool 
                                              %99 = OpTypePointer Private %98 
                               Private bool* %100 = OpVariable Private 
                                         u32 %101 = OpConstant 0 
                                             %102 = OpTypePointer Uniform %6 
                                         f32 %105 = OpConstant 3.67402E-40 
                                        bool %107 = OpConstantFalse 
                                        bool %113 = OpSpecConstantFalse 
                                         u32 %116 = OpConstant 1 
                              Private f32_4* %120 = OpVariable Private 
                                             %159 = OpTypePointer Function %21 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %21 
                                             %188 = OpTypePointer Private %6 
                                Private f32* %189 = OpVariable Private 
                                         f32 %192 = OpConstant 3.67402E-40 
                                         f32 %194 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         u32 %197 = OpConstant 2 
                                         f32 %200 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                                         u32 %221 = OpConstant 3 
                                             %223 = OpTypePointer Private %21 
                              Private f32_3* %224 = OpVariable Private 
                                         f32 %232 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %240 = OpVariable UniformConstant 
                                             %246 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %247 = OpTypeSampledImage %246 
                                             %248 = OpTypePointer UniformConstant %247 
UniformConstant read_only TextureCubeSampled* %249 = OpVariable UniformConstant 
                                         i32 %266 = OpConstant 5 
                              Private f32_3* %271 = OpVariable Private 
                               Private bool* %298 = OpVariable Private 
                                             %304 = OpTypePointer Function %6 
                                         f32 %316 = OpConstant 3.67402E-40 
                                         f32 %318 = OpConstant 3.67402E-40 
                              Private f32_4* %320 = OpVariable Private 
                               Private bool* %337 = OpVariable Private 
                                Private f32* %343 = OpVariable Private 
                              Private f32_3* %381 = OpVariable Private 
                                         f32 %391 = OpConstant 3.67402E-40 
                                         f32 %393 = OpConstant 3.67402E-40 
                                Private f32* %406 = OpVariable Private 
                                Private f32* %450 = OpVariable Private 
                                         i32 %463 = OpConstant 7 
                                         f32 %475 = OpConstant 3.67402E-40 
                                       f32_3 %476 = OpConstantComposite %105 %318 %475 
                                       f32_3 %487 = OpConstantComposite %391 %391 %391 
                                         f32 %489 = OpConstant 3.67402E-40 
                                       f32_3 %490 = OpConstantComposite %489 %489 %489 
                                       f32_3 %497 = OpConstantComposite %316 %316 %316 
                                       f32_3 %518 = OpConstantComposite %105 %105 %105 
                                             %526 = OpTypePointer Output %7 
                               Output f32_4* %527 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %160 = OpVariable Function 
                               Function f32* %305 = OpVariable Function 
                               Function f32* %344 = OpVariable Function 
                               Function f32* %419 = OpVariable Function 
                               Function f32* %443 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %41 = OpAccessChain %31 %33 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_4 %44 = OpLoad %20 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpFMul %43 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %20 %51 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %31 %57 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                        f32_3 %62 = OpFMul %56 %61 
                                        f32_4 %63 = OpLoad %52 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                      OpStore %52 %64 
                               Uniform f32_4* %66 = OpAccessChain %31 %57 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpLoad %54 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                                        f32_3 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %52 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %52 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %52 %76 
                               Uniform f32_4* %78 = OpAccessChain %31 %57 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpLoad %54 
                                        f32_3 %82 = OpVectorShuffle %81 %81 2 2 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %52 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %52 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %52 %88 
                                        f32_4 %89 = OpLoad %52 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %92 = OpAccessChain %31 %57 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %90 %94 
                                        f32_4 %96 = OpLoad %52 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %52 %97 
                                Uniform f32* %103 = OpAccessChain %31 %58 %101 
                                         f32 %104 = OpLoad %103 
                                        bool %106 = OpFOrdEqual %104 %105 
                                                      OpStore %100 %106 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %109 
                                             %108 = OpLabel 
                                        bool %110 = OpLoad %100 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %217 
                                             %114 = OpLabel 
                                Uniform f32* %117 = OpAccessChain %31 %58 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %119 = OpFOrdEqual %118 %105 
                                                      OpStore %100 %119 
                                       f32_3 %121 = OpLoad %54 
                                       f32_3 %122 = OpVectorShuffle %121 %121 1 1 1 
                              Uniform f32_4* %123 = OpAccessChain %31 %77 %58 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %120 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %120 %128 
                              Uniform f32_4* %129 = OpAccessChain %31 %77 %65 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpLoad %54 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 0 0 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %120 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %120 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %120 %139 
                              Uniform f32_4* %140 = OpAccessChain %31 %77 %77 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpLoad %54 
                                       f32_3 %144 = OpVectorShuffle %143 %143 2 2 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %120 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %145 %147 
                                       f32_4 %149 = OpLoad %120 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %120 %150 
                                       f32_4 %151 = OpLoad %120 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %31 %77 %91 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %152 %155 
                                       f32_4 %157 = OpLoad %120 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %120 %158 
                                        bool %161 = OpLoad %100 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %161 %162 %166 
                                             %162 = OpLabel 
                                       f32_4 %164 = OpLoad %120 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                                      OpStore %160 %165 
                                                      OpBranch %163 
                                             %166 = OpLabel 
                                       f32_3 %167 = OpLoad %54 
                                                      OpStore %160 %167 
                                                      OpBranch %163 
                                             %163 = OpLabel 
                                       f32_3 %168 = OpLoad %160 
                                       f32_4 %169 = OpLoad %120 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %120 %170 
                                       f32_4 %171 = OpLoad %120 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_3* %175 = OpAccessChain %31 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                       f32_4 %179 = OpLoad %120 
                                       f32_4 %180 = OpVectorShuffle %179 %178 4 5 6 3 
                                                      OpStore %120 %180 
                                       f32_4 %181 = OpLoad %120 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_3* %183 = OpAccessChain %31 %91 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %120 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 4 5 6 
                                                      OpStore %120 %187 
                                Private f32* %190 = OpAccessChain %120 %116 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpFMul %191 %192 
                                         f32 %195 = OpFAdd %193 %194 
                                                      OpStore %189 %195 
                                Uniform f32* %198 = OpAccessChain %31 %58 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpFMul %199 %200 
                                         f32 %202 = OpFAdd %201 %194 
                                                      OpStore %196 %202 
                                         f32 %203 = OpLoad %189 
                                         f32 %204 = OpLoad %196 
                                         f32 %205 = OpExtInst %1 40 %203 %204 
                                Private f32* %206 = OpAccessChain %120 %101 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %120 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %120 %214 
                                       f32_4 %216 = OpLoad %120 
                                                      OpStore %215 %216 
                                                      OpBranch %115 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %101 
                                                      OpStore %218 %105 
                                Private f32* %219 = OpAccessChain %215 %116 
                                                      OpStore %219 %105 
                                Private f32* %220 = OpAccessChain %215 %197 
                                                      OpStore %220 %105 
                                Private f32* %222 = OpAccessChain %215 %221 
                                                      OpStore %222 %105 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                       f32_4 %225 = OpLoad %215 
                              Uniform f32_4* %226 = OpAccessChain %31 %65 
                                       f32_4 %227 = OpLoad %226 
                                         f32 %228 = OpDot %225 %227 
                                Private f32* %229 = OpAccessChain %224 %101 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %224 %101 
                                         f32 %231 = OpLoad %230 
                                         f32 %233 = OpExtInst %1 43 %231 %232 %105 
                                Private f32* %234 = OpAccessChain %224 %101 
                                                      OpStore %234 %233 
                                       f32_4 %235 = OpLoad %52 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_4 %237 = OpLoad %52 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                         f32 %239 = OpDot %236 %238 
                                                      OpStore %189 %239 
                  read_only Texture2DSampled %241 = OpLoad %240 
                                         f32 %242 = OpLoad %189 
                                       f32_2 %243 = OpCompositeConstruct %242 %242 
                                       f32_4 %244 = OpImageSampleImplicitLod %241 %243 
                                         f32 %245 = OpCompositeExtract %244 3 
                                                      OpStore %189 %245 
                read_only TextureCubeSampled %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %52 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_4 %253 = OpImageSampleImplicitLod %250 %252 
                                         f32 %254 = OpCompositeExtract %253 3 
                                Private f32* %255 = OpAccessChain %52 %101 
                                                      OpStore %255 %254 
                                         f32 %256 = OpLoad %189 
                                Private f32* %257 = OpAccessChain %52 %101 
                                         f32 %258 = OpLoad %257 
                                         f32 %259 = OpFMul %256 %258 
                                                      OpStore %189 %259 
                                Private f32* %260 = OpAccessChain %224 %101 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpLoad %189 
                                         f32 %263 = OpFMul %261 %262 
                                                      OpStore %189 %263 
                                       f32_4 %264 = OpLoad %20 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                              Uniform f32_4* %267 = OpAccessChain %31 %266 
                                       f32_4 %268 = OpLoad %267 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                                       f32_3 %270 = OpFMul %265 %269 
                                                      OpStore %224 %270 
                                         f32 %272 = OpLoad %189 
                                       f32_3 %273 = OpCompositeConstruct %272 %272 %272 
                                       f32_3 %274 = OpLoad %224 
                                       f32_3 %275 = OpFMul %273 %274 
                                                      OpStore %271 %275 
                                       f32_3 %276 = OpLoad %224 
                                       f32_3 %277 = OpFNegate %276 
                                         f32 %278 = OpLoad %189 
                                       f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %280 = OpFMul %277 %279 
                              Uniform f32_4* %281 = OpAccessChain %31 %33 
                                       f32_4 %282 = OpLoad %281 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFAdd %280 %283 
                                       f32_4 %285 = OpLoad %20 
                                       f32_4 %286 = OpVectorShuffle %285 %284 4 5 6 3 
                                                      OpStore %20 %286 
                              Uniform f32_4* %287 = OpAccessChain %31 %33 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 3 3 3 
                                       f32_4 %290 = OpLoad %20 
                                       f32_3 %291 = OpVectorShuffle %290 %290 1 2 0 
                                       f32_3 %292 = OpFMul %289 %291 
                                       f32_3 %293 = OpLoad %271 
                                       f32_3 %294 = OpVectorShuffle %293 %293 1 2 0 
                                       f32_3 %295 = OpFAdd %292 %294 
                                       f32_4 %296 = OpLoad %20 
                                       f32_4 %297 = OpVectorShuffle %296 %295 4 5 2 6 
                                                      OpStore %20 %297 
                                Private f32* %299 = OpAccessChain %20 %101 
                                         f32 %300 = OpLoad %299 
                                Private f32* %301 = OpAccessChain %20 %116 
                                         f32 %302 = OpLoad %301 
                                        bool %303 = OpFOrdGreaterThanEqual %300 %302 
                                                      OpStore %298 %303 
                                        bool %306 = OpLoad %298 
                                                      OpSelectionMerge %308 None 
                                                      OpBranchConditional %306 %307 %309 
                                             %307 = OpLabel 
                                                      OpStore %305 %105 
                                                      OpBranch %308 
                                             %309 = OpLabel 
                                                      OpStore %305 %232 
                                                      OpBranch %308 
                                             %308 = OpLabel 
                                         f32 %310 = OpLoad %305 
                                Private f32* %311 = OpAccessChain %52 %101 
                                                      OpStore %311 %310 
                                       f32_4 %312 = OpLoad %20 
                                       f32_2 %313 = OpVectorShuffle %312 %312 1 0 
                                       f32_4 %314 = OpLoad %120 
                                       f32_4 %315 = OpVectorShuffle %314 %313 4 5 2 3 
                                                      OpStore %120 %315 
                                Private f32* %317 = OpAccessChain %120 %197 
                                                      OpStore %317 %316 
                                Private f32* %319 = OpAccessChain %120 %221 
                                                      OpStore %319 %318 
                                       f32_4 %321 = OpLoad %20 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 1 
                                       f32_4 %323 = OpLoad %120 
                                       f32_2 %324 = OpVectorShuffle %323 %323 0 1 
                                       f32_2 %325 = OpFNegate %324 
                                       f32_2 %326 = OpFAdd %322 %325 
                                       f32_4 %327 = OpLoad %320 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %320 %328 
                                Private f32* %329 = OpAccessChain %320 %197 
                                                      OpStore %329 %105 
                                Private f32* %330 = OpAccessChain %320 %221 
                                                      OpStore %330 %316 
                                       f32_4 %331 = OpLoad %52 
                                       f32_4 %332 = OpVectorShuffle %331 %331 0 0 0 0 
                                       f32_4 %333 = OpLoad %320 
                                       f32_4 %334 = OpFMul %332 %333 
                                       f32_4 %335 = OpLoad %120 
                                       f32_4 %336 = OpFAdd %334 %335 
                                                      OpStore %52 %336 
                                Private f32* %338 = OpAccessChain %20 %221 
                                         f32 %339 = OpLoad %338 
                                Private f32* %340 = OpAccessChain %52 %101 
                                         f32 %341 = OpLoad %340 
                                        bool %342 = OpFOrdGreaterThanEqual %339 %341 
                                                      OpStore %337 %342 
                                        bool %345 = OpLoad %337 
                                                      OpSelectionMerge %347 None 
                                                      OpBranchConditional %345 %346 %348 
                                             %346 = OpLabel 
                                                      OpStore %344 %105 
                                                      OpBranch %347 
                                             %348 = OpLabel 
                                                      OpStore %344 %232 
                                                      OpBranch %347 
                                             %347 = OpLabel 
                                         f32 %349 = OpLoad %344 
                                                      OpStore %343 %349 
                                       f32_4 %350 = OpLoad %52 
                                       f32_3 %351 = OpVectorShuffle %350 %350 0 1 3 
                                       f32_4 %352 = OpLoad %20 
                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
                                                      OpStore %20 %353 
                                       f32_4 %354 = OpLoad %20 
                                       f32_3 %355 = OpVectorShuffle %354 %354 3 1 0 
                                       f32_4 %356 = OpLoad %52 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 2 6 
                                                      OpStore %52 %357 
                                       f32_4 %358 = OpLoad %20 
                                       f32_4 %359 = OpFNegate %358 
                                       f32_4 %360 = OpLoad %52 
                                       f32_4 %361 = OpFAdd %359 %360 
                                                      OpStore %52 %361 
                                         f32 %362 = OpLoad %343 
                                       f32_4 %363 = OpCompositeConstruct %362 %362 %362 %362 
                                       f32_4 %364 = OpLoad %52 
                                       f32_4 %365 = OpFMul %363 %364 
                                       f32_4 %366 = OpLoad %20 
                                       f32_4 %367 = OpFAdd %365 %366 
                                                      OpStore %20 %367 
                                Private f32* %368 = OpAccessChain %20 %116 
                                         f32 %369 = OpLoad %368 
                                Private f32* %370 = OpAccessChain %20 %221 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpExtInst %1 37 %369 %371 
                                Private f32* %373 = OpAccessChain %52 %101 
                                                      OpStore %373 %372 
                                Private f32* %374 = OpAccessChain %20 %101 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %52 %101 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFNegate %377 
                                         f32 %379 = OpFAdd %375 %378 
                                Private f32* %380 = OpAccessChain %52 %101 
                                                      OpStore %380 %379 
                                Private f32* %382 = OpAccessChain %20 %116 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                Private f32* %385 = OpAccessChain %20 %221 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                Private f32* %388 = OpAccessChain %381 %101 
                                                      OpStore %388 %387 
                                Private f32* %389 = OpAccessChain %52 %101 
                                         f32 %390 = OpLoad %389 
                                         f32 %392 = OpFMul %390 %391 
                                         f32 %394 = OpFAdd %392 %393 
                                                      OpStore %189 %394 
                                Private f32* %395 = OpAccessChain %381 %101 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpLoad %189 
                                         f32 %398 = OpFDiv %396 %397 
                                Private f32* %399 = OpAccessChain %381 %101 
                                                      OpStore %399 %398 
                                Private f32* %400 = OpAccessChain %381 %101 
                                         f32 %401 = OpLoad %400 
                                Private f32* %402 = OpAccessChain %20 %197 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                Private f32* %405 = OpAccessChain %381 %101 
                                                      OpStore %405 %404 
                                Private f32* %407 = OpAccessChain %20 %101 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFAdd %408 %393 
                                                      OpStore %406 %409 
                                Private f32* %410 = OpAccessChain %52 %101 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpLoad %406 
                                         f32 %413 = OpFDiv %411 %412 
                                                      OpStore %406 %413 
                                Private f32* %414 = OpAccessChain %9 %116 
                                         f32 %415 = OpLoad %414 
                                Private f32* %416 = OpAccessChain %9 %197 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdGreaterThanEqual %415 %417 
                                                      OpStore %100 %418 
                                        bool %420 = OpLoad %100 
                                                      OpSelectionMerge %422 None 
                                                      OpBranchConditional %420 %421 %423 
                                             %421 = OpLabel 
                                                      OpStore %419 %105 
                                                      OpBranch %422 
                                             %423 = OpLabel 
                                                      OpStore %419 %232 
                                                      OpBranch %422 
                                             %422 = OpLabel 
                                         f32 %424 = OpLoad %419 
                                                      OpStore %189 %424 
                                Private f32* %425 = OpAccessChain %9 %197 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpFNegate %426 
                                Private f32* %428 = OpAccessChain %9 %116 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %52 %101 
                                                      OpStore %431 %430 
                                         f32 %432 = OpLoad %189 
                                Private f32* %433 = OpAccessChain %52 %101 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFMul %432 %434 
                                Private f32* %436 = OpAccessChain %9 %197 
                                         f32 %437 = OpLoad %436 
                                         f32 %438 = OpFAdd %435 %437 
                                                      OpStore %189 %438 
                                Private f32* %439 = OpAccessChain %9 %101 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpLoad %189 
                                        bool %442 = OpFOrdGreaterThanEqual %440 %441 
                                                      OpStore %298 %442 
                                        bool %444 = OpLoad %298 
                                                      OpSelectionMerge %446 None 
                                                      OpBranchConditional %444 %445 %447 
                                             %445 = OpLabel 
                                                      OpStore %443 %105 
                                                      OpBranch %446 
                                             %447 = OpLabel 
                                                      OpStore %443 %232 
                                                      OpBranch %446 
                                             %446 = OpLabel 
                                         f32 %448 = OpLoad %443 
                                Private f32* %449 = OpAccessChain %52 %101 
                                                      OpStore %449 %448 
                                Private f32* %451 = OpAccessChain %9 %101 
                                         f32 %452 = OpLoad %451 
                                         f32 %453 = OpLoad %189 
                                         f32 %454 = OpFNegate %453 
                                         f32 %455 = OpFAdd %452 %454 
                                                      OpStore %450 %455 
                                Private f32* %456 = OpAccessChain %52 %101 
                                         f32 %457 = OpLoad %456 
                                         f32 %458 = OpLoad %450 
                                         f32 %459 = OpFMul %457 %458 
                                         f32 %460 = OpLoad %189 
                                         f32 %461 = OpFAdd %459 %460 
                                                      OpStore %189 %461 
                                         f32 %462 = OpLoad %189 
                                Uniform f32* %464 = OpAccessChain %31 %463 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFMul %462 %465 
                                                      OpStore %189 %466 
                                         f32 %467 = OpLoad %189 
                                Private f32* %468 = OpAccessChain %20 %101 
                                         f32 %469 = OpLoad %468 
                                         f32 %470 = OpExtInst %1 37 %467 %469 
                                Private f32* %471 = OpAccessChain %20 %101 
                                                      OpStore %471 %470 
                                       f32_3 %472 = OpLoad %381 
                                       f32_3 %473 = OpVectorShuffle %472 %472 0 0 0 
                                       f32_3 %474 = OpExtInst %1 4 %473 
                                       f32_3 %477 = OpFAdd %474 %476 
                                       f32_4 %478 = OpLoad %52 
                                       f32_4 %479 = OpVectorShuffle %478 %477 4 5 6 3 
                                                      OpStore %52 %479 
                                       f32_4 %480 = OpLoad %52 
                                       f32_3 %481 = OpVectorShuffle %480 %480 0 1 2 
                                       f32_3 %482 = OpExtInst %1 10 %481 
                                       f32_4 %483 = OpLoad %52 
                                       f32_4 %484 = OpVectorShuffle %483 %482 4 5 6 3 
                                                      OpStore %52 %484 
                                       f32_4 %485 = OpLoad %52 
                                       f32_3 %486 = OpVectorShuffle %485 %485 0 1 2 
                                       f32_3 %488 = OpFMul %486 %487 
                                       f32_3 %491 = OpFAdd %488 %490 
                                       f32_4 %492 = OpLoad %52 
                                       f32_4 %493 = OpVectorShuffle %492 %491 4 5 6 3 
                                                      OpStore %52 %493 
                                       f32_4 %494 = OpLoad %52 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpExtInst %1 4 %495 
                                       f32_3 %498 = OpFAdd %496 %497 
                                       f32_4 %499 = OpLoad %52 
                                       f32_4 %500 = OpVectorShuffle %499 %498 4 5 6 3 
                                                      OpStore %52 %500 
                                       f32_4 %501 = OpLoad %52 
                                       f32_3 %502 = OpVectorShuffle %501 %501 0 1 2 
                                       f32_3 %503 = OpCompositeConstruct %232 %232 %232 
                                       f32_3 %504 = OpCompositeConstruct %105 %105 %105 
                                       f32_3 %505 = OpExtInst %1 43 %502 %503 %504 
                                       f32_4 %506 = OpLoad %52 
                                       f32_4 %507 = OpVectorShuffle %506 %505 4 5 6 3 
                                                      OpStore %52 %507 
                                       f32_4 %508 = OpLoad %52 
                                       f32_3 %509 = OpVectorShuffle %508 %508 0 1 2 
                                       f32_3 %510 = OpFAdd %509 %497 
                                       f32_4 %511 = OpLoad %52 
                                       f32_4 %512 = OpVectorShuffle %511 %510 4 5 6 3 
                                                      OpStore %52 %512 
                                         f32 %513 = OpLoad %406 
                                       f32_3 %514 = OpCompositeConstruct %513 %513 %513 
                                       f32_4 %515 = OpLoad %52 
                                       f32_3 %516 = OpVectorShuffle %515 %515 0 1 2 
                                       f32_3 %517 = OpFMul %514 %516 
                                       f32_3 %519 = OpFAdd %517 %518 
                                                      OpStore %381 %519 
                                       f32_3 %520 = OpLoad %381 
                                       f32_4 %521 = OpLoad %20 
                                       f32_3 %522 = OpVectorShuffle %521 %521 0 0 0 
                                       f32_3 %523 = OpFMul %520 %522 
                                       f32_4 %524 = OpLoad %9 
                                       f32_4 %525 = OpVectorShuffle %524 %523 4 5 6 3 
                                                      OpStore %9 %525 
                                       f32_4 %528 = OpLoad %9 
                                                      OpStore %527 %528 
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
uniform 	float _MaxValue;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat16_5;
float u_xlat6;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat12;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat1.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat2.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat2.xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb16 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb16){
        u_xlatb16 = unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat3.xyz;
        u_xlat3.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat3.xyz;
        u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb16)) ? u_xlat3.xyz : vs_TEXCOORD2.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat3.yzw = u_xlat3.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat16 = u_xlat3.y * 0.25 + 0.75;
        u_xlat12 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat3.x = max(u_xlat16, u_xlat12);
        u_xlat3 = texture(unity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    //ENDIF
    }
    u_xlat16 = dot(u_xlat3, unity_OcclusionMaskSelector);
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xy);
    u_xlat16 = u_xlat16 * u_xlat10_2.w;
    u_xlat1.xyz = u_xlat1.xyz * _LightColor0.xyz;
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * vec3(u_xlat16) + _OverrideColor.xyz;
    u_xlat1.xyw = _OverrideColor.www * u_xlat1.yzx + u_xlat2.yzx;
    u_xlatb2 = u_xlat1.x>=u_xlat1.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = u_xlat2.xxxx * u_xlat4 + u_xlat3;
    u_xlatb3 = u_xlat1.w>=u_xlat2.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = u_xlat3.xxxx * u_xlat2 + u_xlat1;
    u_xlat2.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat2.x = u_xlat1.x + (-u_xlat2.x);
    u_xlat6 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat16 = u_xlat2.x * 6.0 + 1.00000001e-010;
    u_xlat6 = u_xlat6 / u_xlat16;
    u_xlat6 = u_xlat6 + u_xlat1.z;
    u_xlat11 = u_xlat1.x + 1.00000001e-010;
    u_xlat11 = u_xlat2.x / u_xlat11;
    u_xlatb16 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat16_5 = (-u_xlat10_0.z) + u_xlat10_0.y;
    u_xlat5 = u_xlat16 * u_xlat16_5 + u_xlat10_0.z;
    u_xlatb10 = u_xlat10_0.x>=u_xlat5;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0 = (-u_xlat5) + u_xlat10_0.x;
    u_xlat0 = u_xlat10 * u_xlat0 + u_xlat5;
    u_xlat0 = u_xlat0 * _MaxValue;
    u_xlat0 = min(u_xlat0, u_xlat1.x);
    u_xlat1.xyw = abs(vec3(u_xlat6)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyw = fract(u_xlat1.xyw);
    u_xlat1.xyw = u_xlat1.xyw * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyw = abs(u_xlat1.xyw) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
    u_xlat1.xyw = u_xlat1.xyw + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat11) * u_xlat1.xyw + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = vec3(u_xlat0) * u_xlat1.xyz;
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
; Bound: 511
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %54 %508 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpMemberDecorate %29 5 RelaxedPrecision 
                                                      OpMemberDecorate %29 5 Offset 29 
                                                      OpMemberDecorate %29 6 Offset 29 
                                                      OpMemberDecorate %29 7 Offset 29 
                                                      OpMemberDecorate %29 8 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %54 Location 54 
                                                      OpDecorate %113 SpecId 113 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 DescriptorSet 235 
                                                      OpDecorate %235 Binding 235 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %508 RelaxedPrecision 
                                                      OpDecorate %508 Location 508 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 4 
                                              %27 = OpTypeArray %7 %26 
                                              %28 = OpTypeArray %7 %26 
                                              %29 = OpTypeStruct %7 %7 %27 %21 %21 %7 %28 %6 %7 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4; f32_4[4]; f32; f32_4;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 8 
                                              %34 = OpTypePointer Uniform %7 
                               Private f32_4* %52 = OpVariable Private 
                                              %53 = OpTypePointer Input %21 
                                 Input f32_3* %54 = OpVariable Input 
                                          i32 %57 = OpConstant 6 
                                          i32 %58 = OpConstant 1 
                                          i32 %65 = OpConstant 0 
                                          i32 %77 = OpConstant 2 
                                          i32 %91 = OpConstant 3 
                                              %98 = OpTypeBool 
                                              %99 = OpTypePointer Private %98 
                               Private bool* %100 = OpVariable Private 
                                         u32 %101 = OpConstant 0 
                                             %102 = OpTypePointer Uniform %6 
                                         f32 %105 = OpConstant 3.67402E-40 
                                        bool %107 = OpConstantFalse 
                                        bool %113 = OpSpecConstantFalse 
                                         u32 %116 = OpConstant 1 
                              Private f32_4* %120 = OpVariable Private 
                                             %159 = OpTypePointer Function %21 
                                         i32 %173 = OpConstant 4 
                                             %174 = OpTypePointer Uniform %21 
                                             %188 = OpTypePointer Private %6 
                                Private f32* %189 = OpVariable Private 
                                         f32 %192 = OpConstant 3.67402E-40 
                                         f32 %194 = OpConstant 3.67402E-40 
                                Private f32* %196 = OpVariable Private 
                                         u32 %197 = OpConstant 2 
                                         f32 %200 = OpConstant 3.67402E-40 
                                             %207 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %208 = OpTypeSampledImage %207 
                                             %209 = OpTypePointer UniformConstant %208 
 UniformConstant read_only Texture3DSampled* %210 = OpVariable UniformConstant 
                              Private f32_4* %215 = OpVariable Private 
                                         u32 %221 = OpConstant 3 
                                             %223 = OpTypePointer Private %21 
                              Private f32_3* %224 = OpVariable Private 
                                         f32 %232 = OpConstant 3.67402E-40 
 UniformConstant read_only Texture2DSampled* %235 = OpVariable UniformConstant 
                                         i32 %247 = OpConstant 5 
                              Private f32_3* %252 = OpVariable Private 
                               Private bool* %279 = OpVariable Private 
                                             %285 = OpTypePointer Function %6 
                                         f32 %297 = OpConstant 3.67402E-40 
                                         f32 %299 = OpConstant 3.67402E-40 
                              Private f32_4* %301 = OpVariable Private 
                               Private bool* %318 = OpVariable Private 
                                Private f32* %324 = OpVariable Private 
                              Private f32_3* %362 = OpVariable Private 
                                         f32 %372 = OpConstant 3.67402E-40 
                                         f32 %374 = OpConstant 3.67402E-40 
                                Private f32* %387 = OpVariable Private 
                                Private f32* %431 = OpVariable Private 
                                         i32 %444 = OpConstant 7 
                                         f32 %456 = OpConstant 3.67402E-40 
                                       f32_3 %457 = OpConstantComposite %105 %299 %456 
                                       f32_3 %468 = OpConstantComposite %372 %372 %372 
                                         f32 %470 = OpConstant 3.67402E-40 
                                       f32_3 %471 = OpConstantComposite %470 %470 %470 
                                       f32_3 %478 = OpConstantComposite %297 %297 %297 
                                       f32_3 %499 = OpConstantComposite %105 %105 %105 
                                             %507 = OpTypePointer Output %7 
                               Output f32_4* %508 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %160 = OpVariable Function 
                               Function f32* %286 = OpVariable Function 
                               Function f32* %325 = OpVariable Function 
                               Function f32* %400 = OpVariable Function 
                               Function f32* %424 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 1 2 
                                        f32_3 %24 = OpFNegate %23 
                               Uniform f32_4* %35 = OpAccessChain %31 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFAdd %24 %37 
                                        f32_4 %39 = OpLoad %20 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %20 %40 
                               Uniform f32_4* %41 = OpAccessChain %31 %33 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 3 3 3 
                                        f32_4 %44 = OpLoad %20 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                        f32_3 %46 = OpFMul %43 %45 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %46 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %20 %51 
                                        f32_3 %55 = OpLoad %54 
                                        f32_2 %56 = OpVectorShuffle %55 %55 1 1 
                               Uniform f32_4* %59 = OpAccessChain %31 %57 %58 
                                        f32_4 %60 = OpLoad %59 
                                        f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                        f32_2 %62 = OpFMul %56 %61 
                                        f32_4 %63 = OpLoad %52 
                                        f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                                      OpStore %52 %64 
                               Uniform f32_4* %66 = OpAccessChain %31 %57 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                        f32_3 %69 = OpLoad %54 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 0 
                                        f32_2 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %52 
                                        f32_2 %73 = OpVectorShuffle %72 %72 0 1 
                                        f32_2 %74 = OpFAdd %71 %73 
                                        f32_4 %75 = OpLoad %52 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 2 3 
                                                      OpStore %52 %76 
                               Uniform f32_4* %78 = OpAccessChain %31 %57 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                        f32_3 %81 = OpLoad %54 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 2 
                                        f32_2 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %52 
                                        f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                        f32_2 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %52 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                                      OpStore %52 %88 
                                        f32_4 %89 = OpLoad %52 
                                        f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                               Uniform f32_4* %92 = OpAccessChain %31 %57 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %95 = OpFAdd %90 %94 
                                        f32_4 %96 = OpLoad %52 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %52 %97 
                                Uniform f32* %103 = OpAccessChain %31 %58 %101 
                                         f32 %104 = OpLoad %103 
                                        bool %106 = OpFOrdEqual %104 %105 
                                                      OpStore %100 %106 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %109 
                                             %108 = OpLabel 
                                        bool %110 = OpLoad %100 
                                                      OpSelectionMerge %112 None 
                                                      OpBranchConditional %110 %111 %112 
                                             %111 = OpLabel 
                                                      OpBranch %112 
                                             %112 = OpLabel 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                                      OpSelectionMerge %115 None 
                                                      OpBranchConditional %113 %114 %217 
                                             %114 = OpLabel 
                                Uniform f32* %117 = OpAccessChain %31 %58 %116 
                                         f32 %118 = OpLoad %117 
                                        bool %119 = OpFOrdEqual %118 %105 
                                                      OpStore %100 %119 
                                       f32_3 %121 = OpLoad %54 
                                       f32_3 %122 = OpVectorShuffle %121 %121 1 1 1 
                              Uniform f32_4* %123 = OpAccessChain %31 %77 %58 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_3 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %120 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 6 3 
                                                      OpStore %120 %128 
                              Uniform f32_4* %129 = OpAccessChain %31 %77 %65 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpLoad %54 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 0 0 
                                       f32_3 %134 = OpFMul %131 %133 
                                       f32_4 %135 = OpLoad %120 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_3 %137 = OpFAdd %134 %136 
                                       f32_4 %138 = OpLoad %120 
                                       f32_4 %139 = OpVectorShuffle %138 %137 4 5 6 3 
                                                      OpStore %120 %139 
                              Uniform f32_4* %140 = OpAccessChain %31 %77 %77 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                       f32_3 %143 = OpLoad %54 
                                       f32_3 %144 = OpVectorShuffle %143 %143 2 2 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %120 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %145 %147 
                                       f32_4 %149 = OpLoad %120 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %120 %150 
                                       f32_4 %151 = OpLoad %120 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                              Uniform f32_4* %153 = OpAccessChain %31 %77 %91 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                       f32_3 %156 = OpFAdd %152 %155 
                                       f32_4 %157 = OpLoad %120 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                      OpStore %120 %158 
                                        bool %161 = OpLoad %100 
                                                      OpSelectionMerge %163 None 
                                                      OpBranchConditional %161 %162 %166 
                                             %162 = OpLabel 
                                       f32_4 %164 = OpLoad %120 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                                      OpStore %160 %165 
                                                      OpBranch %163 
                                             %166 = OpLabel 
                                       f32_3 %167 = OpLoad %54 
                                                      OpStore %160 %167 
                                                      OpBranch %163 
                                             %163 = OpLabel 
                                       f32_3 %168 = OpLoad %160 
                                       f32_4 %169 = OpLoad %120 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %120 %170 
                                       f32_4 %171 = OpLoad %120 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_3* %175 = OpAccessChain %31 %173 
                                       f32_3 %176 = OpLoad %175 
                                       f32_3 %177 = OpFNegate %176 
                                       f32_3 %178 = OpFAdd %172 %177 
                                       f32_4 %179 = OpLoad %120 
                                       f32_4 %180 = OpVectorShuffle %179 %178 4 5 6 3 
                                                      OpStore %120 %180 
                                       f32_4 %181 = OpLoad %120 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                              Uniform f32_3* %183 = OpAccessChain %31 %91 
                                       f32_3 %184 = OpLoad %183 
                                       f32_3 %185 = OpFMul %182 %184 
                                       f32_4 %186 = OpLoad %120 
                                       f32_4 %187 = OpVectorShuffle %186 %185 0 4 5 6 
                                                      OpStore %120 %187 
                                Private f32* %190 = OpAccessChain %120 %116 
                                         f32 %191 = OpLoad %190 
                                         f32 %193 = OpFMul %191 %192 
                                         f32 %195 = OpFAdd %193 %194 
                                                      OpStore %189 %195 
                                Uniform f32* %198 = OpAccessChain %31 %58 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpFMul %199 %200 
                                         f32 %202 = OpFAdd %201 %194 
                                                      OpStore %196 %202 
                                         f32 %203 = OpLoad %189 
                                         f32 %204 = OpLoad %196 
                                         f32 %205 = OpExtInst %1 40 %203 %204 
                                Private f32* %206 = OpAccessChain %120 %101 
                                                      OpStore %206 %205 
                  read_only Texture3DSampled %211 = OpLoad %210 
                                       f32_4 %212 = OpLoad %120 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 2 3 
                                       f32_4 %214 = OpImageSampleImplicitLod %211 %213 
                                                      OpStore %120 %214 
                                       f32_4 %216 = OpLoad %120 
                                                      OpStore %215 %216 
                                                      OpBranch %115 
                                             %217 = OpLabel 
                                Private f32* %218 = OpAccessChain %215 %101 
                                                      OpStore %218 %105 
                                Private f32* %219 = OpAccessChain %215 %116 
                                                      OpStore %219 %105 
                                Private f32* %220 = OpAccessChain %215 %197 
                                                      OpStore %220 %105 
                                Private f32* %222 = OpAccessChain %215 %221 
                                                      OpStore %222 %105 
                                                      OpBranch %115 
                                             %115 = OpLabel 
                                       f32_4 %225 = OpLoad %215 
                              Uniform f32_4* %226 = OpAccessChain %31 %65 
                                       f32_4 %227 = OpLoad %226 
                                         f32 %228 = OpDot %225 %227 
                                Private f32* %229 = OpAccessChain %224 %101 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %224 %101 
                                         f32 %231 = OpLoad %230 
                                         f32 %233 = OpExtInst %1 43 %231 %232 %105 
                                Private f32* %234 = OpAccessChain %224 %101 
                                                      OpStore %234 %233 
                  read_only Texture2DSampled %236 = OpLoad %235 
                                       f32_4 %237 = OpLoad %52 
                                       f32_2 %238 = OpVectorShuffle %237 %237 0 1 
                                       f32_4 %239 = OpImageSampleImplicitLod %236 %238 
                                         f32 %240 = OpCompositeExtract %239 3 
                                                      OpStore %189 %240 
                                Private f32* %241 = OpAccessChain %224 %101 
                                         f32 %242 = OpLoad %241 
                                         f32 %243 = OpLoad %189 
                                         f32 %244 = OpFMul %242 %243 
                                                      OpStore %189 %244 
                                       f32_4 %245 = OpLoad %20 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                              Uniform f32_4* %248 = OpAccessChain %31 %247 
                                       f32_4 %249 = OpLoad %248 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpFMul %246 %250 
                                                      OpStore %224 %251 
                                         f32 %253 = OpLoad %189 
                                       f32_3 %254 = OpCompositeConstruct %253 %253 %253 
                                       f32_3 %255 = OpLoad %224 
                                       f32_3 %256 = OpFMul %254 %255 
                                                      OpStore %252 %256 
                                       f32_3 %257 = OpLoad %224 
                                       f32_3 %258 = OpFNegate %257 
                                         f32 %259 = OpLoad %189 
                                       f32_3 %260 = OpCompositeConstruct %259 %259 %259 
                                       f32_3 %261 = OpFMul %258 %260 
                              Uniform f32_4* %262 = OpAccessChain %31 %33 
                                       f32_4 %263 = OpLoad %262 
                                       f32_3 %264 = OpVectorShuffle %263 %263 0 1 2 
                                       f32_3 %265 = OpFAdd %261 %264 
                                       f32_4 %266 = OpLoad %20 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                      OpStore %20 %267 
                              Uniform f32_4* %268 = OpAccessChain %31 %33 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 3 3 3 
                                       f32_4 %271 = OpLoad %20 
                                       f32_3 %272 = OpVectorShuffle %271 %271 1 2 0 
                                       f32_3 %273 = OpFMul %270 %272 
                                       f32_3 %274 = OpLoad %252 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 2 0 
                                       f32_3 %276 = OpFAdd %273 %275 
                                       f32_4 %277 = OpLoad %20 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 2 6 
                                                      OpStore %20 %278 
                                Private f32* %280 = OpAccessChain %20 %101 
                                         f32 %281 = OpLoad %280 
                                Private f32* %282 = OpAccessChain %20 %116 
                                         f32 %283 = OpLoad %282 
                                        bool %284 = OpFOrdGreaterThanEqual %281 %283 
                                                      OpStore %279 %284 
                                        bool %287 = OpLoad %279 
                                                      OpSelectionMerge %289 None 
                                                      OpBranchConditional %287 %288 %290 
                                             %288 = OpLabel 
                                                      OpStore %286 %105 
                                                      OpBranch %289 
                                             %290 = OpLabel 
                                                      OpStore %286 %232 
                                                      OpBranch %289 
                                             %289 = OpLabel 
                                         f32 %291 = OpLoad %286 
                                Private f32* %292 = OpAccessChain %52 %101 
                                                      OpStore %292 %291 
                                       f32_4 %293 = OpLoad %20 
                                       f32_2 %294 = OpVectorShuffle %293 %293 1 0 
                                       f32_4 %295 = OpLoad %120 
                                       f32_4 %296 = OpVectorShuffle %295 %294 4 5 2 3 
                                                      OpStore %120 %296 
                                Private f32* %298 = OpAccessChain %120 %197 
                                                      OpStore %298 %297 
                                Private f32* %300 = OpAccessChain %120 %221 
                                                      OpStore %300 %299 
                                       f32_4 %302 = OpLoad %20 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_4 %304 = OpLoad %120 
                                       f32_2 %305 = OpVectorShuffle %304 %304 0 1 
                                       f32_2 %306 = OpFNegate %305 
                                       f32_2 %307 = OpFAdd %303 %306 
                                       f32_4 %308 = OpLoad %301 
                                       f32_4 %309 = OpVectorShuffle %308 %307 4 5 2 3 
                                                      OpStore %301 %309 
                                Private f32* %310 = OpAccessChain %301 %197 
                                                      OpStore %310 %105 
                                Private f32* %311 = OpAccessChain %301 %221 
                                                      OpStore %311 %297 
                                       f32_4 %312 = OpLoad %52 
                                       f32_4 %313 = OpVectorShuffle %312 %312 0 0 0 0 
                                       f32_4 %314 = OpLoad %301 
                                       f32_4 %315 = OpFMul %313 %314 
                                       f32_4 %316 = OpLoad %120 
                                       f32_4 %317 = OpFAdd %315 %316 
                                                      OpStore %52 %317 
                                Private f32* %319 = OpAccessChain %20 %221 
                                         f32 %320 = OpLoad %319 
                                Private f32* %321 = OpAccessChain %52 %101 
                                         f32 %322 = OpLoad %321 
                                        bool %323 = OpFOrdGreaterThanEqual %320 %322 
                                                      OpStore %318 %323 
                                        bool %326 = OpLoad %318 
                                                      OpSelectionMerge %328 None 
                                                      OpBranchConditional %326 %327 %329 
                                             %327 = OpLabel 
                                                      OpStore %325 %105 
                                                      OpBranch %328 
                                             %329 = OpLabel 
                                                      OpStore %325 %232 
                                                      OpBranch %328 
                                             %328 = OpLabel 
                                         f32 %330 = OpLoad %325 
                                                      OpStore %324 %330 
                                       f32_4 %331 = OpLoad %52 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 3 
                                       f32_4 %333 = OpLoad %20 
                                       f32_4 %334 = OpVectorShuffle %333 %332 4 5 6 3 
                                                      OpStore %20 %334 
                                       f32_4 %335 = OpLoad %20 
                                       f32_3 %336 = OpVectorShuffle %335 %335 3 1 0 
                                       f32_4 %337 = OpLoad %52 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 2 6 
                                                      OpStore %52 %338 
                                       f32_4 %339 = OpLoad %20 
                                       f32_4 %340 = OpFNegate %339 
                                       f32_4 %341 = OpLoad %52 
                                       f32_4 %342 = OpFAdd %340 %341 
                                                      OpStore %52 %342 
                                         f32 %343 = OpLoad %324 
                                       f32_4 %344 = OpCompositeConstruct %343 %343 %343 %343 
                                       f32_4 %345 = OpLoad %52 
                                       f32_4 %346 = OpFMul %344 %345 
                                       f32_4 %347 = OpLoad %20 
                                       f32_4 %348 = OpFAdd %346 %347 
                                                      OpStore %20 %348 
                                Private f32* %349 = OpAccessChain %20 %116 
                                         f32 %350 = OpLoad %349 
                                Private f32* %351 = OpAccessChain %20 %221 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpExtInst %1 37 %350 %352 
                                Private f32* %354 = OpAccessChain %52 %101 
                                                      OpStore %354 %353 
                                Private f32* %355 = OpAccessChain %20 %101 
                                         f32 %356 = OpLoad %355 
                                Private f32* %357 = OpAccessChain %52 %101 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFNegate %358 
                                         f32 %360 = OpFAdd %356 %359 
                                Private f32* %361 = OpAccessChain %52 %101 
                                                      OpStore %361 %360 
                                Private f32* %363 = OpAccessChain %20 %116 
                                         f32 %364 = OpLoad %363 
                                         f32 %365 = OpFNegate %364 
                                Private f32* %366 = OpAccessChain %20 %221 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                Private f32* %369 = OpAccessChain %362 %101 
                                                      OpStore %369 %368 
                                Private f32* %370 = OpAccessChain %52 %101 
                                         f32 %371 = OpLoad %370 
                                         f32 %373 = OpFMul %371 %372 
                                         f32 %375 = OpFAdd %373 %374 
                                                      OpStore %189 %375 
                                Private f32* %376 = OpAccessChain %362 %101 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpLoad %189 
                                         f32 %379 = OpFDiv %377 %378 
                                Private f32* %380 = OpAccessChain %362 %101 
                                                      OpStore %380 %379 
                                Private f32* %381 = OpAccessChain %362 %101 
                                         f32 %382 = OpLoad %381 
                                Private f32* %383 = OpAccessChain %20 %197 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFAdd %382 %384 
                                Private f32* %386 = OpAccessChain %362 %101 
                                                      OpStore %386 %385 
                                Private f32* %388 = OpAccessChain %20 %101 
                                         f32 %389 = OpLoad %388 
                                         f32 %390 = OpFAdd %389 %374 
                                                      OpStore %387 %390 
                                Private f32* %391 = OpAccessChain %52 %101 
                                         f32 %392 = OpLoad %391 
                                         f32 %393 = OpLoad %387 
                                         f32 %394 = OpFDiv %392 %393 
                                                      OpStore %387 %394 
                                Private f32* %395 = OpAccessChain %9 %116 
                                         f32 %396 = OpLoad %395 
                                Private f32* %397 = OpAccessChain %9 %197 
                                         f32 %398 = OpLoad %397 
                                        bool %399 = OpFOrdGreaterThanEqual %396 %398 
                                                      OpStore %100 %399 
                                        bool %401 = OpLoad %100 
                                                      OpSelectionMerge %403 None 
                                                      OpBranchConditional %401 %402 %404 
                                             %402 = OpLabel 
                                                      OpStore %400 %105 
                                                      OpBranch %403 
                                             %404 = OpLabel 
                                                      OpStore %400 %232 
                                                      OpBranch %403 
                                             %403 = OpLabel 
                                         f32 %405 = OpLoad %400 
                                                      OpStore %189 %405 
                                Private f32* %406 = OpAccessChain %9 %197 
                                         f32 %407 = OpLoad %406 
                                         f32 %408 = OpFNegate %407 
                                Private f32* %409 = OpAccessChain %9 %116 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpFAdd %408 %410 
                                Private f32* %412 = OpAccessChain %52 %101 
                                                      OpStore %412 %411 
                                         f32 %413 = OpLoad %189 
                                Private f32* %414 = OpAccessChain %52 %101 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFMul %413 %415 
                                Private f32* %417 = OpAccessChain %9 %197 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFAdd %416 %418 
                                                      OpStore %189 %419 
                                Private f32* %420 = OpAccessChain %9 %101 
                                         f32 %421 = OpLoad %420 
                                         f32 %422 = OpLoad %189 
                                        bool %423 = OpFOrdGreaterThanEqual %421 %422 
                                                      OpStore %279 %423 
                                        bool %425 = OpLoad %279 
                                                      OpSelectionMerge %427 None 
                                                      OpBranchConditional %425 %426 %428 
                                             %426 = OpLabel 
                                                      OpStore %424 %105 
                                                      OpBranch %427 
                                             %428 = OpLabel 
                                                      OpStore %424 %232 
                                                      OpBranch %427 
                                             %427 = OpLabel 
                                         f32 %429 = OpLoad %424 
                                Private f32* %430 = OpAccessChain %52 %101 
                                                      OpStore %430 %429 
                                Private f32* %432 = OpAccessChain %9 %101 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpLoad %189 
                                         f32 %435 = OpFNegate %434 
                                         f32 %436 = OpFAdd %433 %435 
                                                      OpStore %431 %436 
                                Private f32* %437 = OpAccessChain %52 %101 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpLoad %431 
                                         f32 %440 = OpFMul %438 %439 
                                         f32 %441 = OpLoad %189 
                                         f32 %442 = OpFAdd %440 %441 
                                                      OpStore %189 %442 
                                         f32 %443 = OpLoad %189 
                                Uniform f32* %445 = OpAccessChain %31 %444 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFMul %443 %446 
                                                      OpStore %189 %447 
                                         f32 %448 = OpLoad %189 
                                Private f32* %449 = OpAccessChain %20 %101 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpExtInst %1 37 %448 %450 
                                Private f32* %452 = OpAccessChain %20 %101 
                                                      OpStore %452 %451 
                                       f32_3 %453 = OpLoad %362 
                                       f32_3 %454 = OpVectorShuffle %453 %453 0 0 0 
                                       f32_3 %455 = OpExtInst %1 4 %454 
                                       f32_3 %458 = OpFAdd %455 %457 
                                       f32_4 %459 = OpLoad %52 
                                       f32_4 %460 = OpVectorShuffle %459 %458 4 5 6 3 
                                                      OpStore %52 %460 
                                       f32_4 %461 = OpLoad %52 
                                       f32_3 %462 = OpVectorShuffle %461 %461 0 1 2 
                                       f32_3 %463 = OpExtInst %1 10 %462 
                                       f32_4 %464 = OpLoad %52 
                                       f32_4 %465 = OpVectorShuffle %464 %463 4 5 6 3 
                                                      OpStore %52 %465 
                                       f32_4 %466 = OpLoad %52 
                                       f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
                                       f32_3 %469 = OpFMul %467 %468 
                                       f32_3 %472 = OpFAdd %469 %471 
                                       f32_4 %473 = OpLoad %52 
                                       f32_4 %474 = OpVectorShuffle %473 %472 4 5 6 3 
                                                      OpStore %52 %474 
                                       f32_4 %475 = OpLoad %52 
                                       f32_3 %476 = OpVectorShuffle %475 %475 0 1 2 
                                       f32_3 %477 = OpExtInst %1 4 %476 
                                       f32_3 %479 = OpFAdd %477 %478 
                                       f32_4 %480 = OpLoad %52 
                                       f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
                                                      OpStore %52 %481 
                                       f32_4 %482 = OpLoad %52 
                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                       f32_3 %484 = OpCompositeConstruct %232 %232 %232 
                                       f32_3 %485 = OpCompositeConstruct %105 %105 %105 
                                       f32_3 %486 = OpExtInst %1 43 %483 %484 %485 
                                       f32_4 %487 = OpLoad %52 
                                       f32_4 %488 = OpVectorShuffle %487 %486 4 5 6 3 
                                                      OpStore %52 %488 
                                       f32_4 %489 = OpLoad %52 
                                       f32_3 %490 = OpVectorShuffle %489 %489 0 1 2 
                                       f32_3 %491 = OpFAdd %490 %478 
                                       f32_4 %492 = OpLoad %52 
                                       f32_4 %493 = OpVectorShuffle %492 %491 4 5 6 3 
                                                      OpStore %52 %493 
                                         f32 %494 = OpLoad %387 
                                       f32_3 %495 = OpCompositeConstruct %494 %494 %494 
                                       f32_4 %496 = OpLoad %52 
                                       f32_3 %497 = OpVectorShuffle %496 %496 0 1 2 
                                       f32_3 %498 = OpFMul %495 %497 
                                       f32_3 %500 = OpFAdd %498 %499 
                                                      OpStore %362 %500 
                                       f32_3 %501 = OpLoad %362 
                                       f32_4 %502 = OpLoad %20 
                                       f32_3 %503 = OpVectorShuffle %502 %502 0 0 0 
                                       f32_3 %504 = OpFMul %501 %503 
                                       f32_4 %505 = OpLoad %9 
                                       f32_4 %506 = OpVectorShuffle %505 %504 4 5 6 3 
                                                      OpStore %9 %506 
                                       f32_4 %509 = OpLoad %9 
                                                      OpStore %508 %509 
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
  GpuProgramID 161967
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

uniform 	vec4 _OverrideColor;
uniform 	bvec4 unity_MetaFragmentControl;
uniform 	float unity_OneOverOutputBoost;
uniform 	float unity_MaxOutputValue;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat6 = unity_OneOverOutputBoost;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat6);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(vec3(unity_MaxOutputValue, unity_MaxOutputValue, unity_MaxOutputValue)));
    u_xlat0.w = 1.0;
    u_xlat0 = (unity_MetaFragmentControl.x) ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    SV_Target0 = (unity_MetaFragmentControl.y) ? vec4(0.0, 0.0, 0.0, 1.0) : u_xlat0;
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
; Bound: 125
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %111 
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
                                                    OpMemberDecorate %27 0 Offset 27 
                                                    OpMemberDecorate %27 1 Offset 27 
                                                    OpMemberDecorate %27 2 Offset 27 
                                                    OpMemberDecorate %27 3 Offset 27 
                                                    OpDecorate %27 Block 
                                                    OpDecorate %29 DescriptorSet 29 
                                                    OpDecorate %29 Binding 29 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                                    OpDecorate %111 Location 111 
                                                    OpDecorate %122 RelaxedPrecision 
                                                    OpDecorate %123 RelaxedPrecision 
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
                             Private f32_3* %22 = OpVariable Private 
                                            %25 = OpTypeInt 32 0 
                                            %26 = OpTypeVector %25 4 
                                            %27 = OpTypeStruct %19 %26 %6 %6 
                                            %28 = OpTypePointer Uniform %27 
  Uniform struct {f32_4; u32_4; f32; f32;}* %29 = OpVariable Uniform 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                            %32 = OpTypePointer Uniform %19 
                             Private f32_3* %37 = OpVariable Private 
                                            %47 = OpTypePointer Private %6 
                               Private f32* %48 = OpVariable Private 
                                        i32 %49 = OpConstant 2 
                                            %50 = OpTypePointer Uniform %6 
                                        f32 %54 = OpConstant 3.67402E-40 
                                        f32 %55 = OpConstant 3.67402E-40 
                                        i32 %64 = OpConstant 3 
                                            %77 = OpTypePointer Private %19 
                             Private f32_4* %78 = OpVariable Private 
                                            %79 = OpTypePointer Function %7 
                                        i32 %81 = OpConstant 1 
                                            %82 = OpTypeBool 
                                            %83 = OpTypeVector %82 4 
                                            %84 = OpTypePointer Uniform %26 
                                        u32 %88 = OpConstant 0 
                                      f32_3 %94 = OpConstantComposite %54 %54 %54 
                                            %98 = OpTypePointer Function %6 
                                       u32 %108 = OpConstant 3 
                                           %110 = OpTypePointer Output %19 
                             Output f32_4* %111 = OpVariable Output 
                                           %112 = OpTypePointer Function %19 
                                     f32_4 %120 = OpConstantComposite %54 %54 %54 %55 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                            Function f32_3* %80 = OpVariable Function 
                              Function f32* %99 = OpVariable Function 
                           Function f32_4* %113 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %18 
                                      f32_3 %21 = OpVectorShuffle %20 %20 0 1 2 
                                                    OpStore %9 %21 
                                      f32_3 %23 = OpLoad %9 
                                      f32_3 %24 = OpFNegate %23 
                             Uniform f32_4* %33 = OpAccessChain %29 %31 
                                      f32_4 %34 = OpLoad %33 
                                      f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                      f32_3 %36 = OpFAdd %24 %35 
                                                    OpStore %22 %36 
                             Uniform f32_4* %38 = OpAccessChain %29 %31 
                                      f32_4 %39 = OpLoad %38 
                                      f32_3 %40 = OpVectorShuffle %39 %39 3 3 3 
                                      f32_3 %41 = OpLoad %22 
                                      f32_3 %42 = OpFMul %40 %41 
                                      f32_3 %43 = OpLoad %9 
                                      f32_3 %44 = OpFAdd %42 %43 
                                                    OpStore %37 %44 
                                      f32_3 %45 = OpLoad %37 
                                      f32_3 %46 = OpExtInst %1 30 %45 
                                                    OpStore %37 %46 
                               Uniform f32* %51 = OpAccessChain %29 %49 
                                        f32 %52 = OpLoad %51 
                                                    OpStore %48 %52 
                                        f32 %53 = OpLoad %48 
                                        f32 %56 = OpExtInst %1 43 %53 %54 %55 
                                                    OpStore %48 %56 
                                      f32_3 %57 = OpLoad %37 
                                        f32 %58 = OpLoad %48 
                                      f32_3 %59 = OpCompositeConstruct %58 %58 %58 
                                      f32_3 %60 = OpFMul %57 %59 
                                                    OpStore %37 %60 
                                      f32_3 %61 = OpLoad %37 
                                      f32_3 %62 = OpExtInst %1 29 %61 
                                                    OpStore %37 %62 
                                      f32_3 %63 = OpLoad %37 
                               Uniform f32* %65 = OpAccessChain %29 %64 
                                        f32 %66 = OpLoad %65 
                               Uniform f32* %67 = OpAccessChain %29 %64 
                                        f32 %68 = OpLoad %67 
                               Uniform f32* %69 = OpAccessChain %29 %64 
                                        f32 %70 = OpLoad %69 
                                      f32_3 %71 = OpCompositeConstruct %66 %68 %70 
                                        f32 %72 = OpCompositeExtract %71 0 
                                        f32 %73 = OpCompositeExtract %71 1 
                                        f32 %74 = OpCompositeExtract %71 2 
                                      f32_3 %75 = OpCompositeConstruct %72 %73 %74 
                                      f32_3 %76 = OpExtInst %1 37 %63 %75 
                                                    OpStore %37 %76 
                             Uniform u32_4* %85 = OpAccessChain %29 %81 
                                      u32_4 %86 = OpLoad %85 
                                        u32 %87 = OpCompositeExtract %86 0 
                                       bool %89 = OpINotEqual %87 %88 
                                                    OpSelectionMerge %91 None 
                                                    OpBranchConditional %89 %90 %93 
                                            %90 = OpLabel 
                                      f32_3 %92 = OpLoad %37 
                                                    OpStore %80 %92 
                                                    OpBranch %91 
                                            %93 = OpLabel 
                                                    OpStore %80 %94 
                                                    OpBranch %91 
                                            %91 = OpLabel 
                                      f32_3 %95 = OpLoad %80 
                                      f32_4 %96 = OpLoad %78 
                                      f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                    OpStore %78 %97 
                            Uniform u32_4* %100 = OpAccessChain %29 %81 
                                     u32_4 %101 = OpLoad %100 
                                       u32 %102 = OpCompositeExtract %101 0 
                                      bool %103 = OpINotEqual %102 %88 
                                                    OpSelectionMerge %105 None 
                                                    OpBranchConditional %103 %104 %106 
                                           %104 = OpLabel 
                                                    OpStore %99 %55 
                                                    OpBranch %105 
                                           %106 = OpLabel 
                                                    OpStore %99 %54 
                                                    OpBranch %105 
                                           %105 = OpLabel 
                                       f32 %107 = OpLoad %99 
                              Private f32* %109 = OpAccessChain %78 %108 
                                                    OpStore %109 %107 
                            Uniform u32_4* %114 = OpAccessChain %29 %81 
                                     u32_4 %115 = OpLoad %114 
                                       u32 %116 = OpCompositeExtract %115 1 
                                      bool %117 = OpINotEqual %116 %88 
                                                    OpSelectionMerge %119 None 
                                                    OpBranchConditional %117 %118 %121 
                                           %118 = OpLabel 
                                                    OpStore %113 %120 
                                                    OpBranch %119 
                                           %121 = OpLabel 
                                     f32_4 %122 = OpLoad %78 
                                                    OpStore %113 %122 
                                                    OpBranch %119 
                                           %119 = OpLabel 
                                     f32_4 %123 = OpLoad %113 
                                                    OpStore %111 %123 
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