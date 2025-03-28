//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/Curse Pot Circle" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_SubTex ("Sub Tex", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_WorldCenter ("World center", Vector) = (0,0,0,0)
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 54284
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
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _OverrideColor;
uniform  sampler2D _SubTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat10_0 = texture(_SubTex, vs_TEXCOORD1.xy);
    u_xlat0.x = u_xlat10_0.w + -0.100000001;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat4 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
    u_xlatb6 = u_xlat0.x<(-u_xlat0.x);
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.x, u_xlat0.y);
    u_xlatb6 = u_xlat6<(-u_xlat6);
    u_xlat1.x = max(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb6 = u_xlatb6 && u_xlatb1;
    u_xlat4 = (u_xlatb6) ? (-u_xlat4) : u_xlat4;
    u_xlat4 = _Time.x * 5.0 + u_xlat4;
    u_xlat6 = u_xlat4 * 5.0 + _Time.z;
    u_xlat4 = u_xlat4 * 12.0;
    u_xlat4 = sin(u_xlat4);
    u_xlat4 = u_xlat4 + 1.0;
    u_xlat4 = u_xlat4 * 0.5;
    u_xlat6 = cos(u_xlat6);
    u_xlat6 = u_xlat6 + 1.0;
    u_xlat6 = u_xlat6 * 0.0325000025 + 0.00999999978;
    u_xlat1.xy = u_xlat0.xy * vec2(0.00999999978, 0.00999999978);
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + (-u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat4) * u_xlat0.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD1.xy;
    u_xlat10_0 = texture(_SubTex, u_xlat0.xy);
    u_xlat1 = (-vs_COLOR0) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat10_0 + u_xlat1;
    SV_Target0 = u_xlat0 * _OverrideColor;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 100
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 %91 %92 
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
                                              OpDecorate %91 Location 91 
                                              OpDecorate %92 Location 92 
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
                        Output f32_2* %91 = OpVariable Output 
                         Input f32_2* %92 = OpVariable Input 
                                      %94 = OpTypePointer Output %6 
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
                                f32_2 %93 = OpLoad %92 
                                              OpStore %91 %93 
                          Output f32* %95 = OpAccessChain %72 %22 %68 
                                  f32 %96 = OpLoad %95 
                                  f32 %97 = OpFNegate %96 
                          Output f32* %98 = OpAccessChain %72 %22 %68 
                                              OpStore %98 %97 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 270
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %253 %263 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %26 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpMemberDecorate %195 0 Offset 195 
                                                    OpMemberDecorate %195 1 RelaxedPrecision 
                                                    OpMemberDecorate %195 1 Offset 195 
                                                    OpDecorate %195 Block 
                                                    OpDecorate %197 DescriptorSet 197 
                                                    OpDecorate %197 Binding 197 
                                                    OpDecorate %249 RelaxedPrecision 
                                                    OpDecorate %253 RelaxedPrecision 
                                                    OpDecorate %253 Location 253 
                                                    OpDecorate %254 RelaxedPrecision 
                                                    OpDecorate %255 RelaxedPrecision 
                                                    OpDecorate %257 RelaxedPrecision 
                                                    OpDecorate %258 RelaxedPrecision 
                                                    OpDecorate %259 RelaxedPrecision 
                                                    OpDecorate %260 RelaxedPrecision 
                                                    OpDecorate %261 RelaxedPrecision 
                                                    OpDecorate %263 RelaxedPrecision 
                                                    OpDecorate %263 Location 263 
                                                    OpDecorate %264 RelaxedPrecision 
                                                    OpDecorate %267 RelaxedPrecision 
                                                    OpDecorate %268 RelaxedPrecision 
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
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                        u32 %23 = OpConstant 0 
                                            %24 = OpTypePointer Private %6 
                             Private f32_4* %26 = OpVariable Private 
                                        f32 %29 = OpConstant 3.67402E-40 
                                            %32 = OpTypeBool 
                                            %33 = OpTypePointer Private %32 
                              Private bool* %34 = OpVariable Private 
                                        f32 %37 = OpConstant 3.67402E-40 
                                            %40 = OpTypeInt 32 1 
                                        i32 %41 = OpConstant 0 
                                        i32 %42 = OpConstant 1 
                                        i32 %44 = OpConstant -1 
                                            %50 = OpTypePointer Private %15 
                             Private f32_2* %51 = OpVariable Private 
                                        f32 %53 = OpConstant 3.67402E-40 
                                      f32_2 %54 = OpConstantComposite %53 %53 
                               Private f32* %56 = OpVariable Private 
                                        u32 %60 = OpConstant 1 
                                        f32 %65 = OpConstant 3.67402E-40 
                               Private f32* %68 = OpVariable Private 
                             Private f32_2* %82 = OpVariable Private 
                                        f32 %84 = OpConstant 3.67402E-40 
                                        f32 %86 = OpConstant 3.67402E-40 
                                        f32 %93 = OpConstant 3.67402E-40 
                                       f32 %100 = OpConstant 3.67402E-40 
                                       f32 %107 = OpConstant 3.67402E-40 
                                       f32 %115 = OpConstant 3.67402E-40 
                                       f32 %117 = OpConstant 3.67402E-40 
                             Private bool* %120 = OpVariable Private 
                                           %128 = OpTypePointer Function %6 
                             Private bool* %144 = OpVariable Private 
                                       f32 %155 = OpConstant 3.67402E-40 
                             Private bool* %176 = OpVariable Private 
                                           %195 = OpTypeStruct %7 %7 
                                           %196 = OpTypePointer Uniform %195 
           Uniform struct {f32_4; f32_4;}* %197 = OpVariable Uniform 
                                           %198 = OpTypePointer Uniform %6 
                                       f32 %201 = OpConstant 3.67402E-40 
                                       u32 %207 = OpConstant 2 
                                       f32 %212 = OpConstant 3.67402E-40 
                                       f32 %219 = OpConstant 3.67402E-40 
                                       f32 %226 = OpConstant 3.67402E-40 
                                       f32 %228 = OpConstant 3.67402E-40 
                                     f32_2 %231 = OpConstantComposite %228 %228 
                                           %252 = OpTypePointer Input %7 
                              Input f32_4* %253 = OpVariable Input 
                                     f32_4 %256 = OpConstantComposite %65 %65 %65 %65 
                            Private f32_4* %258 = OpVariable Private 
                                           %262 = OpTypePointer Output %7 
                             Output f32_4* %263 = OpVariable Output 
                                           %265 = OpTypePointer Uniform %7 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                             Function f32* %129 = OpVariable Function 
                             Function f32* %151 = OpVariable Function 
                             Function f32* %186 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                        f32 %22 = OpCompositeExtract %19 3 
                               Private f32* %25 = OpAccessChain %9 %23 
                                                    OpStore %25 %22 
                               Private f32* %27 = OpAccessChain %9 %23 
                                        f32 %28 = OpLoad %27 
                                        f32 %30 = OpFAdd %28 %29 
                               Private f32* %31 = OpAccessChain %26 %23 
                                                    OpStore %31 %30 
                               Private f32* %35 = OpAccessChain %26 %23 
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
                                      f32_2 %52 = OpLoad %17 
                                      f32_2 %55 = OpFAdd %52 %54 
                                                    OpStore %51 %55 
                               Private f32* %57 = OpAccessChain %51 %23 
                                        f32 %58 = OpLoad %57 
                                        f32 %59 = OpExtInst %1 4 %58 
                               Private f32* %61 = OpAccessChain %51 %60 
                                        f32 %62 = OpLoad %61 
                                        f32 %63 = OpExtInst %1 4 %62 
                                        f32 %64 = OpExtInst %1 40 %59 %63 
                                                    OpStore %56 %64 
                                        f32 %66 = OpLoad %56 
                                        f32 %67 = OpFDiv %65 %66 
                                                    OpStore %56 %67 
                               Private f32* %69 = OpAccessChain %51 %23 
                                        f32 %70 = OpLoad %69 
                                        f32 %71 = OpExtInst %1 4 %70 
                               Private f32* %72 = OpAccessChain %51 %60 
                                        f32 %73 = OpLoad %72 
                                        f32 %74 = OpExtInst %1 4 %73 
                                        f32 %75 = OpExtInst %1 37 %71 %74 
                                                    OpStore %68 %75 
                                        f32 %76 = OpLoad %56 
                                        f32 %77 = OpLoad %68 
                                        f32 %78 = OpFMul %76 %77 
                                                    OpStore %56 %78 
                                        f32 %79 = OpLoad %56 
                                        f32 %80 = OpLoad %56 
                                        f32 %81 = OpFMul %79 %80 
                                                    OpStore %68 %81 
                                        f32 %83 = OpLoad %68 
                                        f32 %85 = OpFMul %83 %84 
                                        f32 %87 = OpFAdd %85 %86 
                               Private f32* %88 = OpAccessChain %82 %23 
                                                    OpStore %88 %87 
                                        f32 %89 = OpLoad %68 
                               Private f32* %90 = OpAccessChain %82 %23 
                                        f32 %91 = OpLoad %90 
                                        f32 %92 = OpFMul %89 %91 
                                        f32 %94 = OpFAdd %92 %93 
                               Private f32* %95 = OpAccessChain %82 %23 
                                                    OpStore %95 %94 
                                        f32 %96 = OpLoad %68 
                               Private f32* %97 = OpAccessChain %82 %23 
                                        f32 %98 = OpLoad %97 
                                        f32 %99 = OpFMul %96 %98 
                                       f32 %101 = OpFAdd %99 %100 
                              Private f32* %102 = OpAccessChain %82 %23 
                                                    OpStore %102 %101 
                                       f32 %103 = OpLoad %68 
                              Private f32* %104 = OpAccessChain %82 %23 
                                       f32 %105 = OpLoad %104 
                                       f32 %106 = OpFMul %103 %105 
                                       f32 %108 = OpFAdd %106 %107 
                                                    OpStore %68 %108 
                                       f32 %109 = OpLoad %68 
                                       f32 %110 = OpLoad %56 
                                       f32 %111 = OpFMul %109 %110 
                              Private f32* %112 = OpAccessChain %82 %23 
                                                    OpStore %112 %111 
                              Private f32* %113 = OpAccessChain %82 %23 
                                       f32 %114 = OpLoad %113 
                                       f32 %116 = OpFMul %114 %115 
                                       f32 %118 = OpFAdd %116 %117 
                              Private f32* %119 = OpAccessChain %82 %23 
                                                    OpStore %119 %118 
                              Private f32* %121 = OpAccessChain %51 %23 
                                       f32 %122 = OpLoad %121 
                                       f32 %123 = OpExtInst %1 4 %122 
                              Private f32* %124 = OpAccessChain %51 %60 
                                       f32 %125 = OpLoad %124 
                                       f32 %126 = OpExtInst %1 4 %125 
                                      bool %127 = OpFOrdLessThan %123 %126 
                                                    OpStore %120 %127 
                                      bool %130 = OpLoad %120 
                                                    OpSelectionMerge %132 None 
                                                    OpBranchConditional %130 %131 %135 
                                           %131 = OpLabel 
                              Private f32* %133 = OpAccessChain %82 %23 
                                       f32 %134 = OpLoad %133 
                                                    OpStore %129 %134 
                                                    OpBranch %132 
                                           %135 = OpLabel 
                                                    OpStore %129 %37 
                                                    OpBranch %132 
                                           %132 = OpLabel 
                                       f32 %136 = OpLoad %129 
                              Private f32* %137 = OpAccessChain %82 %23 
                                                    OpStore %137 %136 
                                       f32 %138 = OpLoad %56 
                                       f32 %139 = OpLoad %68 
                                       f32 %140 = OpFMul %138 %139 
                              Private f32* %141 = OpAccessChain %82 %23 
                                       f32 %142 = OpLoad %141 
                                       f32 %143 = OpFAdd %140 %142 
                                                    OpStore %56 %143 
                              Private f32* %145 = OpAccessChain %51 %23 
                                       f32 %146 = OpLoad %145 
                              Private f32* %147 = OpAccessChain %51 %23 
                                       f32 %148 = OpLoad %147 
                                       f32 %149 = OpFNegate %148 
                                      bool %150 = OpFOrdLessThan %146 %149 
                                                    OpStore %144 %150 
                                      bool %152 = OpLoad %144 
                                                    OpSelectionMerge %154 None 
                                                    OpBranchConditional %152 %153 %156 
                                           %153 = OpLabel 
                                                    OpStore %151 %155 
                                                    OpBranch %154 
                                           %156 = OpLabel 
                                                    OpStore %151 %37 
                                                    OpBranch %154 
                                           %154 = OpLabel 
                                       f32 %157 = OpLoad %151 
                                                    OpStore %68 %157 
                                       f32 %158 = OpLoad %68 
                                       f32 %159 = OpLoad %56 
                                       f32 %160 = OpFAdd %158 %159 
                                                    OpStore %56 %160 
                              Private f32* %161 = OpAccessChain %51 %23 
                                       f32 %162 = OpLoad %161 
                              Private f32* %163 = OpAccessChain %51 %60 
                                       f32 %164 = OpLoad %163 
                                       f32 %165 = OpExtInst %1 37 %162 %164 
                                                    OpStore %68 %165 
                                       f32 %166 = OpLoad %68 
                                       f32 %167 = OpLoad %68 
                                       f32 %168 = OpFNegate %167 
                                      bool %169 = OpFOrdLessThan %166 %168 
                                                    OpStore %144 %169 
                              Private f32* %170 = OpAccessChain %51 %23 
                                       f32 %171 = OpLoad %170 
                              Private f32* %172 = OpAccessChain %51 %60 
                                       f32 %173 = OpLoad %172 
                                       f32 %174 = OpExtInst %1 40 %171 %173 
                              Private f32* %175 = OpAccessChain %82 %23 
                                                    OpStore %175 %174 
                              Private f32* %177 = OpAccessChain %82 %23 
                                       f32 %178 = OpLoad %177 
                              Private f32* %179 = OpAccessChain %82 %23 
                                       f32 %180 = OpLoad %179 
                                       f32 %181 = OpFNegate %180 
                                      bool %182 = OpFOrdGreaterThanEqual %178 %181 
                                                    OpStore %176 %182 
                                      bool %183 = OpLoad %144 
                                      bool %184 = OpLoad %176 
                                      bool %185 = OpLogicalAnd %183 %184 
                                                    OpStore %144 %185 
                                      bool %187 = OpLoad %144 
                                                    OpSelectionMerge %189 None 
                                                    OpBranchConditional %187 %188 %192 
                                           %188 = OpLabel 
                                       f32 %190 = OpLoad %56 
                                       f32 %191 = OpFNegate %190 
                                                    OpStore %186 %191 
                                                    OpBranch %189 
                                           %192 = OpLabel 
                                       f32 %193 = OpLoad %56 
                                                    OpStore %186 %193 
                                                    OpBranch %189 
                                           %189 = OpLabel 
                                       f32 %194 = OpLoad %186 
                                                    OpStore %56 %194 
                              Uniform f32* %199 = OpAccessChain %197 %41 %23 
                                       f32 %200 = OpLoad %199 
                                       f32 %202 = OpFMul %200 %201 
                                       f32 %203 = OpLoad %56 
                                       f32 %204 = OpFAdd %202 %203 
                                                    OpStore %56 %204 
                                       f32 %205 = OpLoad %56 
                                       f32 %206 = OpFMul %205 %201 
                              Uniform f32* %208 = OpAccessChain %197 %41 %207 
                                       f32 %209 = OpLoad %208 
                                       f32 %210 = OpFAdd %206 %209 
                                                    OpStore %68 %210 
                                       f32 %211 = OpLoad %56 
                                       f32 %213 = OpFMul %211 %212 
                                                    OpStore %56 %213 
                                       f32 %214 = OpLoad %56 
                                       f32 %215 = OpExtInst %1 13 %214 
                                                    OpStore %56 %215 
                                       f32 %216 = OpLoad %56 
                                       f32 %217 = OpFAdd %216 %65 
                                                    OpStore %56 %217 
                                       f32 %218 = OpLoad %56 
                                       f32 %220 = OpFMul %218 %219 
                                                    OpStore %56 %220 
                                       f32 %221 = OpLoad %68 
                                       f32 %222 = OpExtInst %1 14 %221 
                                                    OpStore %68 %222 
                                       f32 %223 = OpLoad %68 
                                       f32 %224 = OpFAdd %223 %65 
                                                    OpStore %68 %224 
                                       f32 %225 = OpLoad %68 
                                       f32 %227 = OpFMul %225 %226 
                                       f32 %229 = OpFAdd %227 %228 
                                                    OpStore %68 %229 
                                     f32_2 %230 = OpLoad %51 
                                     f32_2 %232 = OpFMul %230 %231 
                                                    OpStore %82 %232 
                                     f32_2 %233 = OpLoad %51 
                                       f32 %234 = OpLoad %68 
                                     f32_2 %235 = OpCompositeConstruct %234 %234 
                                     f32_2 %236 = OpFMul %233 %235 
                                     f32_2 %237 = OpLoad %82 
                                     f32_2 %238 = OpFNegate %237 
                                     f32_2 %239 = OpFAdd %236 %238 
                                                    OpStore %51 %239 
                                       f32 %240 = OpLoad %56 
                                     f32_2 %241 = OpCompositeConstruct %240 %240 
                                     f32_2 %242 = OpLoad %51 
                                     f32_2 %243 = OpFMul %241 %242 
                                     f32_2 %244 = OpLoad %82 
                                     f32_2 %245 = OpFAdd %243 %244 
                                                    OpStore %51 %245 
                                     f32_2 %246 = OpLoad %51 
                                     f32_2 %247 = OpLoad %17 
                                     f32_2 %248 = OpFAdd %246 %247 
                                                    OpStore %51 %248 
                read_only Texture2DSampled %249 = OpLoad %13 
                                     f32_2 %250 = OpLoad %51 
                                     f32_4 %251 = OpImageSampleImplicitLod %249 %250 
                                                    OpStore %9 %251 
                                     f32_4 %254 = OpLoad %253 
                                     f32_4 %255 = OpFNegate %254 
                                     f32_4 %257 = OpFAdd %255 %256 
                                                    OpStore %26 %257 
                                     f32_4 %259 = OpLoad %9 
                                     f32_4 %260 = OpLoad %26 
                                     f32_4 %261 = OpFAdd %259 %260 
                                                    OpStore %258 %261 
                                     f32_4 %264 = OpLoad %258 
                            Uniform f32_4* %266 = OpAccessChain %197 %42 
                                     f32_4 %267 = OpLoad %266 
                                     f32_4 %268 = OpFMul %264 %267 
                                                    OpStore %263 %268 
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
}