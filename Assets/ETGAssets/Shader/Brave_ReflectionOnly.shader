//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/ReflectionOnly" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_ValueMaximum ("Value Maximum", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 20932
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
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
uniform 	float _ReflectionYFactor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0 = _ReflectionYFactor * 0.5;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_1 * vs_COLOR0;
    u_xlat3.xyz = (-u_xlat10_1.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat3.x = u_xlat2.w * u_xlat0 + -0.100000001;
    u_xlat0 = u_xlat0 * u_xlat2.w;
    SV_Target0.w = u_xlat0;
    u_xlatb0 = u_xlat3.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
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
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
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
                                              OpDecorate %83 Location 83 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %89 Location 89 
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
                                      %88 = OpTypePointer Input %85 
                         Input f32_2* %89 = OpVariable Input 
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
                                f32_2 %90 = OpLoad %89 
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
; Bound: 98
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %29 %35 %54 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpMemberDecorate %10 0 RelaxedPrecision 
                                                    OpMemberDecorate %10 0 Offset 10 
                                                    OpMemberDecorate %10 1 Offset 10 
                                                    OpDecorate %10 Block 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %29 Location 29 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %35 Location 35 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %54 Location 54 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeVector %6 4 
                                            %10 = OpTypeStruct %9 %6 
                                            %11 = OpTypePointer Uniform %10 
              Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
                                            %13 = OpTypeInt 32 1 
                                        i32 %14 = OpConstant 1 
                                            %15 = OpTypePointer Uniform %6 
                                        f32 %18 = OpConstant 3.67402E-40 
                                            %20 = OpTypePointer Private %9 
                             Private f32_4* %21 = OpVariable Private 
                                            %22 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %23 = OpTypeSampledImage %22 
                                            %24 = OpTypePointer UniformConstant %23 
UniformConstant read_only Texture2DSampled* %25 = OpVariable UniformConstant 
                                            %27 = OpTypeVector %6 2 
                                            %28 = OpTypePointer Input %27 
                               Input f32_2* %29 = OpVariable Input 
                             Private f32_4* %32 = OpVariable Private 
                                            %34 = OpTypePointer Input %9 
                               Input f32_4* %35 = OpVariable Input 
                                            %38 = OpTypeVector %6 3 
                                            %39 = OpTypePointer Private %38 
                             Private f32_3* %40 = OpVariable Private 
                                        i32 %47 = OpConstant 0 
                                            %48 = OpTypePointer Uniform %9 
                                            %53 = OpTypePointer Output %9 
                              Output f32_4* %54 = OpVariable Output 
                                            %65 = OpTypeInt 32 0 
                                        u32 %66 = OpConstant 3 
                                        f32 %71 = OpConstant 3.67402E-40 
                                        u32 %73 = OpConstant 0 
                                            %80 = OpTypePointer Output %6 
                                            %82 = OpTypeBool 
                                            %83 = OpTypePointer Private %82 
                              Private bool* %84 = OpVariable Private 
                                        f32 %87 = OpConstant 3.67402E-40 
                                        i32 %91 = OpConstant -1 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Uniform f32* %16 = OpAccessChain %12 %14 
                                        f32 %17 = OpLoad %16 
                                        f32 %19 = OpFMul %17 %18 
                                                    OpStore %8 %19 
                 read_only Texture2DSampled %26 = OpLoad %25 
                                      f32_2 %30 = OpLoad %29 
                                      f32_4 %31 = OpImageSampleImplicitLod %26 %30 
                                                    OpStore %21 %31 
                                      f32_4 %33 = OpLoad %21 
                                      f32_4 %36 = OpLoad %35 
                                      f32_4 %37 = OpFMul %33 %36 
                                                    OpStore %32 %37 
                                      f32_4 %41 = OpLoad %21 
                                      f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                                      f32_3 %43 = OpFNegate %42 
                                      f32_4 %44 = OpLoad %35 
                                      f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                      f32_3 %46 = OpFMul %43 %45 
                             Uniform f32_4* %49 = OpAccessChain %12 %47 
                                      f32_4 %50 = OpLoad %49 
                                      f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                      f32_3 %52 = OpFAdd %46 %51 
                                                    OpStore %40 %52 
                             Uniform f32_4* %55 = OpAccessChain %12 %47 
                                      f32_4 %56 = OpLoad %55 
                                      f32_3 %57 = OpVectorShuffle %56 %56 3 3 3 
                                      f32_3 %58 = OpLoad %40 
                                      f32_3 %59 = OpFMul %57 %58 
                                      f32_4 %60 = OpLoad %32 
                                      f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                                      f32_3 %62 = OpFAdd %59 %61 
                                      f32_4 %63 = OpLoad %54 
                                      f32_4 %64 = OpVectorShuffle %63 %62 4 5 6 3 
                                                    OpStore %54 %64 
                               Private f32* %67 = OpAccessChain %32 %66 
                                        f32 %68 = OpLoad %67 
                                        f32 %69 = OpLoad %8 
                                        f32 %70 = OpFMul %68 %69 
                                        f32 %72 = OpFAdd %70 %71 
                               Private f32* %74 = OpAccessChain %32 %73 
                                                    OpStore %74 %72 
                                        f32 %75 = OpLoad %8 
                               Private f32* %76 = OpAccessChain %32 %66 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpFMul %75 %77 
                                                    OpStore %8 %78 
                                        f32 %79 = OpLoad %8 
                                Output f32* %81 = OpAccessChain %54 %66 
                                                    OpStore %81 %79 
                               Private f32* %85 = OpAccessChain %32 %73 
                                        f32 %86 = OpLoad %85 
                                       bool %88 = OpFOrdLessThan %86 %87 
                                                    OpStore %84 %88 
                                       bool %89 = OpLoad %84 
                                        i32 %90 = OpSelect %89 %14 %47 
                                        i32 %92 = OpIMul %90 %91 
                                       bool %93 = OpINotEqual %92 %47 
                                                    OpSelectionMerge %95 None 
                                                    OpBranchConditional %93 %94 %95 
                                            %94 = OpLabel 
                                                    OpKill
                                            %95 = OpLabel 
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
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
uniform 	float _ReflectionYFactor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
vec2 u_xlat16_4;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = _ReflectionYFactor * 0.5;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_1 * vs_COLOR0;
    u_xlat4.x = u_xlat2.w * u_xlat0.x + -0.100000001;
    u_xlat0.x = u_xlat0.x * u_xlat2.w;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat4.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlatb0 = u_xlat10_1.y>=u_xlat10_1.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat16_4.xy = (-u_xlat10_1.zy) + u_xlat10_1.yz;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_4.xy + u_xlat10_1.zy;
    u_xlatb12 = u_xlat10_1.x>=u_xlat0.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat0.z = u_xlat10_1.x;
    u_xlat1.xyz = (-u_xlat10_1.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat1.xyw = _OverrideColor.www * u_xlat1.yzx + u_xlat2.yzx;
    u_xlat2.xyz = (-u_xlat0.xyz) + u_xlat0.zyx;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat4.x = min(u_xlat0.y, u_xlat0.z);
    u_xlat4.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat8 = u_xlat0.x + 1.00000001e-010;
    u_xlat4.x = u_xlat4.x / u_xlat8;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlatb8 = u_xlat2.y>=u_xlat1.y;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat2 = vec4(u_xlat8) * u_xlat3 + u_xlat2;
    u_xlatb8 = u_xlat1.w>=u_xlat2.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat8) * u_xlat2 + u_xlat1;
    u_xlat8 = min(u_xlat1.y, u_xlat1.w);
    u_xlat8 = (-u_xlat8) + u_xlat1.x;
    u_xlat8 = u_xlat8 * 6.0 + 1.00000001e-010;
    u_xlat12 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat8 = u_xlat12 / u_xlat8;
    u_xlat8 = u_xlat8 + u_xlat1.z;
    u_xlat1.xyz = abs(vec3(u_xlat8)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = u_xlat4.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
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
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
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
                                              OpDecorate %83 Location 83 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %89 Location 89 
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
                                      %88 = OpTypePointer Input %85 
                         Input f32_2* %89 = OpVariable Input 
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
                                f32_2 %90 = OpLoad %89 
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
; Bound: 357
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %32 %38 %354 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpMemberDecorate %10 0 RelaxedPrecision 
                                                    OpMemberDecorate %10 0 Offset 10 
                                                    OpMemberDecorate %10 1 Offset 10 
                                                    OpDecorate %10 Block 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %28 DescriptorSet 28 
                                                    OpDecorate %28 Binding 28 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %32 Location 32 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %38 Location 38 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %110 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %123 RelaxedPrecision 
                                                    OpDecorate %124 RelaxedPrecision 
                                                    OpDecorate %125 RelaxedPrecision 
                                                    OpDecorate %126 RelaxedPrecision 
                                                    OpDecorate %127 RelaxedPrecision 
                                                    OpDecorate %128 RelaxedPrecision 
                                                    OpDecorate %131 RelaxedPrecision 
                                                    OpDecorate %132 RelaxedPrecision 
                                                    OpDecorate %133 RelaxedPrecision 
                                                    OpDecorate %135 RelaxedPrecision 
                                                    OpDecorate %136 RelaxedPrecision 
                                                    OpDecorate %137 RelaxedPrecision 
                                                    OpDecorate %138 RelaxedPrecision 
                                                    OpDecorate %139 RelaxedPrecision 
                                                    OpDecorate %140 RelaxedPrecision 
                                                    OpDecorate %141 RelaxedPrecision 
                                                    OpDecorate %184 RelaxedPrecision 
                                                    OpDecorate %186 RelaxedPrecision 
                                                    OpDecorate %194 RelaxedPrecision 
                                                    OpDecorate %195 RelaxedPrecision 
                                                    OpDecorate %196 RelaxedPrecision 
                                                    OpDecorate %197 RelaxedPrecision 
                                                    OpDecorate %198 RelaxedPrecision 
                                                    OpDecorate %199 RelaxedPrecision 
                                                    OpDecorate %202 RelaxedPrecision 
                                                    OpDecorate %203 RelaxedPrecision 
                                                    OpDecorate %204 RelaxedPrecision 
                                                    OpDecorate %205 RelaxedPrecision 
                                                    OpDecorate %206 RelaxedPrecision 
                                                    OpDecorate %207 RelaxedPrecision 
                                                    OpDecorate %229 RelaxedPrecision 
                                                    OpDecorate %230 RelaxedPrecision 
                                                    OpDecorate %241 RelaxedPrecision 
                                                    OpDecorate %247 RelaxedPrecision 
                                                    OpDecorate %272 RelaxedPrecision 
                                                    OpDecorate %354 RelaxedPrecision 
                                                    OpDecorate %354 Location 354 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeStruct %7 %6 
                                            %11 = OpTypePointer Uniform %10 
              Uniform struct {f32_4; f32;}* %12 = OpVariable Uniform 
                                            %13 = OpTypeInt 32 1 
                                        i32 %14 = OpConstant 1 
                                            %15 = OpTypePointer Uniform %6 
                                        f32 %18 = OpConstant 3.67402E-40 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 0 
                                            %22 = OpTypePointer Private %6 
                             Private f32_4* %24 = OpVariable Private 
                                            %25 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %26 = OpTypeSampledImage %25 
                                            %27 = OpTypePointer UniformConstant %26 
UniformConstant read_only Texture2DSampled* %28 = OpVariable UniformConstant 
                                            %30 = OpTypeVector %6 2 
                                            %31 = OpTypePointer Input %30 
                               Input f32_2* %32 = OpVariable Input 
                             Private f32_4* %35 = OpVariable Private 
                                            %37 = OpTypePointer Input %7 
                               Input f32_4* %38 = OpVariable Input 
                                            %41 = OpTypeVector %6 3 
                                            %42 = OpTypePointer Private %41 
                             Private f32_3* %43 = OpVariable Private 
                                        u32 %44 = OpConstant 3 
                                        f32 %50 = OpConstant 3.67402E-40 
                                            %59 = OpTypeBool 
                                            %60 = OpTypePointer Private %59 
                              Private bool* %61 = OpVariable Private 
                                        f32 %64 = OpConstant 3.67402E-40 
                                        i32 %67 = OpConstant 0 
                                        i32 %69 = OpConstant -1 
                                        u32 %75 = OpConstant 1 
                                        u32 %78 = OpConstant 2 
                               Private f32* %82 = OpVariable Private 
                                            %83 = OpTypePointer Function %6 
                                        f32 %88 = OpConstant 3.67402E-40 
                                            %91 = OpTypePointer Private %30 
                             Private f32_2* %92 = OpVariable Private 
                             Private f32_4* %99 = OpVariable Private 
                                           %129 = OpTypePointer Uniform %7 
                            Private f32_3* %144 = OpVariable Private 
                            Private f32_3* %158 = OpVariable Private 
                              Private f32* %172 = OpVariable Private 
                                       f32 %175 = OpConstant 3.67402E-40 
                             Private bool* %182 = OpVariable Private 
                            Private f32_4* %200 = OpVariable Private 
                                       f32 %211 = OpConstant 3.67402E-40 
                                       f32 %218 = OpConstant 3.67402E-40 
                                     f32_2 %219 = OpConstantComposite %211 %218 
                            Private f32_4* %232 = OpVariable Private 
                                       f32 %289 = OpConstant 3.67402E-40 
                                       f32 %302 = OpConstant 3.67402E-40 
                                     f32_3 %303 = OpConstantComposite %88 %218 %302 
                                     f32_3 %314 = OpConstantComposite %289 %289 %289 
                                       f32 %316 = OpConstant 3.67402E-40 
                                     f32_3 %317 = OpConstantComposite %316 %316 %316 
                                     f32_3 %324 = OpConstantComposite %211 %211 %211 
                                     f32_3 %345 = OpConstantComposite %88 %88 %88 
                                           %353 = OpTypePointer Output %7 
                             Output f32_4* %354 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %84 = OpVariable Function 
                             Function f32* %114 = OpVariable Function 
                             Function f32* %188 = OpVariable Function 
                             Function f32* %251 = OpVariable Function 
                               Uniform f32* %16 = OpAccessChain %12 %14 
                                        f32 %17 = OpLoad %16 
                                        f32 %19 = OpFMul %17 %18 
                               Private f32* %23 = OpAccessChain %9 %21 
                                                    OpStore %23 %19 
                 read_only Texture2DSampled %29 = OpLoad %28 
                                      f32_2 %33 = OpLoad %32 
                                      f32_4 %34 = OpImageSampleImplicitLod %29 %33 
                                                    OpStore %24 %34 
                                      f32_4 %36 = OpLoad %24 
                                      f32_4 %39 = OpLoad %38 
                                      f32_4 %40 = OpFMul %36 %39 
                                                    OpStore %35 %40 
                               Private f32* %45 = OpAccessChain %35 %44 
                                        f32 %46 = OpLoad %45 
                               Private f32* %47 = OpAccessChain %9 %21 
                                        f32 %48 = OpLoad %47 
                                        f32 %49 = OpFMul %46 %48 
                                        f32 %51 = OpFAdd %49 %50 
                               Private f32* %52 = OpAccessChain %43 %21 
                                                    OpStore %52 %51 
                               Private f32* %53 = OpAccessChain %9 %21 
                                        f32 %54 = OpLoad %53 
                               Private f32* %55 = OpAccessChain %35 %44 
                                        f32 %56 = OpLoad %55 
                                        f32 %57 = OpFMul %54 %56 
                               Private f32* %58 = OpAccessChain %9 %44 
                                                    OpStore %58 %57 
                               Private f32* %62 = OpAccessChain %43 %21 
                                        f32 %63 = OpLoad %62 
                                       bool %65 = OpFOrdLessThan %63 %64 
                                                    OpStore %61 %65 
                                       bool %66 = OpLoad %61 
                                        i32 %68 = OpSelect %66 %14 %67 
                                        i32 %70 = OpIMul %68 %69 
                                       bool %71 = OpINotEqual %70 %67 
                                                    OpSelectionMerge %73 None 
                                                    OpBranchConditional %71 %72 %73 
                                            %72 = OpLabel 
                                                    OpKill
                                            %73 = OpLabel 
                               Private f32* %76 = OpAccessChain %24 %75 
                                        f32 %77 = OpLoad %76 
                               Private f32* %79 = OpAccessChain %24 %78 
                                        f32 %80 = OpLoad %79 
                                       bool %81 = OpFOrdGreaterThanEqual %77 %80 
                                                    OpStore %61 %81 
                                       bool %85 = OpLoad %61 
                                                    OpSelectionMerge %87 None 
                                                    OpBranchConditional %85 %86 %89 
                                            %86 = OpLabel 
                                                    OpStore %84 %88 
                                                    OpBranch %87 
                                            %89 = OpLabel 
                                                    OpStore %84 %64 
                                                    OpBranch %87 
                                            %87 = OpLabel 
                                        f32 %90 = OpLoad %84 
                                                    OpStore %82 %90 
                                      f32_4 %93 = OpLoad %24 
                                      f32_2 %94 = OpVectorShuffle %93 %93 2 1 
                                      f32_2 %95 = OpFNegate %94 
                                      f32_4 %96 = OpLoad %24 
                                      f32_2 %97 = OpVectorShuffle %96 %96 1 2 
                                      f32_2 %98 = OpFAdd %95 %97 
                                                    OpStore %92 %98 
                                       f32 %100 = OpLoad %82 
                                     f32_2 %101 = OpCompositeConstruct %100 %100 
                                     f32_2 %102 = OpLoad %92 
                                     f32_2 %103 = OpFMul %101 %102 
                                     f32_4 %104 = OpLoad %24 
                                     f32_2 %105 = OpVectorShuffle %104 %104 2 1 
                                     f32_2 %106 = OpFAdd %103 %105 
                                     f32_4 %107 = OpLoad %99 
                                     f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                    OpStore %99 %108 
                              Private f32* %109 = OpAccessChain %24 %21 
                                       f32 %110 = OpLoad %109 
                              Private f32* %111 = OpAccessChain %99 %21 
                                       f32 %112 = OpLoad %111 
                                      bool %113 = OpFOrdGreaterThanEqual %110 %112 
                                                    OpStore %61 %113 
                                      bool %115 = OpLoad %61 
                                                    OpSelectionMerge %117 None 
                                                    OpBranchConditional %115 %116 %118 
                                           %116 = OpLabel 
                                                    OpStore %114 %88 
                                                    OpBranch %117 
                                           %118 = OpLabel 
                                                    OpStore %114 %64 
                                                    OpBranch %117 
                                           %117 = OpLabel 
                                       f32 %119 = OpLoad %114 
                                                    OpStore %82 %119 
                              Private f32* %120 = OpAccessChain %24 %21 
                                       f32 %121 = OpLoad %120 
                              Private f32* %122 = OpAccessChain %99 %78 
                                                    OpStore %122 %121 
                                     f32_4 %123 = OpLoad %24 
                                     f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                     f32_3 %125 = OpFNegate %124 
                                     f32_4 %126 = OpLoad %38 
                                     f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                     f32_3 %128 = OpFMul %125 %127 
                            Uniform f32_4* %130 = OpAccessChain %12 %67 
                                     f32_4 %131 = OpLoad %130 
                                     f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                     f32_3 %133 = OpFAdd %128 %132 
                                                    OpStore %43 %133 
                            Uniform f32_4* %134 = OpAccessChain %12 %67 
                                     f32_4 %135 = OpLoad %134 
                                     f32_3 %136 = OpVectorShuffle %135 %135 3 3 3 
                                     f32_3 %137 = OpLoad %43 
                                     f32_3 %138 = OpFMul %136 %137 
                                     f32_4 %139 = OpLoad %35 
                                     f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                     f32_3 %141 = OpFAdd %138 %140 
                                     f32_4 %142 = OpLoad %35 
                                     f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                    OpStore %35 %143 
                                     f32_4 %145 = OpLoad %99 
                                     f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                     f32_3 %147 = OpFNegate %146 
                                     f32_4 %148 = OpLoad %99 
                                     f32_3 %149 = OpVectorShuffle %148 %148 2 1 0 
                                     f32_3 %150 = OpFAdd %147 %149 
                                                    OpStore %144 %150 
                                       f32 %151 = OpLoad %82 
                                     f32_3 %152 = OpCompositeConstruct %151 %151 %151 
                                     f32_3 %153 = OpLoad %144 
                                     f32_3 %154 = OpFMul %152 %153 
                                     f32_4 %155 = OpLoad %99 
                                     f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                     f32_3 %157 = OpFAdd %154 %156 
                                                    OpStore %144 %157 
                              Private f32* %159 = OpAccessChain %144 %75 
                                       f32 %160 = OpLoad %159 
                              Private f32* %161 = OpAccessChain %144 %78 
                                       f32 %162 = OpLoad %161 
                                       f32 %163 = OpExtInst %1 37 %160 %162 
                              Private f32* %164 = OpAccessChain %158 %21 
                                                    OpStore %164 %163 
                              Private f32* %165 = OpAccessChain %158 %21 
                                       f32 %166 = OpLoad %165 
                                       f32 %167 = OpFNegate %166 
                              Private f32* %168 = OpAccessChain %144 %21 
                                       f32 %169 = OpLoad %168 
                                       f32 %170 = OpFAdd %167 %169 
                              Private f32* %171 = OpAccessChain %158 %21 
                                                    OpStore %171 %170 
                              Private f32* %173 = OpAccessChain %144 %21 
                                       f32 %174 = OpLoad %173 
                                       f32 %176 = OpFAdd %174 %175 
                                                    OpStore %172 %176 
                              Private f32* %177 = OpAccessChain %158 %21 
                                       f32 %178 = OpLoad %177 
                                       f32 %179 = OpLoad %172 
                                       f32 %180 = OpFDiv %178 %179 
                              Private f32* %181 = OpAccessChain %158 %21 
                                                    OpStore %181 %180 
                              Private f32* %183 = OpAccessChain %35 %75 
                                       f32 %184 = OpLoad %183 
                              Private f32* %185 = OpAccessChain %35 %78 
                                       f32 %186 = OpLoad %185 
                                      bool %187 = OpFOrdGreaterThanEqual %184 %186 
                                                    OpStore %182 %187 
                                      bool %189 = OpLoad %182 
                                                    OpSelectionMerge %191 None 
                                                    OpBranchConditional %189 %190 %192 
                                           %190 = OpLabel 
                                                    OpStore %188 %88 
                                                    OpBranch %191 
                                           %192 = OpLabel 
                                                    OpStore %188 %64 
                                                    OpBranch %191 
                                           %191 = OpLabel 
                                       f32 %193 = OpLoad %188 
                                                    OpStore %172 %193 
                                     f32_4 %194 = OpLoad %35 
                                     f32_2 %195 = OpVectorShuffle %194 %194 2 1 
                                     f32_2 %196 = OpFNegate %195 
                                     f32_4 %197 = OpLoad %35 
                                     f32_2 %198 = OpVectorShuffle %197 %197 1 2 
                                     f32_2 %199 = OpFAdd %196 %198 
                                                    OpStore %92 %199 
                                       f32 %201 = OpLoad %172 
                                     f32_2 %202 = OpCompositeConstruct %201 %201 
                                     f32_2 %203 = OpLoad %92 
                                     f32_2 %204 = OpFMul %202 %203 
                                     f32_4 %205 = OpLoad %35 
                                     f32_2 %206 = OpVectorShuffle %205 %205 2 1 
                                     f32_2 %207 = OpFAdd %204 %206 
                                     f32_4 %208 = OpLoad %200 
                                     f32_4 %209 = OpVectorShuffle %208 %207 4 5 2 3 
                                                    OpStore %200 %209 
                              Private f32* %210 = OpAccessChain %99 %21 
                                                    OpStore %210 %88 
                              Private f32* %212 = OpAccessChain %99 %75 
                                                    OpStore %212 %211 
                                       f32 %213 = OpLoad %172 
                                     f32_2 %214 = OpCompositeConstruct %213 %213 
                                     f32_4 %215 = OpLoad %99 
                                     f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                     f32_2 %217 = OpFMul %214 %216 
                                     f32_2 %220 = OpFAdd %217 %219 
                                     f32_4 %221 = OpLoad %200 
                                     f32_4 %222 = OpVectorShuffle %221 %220 0 1 4 5 
                                                    OpStore %200 %222 
                                     f32_4 %223 = OpLoad %200 
                                     f32_3 %224 = OpVectorShuffle %223 %223 0 1 3 
                                     f32_3 %225 = OpFNegate %224 
                                     f32_4 %226 = OpLoad %99 
                                     f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                    OpStore %99 %227 
                              Private f32* %228 = OpAccessChain %35 %21 
                                       f32 %229 = OpLoad %228 
                                       f32 %230 = OpFNegate %229 
                              Private f32* %231 = OpAccessChain %99 %44 
                                                    OpStore %231 %230 
                                     f32_4 %233 = OpLoad %200 
                                     f32_3 %234 = OpVectorShuffle %233 %233 1 2 0 
                                     f32_4 %235 = OpLoad %99 
                                     f32_3 %236 = OpVectorShuffle %235 %235 1 2 3 
                                     f32_3 %237 = OpFAdd %234 %236 
                                     f32_4 %238 = OpLoad %232 
                                     f32_4 %239 = OpVectorShuffle %238 %237 0 4 5 6 
                                                    OpStore %232 %239 
                              Private f32* %240 = OpAccessChain %35 %21 
                                       f32 %241 = OpLoad %240 
                              Private f32* %242 = OpAccessChain %99 %21 
                                       f32 %243 = OpLoad %242 
                                       f32 %244 = OpFAdd %241 %243 
                              Private f32* %245 = OpAccessChain %232 %21 
                                                    OpStore %245 %244 
                              Private f32* %246 = OpAccessChain %35 %21 
                                       f32 %247 = OpLoad %246 
                              Private f32* %248 = OpAccessChain %200 %21 
                                       f32 %249 = OpLoad %248 
                                      bool %250 = OpFOrdGreaterThanEqual %247 %249 
                                                    OpStore %182 %250 
                                      bool %252 = OpLoad %182 
                                                    OpSelectionMerge %254 None 
                                                    OpBranchConditional %252 %253 %255 
                                           %253 = OpLabel 
                                                    OpStore %251 %88 
                                                    OpBranch %254 
                                           %255 = OpLabel 
                                                    OpStore %251 %64 
                                                    OpBranch %254 
                                           %254 = OpLabel 
                                       f32 %256 = OpLoad %251 
                                                    OpStore %172 %256 
                                       f32 %257 = OpLoad %172 
                                     f32_3 %258 = OpCompositeConstruct %257 %257 %257 
                                     f32_4 %259 = OpLoad %232 
                                     f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                     f32_3 %261 = OpFMul %258 %260 
                                     f32_4 %262 = OpLoad %200 
                                     f32_3 %263 = OpVectorShuffle %262 %262 0 1 3 
                                     f32_3 %264 = OpFAdd %261 %263 
                                     f32_4 %265 = OpLoad %99 
                                     f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                    OpStore %99 %266 
                                       f32 %267 = OpLoad %172 
                              Private f32* %268 = OpAccessChain %232 %44 
                                       f32 %269 = OpLoad %268 
                                       f32 %270 = OpFMul %267 %269 
                              Private f32* %271 = OpAccessChain %35 %21 
                                       f32 %272 = OpLoad %271 
                                       f32 %273 = OpFAdd %270 %272 
                                                    OpStore %172 %273 
                              Private f32* %274 = OpAccessChain %99 %75 
                                       f32 %275 = OpLoad %274 
                                       f32 %276 = OpLoad %172 
                                       f32 %277 = OpExtInst %1 37 %275 %276 
                                                    OpStore %82 %277 
                              Private f32* %278 = OpAccessChain %99 %75 
                                       f32 %279 = OpLoad %278 
                                       f32 %280 = OpFNegate %279 
                                       f32 %281 = OpLoad %172 
                                       f32 %282 = OpFAdd %280 %281 
                                                    OpStore %172 %282 
                                       f32 %283 = OpLoad %82 
                                       f32 %284 = OpFNegate %283 
                              Private f32* %285 = OpAccessChain %99 %21 
                                       f32 %286 = OpLoad %285 
                                       f32 %287 = OpFAdd %284 %286 
                                                    OpStore %82 %287 
                                       f32 %288 = OpLoad %82 
                                       f32 %290 = OpFMul %288 %289 
                                       f32 %291 = OpFAdd %290 %175 
                                                    OpStore %82 %291 
                                       f32 %292 = OpLoad %172 
                                       f32 %293 = OpLoad %82 
                                       f32 %294 = OpFDiv %292 %293 
                                                    OpStore %172 %294 
                                       f32 %295 = OpLoad %172 
                              Private f32* %296 = OpAccessChain %99 %78 
                                       f32 %297 = OpLoad %296 
                                       f32 %298 = OpFAdd %295 %297 
                                                    OpStore %172 %298 
                                       f32 %299 = OpLoad %172 
                                     f32_3 %300 = OpCompositeConstruct %299 %299 %299 
                                     f32_3 %301 = OpExtInst %1 4 %300 
                                     f32_3 %304 = OpFAdd %301 %303 
                                     f32_4 %305 = OpLoad %99 
                                     f32_4 %306 = OpVectorShuffle %305 %304 4 5 6 3 
                                                    OpStore %99 %306 
                                     f32_4 %307 = OpLoad %99 
                                     f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                     f32_3 %309 = OpExtInst %1 10 %308 
                                     f32_4 %310 = OpLoad %99 
                                     f32_4 %311 = OpVectorShuffle %310 %309 4 5 6 3 
                                                    OpStore %99 %311 
                                     f32_4 %312 = OpLoad %99 
                                     f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                     f32_3 %315 = OpFMul %313 %314 
                                     f32_3 %318 = OpFAdd %315 %317 
                                     f32_4 %319 = OpLoad %99 
                                     f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                    OpStore %99 %320 
                                     f32_4 %321 = OpLoad %99 
                                     f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
                                     f32_3 %323 = OpExtInst %1 4 %322 
                                     f32_3 %325 = OpFAdd %323 %324 
                                     f32_4 %326 = OpLoad %99 
                                     f32_4 %327 = OpVectorShuffle %326 %325 4 5 6 3 
                                                    OpStore %99 %327 
                                     f32_4 %328 = OpLoad %99 
                                     f32_3 %329 = OpVectorShuffle %328 %328 0 1 2 
                                     f32_3 %330 = OpCompositeConstruct %64 %64 %64 
                                     f32_3 %331 = OpCompositeConstruct %88 %88 %88 
                                     f32_3 %332 = OpExtInst %1 43 %329 %330 %331 
                                     f32_4 %333 = OpLoad %99 
                                     f32_4 %334 = OpVectorShuffle %333 %332 4 5 6 3 
                                                    OpStore %99 %334 
                                     f32_4 %335 = OpLoad %99 
                                     f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                     f32_3 %337 = OpFAdd %336 %324 
                                     f32_4 %338 = OpLoad %99 
                                     f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                    OpStore %99 %339 
                                     f32_3 %340 = OpLoad %158 
                                     f32_3 %341 = OpVectorShuffle %340 %340 0 0 0 
                                     f32_4 %342 = OpLoad %99 
                                     f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                     f32_3 %344 = OpFMul %341 %343 
                                     f32_3 %346 = OpFAdd %344 %345 
                                                    OpStore %158 %346 
                                     f32_3 %347 = OpLoad %158 
                                     f32_3 %348 = OpLoad %144 
                                     f32_3 %349 = OpVectorShuffle %348 %348 0 0 0 
                                     f32_3 %350 = OpFMul %347 %349 
                                     f32_4 %351 = OpLoad %9 
                                     f32_4 %352 = OpVectorShuffle %351 %350 4 5 6 3 
                                                    OpStore %9 %352 
                                     f32_4 %355 = OpLoad %9 
                                                    OpStore %354 %355 
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