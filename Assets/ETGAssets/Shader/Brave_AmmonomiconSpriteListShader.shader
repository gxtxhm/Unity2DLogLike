//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/AmmonomiconSpriteListShader" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_ValueMaximum ("Value Maximum", Float) = 1
_SpriteScale ("Sprite Scale", Float) = 1
_Saturation ("Saturation", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  GpuProgramID 18880
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
uniform 	float _SpriteScale;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat1.x = in_POSITION0.z + 0.25;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = vec4(vec4(_SpriteScale, _SpriteScale, _SpriteScale, _SpriteScale)) * vec4(0.0625, -0.0625, 0.0250000004, 0.0) + u_xlat0;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0.w + -0.100000001;
    SV_Target0.w = min(u_xlat10_0.w, 1.0);
    u_xlatb0 = u_xlat0<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.xyz = vec3(0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 129
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %107 %119 %120 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpMemberDecorate %105 0 BuiltIn 105 
                                                   OpMemberDecorate %105 1 BuiltIn 105 
                                                   OpMemberDecorate %105 2 BuiltIn 105 
                                                   OpDecorate %105 Block 
                                                   OpDecorate %119 Location 119 
                                                   OpDecorate %120 Location 120 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                            Private f32_4* %35 = OpVariable Private 
                                       u32 %36 = OpConstant 2 
                                           %37 = OpTypePointer Input %6 
                                       f32 %40 = OpConstant 3.67402E-40 
                                       u32 %42 = OpConstant 0 
                                           %43 = OpTypePointer Private %6 
                                       i32 %45 = OpConstant 2 
                                       i32 %53 = OpConstant 3 
                                           %61 = OpTypePointer Uniform %6 
                                       f32 %76 = OpConstant 3.67402E-40 
                                       f32 %77 = OpConstant 3.67402E-40 
                                       f32 %78 = OpConstant 3.67402E-40 
                                       f32 %79 = OpConstant 3.67402E-40 
                                     f32_4 %80 = OpConstantComposite %76 %77 %78 %79 
                                      u32 %103 = OpConstant 1 
                                          %104 = OpTypeArray %6 %103 
                                          %105 = OpTypeStruct %7 %6 %104 
                                          %106 = OpTypePointer Output %105 
     Output struct {f32_4; f32; f32[1];}* %107 = OpVariable Output 
                                          %115 = OpTypePointer Output %7 
                                          %117 = OpTypeVector %6 2 
                                          %118 = OpTypePointer Output %117 
                            Output f32_2* %119 = OpVariable Output 
                             Input f32_4* %120 = OpVariable Input 
                                          %123 = OpTypePointer Output %6 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                                     f32_4 %12 = OpLoad %11 
                                     f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                            Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                     f32_4 %26 = OpLoad %25 
                                     f32_4 %27 = OpFMul %13 %26 
                                                   OpStore %9 %27 
                            Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                     f32_4 %29 = OpLoad %28 
                                     f32_4 %30 = OpLoad %11 
                                     f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                     f32_4 %32 = OpFMul %29 %31 
                                     f32_4 %33 = OpLoad %9 
                                     f32_4 %34 = OpFAdd %32 %33 
                                                   OpStore %9 %34 
                                Input f32* %38 = OpAccessChain %11 %36 
                                       f32 %39 = OpLoad %38 
                                       f32 %41 = OpFAdd %39 %40 
                              Private f32* %44 = OpAccessChain %35 %42 
                                                   OpStore %44 %41 
                            Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                     f32_4 %47 = OpLoad %46 
                                     f32_4 %48 = OpLoad %35 
                                     f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
                                     f32_4 %50 = OpFMul %47 %49 
                                     f32_4 %51 = OpLoad %9 
                                     f32_4 %52 = OpFAdd %50 %51 
                                                   OpStore %9 %52 
                            Uniform f32_4* %54 = OpAccessChain %20 %22 %53 
                                     f32_4 %55 = OpLoad %54 
                                     f32_4 %56 = OpLoad %11 
                                     f32_4 %57 = OpVectorShuffle %56 %56 3 3 3 3 
                                     f32_4 %58 = OpFMul %55 %57 
                                     f32_4 %59 = OpLoad %9 
                                     f32_4 %60 = OpFAdd %58 %59 
                                                   OpStore %9 %60 
                              Uniform f32* %62 = OpAccessChain %20 %45 
                                       f32 %63 = OpLoad %62 
                              Uniform f32* %64 = OpAccessChain %20 %45 
                                       f32 %65 = OpLoad %64 
                              Uniform f32* %66 = OpAccessChain %20 %45 
                                       f32 %67 = OpLoad %66 
                              Uniform f32* %68 = OpAccessChain %20 %45 
                                       f32 %69 = OpLoad %68 
                                     f32_4 %70 = OpCompositeConstruct %63 %65 %67 %69 
                                       f32 %71 = OpCompositeExtract %70 0 
                                       f32 %72 = OpCompositeExtract %70 1 
                                       f32 %73 = OpCompositeExtract %70 2 
                                       f32 %74 = OpCompositeExtract %70 3 
                                     f32_4 %75 = OpCompositeConstruct %71 %72 %73 %74 
                                     f32_4 %81 = OpFMul %75 %80 
                                     f32_4 %82 = OpLoad %9 
                                     f32_4 %83 = OpFAdd %81 %82 
                                                   OpStore %9 %83 
                                     f32_4 %84 = OpLoad %9 
                                     f32_4 %85 = OpVectorShuffle %84 %84 1 1 1 1 
                            Uniform f32_4* %86 = OpAccessChain %20 %23 %23 
                                     f32_4 %87 = OpLoad %86 
                                     f32_4 %88 = OpFMul %85 %87 
                                                   OpStore %35 %88 
                            Uniform f32_4* %89 = OpAccessChain %20 %23 %22 
                                     f32_4 %90 = OpLoad %89 
                                     f32_4 %91 = OpLoad %9 
                                     f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                     f32_4 %93 = OpFMul %90 %92 
                                     f32_4 %94 = OpLoad %35 
                                     f32_4 %95 = OpFAdd %93 %94 
                                                   OpStore %35 %95 
                            Uniform f32_4* %96 = OpAccessChain %20 %23 %45 
                                     f32_4 %97 = OpLoad %96 
                                     f32_4 %98 = OpLoad %9 
                                     f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                    f32_4 %100 = OpFMul %97 %99 
                                    f32_4 %101 = OpLoad %35 
                                    f32_4 %102 = OpFAdd %100 %101 
                                                   OpStore %35 %102 
                           Uniform f32_4* %108 = OpAccessChain %20 %23 %53 
                                    f32_4 %109 = OpLoad %108 
                                    f32_4 %110 = OpLoad %9 
                                    f32_4 %111 = OpVectorShuffle %110 %110 3 3 3 3 
                                    f32_4 %112 = OpFMul %109 %111 
                                    f32_4 %113 = OpLoad %35 
                                    f32_4 %114 = OpFAdd %112 %113 
                            Output f32_4* %116 = OpAccessChain %107 %22 
                                                   OpStore %116 %114 
                                    f32_4 %121 = OpLoad %120 
                                    f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                                   OpStore %119 %122 
                              Output f32* %124 = OpAccessChain %107 %22 %103 
                                      f32 %125 = OpLoad %124 
                                      f32 %126 = OpFNegate %125 
                              Output f32* %127 = OpAccessChain %107 %22 %103 
                                                   OpStore %127 %126 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 61
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %58 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %8 RelaxedPrecision 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %58 Location 58 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                               Private f32* %23 = OpVariable Private 
                                        f32 %25 = OpConstant 3.67402E-40 
                                            %27 = OpTypePointer Private %18 
                             Private f32_4* %28 = OpVariable Private 
                                        f32 %30 = OpConstant 3.67402E-40 
                                            %33 = OpTypeBool 
                                            %34 = OpTypePointer Private %33 
                              Private bool* %35 = OpVariable Private 
                                        f32 %37 = OpConstant 3.67402E-40 
                                            %40 = OpTypeInt 32 1 
                                        i32 %41 = OpConstant 0 
                                        i32 %42 = OpConstant 1 
                                        i32 %44 = OpConstant -1 
                                        f32 %50 = OpConstant 3.67402E-40 
                                        u32 %51 = OpConstant 0 
                                        u32 %53 = OpConstant 1 
                                        u32 %55 = OpConstant 2 
                                            %57 = OpTypePointer Output %18 
                              Output f32_4* %58 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %24 = OpLoad %8 
                                        f32 %26 = OpFAdd %24 %25 
                                                    OpStore %23 %26 
                                        f32 %29 = OpLoad %8 
                                        f32 %31 = OpExtInst %1 37 %29 %30 
                               Private f32* %32 = OpAccessChain %28 %21 
                                                    OpStore %32 %31 
                                        f32 %36 = OpLoad %23 
                                       bool %38 = OpFOrdLessThan %36 %37 
                                                    OpStore %35 %38 
                                       bool %39 = OpLoad %35 
                                        i32 %43 = OpSelect %39 %42 %41 
                                        i32 %45 = OpIMul %43 %44 
                                       bool %46 = OpINotEqual %45 %41 
                                                    OpSelectionMerge %48 None 
                                                    OpBranchConditional %46 %47 %48 
                                            %47 = OpLabel 
                                                    OpKill
                                            %48 = OpLabel 
                               Private f32* %52 = OpAccessChain %28 %51 
                                                    OpStore %52 %50 
                               Private f32* %54 = OpAccessChain %28 %53 
                                                    OpStore %54 %50 
                               Private f32* %56 = OpAccessChain %28 %55 
                                                    OpStore %56 %50 
                                      f32_4 %59 = OpLoad %28 
                                                    OpStore %58 %59 
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
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 124951
Program "vp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform 	float _Saturation;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
float u_xlat6;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat6 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * 0.5 + 0.25;
    u_xlat0.xyz = (-vec3(u_xlat6)) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyz + vec3(u_xlat6);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %88 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %82 Location 82 
                                              OpDecorate %83 RelaxedPrecision 
                                              OpDecorate %83 Location 83 
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %88 Location 88 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                        Output f32_4* %82 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypeVector %6 2 
                                      %86 = OpTypePointer Output %85 
                        Output f32_2* %87 = OpVariable Output 
                         Input f32_4* %88 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_4 %84 = OpLoad %83 
                                              OpStore %82 %84 
                                f32_4 %89 = OpLoad %88 
                                f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                              OpStore %87 %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %72 %22 %68 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 128
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %29 %83 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %29 Location 29 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpMemberDecorate %62 0 RelaxedPrecision 
                                                    OpMemberDecorate %62 0 Offset 62 
                                                    OpMemberDecorate %62 1 Offset 62 
                                                    OpDecorate %62 Block 
                                                    OpDecorate %64 DescriptorSet 64 
                                                    OpDecorate %64 Binding 64 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %83 Location 83 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
                                                    OpDecorate %120 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %122 RelaxedPrecision 
                                                    OpDecorate %123 RelaxedPrecision 
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
                                            %28 = OpTypePointer Input %7 
                               Input f32_4* %29 = OpVariable Input 
                                            %30 = OpTypePointer Input %6 
                                        f32 %34 = OpConstant 3.67402E-40 
                                        u32 %36 = OpConstant 0 
                                            %38 = OpTypeBool 
                                            %39 = OpTypePointer Private %38 
                              Private bool* %40 = OpVariable Private 
                                        f32 %43 = OpConstant 3.67402E-40 
                                            %46 = OpTypeInt 32 1 
                                        i32 %47 = OpConstant 0 
                                        i32 %48 = OpConstant 1 
                                        i32 %50 = OpConstant -1 
                                            %62 = OpTypeStruct %7 %6 
                                            %63 = OpTypePointer Uniform %62 
              Uniform struct {f32_4; f32;}* %64 = OpVariable Uniform 
                                            %65 = OpTypePointer Uniform %7 
                             Private f32_4* %70 = OpVariable Private 
                                            %82 = OpTypePointer Output %7 
                              Output f32_4* %83 = OpVariable Output 
                                            %86 = OpTypePointer Output %6 
                               Private f32* %88 = OpVariable Private 
                                        f32 %90 = OpConstant 3.67402E-40 
                                        f32 %91 = OpConstant 3.67402E-40 
                                        f32 %92 = OpConstant 3.67402E-40 
                                      f32_3 %93 = OpConstantComposite %90 %91 %92 
                                        f32 %96 = OpConstant 3.67402E-40 
                                        f32 %98 = OpConstant 3.67402E-40 
                            Private f32_3* %100 = OpVariable Private 
                            Private f32_3* %106 = OpVariable Private 
                                           %107 = OpTypePointer Uniform %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %26 = OpAccessChain %9 %24 
                                        f32 %27 = OpLoad %26 
                                 Input f32* %31 = OpAccessChain %29 %24 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %27 %32 
                                        f32 %35 = OpFAdd %33 %34 
                               Private f32* %37 = OpAccessChain %22 %36 
                                                    OpStore %37 %35 
                               Private f32* %41 = OpAccessChain %22 %36 
                                        f32 %42 = OpLoad %41 
                                       bool %44 = OpFOrdLessThan %42 %43 
                                                    OpStore %40 %44 
                                       bool %45 = OpLoad %40 
                                        i32 %49 = OpSelect %45 %48 %47 
                                        i32 %51 = OpIMul %49 %50 
                                       bool %52 = OpINotEqual %51 %47 
                                                    OpSelectionMerge %54 None 
                                                    OpBranchConditional %52 %53 %54 
                                            %53 = OpLabel 
                                                    OpKill
                                            %54 = OpLabel 
                                      f32_4 %56 = OpLoad %9 
                                      f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                      f32_3 %58 = OpFNegate %57 
                                      f32_4 %59 = OpLoad %29 
                                      f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                      f32_3 %61 = OpFMul %58 %60 
                             Uniform f32_4* %66 = OpAccessChain %64 %47 
                                      f32_4 %67 = OpLoad %66 
                                      f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                      f32_3 %69 = OpFAdd %61 %68 
                                                    OpStore %22 %69 
                                      f32_4 %71 = OpLoad %9 
                                      f32_4 %72 = OpLoad %29 
                                      f32_4 %73 = OpFMul %71 %72 
                                                    OpStore %70 %73 
                             Uniform f32_4* %74 = OpAccessChain %64 %47 
                                      f32_4 %75 = OpLoad %74 
                                      f32_3 %76 = OpVectorShuffle %75 %75 3 3 3 
                                      f32_3 %77 = OpLoad %22 
                                      f32_3 %78 = OpFMul %76 %77 
                                      f32_4 %79 = OpLoad %70 
                                      f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                      f32_3 %81 = OpFAdd %78 %80 
                                                    OpStore %22 %81 
                               Private f32* %84 = OpAccessChain %70 %24 
                                        f32 %85 = OpLoad %84 
                                Output f32* %87 = OpAccessChain %83 %24 
                                                    OpStore %87 %85 
                                      f32_3 %89 = OpLoad %22 
                                        f32 %94 = OpDot %89 %93 
                                                    OpStore %88 %94 
                                        f32 %95 = OpLoad %88 
                                        f32 %97 = OpFMul %95 %96 
                                        f32 %99 = OpFAdd %97 %98 
                                                    OpStore %88 %99 
                                       f32 %101 = OpLoad %88 
                                     f32_3 %102 = OpCompositeConstruct %101 %101 %101 
                                     f32_3 %103 = OpFNegate %102 
                                     f32_3 %104 = OpLoad %22 
                                     f32_3 %105 = OpFAdd %103 %104 
                                                    OpStore %100 %105 
                              Uniform f32* %108 = OpAccessChain %64 %48 
                                       f32 %109 = OpLoad %108 
                              Uniform f32* %110 = OpAccessChain %64 %48 
                                       f32 %111 = OpLoad %110 
                              Uniform f32* %112 = OpAccessChain %64 %48 
                                       f32 %113 = OpLoad %112 
                                     f32_3 %114 = OpCompositeConstruct %109 %111 %113 
                                       f32 %115 = OpCompositeExtract %114 0 
                                       f32 %116 = OpCompositeExtract %114 1 
                                       f32 %117 = OpCompositeExtract %114 2 
                                     f32_3 %118 = OpCompositeConstruct %115 %116 %117 
                                     f32_3 %119 = OpLoad %100 
                                     f32_3 %120 = OpFMul %118 %119 
                                       f32 %121 = OpLoad %88 
                                     f32_3 %122 = OpCompositeConstruct %121 %121 %121 
                                     f32_3 %123 = OpFAdd %120 %122 
                                                    OpStore %106 %123 
                                     f32_3 %124 = OpLoad %106 
                                     f32_4 %125 = OpLoad %83 
                                     f32_4 %126 = OpVectorShuffle %125 %124 4 5 6 3 
                                                    OpStore %83 %126 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform 	float _Saturation;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat16_5;
float u_xlat9;
bool u_xlatb9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat16_5.xy = (-u_xlat10_0.zy) + u_xlat10_0.yz;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_5.xy + u_xlat10_0.zy;
    u_xlatb13 = u_xlat10_0.x>=u_xlat1.x;
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat1.z = u_xlat10_0.x;
    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat5 = min(u_xlat1.y, u_xlat1.z);
    u_xlat5 = (-u_xlat5) + u_xlat1.x;
    u_xlat9 = u_xlat1.x + 1.00000001e-010;
    u_xlat5 = u_xlat5 / u_xlat9;
    u_xlat2.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * 0.5 + 0.25;
    u_xlat0.xyz = (-vec3(u_xlat12)) + u_xlat0.xyz;
    u_xlat0.xyw = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.yzx + vec3(u_xlat12);
    u_xlatb9 = u_xlat0.x>=u_xlat0.y;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat9) * u_xlat3 + u_xlat2;
    u_xlatb9 = u_xlat0.w>=u_xlat2.x;
    u_xlat9 = u_xlatb9 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat9) * u_xlat2 + u_xlat0;
    u_xlat9 = min(u_xlat0.y, u_xlat0.w);
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = u_xlat0.x * 6.0 + 1.00000001e-010;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat0.x = u_xlat4 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + u_xlat0.z;
    u_xlat0.xyz = abs(u_xlat0.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(u_xlat5) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %88 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %82 Location 82 
                                              OpDecorate %83 RelaxedPrecision 
                                              OpDecorate %83 Location 83 
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %88 Location 88 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                        Output f32_4* %82 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypeVector %6 2 
                                      %86 = OpTypePointer Output %85 
                        Output f32_2* %87 = OpVariable Output 
                         Input f32_4* %88 = OpVariable Input 
                                      %91 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_4 %84 = OpLoad %83 
                                              OpStore %82 %84 
                                f32_4 %89 = OpLoad %88 
                                f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                              OpStore %87 %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %72 %22 %68 
                                              OpStore %95 %94 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 365
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %29 %172 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %29 Location 29 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %146 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %148 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %150 RelaxedPrecision 
                                                    OpMemberDecorate %151 0 RelaxedPrecision 
                                                    OpMemberDecorate %151 0 Offset 151 
                                                    OpMemberDecorate %151 1 Offset 151 
                                                    OpDecorate %151 Block 
                                                    OpDecorate %153 DescriptorSet 153 
                                                    OpDecorate %153 Binding 153 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %158 RelaxedPrecision 
                                                    OpDecorate %159 RelaxedPrecision 
                                                    OpDecorate %160 RelaxedPrecision 
                                                    OpDecorate %161 RelaxedPrecision 
                                                    OpDecorate %162 RelaxedPrecision 
                                                    OpDecorate %164 RelaxedPrecision 
                                                    OpDecorate %165 RelaxedPrecision 
                                                    OpDecorate %166 RelaxedPrecision 
                                                    OpDecorate %167 RelaxedPrecision 
                                                    OpDecorate %168 RelaxedPrecision 
                                                    OpDecorate %169 RelaxedPrecision 
                                                    OpDecorate %170 RelaxedPrecision 
                                                    OpDecorate %172 RelaxedPrecision 
                                                    OpDecorate %172 Location 172 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %178 RelaxedPrecision 
                                                    OpDecorate %183 RelaxedPrecision 
                                                    OpDecorate %184 RelaxedPrecision 
                                                    OpDecorate %186 RelaxedPrecision 
                                                    OpDecorate %188 RelaxedPrecision 
                                                    OpDecorate %189 RelaxedPrecision 
                                                    OpDecorate %190 RelaxedPrecision 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %192 RelaxedPrecision 
                                                    OpDecorate %193 RelaxedPrecision 
                                                    OpDecorate %194 RelaxedPrecision 
                                                    OpDecorate %203 RelaxedPrecision 
                                                    OpDecorate %204 RelaxedPrecision 
                                                    OpDecorate %205 RelaxedPrecision 
                                                    OpDecorate %206 RelaxedPrecision 
                                                    OpDecorate %207 RelaxedPrecision 
                                                    OpDecorate %208 RelaxedPrecision 
                                                    OpDecorate %209 RelaxedPrecision 
                                                    OpDecorate %210 RelaxedPrecision 
                                                    OpDecorate %211 RelaxedPrecision 
                                                    OpDecorate %212 RelaxedPrecision 
                                                    OpDecorate %213 RelaxedPrecision 
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
                                            %28 = OpTypePointer Input %7 
                               Input f32_4* %29 = OpVariable Input 
                                            %30 = OpTypePointer Input %6 
                                        f32 %34 = OpConstant 3.67402E-40 
                                        u32 %36 = OpConstant 0 
                                            %38 = OpTypeBool 
                                            %39 = OpTypePointer Private %38 
                              Private bool* %40 = OpVariable Private 
                                        f32 %43 = OpConstant 3.67402E-40 
                                            %46 = OpTypeInt 32 1 
                                        i32 %47 = OpConstant 0 
                                        i32 %48 = OpConstant 1 
                                        i32 %50 = OpConstant -1 
                                        u32 %56 = OpConstant 1 
                                        u32 %59 = OpConstant 2 
                             Private f32_3* %63 = OpVariable Private 
                                            %64 = OpTypePointer Function %6 
                                        f32 %69 = OpConstant 3.67402E-40 
                                            %73 = OpTypePointer Private %15 
                             Private f32_2* %74 = OpVariable Private 
                              Private bool* %90 = OpVariable Private 
                               Private f32* %96 = OpVariable Private 
                            Private f32_4* %106 = OpVariable Private 
                            Private f32_3* %121 = OpVariable Private 
                              Private f32* %135 = OpVariable Private 
                                       f32 %138 = OpConstant 3.67402E-40 
                                           %151 = OpTypeStruct %7 %6 
                                           %152 = OpTypePointer Uniform %151 
             Uniform struct {f32_4; f32;}* %153 = OpVariable Uniform 
                                           %154 = OpTypePointer Uniform %7 
                            Private f32_4* %159 = OpVariable Private 
                                           %171 = OpTypePointer Output %7 
                             Output f32_4* %172 = OpVariable Output 
                                           %175 = OpTypePointer Output %6 
                              Private f32* %177 = OpVariable Private 
                                       f32 %179 = OpConstant 3.67402E-40 
                                       f32 %180 = OpConstant 3.67402E-40 
                                       f32 %181 = OpConstant 3.67402E-40 
                                     f32_3 %182 = OpConstantComposite %179 %180 %181 
                                       f32 %185 = OpConstant 3.67402E-40 
                                       f32 %187 = OpConstant 3.67402E-40 
                            Private f32_3* %189 = OpVariable Private 
                            Private f32_4* %195 = OpVariable Private 
                                           %196 = OpTypePointer Uniform %6 
                             Private bool* %216 = OpVariable Private 
                            Private f32_4* %228 = OpVariable Private 
                                       f32 %241 = OpConstant 3.67402E-40 
                                       f32 %243 = OpConstant 3.67402E-40 
                                       f32 %293 = OpConstant 3.67402E-40 
                                       f32 %312 = OpConstant 3.67402E-40 
                                     f32_3 %313 = OpConstantComposite %69 %243 %312 
                                     f32_3 %324 = OpConstantComposite %293 %293 %293 
                                       f32 %326 = OpConstant 3.67402E-40 
                                     f32_3 %327 = OpConstantComposite %326 %326 %326 
                                     f32_3 %334 = OpConstantComposite %241 %241 %241 
                                     f32_3 %355 = OpConstantComposite %69 %69 %69 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %65 = OpVariable Function 
                              Function f32* %97 = OpVariable Function 
                             Function f32* %222 = OpVariable Function 
                             Function f32* %258 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %26 = OpAccessChain %9 %24 
                                        f32 %27 = OpLoad %26 
                                 Input f32* %31 = OpAccessChain %29 %24 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %27 %32 
                                        f32 %35 = OpFAdd %33 %34 
                               Private f32* %37 = OpAccessChain %22 %36 
                                                    OpStore %37 %35 
                               Private f32* %41 = OpAccessChain %22 %36 
                                        f32 %42 = OpLoad %41 
                                       bool %44 = OpFOrdLessThan %42 %43 
                                                    OpStore %40 %44 
                                       bool %45 = OpLoad %40 
                                        i32 %49 = OpSelect %45 %48 %47 
                                        i32 %51 = OpIMul %49 %50 
                                       bool %52 = OpINotEqual %51 %47 
                                                    OpSelectionMerge %54 None 
                                                    OpBranchConditional %52 %53 %54 
                                            %53 = OpLabel 
                                                    OpKill
                                            %54 = OpLabel 
                               Private f32* %57 = OpAccessChain %9 %56 
                                        f32 %58 = OpLoad %57 
                               Private f32* %60 = OpAccessChain %9 %59 
                                        f32 %61 = OpLoad %60 
                                       bool %62 = OpFOrdGreaterThanEqual %58 %61 
                                                    OpStore %40 %62 
                                       bool %66 = OpLoad %40 
                                                    OpSelectionMerge %68 None 
                                                    OpBranchConditional %66 %67 %70 
                                            %67 = OpLabel 
                                                    OpStore %65 %69 
                                                    OpBranch %68 
                                            %70 = OpLabel 
                                                    OpStore %65 %43 
                                                    OpBranch %68 
                                            %68 = OpLabel 
                                        f32 %71 = OpLoad %65 
                               Private f32* %72 = OpAccessChain %63 %36 
                                                    OpStore %72 %71 
                                      f32_4 %75 = OpLoad %9 
                                      f32_2 %76 = OpVectorShuffle %75 %75 2 1 
                                      f32_2 %77 = OpFNegate %76 
                                      f32_4 %78 = OpLoad %9 
                                      f32_2 %79 = OpVectorShuffle %78 %78 1 2 
                                      f32_2 %80 = OpFAdd %77 %79 
                                                    OpStore %74 %80 
                                      f32_3 %81 = OpLoad %63 
                                      f32_2 %82 = OpVectorShuffle %81 %81 0 0 
                                      f32_2 %83 = OpLoad %74 
                                      f32_2 %84 = OpFMul %82 %83 
                                      f32_4 %85 = OpLoad %9 
                                      f32_2 %86 = OpVectorShuffle %85 %85 2 1 
                                      f32_2 %87 = OpFAdd %84 %86 
                                      f32_3 %88 = OpLoad %63 
                                      f32_3 %89 = OpVectorShuffle %88 %87 3 4 2 
                                                    OpStore %63 %89 
                               Private f32* %91 = OpAccessChain %9 %36 
                                        f32 %92 = OpLoad %91 
                               Private f32* %93 = OpAccessChain %63 %36 
                                        f32 %94 = OpLoad %93 
                                       bool %95 = OpFOrdGreaterThanEqual %92 %94 
                                                    OpStore %90 %95 
                                       bool %98 = OpLoad %90 
                                                    OpSelectionMerge %100 None 
                                                    OpBranchConditional %98 %99 %101 
                                            %99 = OpLabel 
                                                    OpStore %97 %69 
                                                    OpBranch %100 
                                           %101 = OpLabel 
                                                    OpStore %97 %43 
                                                    OpBranch %100 
                                           %100 = OpLabel 
                                       f32 %102 = OpLoad %97 
                                                    OpStore %96 %102 
                              Private f32* %103 = OpAccessChain %9 %36 
                                       f32 %104 = OpLoad %103 
                              Private f32* %105 = OpAccessChain %63 %59 
                                                    OpStore %105 %104 
                                     f32_3 %107 = OpLoad %63 
                                     f32_3 %108 = OpFNegate %107 
                                     f32_3 %109 = OpLoad %63 
                                     f32_3 %110 = OpVectorShuffle %109 %109 2 1 0 
                                     f32_3 %111 = OpFAdd %108 %110 
                                     f32_4 %112 = OpLoad %106 
                                     f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                    OpStore %106 %113 
                                       f32 %114 = OpLoad %96 
                                     f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                     f32_4 %116 = OpLoad %106 
                                     f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                     f32_3 %118 = OpFMul %115 %117 
                                     f32_3 %119 = OpLoad %63 
                                     f32_3 %120 = OpFAdd %118 %119 
                                                    OpStore %63 %120 
                              Private f32* %122 = OpAccessChain %63 %56 
                                       f32 %123 = OpLoad %122 
                              Private f32* %124 = OpAccessChain %63 %59 
                                       f32 %125 = OpLoad %124 
                                       f32 %126 = OpExtInst %1 37 %123 %125 
                              Private f32* %127 = OpAccessChain %121 %36 
                                                    OpStore %127 %126 
                              Private f32* %128 = OpAccessChain %121 %36 
                                       f32 %129 = OpLoad %128 
                                       f32 %130 = OpFNegate %129 
                              Private f32* %131 = OpAccessChain %63 %36 
                                       f32 %132 = OpLoad %131 
                                       f32 %133 = OpFAdd %130 %132 
                              Private f32* %134 = OpAccessChain %121 %36 
                                                    OpStore %134 %133 
                              Private f32* %136 = OpAccessChain %63 %36 
                                       f32 %137 = OpLoad %136 
                                       f32 %139 = OpFAdd %137 %138 
                                                    OpStore %135 %139 
                              Private f32* %140 = OpAccessChain %121 %36 
                                       f32 %141 = OpLoad %140 
                                       f32 %142 = OpLoad %135 
                                       f32 %143 = OpFDiv %141 %142 
                              Private f32* %144 = OpAccessChain %121 %36 
                                                    OpStore %144 %143 
                                     f32_4 %145 = OpLoad %9 
                                     f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                     f32_3 %147 = OpFNegate %146 
                                     f32_4 %148 = OpLoad %29 
                                     f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                     f32_3 %150 = OpFMul %147 %149 
                            Uniform f32_4* %155 = OpAccessChain %153 %47 
                                     f32_4 %156 = OpLoad %155 
                                     f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                     f32_3 %158 = OpFAdd %150 %157 
                                                    OpStore %22 %158 
                                     f32_4 %160 = OpLoad %9 
                                     f32_4 %161 = OpLoad %29 
                                     f32_4 %162 = OpFMul %160 %161 
                                                    OpStore %159 %162 
                            Uniform f32_4* %163 = OpAccessChain %153 %47 
                                     f32_4 %164 = OpLoad %163 
                                     f32_3 %165 = OpVectorShuffle %164 %164 3 3 3 
                                     f32_3 %166 = OpLoad %22 
                                     f32_3 %167 = OpFMul %165 %166 
                                     f32_4 %168 = OpLoad %159 
                                     f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                     f32_3 %170 = OpFAdd %167 %169 
                                                    OpStore %22 %170 
                              Private f32* %173 = OpAccessChain %159 %24 
                                       f32 %174 = OpLoad %173 
                               Output f32* %176 = OpAccessChain %172 %24 
                                                    OpStore %176 %174 
                                     f32_3 %178 = OpLoad %22 
                                       f32 %183 = OpDot %178 %182 
                                                    OpStore %177 %183 
                                       f32 %184 = OpLoad %177 
                                       f32 %186 = OpFMul %184 %185 
                                       f32 %188 = OpFAdd %186 %187 
                                                    OpStore %177 %188 
                                       f32 %190 = OpLoad %177 
                                     f32_3 %191 = OpCompositeConstruct %190 %190 %190 
                                     f32_3 %192 = OpFNegate %191 
                                     f32_3 %193 = OpLoad %22 
                                     f32_3 %194 = OpFAdd %192 %193 
                                                    OpStore %189 %194 
                              Uniform f32* %197 = OpAccessChain %153 %48 
                                       f32 %198 = OpLoad %197 
                              Uniform f32* %199 = OpAccessChain %153 %48 
                                       f32 %200 = OpLoad %199 
                              Uniform f32* %201 = OpAccessChain %153 %48 
                                       f32 %202 = OpLoad %201 
                                     f32_3 %203 = OpCompositeConstruct %198 %200 %202 
                                       f32 %204 = OpCompositeExtract %203 0 
                                       f32 %205 = OpCompositeExtract %203 1 
                                       f32 %206 = OpCompositeExtract %203 2 
                                     f32_3 %207 = OpCompositeConstruct %204 %205 %206 
                                     f32_3 %208 = OpLoad %189 
                                     f32_3 %209 = OpVectorShuffle %208 %208 1 2 0 
                                     f32_3 %210 = OpFMul %207 %209 
                                       f32 %211 = OpLoad %177 
                                     f32_3 %212 = OpCompositeConstruct %211 %211 %211 
                                     f32_3 %213 = OpFAdd %210 %212 
                                     f32_4 %214 = OpLoad %195 
                                     f32_4 %215 = OpVectorShuffle %214 %213 4 5 2 6 
                                                    OpStore %195 %215 
                              Private f32* %217 = OpAccessChain %195 %36 
                                       f32 %218 = OpLoad %217 
                              Private f32* %219 = OpAccessChain %195 %56 
                                       f32 %220 = OpLoad %219 
                                      bool %221 = OpFOrdGreaterThanEqual %218 %220 
                                                    OpStore %216 %221 
                                      bool %223 = OpLoad %216 
                                                    OpSelectionMerge %225 None 
                                                    OpBranchConditional %223 %224 %226 
                                           %224 = OpLabel 
                                                    OpStore %222 %69 
                                                    OpBranch %225 
                                           %226 = OpLabel 
                                                    OpStore %222 %43 
                                                    OpBranch %225 
                                           %225 = OpLabel 
                                       f32 %227 = OpLoad %222 
                                                    OpStore %135 %227 
                                     f32_4 %229 = OpLoad %195 
                                     f32_2 %230 = OpVectorShuffle %229 %229 1 0 
                                     f32_4 %231 = OpLoad %228 
                                     f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
                                                    OpStore %228 %232 
                                     f32_4 %233 = OpLoad %195 
                                     f32_2 %234 = OpVectorShuffle %233 %233 0 1 
                                     f32_4 %235 = OpLoad %228 
                                     f32_2 %236 = OpVectorShuffle %235 %235 0 1 
                                     f32_2 %237 = OpFNegate %236 
                                     f32_2 %238 = OpFAdd %234 %237 
                                     f32_4 %239 = OpLoad %106 
                                     f32_4 %240 = OpVectorShuffle %239 %238 4 5 2 3 
                                                    OpStore %106 %240 
                              Private f32* %242 = OpAccessChain %228 %59 
                                                    OpStore %242 %241 
                              Private f32* %244 = OpAccessChain %228 %24 
                                                    OpStore %244 %243 
                              Private f32* %245 = OpAccessChain %106 %59 
                                                    OpStore %245 %69 
                              Private f32* %246 = OpAccessChain %106 %24 
                                                    OpStore %246 %241 
                                       f32 %247 = OpLoad %135 
                                     f32_4 %248 = OpCompositeConstruct %247 %247 %247 %247 
                                     f32_4 %249 = OpLoad %106 
                                     f32_4 %250 = OpFMul %248 %249 
                                     f32_4 %251 = OpLoad %228 
                                     f32_4 %252 = OpFAdd %250 %251 
                                                    OpStore %228 %252 
                              Private f32* %253 = OpAccessChain %195 %24 
                                       f32 %254 = OpLoad %253 
                              Private f32* %255 = OpAccessChain %228 %36 
                                       f32 %256 = OpLoad %255 
                                      bool %257 = OpFOrdGreaterThanEqual %254 %256 
                                                    OpStore %216 %257 
                                      bool %259 = OpLoad %216 
                                                    OpSelectionMerge %261 None 
                                                    OpBranchConditional %259 %260 %262 
                                           %260 = OpLabel 
                                                    OpStore %258 %69 
                                                    OpBranch %261 
                                           %262 = OpLabel 
                                                    OpStore %258 %43 
                                                    OpBranch %261 
                                           %261 = OpLabel 
                                       f32 %263 = OpLoad %258 
                                                    OpStore %135 %263 
                                     f32_4 %264 = OpLoad %228 
                                     f32_3 %265 = OpVectorShuffle %264 %264 0 1 3 
                                     f32_4 %266 = OpLoad %195 
                                     f32_4 %267 = OpVectorShuffle %266 %265 4 5 6 3 
                                                    OpStore %195 %267 
                                     f32_4 %268 = OpLoad %195 
                                     f32_3 %269 = OpVectorShuffle %268 %268 3 1 0 
                                     f32_4 %270 = OpLoad %228 
                                     f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 6 
                                                    OpStore %228 %271 
                                     f32_4 %272 = OpLoad %195 
                                     f32_4 %273 = OpFNegate %272 
                                     f32_4 %274 = OpLoad %228 
                                     f32_4 %275 = OpFAdd %273 %274 
                                                    OpStore %228 %275 
                                       f32 %276 = OpLoad %135 
                                     f32_4 %277 = OpCompositeConstruct %276 %276 %276 %276 
                                     f32_4 %278 = OpLoad %228 
                                     f32_4 %279 = OpFMul %277 %278 
                                     f32_4 %280 = OpLoad %195 
                                     f32_4 %281 = OpFAdd %279 %280 
                                                    OpStore %195 %281 
                              Private f32* %282 = OpAccessChain %195 %56 
                                       f32 %283 = OpLoad %282 
                              Private f32* %284 = OpAccessChain %195 %24 
                                       f32 %285 = OpLoad %284 
                                       f32 %286 = OpExtInst %1 37 %283 %285 
                                                    OpStore %135 %286 
                              Private f32* %287 = OpAccessChain %195 %36 
                                       f32 %288 = OpLoad %287 
                                       f32 %289 = OpLoad %135 
                                       f32 %290 = OpFNegate %289 
                                       f32 %291 = OpFAdd %288 %290 
                                                    OpStore %135 %291 
                                       f32 %292 = OpLoad %135 
                                       f32 %294 = OpFMul %292 %293 
                                       f32 %295 = OpFAdd %294 %138 
                                                    OpStore %135 %295 
                              Private f32* %296 = OpAccessChain %195 %56 
                                       f32 %297 = OpLoad %296 
                                       f32 %298 = OpFNegate %297 
                              Private f32* %299 = OpAccessChain %195 %24 
                                       f32 %300 = OpLoad %299 
                                       f32 %301 = OpFAdd %298 %300 
                                                    OpStore %96 %301 
                                       f32 %302 = OpLoad %96 
                                       f32 %303 = OpLoad %135 
                                       f32 %304 = OpFDiv %302 %303 
                                                    OpStore %135 %304 
                              Private f32* %305 = OpAccessChain %195 %59 
                                       f32 %306 = OpLoad %305 
                                       f32 %307 = OpLoad %135 
                                       f32 %308 = OpFAdd %306 %307 
                                                    OpStore %135 %308 
                                       f32 %309 = OpLoad %135 
                                     f32_3 %310 = OpCompositeConstruct %309 %309 %309 
                                     f32_3 %311 = OpExtInst %1 4 %310 
                                     f32_3 %314 = OpFAdd %311 %313 
                                     f32_4 %315 = OpLoad %106 
                                     f32_4 %316 = OpVectorShuffle %315 %314 4 5 6 3 
                                                    OpStore %106 %316 
                                     f32_4 %317 = OpLoad %106 
                                     f32_3 %318 = OpVectorShuffle %317 %317 0 1 2 
                                     f32_3 %319 = OpExtInst %1 10 %318 
                                     f32_4 %320 = OpLoad %106 
                                     f32_4 %321 = OpVectorShuffle %320 %319 4 5 6 3 
                                                    OpStore %106 %321 
                                     f32_4 %322 = OpLoad %106 
                                     f32_3 %323 = OpVectorShuffle %322 %322 0 1 2 
                                     f32_3 %325 = OpFMul %323 %324 
                                     f32_3 %328 = OpFAdd %325 %327 
                                     f32_4 %329 = OpLoad %106 
                                     f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                                    OpStore %106 %330 
                                     f32_4 %331 = OpLoad %106 
                                     f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                     f32_3 %333 = OpExtInst %1 4 %332 
                                     f32_3 %335 = OpFAdd %333 %334 
                                     f32_4 %336 = OpLoad %106 
                                     f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                    OpStore %106 %337 
                                     f32_4 %338 = OpLoad %106 
                                     f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                     f32_3 %340 = OpCompositeConstruct %43 %43 %43 
                                     f32_3 %341 = OpCompositeConstruct %69 %69 %69 
                                     f32_3 %342 = OpExtInst %1 43 %339 %340 %341 
                                     f32_4 %343 = OpLoad %106 
                                     f32_4 %344 = OpVectorShuffle %343 %342 4 5 6 3 
                                                    OpStore %106 %344 
                                     f32_4 %345 = OpLoad %106 
                                     f32_3 %346 = OpVectorShuffle %345 %345 0 1 2 
                                     f32_3 %347 = OpFAdd %346 %334 
                                     f32_4 %348 = OpLoad %106 
                                     f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                                    OpStore %106 %349 
                                     f32_3 %350 = OpLoad %121 
                                     f32_3 %351 = OpVectorShuffle %350 %350 0 0 0 
                                     f32_4 %352 = OpLoad %106 
                                     f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                                     f32_3 %354 = OpFMul %351 %353 
                                     f32_3 %356 = OpFAdd %354 %355 
                                                    OpStore %121 %356 
                                     f32_3 %357 = OpLoad %121 
                                     f32_3 %358 = OpLoad %63 
                                     f32_3 %359 = OpVectorShuffle %358 %358 0 0 0 
                                     f32_3 %360 = OpFMul %357 %359 
                                                    OpStore %63 %360 
                                     f32_3 %361 = OpLoad %63 
                                     f32_4 %362 = OpLoad %172 
                                     f32_4 %363 = OpVectorShuffle %362 %361 4 5 6 3 
                                                    OpStore %172 %363 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
}
}
}
}