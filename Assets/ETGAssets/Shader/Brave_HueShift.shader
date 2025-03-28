//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/HueShift" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_HueShift ("HueShift", Float) = 0
_TimeHueShiftFactor ("Time Factor", Float) = 0
_SaturationShift ("SaturationShift", Float) = 1
_ValueShift ("ValueShift", Float) = 1
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
  GpuProgramID 31446
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

uniform 	vec4 _Time;
uniform 	float _HueShift;
uniform 	float _TimeHueShiftFactor;
uniform 	float _SaturationShift;
uniform 	float _ValueShift;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec2 u_xlat5;
float u_xlat9;
float u_xlat13;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = _Time.x * _TimeHueShiftFactor;
    u_xlat1 = u_xlat1 * 360.0;
    u_xlat1 = _HueShift * 360.0 + u_xlat1;
    u_xlat1 = u_xlat1 * 0.0174532942;
    u_xlat2.x = cos(u_xlat1);
    u_xlat1 = sin(u_xlat1);
    u_xlat5.x = _SaturationShift * _ValueShift;
    u_xlat9 = u_xlat2.x * u_xlat5.x;
    u_xlat1 = u_xlat1 * u_xlat5.x;
    u_xlat2 = vec4(u_xlat9) * vec4(0.412999988, 0.300000012, 0.588, 0.885999978);
    u_xlat3 = vec4(u_xlat9) * vec4(0.700999975, 0.587000012, 0.114, 0.298999995);
    u_xlat5.xy = vec2(_ValueShift) * vec2(0.298999995, 0.587000012) + (-u_xlat2.yz);
    u_xlat2.xy = vec2(_ValueShift) * vec2(0.587000012, 0.114) + u_xlat2.xw;
    u_xlat5.x = u_xlat1 * 1.25 + u_xlat5.x;
    u_xlat9 = (-u_xlat1) * 1.04999995 + u_xlat5.y;
    u_xlat9 = u_xlat0.y * u_xlat9;
    u_xlat5.x = u_xlat5.x * u_xlat0.x + u_xlat9;
    u_xlat9 = (-u_xlat1) * 0.202999994 + u_xlat2.y;
    u_xlat13 = u_xlat1 * 0.0350000001 + u_xlat2.x;
    SV_Target0.z = u_xlat9 * u_xlat0.z + u_xlat5.x;
    u_xlat5.x = _ValueShift * 0.298999995 + u_xlat3.x;
    u_xlat2.xyz = vec3(_ValueShift) * vec3(0.587000012, 0.114, 0.298999995) + (-u_xlat3.yzw);
    u_xlat5.x = u_xlat1 * 0.167999998 + u_xlat5.x;
    u_xlat9 = u_xlat1 * 0.330000013 + u_xlat2.x;
    u_xlat9 = u_xlat0.y * u_xlat9;
    u_xlat5.x = u_xlat5.x * u_xlat0.x + u_xlat9;
    u_xlat2.xz = (-vec2(u_xlat1)) * vec2(0.497000009, 0.328000009) + u_xlat2.yz;
    u_xlat1 = u_xlat1 * 0.291999996 + u_xlat2.y;
    SV_Target0.x = u_xlat2.x * u_xlat0.z + u_xlat5.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.z;
    u_xlat0.x = u_xlat13 * u_xlat0.y + u_xlat0.x;
    SV_Target0.y = u_xlat1 * u_xlat0.z + u_xlat0.x;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
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
; Bound: 286
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %17 %27 %283 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %9 RelaxedPrecision 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate %14 RelaxedPrecision 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %21 RelaxedPrecision 
                                                     OpDecorate %25 RelaxedPrecision 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %30 RelaxedPrecision 
                                                     OpDecorate %31 RelaxedPrecision 
                                                     OpDecorate %33 RelaxedPrecision 
                                                     OpDecorate %34 RelaxedPrecision 
                                                     OpDecorate %35 RelaxedPrecision 
                                                     OpDecorate %36 RelaxedPrecision 
                                                     OpDecorate %37 RelaxedPrecision 
                                                     OpDecorate %41 RelaxedPrecision 
                                                     OpMemberDecorate %56 0 Offset 56 
                                                     OpMemberDecorate %56 1 Offset 56 
                                                     OpMemberDecorate %56 2 Offset 56 
                                                     OpMemberDecorate %56 3 Offset 56 
                                                     OpMemberDecorate %56 4 Offset 56 
                                                     OpDecorate %56 Block 
                                                     OpDecorate %58 DescriptorSet 58 
                                                     OpDecorate %58 Binding 58 
                                                     OpDecorate %155 RelaxedPrecision 
                                                     OpDecorate %161 RelaxedPrecision 
                                                     OpDecorate %183 RelaxedPrecision 
                                                     OpDecorate %222 RelaxedPrecision 
                                                     OpDecorate %228 RelaxedPrecision 
                                                     OpDecorate %254 RelaxedPrecision 
                                                     OpDecorate %262 RelaxedPrecision 
                                                     OpDecorate %268 RelaxedPrecision 
                                                     OpDecorate %274 RelaxedPrecision 
                                                     OpDecorate %280 RelaxedPrecision 
                                                     OpDecorate %283 RelaxedPrecision 
                                                     OpDecorate %283 Location 283 
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
                                             %22 = OpTypeInt 32 0 
                                         u32 %23 = OpConstant 3 
                                             %26 = OpTypePointer Input %7 
                                Input f32_4* %27 = OpVariable Input 
                                             %28 = OpTypePointer Input %6 
                                         f32 %32 = OpConstant 3.67402E-40 
                              Private f32_4* %34 = OpVariable Private 
                                             %38 = OpTypeBool 
                                             %39 = OpTypePointer Private %38 
                               Private bool* %40 = OpVariable Private 
                                         f32 %42 = OpConstant 3.67402E-40 
                                             %45 = OpTypeInt 32 1 
                                         i32 %46 = OpConstant 0 
                                         i32 %47 = OpConstant 1 
                                         i32 %49 = OpConstant -1 
                                Private f32* %55 = OpVariable Private 
                                             %56 = OpTypeStruct %7 %6 %6 %6 %6 
                                             %57 = OpTypePointer Uniform %56 
Uniform struct {f32_4; f32; f32; f32; f32;}* %58 = OpVariable Uniform 
                                         u32 %59 = OpConstant 0 
                                             %60 = OpTypePointer Uniform %6 
                                         i32 %63 = OpConstant 2 
                                         f32 %68 = OpConstant 3.67402E-40 
                                         f32 %76 = OpConstant 3.67402E-40 
                              Private f32_4* %78 = OpVariable Private 
                                             %84 = OpTypePointer Private %15 
                              Private f32_2* %85 = OpVariable Private 
                                         i32 %86 = OpConstant 3 
                                         i32 %89 = OpConstant 4 
                                Private f32* %94 = OpVariable Private 
                             Private f32_4* %104 = OpVariable Private 
                                        f32 %107 = OpConstant 3.67402E-40 
                                        f32 %108 = OpConstant 3.67402E-40 
                                        f32 %109 = OpConstant 3.67402E-40 
                                        f32 %110 = OpConstant 3.67402E-40 
                                      f32_4 %111 = OpConstantComposite %107 %108 %109 %110 
                                        f32 %115 = OpConstant 3.67402E-40 
                                        f32 %116 = OpConstant 3.67402E-40 
                                        f32 %117 = OpConstant 3.67402E-40 
                                        f32 %118 = OpConstant 3.67402E-40 
                                      f32_4 %119 = OpConstantComposite %115 %116 %117 %118 
                                      f32_2 %124 = OpConstantComposite %118 %116 
                             Private f32_2* %130 = OpVariable Private 
                                      f32_2 %134 = OpConstantComposite %116 %117 
                                        f32 %140 = OpConstant 3.67402E-40 
                                        f32 %148 = OpConstant 3.67402E-40 
                                        u32 %150 = OpConstant 1 
                                        f32 %168 = OpConstant 3.67402E-40 
                               Private f32* %173 = OpVariable Private 
                                        f32 %175 = OpConstant 3.67402E-40 
                                        u32 %181 = OpConstant 2 
                                            %198 = OpTypeVector %6 3 
                                      f32_3 %200 = OpConstantComposite %116 %117 %118 
                                        f32 %209 = OpConstant 3.67402E-40 
                                        f32 %216 = OpConstant 3.67402E-40 
                                        f32 %236 = OpConstant 3.67402E-40 
                                        f32 %237 = OpConstant 3.67402E-40 
                                      f32_2 %238 = OpConstantComposite %236 %237 
                                        f32 %246 = OpConstant 3.67402E-40 
                               Private f32* %260 = OpVariable Private 
                                            %282 = OpTypePointer Output %7 
                              Output f32_4* %283 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                  read_only Texture2DSampled %14 = OpLoad %13 
                                       f32_2 %18 = OpLoad %17 
                                       f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                     OpStore %9 %19 
                                Private f32* %24 = OpAccessChain %9 %23 
                                         f32 %25 = OpLoad %24 
                                  Input f32* %29 = OpAccessChain %27 %23 
                                         f32 %30 = OpLoad %29 
                                         f32 %31 = OpFMul %25 %30 
                                         f32 %33 = OpFAdd %31 %32 
                                                     OpStore %21 %33 
                                       f32_4 %35 = OpLoad %9 
                                       f32_4 %36 = OpLoad %27 
                                       f32_4 %37 = OpFMul %35 %36 
                                                     OpStore %34 %37 
                                         f32 %41 = OpLoad %21 
                                        bool %43 = OpFOrdLessThan %41 %42 
                                                     OpStore %40 %43 
                                        bool %44 = OpLoad %40 
                                         i32 %48 = OpSelect %44 %47 %46 
                                         i32 %50 = OpIMul %48 %49 
                                        bool %51 = OpINotEqual %50 %46 
                                                     OpSelectionMerge %53 None 
                                                     OpBranchConditional %51 %52 %53 
                                             %52 = OpLabel 
                                                     OpKill
                                             %53 = OpLabel 
                                Uniform f32* %61 = OpAccessChain %58 %46 %59 
                                         f32 %62 = OpLoad %61 
                                Uniform f32* %64 = OpAccessChain %58 %63 
                                         f32 %65 = OpLoad %64 
                                         f32 %66 = OpFMul %62 %65 
                                                     OpStore %55 %66 
                                         f32 %67 = OpLoad %55 
                                         f32 %69 = OpFMul %67 %68 
                                                     OpStore %55 %69 
                                Uniform f32* %70 = OpAccessChain %58 %47 
                                         f32 %71 = OpLoad %70 
                                         f32 %72 = OpFMul %71 %68 
                                         f32 %73 = OpLoad %55 
                                         f32 %74 = OpFAdd %72 %73 
                                                     OpStore %55 %74 
                                         f32 %75 = OpLoad %55 
                                         f32 %77 = OpFMul %75 %76 
                                                     OpStore %55 %77 
                                         f32 %79 = OpLoad %55 
                                         f32 %80 = OpExtInst %1 14 %79 
                                Private f32* %81 = OpAccessChain %78 %59 
                                                     OpStore %81 %80 
                                         f32 %82 = OpLoad %55 
                                         f32 %83 = OpExtInst %1 13 %82 
                                                     OpStore %55 %83 
                                Uniform f32* %87 = OpAccessChain %58 %86 
                                         f32 %88 = OpLoad %87 
                                Uniform f32* %90 = OpAccessChain %58 %89 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFMul %88 %91 
                                Private f32* %93 = OpAccessChain %85 %59 
                                                     OpStore %93 %92 
                                Private f32* %95 = OpAccessChain %78 %59 
                                         f32 %96 = OpLoad %95 
                                Private f32* %97 = OpAccessChain %85 %59 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFMul %96 %98 
                                                     OpStore %94 %99 
                                        f32 %100 = OpLoad %55 
                               Private f32* %101 = OpAccessChain %85 %59 
                                        f32 %102 = OpLoad %101 
                                        f32 %103 = OpFMul %100 %102 
                                                     OpStore %55 %103 
                                        f32 %105 = OpLoad %94 
                                      f32_4 %106 = OpCompositeConstruct %105 %105 %105 %105 
                                      f32_4 %112 = OpFMul %106 %111 
                                                     OpStore %104 %112 
                                        f32 %113 = OpLoad %94 
                                      f32_4 %114 = OpCompositeConstruct %113 %113 %113 %113 
                                      f32_4 %120 = OpFMul %114 %119 
                                                     OpStore %78 %120 
                               Uniform f32* %121 = OpAccessChain %58 %89 
                                        f32 %122 = OpLoad %121 
                                      f32_2 %123 = OpCompositeConstruct %122 %122 
                                      f32_2 %125 = OpFMul %123 %124 
                                      f32_4 %126 = OpLoad %104 
                                      f32_2 %127 = OpVectorShuffle %126 %126 1 2 
                                      f32_2 %128 = OpFNegate %127 
                                      f32_2 %129 = OpFAdd %125 %128 
                                                     OpStore %85 %129 
                               Uniform f32* %131 = OpAccessChain %58 %89 
                                        f32 %132 = OpLoad %131 
                                      f32_2 %133 = OpCompositeConstruct %132 %132 
                                      f32_2 %135 = OpFMul %133 %134 
                                      f32_4 %136 = OpLoad %104 
                                      f32_2 %137 = OpVectorShuffle %136 %136 0 3 
                                      f32_2 %138 = OpFAdd %135 %137 
                                                     OpStore %130 %138 
                                        f32 %139 = OpLoad %55 
                                        f32 %141 = OpFMul %139 %140 
                               Private f32* %142 = OpAccessChain %85 %59 
                                        f32 %143 = OpLoad %142 
                                        f32 %144 = OpFAdd %141 %143 
                               Private f32* %145 = OpAccessChain %85 %59 
                                                     OpStore %145 %144 
                                        f32 %146 = OpLoad %55 
                                        f32 %147 = OpFNegate %146 
                                        f32 %149 = OpFMul %147 %148 
                               Private f32* %151 = OpAccessChain %85 %150 
                                        f32 %152 = OpLoad %151 
                                        f32 %153 = OpFAdd %149 %152 
                                                     OpStore %94 %153 
                               Private f32* %154 = OpAccessChain %34 %150 
                                        f32 %155 = OpLoad %154 
                                        f32 %156 = OpLoad %94 
                                        f32 %157 = OpFMul %155 %156 
                                                     OpStore %94 %157 
                               Private f32* %158 = OpAccessChain %85 %59 
                                        f32 %159 = OpLoad %158 
                               Private f32* %160 = OpAccessChain %34 %59 
                                        f32 %161 = OpLoad %160 
                                        f32 %162 = OpFMul %159 %161 
                                        f32 %163 = OpLoad %94 
                                        f32 %164 = OpFAdd %162 %163 
                               Private f32* %165 = OpAccessChain %85 %59 
                                                     OpStore %165 %164 
                                        f32 %166 = OpLoad %55 
                                        f32 %167 = OpFNegate %166 
                                        f32 %169 = OpFMul %167 %168 
                               Private f32* %170 = OpAccessChain %130 %150 
                                        f32 %171 = OpLoad %170 
                                        f32 %172 = OpFAdd %169 %171 
                                                     OpStore %94 %172 
                                        f32 %174 = OpLoad %55 
                                        f32 %176 = OpFMul %174 %175 
                               Private f32* %177 = OpAccessChain %130 %59 
                                        f32 %178 = OpLoad %177 
                                        f32 %179 = OpFAdd %176 %178 
                                                     OpStore %173 %179 
                                        f32 %180 = OpLoad %94 
                               Private f32* %182 = OpAccessChain %34 %181 
                                        f32 %183 = OpLoad %182 
                                        f32 %184 = OpFMul %180 %183 
                               Private f32* %185 = OpAccessChain %85 %59 
                                        f32 %186 = OpLoad %185 
                                        f32 %187 = OpFAdd %184 %186 
                               Private f32* %188 = OpAccessChain %104 %181 
                                                     OpStore %188 %187 
                               Uniform f32* %189 = OpAccessChain %58 %89 
                                        f32 %190 = OpLoad %189 
                                        f32 %191 = OpFMul %190 %118 
                               Private f32* %192 = OpAccessChain %78 %59 
                                        f32 %193 = OpLoad %192 
                                        f32 %194 = OpFAdd %191 %193 
                               Private f32* %195 = OpAccessChain %85 %59 
                                                     OpStore %195 %194 
                               Uniform f32* %196 = OpAccessChain %58 %89 
                                        f32 %197 = OpLoad %196 
                                      f32_3 %199 = OpCompositeConstruct %197 %197 %197 
                                      f32_3 %201 = OpFMul %199 %200 
                                      f32_4 %202 = OpLoad %78 
                                      f32_3 %203 = OpVectorShuffle %202 %202 1 2 3 
                                      f32_3 %204 = OpFNegate %203 
                                      f32_3 %205 = OpFAdd %201 %204 
                                      f32_4 %206 = OpLoad %78 
                                      f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                     OpStore %78 %207 
                                        f32 %208 = OpLoad %55 
                                        f32 %210 = OpFMul %208 %209 
                               Private f32* %211 = OpAccessChain %85 %59 
                                        f32 %212 = OpLoad %211 
                                        f32 %213 = OpFAdd %210 %212 
                               Private f32* %214 = OpAccessChain %85 %59 
                                                     OpStore %214 %213 
                                        f32 %215 = OpLoad %55 
                                        f32 %217 = OpFMul %215 %216 
                               Private f32* %218 = OpAccessChain %78 %59 
                                        f32 %219 = OpLoad %218 
                                        f32 %220 = OpFAdd %217 %219 
                                                     OpStore %94 %220 
                               Private f32* %221 = OpAccessChain %34 %150 
                                        f32 %222 = OpLoad %221 
                                        f32 %223 = OpLoad %94 
                                        f32 %224 = OpFMul %222 %223 
                                                     OpStore %94 %224 
                               Private f32* %225 = OpAccessChain %85 %59 
                                        f32 %226 = OpLoad %225 
                               Private f32* %227 = OpAccessChain %34 %59 
                                        f32 %228 = OpLoad %227 
                                        f32 %229 = OpFMul %226 %228 
                                        f32 %230 = OpLoad %94 
                                        f32 %231 = OpFAdd %229 %230 
                               Private f32* %232 = OpAccessChain %85 %59 
                                                     OpStore %232 %231 
                                        f32 %233 = OpLoad %55 
                                      f32_2 %234 = OpCompositeConstruct %233 %233 
                                      f32_2 %235 = OpFNegate %234 
                                      f32_2 %239 = OpFMul %235 %238 
                                      f32_4 %240 = OpLoad %78 
                                      f32_2 %241 = OpVectorShuffle %240 %240 1 2 
                                      f32_2 %242 = OpFAdd %239 %241 
                                      f32_4 %243 = OpLoad %78 
                                      f32_4 %244 = OpVectorShuffle %243 %242 4 1 5 3 
                                                     OpStore %78 %244 
                                        f32 %245 = OpLoad %55 
                                        f32 %247 = OpFMul %245 %246 
                               Private f32* %248 = OpAccessChain %78 %150 
                                        f32 %249 = OpLoad %248 
                                        f32 %250 = OpFAdd %247 %249 
                                                     OpStore %55 %250 
                               Private f32* %251 = OpAccessChain %78 %59 
                                        f32 %252 = OpLoad %251 
                               Private f32* %253 = OpAccessChain %34 %181 
                                        f32 %254 = OpLoad %253 
                                        f32 %255 = OpFMul %252 %254 
                               Private f32* %256 = OpAccessChain %85 %59 
                                        f32 %257 = OpLoad %256 
                                        f32 %258 = OpFAdd %255 %257 
                               Private f32* %259 = OpAccessChain %104 %59 
                                                     OpStore %259 %258 
                               Private f32* %261 = OpAccessChain %34 %59 
                                        f32 %262 = OpLoad %261 
                               Private f32* %263 = OpAccessChain %78 %181 
                                        f32 %264 = OpLoad %263 
                                        f32 %265 = OpFMul %262 %264 
                                                     OpStore %260 %265 
                                        f32 %266 = OpLoad %173 
                               Private f32* %267 = OpAccessChain %34 %150 
                                        f32 %268 = OpLoad %267 
                                        f32 %269 = OpFMul %266 %268 
                                        f32 %270 = OpLoad %260 
                                        f32 %271 = OpFAdd %269 %270 
                                                     OpStore %260 %271 
                                        f32 %272 = OpLoad %55 
                               Private f32* %273 = OpAccessChain %34 %181 
                                        f32 %274 = OpLoad %273 
                                        f32 %275 = OpFMul %272 %274 
                                        f32 %276 = OpLoad %260 
                                        f32 %277 = OpFAdd %275 %276 
                               Private f32* %278 = OpAccessChain %104 %150 
                                                     OpStore %278 %277 
                               Private f32* %279 = OpAccessChain %34 %23 
                                        f32 %280 = OpLoad %279 
                               Private f32* %281 = OpAccessChain %104 %23 
                                                     OpStore %281 %280 
                                      f32_4 %284 = OpLoad %104 
                                                     OpStore %283 %284 
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
Fallback "VertexLit"
}