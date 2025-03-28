//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/DarknessChallengeShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_ConeAngle ("Cone Angle", Float) = 30
_FadeRange ("Fade Angle", Float) = 10
_Player1ScreenPosition ("Player 1 Pos", Vector) = (0.5,0.5,0,0)
_Player2ScreenPosition ("Player 2 Pos", Vector) = (0.5,0.5,0,0)
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 19286
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _ConeAngle;
uniform 	vec4 _Player1ScreenPosition;
uniform 	vec4 _Player2ScreenPosition;
uniform 	float _FadeRange;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat16_2;
float u_xlat3;
float u_xlat16_3;
bool u_xlatb3;
float u_xlat4;
bool u_xlatb4;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_Player1ScreenPosition.xy);
    u_xlat0.x = u_xlat0.x * 1.77777779;
    u_xlat6.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat9 = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat6.x = u_xlat6.x * u_xlat9;
    u_xlat9 = u_xlat6.x * u_xlat6.x;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6.x;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6.x = u_xlat6.x * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.x<(-u_xlat0.x);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6.x = u_xlat9 + u_xlat6.x;
    u_xlat9 = min(u_xlat0.x, u_xlat0.y);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.x, u_xlat0.y);
    u_xlat3 = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat0.x * u_xlat0.x + u_xlat3;
    u_xlatb3 = u_xlat1>=(-u_xlat1);
    u_xlatb3 = u_xlatb3 && u_xlatb9;
    u_xlat3 = (u_xlatb3) ? (-u_xlat6.x) : u_xlat6.x;
    u_xlat6.x = u_xlat3 * 57.2957802 + 360.0;
    u_xlat6.x = (-u_xlat6.x) + _Player1ScreenPosition.z;
    u_xlat9 = (-u_xlat3) * 57.2957802 + _Player1ScreenPosition.z;
    u_xlat6.x = min(abs(u_xlat6.x), abs(u_xlat9));
    u_xlat9 = _Player1ScreenPosition.z + 360.0;
    u_xlat3 = (-u_xlat3) * 57.2957802 + u_xlat9;
    u_xlat3 = min(u_xlat6.x, abs(u_xlat3));
    u_xlat6.xy = vs_TEXCOORD0.xy + (-_Player2ScreenPosition.xy);
    u_xlat6.x = u_xlat6.x * 1.77777779;
    u_xlat1 = max(abs(u_xlat6.x), abs(u_xlat6.y));
    u_xlat1 = float(1.0) / u_xlat1;
    u_xlat4 = min(abs(u_xlat6.x), abs(u_xlat6.y));
    u_xlat1 = u_xlat1 * u_xlat4;
    u_xlat4 = u_xlat1 * u_xlat1;
    u_xlat7 = u_xlat4 * 0.0208350997 + -0.0851330012;
    u_xlat7 = u_xlat4 * u_xlat7 + 0.180141002;
    u_xlat7 = u_xlat4 * u_xlat7 + -0.330299497;
    u_xlat4 = u_xlat4 * u_xlat7 + 0.999866009;
    u_xlat7 = u_xlat4 * u_xlat1;
    u_xlat7 = u_xlat7 * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat6.x)<abs(u_xlat6.y);
    u_xlat7 = u_xlatb10 ? u_xlat7 : float(0.0);
    u_xlat1 = u_xlat1 * u_xlat4 + u_xlat7;
    u_xlatb4 = u_xlat6.x<(-u_xlat6.x);
    u_xlat4 = u_xlatb4 ? -3.14159274 : float(0.0);
    u_xlat1 = u_xlat4 + u_xlat1;
    u_xlat4 = min(u_xlat6.x, u_xlat6.y);
    u_xlatb4 = u_xlat4<(-u_xlat4);
    u_xlat7 = max(u_xlat6.x, u_xlat6.y);
    u_xlat9 = u_xlat6.y * u_xlat6.y;
    u_xlat6.x = u_xlat6.x * u_xlat6.x + u_xlat9;
    u_xlat0.x = min(u_xlat6.x, u_xlat0.x);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb6 = u_xlat7>=(-u_xlat7);
    u_xlatb6 = u_xlatb6 && u_xlatb4;
    u_xlat6.x = (u_xlatb6) ? (-u_xlat1) : u_xlat1;
    u_xlat9 = u_xlat6.x * 57.2957802 + 360.0;
    u_xlat9 = (-u_xlat9) + _Player2ScreenPosition.z;
    u_xlat1 = (-u_xlat6.x) * 57.2957802 + _Player2ScreenPosition.z;
    u_xlat9 = min(abs(u_xlat9), abs(u_xlat1));
    u_xlat1 = _Player2ScreenPosition.z + 360.0;
    u_xlat6.x = (-u_xlat6.x) * 57.2957802 + u_xlat1;
    u_xlat6.x = min(u_xlat9, abs(u_xlat6.x));
    u_xlat3 = min(u_xlat6.x, u_xlat3);
    u_xlat3 = u_xlat3 + (-_ConeAngle);
    u_xlat3 = u_xlat3 + _FadeRange;
    u_xlat3 = u_xlat3 / _FadeRange;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0.x = u_xlat3 * u_xlat0.x + -0.100000001;
    u_xlat0.x = u_xlat0.x * 4.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3 = u_xlat10_1.y + u_xlat10_1.x;
    u_xlat16_3 = u_xlat16_3 + u_xlat10_1.z;
    u_xlat16_3 = u_xlat16_3 + -2.97000003;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_3 = u_xlat16_3 * 33.0 + -0.800000012;
    u_xlat16_3 = clamp(u_xlat16_3, 0.0, 1.0);
    u_xlat16_3 = u_xlat16_3 * 7.0;
    u_xlat16_3 = min(u_xlat16_3, 1.0);
    u_xlat16_2 = (-u_xlat10_1) + vec4(u_xlat16_3);
    SV_Target0 = u_xlat0.xxxx * u_xlat16_2 + u_xlat10_1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %78 
                                              OpDecorate %9 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %76 0 BuiltIn 76 
                                              OpMemberDecorate %76 1 BuiltIn 76 
                                              OpMemberDecorate %76 2 BuiltIn 76 
                                              OpDecorate %76 Block 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
                         Output f32_2* %9 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                                  i32 %50 = OpConstant 3 
                       Private f32_4* %54 = OpVariable Private 
                                  u32 %74 = OpConstant 1 
                                      %75 = OpTypeArray %6 %74 
                                      %76 = OpTypeStruct %13 %6 %75 
                                      %77 = OpTypePointer Output %76 
 Output struct {f32_4; f32; f32[1];}* %78 = OpVariable Output 
                                      %86 = OpTypePointer Output %13 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore %9 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %49 = OpLoad %15 
                       Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFAdd %49 %52 
                                              OpStore %15 %53 
                                f32_4 %55 = OpLoad %15 
                                f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                       Uniform f32_4* %57 = OpAccessChain %26 %29 %29 
                                f32_4 %58 = OpLoad %57 
                                f32_4 %59 = OpFMul %56 %58 
                                              OpStore %54 %59 
                       Uniform f32_4* %60 = OpAccessChain %26 %29 %28 
                                f32_4 %61 = OpLoad %60 
                                f32_4 %62 = OpLoad %15 
                                f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                f32_4 %64 = OpFMul %61 %63 
                                f32_4 %65 = OpLoad %54 
                                f32_4 %66 = OpFAdd %64 %65 
                                              OpStore %54 %66 
                       Uniform f32_4* %67 = OpAccessChain %26 %29 %41 
                                f32_4 %68 = OpLoad %67 
                                f32_4 %69 = OpLoad %15 
                                f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %54 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %54 %73 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %50 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %15 
                                f32_4 %82 = OpVectorShuffle %81 %81 3 3 3 3 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %54 
                                f32_4 %85 = OpFAdd %83 %84 
                        Output f32_4* %87 = OpAccessChain %78 %28 
                                              OpStore %87 %85 
                          Output f32* %89 = OpAccessChain %78 %28 %74 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %78 %28 %74 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 520
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %517 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %12 Location 12 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpMemberDecorate %14 1 Offset 14 
                                                     OpMemberDecorate %14 2 Offset 14 
                                                     OpMemberDecorate %14 3 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %452 RelaxedPrecision 
                                                     OpDecorate %456 RelaxedPrecision 
                                                     OpDecorate %456 DescriptorSet 456 
                                                     OpDecorate %456 Binding 456 
                                                     OpDecorate %457 RelaxedPrecision 
                                                     OpDecorate %460 RelaxedPrecision 
                                                     OpDecorate %462 RelaxedPrecision 
                                                     OpDecorate %463 RelaxedPrecision 
                                                     OpDecorate %466 RelaxedPrecision 
                                                     OpDecorate %470 RelaxedPrecision 
                                                     OpDecorate %472 RelaxedPrecision 
                                                     OpDecorate %473 RelaxedPrecision 
                                                     OpDecorate %476 RelaxedPrecision 
                                                     OpDecorate %478 RelaxedPrecision 
                                                     OpDecorate %479 RelaxedPrecision 
                                                     OpDecorate %482 RelaxedPrecision 
                                                     OpDecorate %483 RelaxedPrecision 
                                                     OpDecorate %486 RelaxedPrecision 
                                                     OpDecorate %488 RelaxedPrecision 
                                                     OpDecorate %490 RelaxedPrecision 
                                                     OpDecorate %493 RelaxedPrecision 
                                                     OpDecorate %494 RelaxedPrecision 
                                                     OpDecorate %497 RelaxedPrecision 
                                                     OpDecorate %499 RelaxedPrecision 
                                                     OpDecorate %501 RelaxedPrecision 
                                                     OpDecorate %503 RelaxedPrecision 
                                                     OpDecorate %504 RelaxedPrecision 
                                                     OpDecorate %505 RelaxedPrecision 
                                                     OpDecorate %506 RelaxedPrecision 
                                                     OpDecorate %507 RelaxedPrecision 
                                                     OpDecorate %508 RelaxedPrecision 
                                                     OpDecorate %509 RelaxedPrecision 
                                                     OpDecorate %512 RelaxedPrecision 
                                                     OpDecorate %514 RelaxedPrecision 
                                                     OpDecorate %517 RelaxedPrecision 
                                                     OpDecorate %517 Location 517 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                                Input f32_2* %12 = OpVariable Input 
                                             %14 = OpTypeStruct %6 %7 %7 %6 
                                             %15 = OpTypePointer Uniform %14 
   Uniform struct {f32; f32_4; f32_4; f32;}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 1 
                                             %19 = OpTypePointer Uniform %7 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 0 
                                             %29 = OpTypePointer Private %6 
                                         f32 %32 = OpConstant 3.67402E-40 
                                             %35 = OpTypePointer Private %10 
                              Private f32_2* %36 = OpVariable Private 
                                         u32 %40 = OpConstant 1 
                                         f32 %46 = OpConstant 3.67402E-40 
                                Private f32* %51 = OpVariable Private 
                                Private f32* %69 = OpVariable Private 
                                         f32 %71 = OpConstant 3.67402E-40 
                                         f32 %73 = OpConstant 3.67402E-40 
                                         f32 %78 = OpConstant 3.67402E-40 
                                         f32 %83 = OpConstant 3.67402E-40 
                                         f32 %88 = OpConstant 3.67402E-40 
                                         f32 %95 = OpConstant 3.67402E-40 
                                         f32 %97 = OpConstant 3.67402E-40 
                                             %99 = OpTypeBool 
                                            %100 = OpTypePointer Private %99 
                              Private bool* %101 = OpVariable Private 
                                            %109 = OpTypePointer Function %6 
                                        f32 %116 = OpConstant 3.67402E-40 
                              Private bool* %125 = OpVariable Private 
                                        f32 %136 = OpConstant 3.67402E-40 
                               Private f32* %158 = OpVariable Private 
                              Private bool* %172 = OpVariable Private 
                                        f32 %192 = OpConstant 3.67402E-40 
                                        f32 %194 = OpConstant 3.67402E-40 
                                        u32 %200 = OpConstant 2 
                                            %201 = OpTypePointer Uniform %6 
                                        i32 %233 = OpConstant 2 
                               Private f32* %252 = OpVariable Private 
                               Private f32* %266 = OpVariable Private 
                              Private bool* %288 = OpVariable Private 
                              Private bool* %360 = OpVariable Private 
                                        i32 %420 = OpConstant 0 
                                        i32 %426 = OpConstant 3 
                                        f32 %440 = OpConstant 3.67402E-40 
                                        f32 %445 = OpConstant 3.67402E-40 
                             Private f32_4* %452 = OpVariable Private 
                                            %453 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %454 = OpTypeSampledImage %453 
                                            %455 = OpTypePointer UniformConstant %454 
UniformConstant read_only Texture2DSampled* %456 = OpVariable UniformConstant 
                             Private f32_4* %460 = OpVariable Private 
                                            %461 = OpTypeVector %6 3 
                                        f32 %464 = OpConstant 3.67402E-40 
                                      f32_3 %465 = OpConstantComposite %464 %464 %464 
                                        f32 %487 = OpConstant 3.67402E-40 
                                        f32 %489 = OpConstant 3.67402E-40 
                                        f32 %498 = OpConstant 3.67402E-40 
                               Private f32* %501 = OpVariable Private 
                                            %516 = OpTypePointer Output %7 
                              Output f32_4* %517 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %110 = OpVariable Function 
                              Function f32* %132 = OpVariable Function 
                              Function f32* %180 = OpVariable Function 
                              Function f32* %296 = OpVariable Function 
                              Function f32* %314 = OpVariable Function 
                              Function f32* %368 = OpVariable Function 
                                       f32_2 %13 = OpLoad %12 
                              Uniform f32_4* %20 = OpAccessChain %16 %18 
                                       f32_4 %21 = OpLoad %20 
                                       f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                       f32_2 %23 = OpFNegate %22 
                                       f32_2 %24 = OpFAdd %13 %23 
                                       f32_4 %25 = OpLoad %9 
                                       f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                                     OpStore %9 %26 
                                Private f32* %30 = OpAccessChain %9 %28 
                                         f32 %31 = OpLoad %30 
                                         f32 %33 = OpFMul %31 %32 
                                Private f32* %34 = OpAccessChain %9 %28 
                                                     OpStore %34 %33 
                                Private f32* %37 = OpAccessChain %9 %28 
                                         f32 %38 = OpLoad %37 
                                         f32 %39 = OpExtInst %1 4 %38 
                                Private f32* %41 = OpAccessChain %9 %40 
                                         f32 %42 = OpLoad %41 
                                         f32 %43 = OpExtInst %1 4 %42 
                                         f32 %44 = OpExtInst %1 40 %39 %43 
                                Private f32* %45 = OpAccessChain %36 %28 
                                                     OpStore %45 %44 
                                Private f32* %47 = OpAccessChain %36 %28 
                                         f32 %48 = OpLoad %47 
                                         f32 %49 = OpFDiv %46 %48 
                                Private f32* %50 = OpAccessChain %36 %28 
                                                     OpStore %50 %49 
                                Private f32* %52 = OpAccessChain %9 %28 
                                         f32 %53 = OpLoad %52 
                                         f32 %54 = OpExtInst %1 4 %53 
                                Private f32* %55 = OpAccessChain %9 %40 
                                         f32 %56 = OpLoad %55 
                                         f32 %57 = OpExtInst %1 4 %56 
                                         f32 %58 = OpExtInst %1 37 %54 %57 
                                                     OpStore %51 %58 
                                Private f32* %59 = OpAccessChain %36 %28 
                                         f32 %60 = OpLoad %59 
                                         f32 %61 = OpLoad %51 
                                         f32 %62 = OpFMul %60 %61 
                                Private f32* %63 = OpAccessChain %36 %28 
                                                     OpStore %63 %62 
                                Private f32* %64 = OpAccessChain %36 %28 
                                         f32 %65 = OpLoad %64 
                                Private f32* %66 = OpAccessChain %36 %28 
                                         f32 %67 = OpLoad %66 
                                         f32 %68 = OpFMul %65 %67 
                                                     OpStore %51 %68 
                                         f32 %70 = OpLoad %51 
                                         f32 %72 = OpFMul %70 %71 
                                         f32 %74 = OpFAdd %72 %73 
                                                     OpStore %69 %74 
                                         f32 %75 = OpLoad %51 
                                         f32 %76 = OpLoad %69 
                                         f32 %77 = OpFMul %75 %76 
                                         f32 %79 = OpFAdd %77 %78 
                                                     OpStore %69 %79 
                                         f32 %80 = OpLoad %51 
                                         f32 %81 = OpLoad %69 
                                         f32 %82 = OpFMul %80 %81 
                                         f32 %84 = OpFAdd %82 %83 
                                                     OpStore %69 %84 
                                         f32 %85 = OpLoad %51 
                                         f32 %86 = OpLoad %69 
                                         f32 %87 = OpFMul %85 %86 
                                         f32 %89 = OpFAdd %87 %88 
                                                     OpStore %51 %89 
                                         f32 %90 = OpLoad %51 
                                Private f32* %91 = OpAccessChain %36 %28 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFMul %90 %92 
                                                     OpStore %69 %93 
                                         f32 %94 = OpLoad %69 
                                         f32 %96 = OpFMul %94 %95 
                                         f32 %98 = OpFAdd %96 %97 
                                                     OpStore %69 %98 
                               Private f32* %102 = OpAccessChain %9 %28 
                                        f32 %103 = OpLoad %102 
                                        f32 %104 = OpExtInst %1 4 %103 
                               Private f32* %105 = OpAccessChain %9 %40 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpExtInst %1 4 %106 
                                       bool %108 = OpFOrdLessThan %104 %107 
                                                     OpStore %101 %108 
                                       bool %111 = OpLoad %101 
                                                     OpSelectionMerge %113 None 
                                                     OpBranchConditional %111 %112 %115 
                                            %112 = OpLabel 
                                        f32 %114 = OpLoad %69 
                                                     OpStore %110 %114 
                                                     OpBranch %113 
                                            %115 = OpLabel 
                                                     OpStore %110 %116 
                                                     OpBranch %113 
                                            %113 = OpLabel 
                                        f32 %117 = OpLoad %110 
                                                     OpStore %69 %117 
                               Private f32* %118 = OpAccessChain %36 %28 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpLoad %51 
                                        f32 %121 = OpFMul %119 %120 
                                        f32 %122 = OpLoad %69 
                                        f32 %123 = OpFAdd %121 %122 
                               Private f32* %124 = OpAccessChain %36 %28 
                                                     OpStore %124 %123 
                               Private f32* %126 = OpAccessChain %9 %28 
                                        f32 %127 = OpLoad %126 
                               Private f32* %128 = OpAccessChain %9 %28 
                                        f32 %129 = OpLoad %128 
                                        f32 %130 = OpFNegate %129 
                                       bool %131 = OpFOrdLessThan %127 %130 
                                                     OpStore %125 %131 
                                       bool %133 = OpLoad %125 
                                                     OpSelectionMerge %135 None 
                                                     OpBranchConditional %133 %134 %137 
                                            %134 = OpLabel 
                                                     OpStore %132 %136 
                                                     OpBranch %135 
                                            %137 = OpLabel 
                                                     OpStore %132 %116 
                                                     OpBranch %135 
                                            %135 = OpLabel 
                                        f32 %138 = OpLoad %132 
                                                     OpStore %51 %138 
                                        f32 %139 = OpLoad %51 
                               Private f32* %140 = OpAccessChain %36 %28 
                                        f32 %141 = OpLoad %140 
                                        f32 %142 = OpFAdd %139 %141 
                               Private f32* %143 = OpAccessChain %36 %28 
                                                     OpStore %143 %142 
                               Private f32* %144 = OpAccessChain %9 %28 
                                        f32 %145 = OpLoad %144 
                               Private f32* %146 = OpAccessChain %9 %40 
                                        f32 %147 = OpLoad %146 
                                        f32 %148 = OpExtInst %1 37 %145 %147 
                                                     OpStore %51 %148 
                                        f32 %149 = OpLoad %51 
                                        f32 %150 = OpLoad %51 
                                        f32 %151 = OpFNegate %150 
                                       bool %152 = OpFOrdLessThan %149 %151 
                                                     OpStore %125 %152 
                               Private f32* %153 = OpAccessChain %9 %28 
                                        f32 %154 = OpLoad %153 
                               Private f32* %155 = OpAccessChain %9 %40 
                                        f32 %156 = OpLoad %155 
                                        f32 %157 = OpExtInst %1 40 %154 %156 
                                                     OpStore %69 %157 
                               Private f32* %159 = OpAccessChain %9 %40 
                                        f32 %160 = OpLoad %159 
                               Private f32* %161 = OpAccessChain %9 %40 
                                        f32 %162 = OpLoad %161 
                                        f32 %163 = OpFMul %160 %162 
                                                     OpStore %158 %163 
                               Private f32* %164 = OpAccessChain %9 %28 
                                        f32 %165 = OpLoad %164 
                               Private f32* %166 = OpAccessChain %9 %28 
                                        f32 %167 = OpLoad %166 
                                        f32 %168 = OpFMul %165 %167 
                                        f32 %169 = OpLoad %158 
                                        f32 %170 = OpFAdd %168 %169 
                               Private f32* %171 = OpAccessChain %9 %28 
                                                     OpStore %171 %170 
                                        f32 %173 = OpLoad %69 
                                        f32 %174 = OpLoad %69 
                                        f32 %175 = OpFNegate %174 
                                       bool %176 = OpFOrdGreaterThanEqual %173 %175 
                                                     OpStore %172 %176 
                                       bool %177 = OpLoad %172 
                                       bool %178 = OpLoad %125 
                                       bool %179 = OpLogicalAnd %177 %178 
                                                     OpStore %172 %179 
                                       bool %181 = OpLoad %172 
                                                     OpSelectionMerge %183 None 
                                                     OpBranchConditional %181 %182 %187 
                                            %182 = OpLabel 
                               Private f32* %184 = OpAccessChain %36 %28 
                                        f32 %185 = OpLoad %184 
                                        f32 %186 = OpFNegate %185 
                                                     OpStore %180 %186 
                                                     OpBranch %183 
                                            %187 = OpLabel 
                               Private f32* %188 = OpAccessChain %36 %28 
                                        f32 %189 = OpLoad %188 
                                                     OpStore %180 %189 
                                                     OpBranch %183 
                                            %183 = OpLabel 
                                        f32 %190 = OpLoad %180 
                                                     OpStore %158 %190 
                                        f32 %191 = OpLoad %158 
                                        f32 %193 = OpFMul %191 %192 
                                        f32 %195 = OpFAdd %193 %194 
                               Private f32* %196 = OpAccessChain %36 %28 
                                                     OpStore %196 %195 
                               Private f32* %197 = OpAccessChain %36 %28 
                                        f32 %198 = OpLoad %197 
                                        f32 %199 = OpFNegate %198 
                               Uniform f32* %202 = OpAccessChain %16 %18 %200 
                                        f32 %203 = OpLoad %202 
                                        f32 %204 = OpFAdd %199 %203 
                               Private f32* %205 = OpAccessChain %36 %28 
                                                     OpStore %205 %204 
                                        f32 %206 = OpLoad %158 
                                        f32 %207 = OpFNegate %206 
                                        f32 %208 = OpFMul %207 %192 
                               Uniform f32* %209 = OpAccessChain %16 %18 %200 
                                        f32 %210 = OpLoad %209 
                                        f32 %211 = OpFAdd %208 %210 
                                                     OpStore %51 %211 
                               Private f32* %212 = OpAccessChain %36 %28 
                                        f32 %213 = OpLoad %212 
                                        f32 %214 = OpExtInst %1 4 %213 
                                        f32 %215 = OpLoad %51 
                                        f32 %216 = OpExtInst %1 4 %215 
                                        f32 %217 = OpExtInst %1 37 %214 %216 
                               Private f32* %218 = OpAccessChain %36 %28 
                                                     OpStore %218 %217 
                               Uniform f32* %219 = OpAccessChain %16 %18 %200 
                                        f32 %220 = OpLoad %219 
                                        f32 %221 = OpFAdd %220 %194 
                                                     OpStore %51 %221 
                                        f32 %222 = OpLoad %158 
                                        f32 %223 = OpFNegate %222 
                                        f32 %224 = OpFMul %223 %192 
                                        f32 %225 = OpLoad %51 
                                        f32 %226 = OpFAdd %224 %225 
                                                     OpStore %158 %226 
                               Private f32* %227 = OpAccessChain %36 %28 
                                        f32 %228 = OpLoad %227 
                                        f32 %229 = OpLoad %158 
                                        f32 %230 = OpExtInst %1 4 %229 
                                        f32 %231 = OpExtInst %1 37 %228 %230 
                                                     OpStore %158 %231 
                                      f32_2 %232 = OpLoad %12 
                             Uniform f32_4* %234 = OpAccessChain %16 %233 
                                      f32_4 %235 = OpLoad %234 
                                      f32_2 %236 = OpVectorShuffle %235 %235 0 1 
                                      f32_2 %237 = OpFNegate %236 
                                      f32_2 %238 = OpFAdd %232 %237 
                                                     OpStore %36 %238 
                               Private f32* %239 = OpAccessChain %36 %28 
                                        f32 %240 = OpLoad %239 
                                        f32 %241 = OpFMul %240 %32 
                               Private f32* %242 = OpAccessChain %36 %28 
                                                     OpStore %242 %241 
                               Private f32* %243 = OpAccessChain %36 %28 
                                        f32 %244 = OpLoad %243 
                                        f32 %245 = OpExtInst %1 4 %244 
                               Private f32* %246 = OpAccessChain %36 %40 
                                        f32 %247 = OpLoad %246 
                                        f32 %248 = OpExtInst %1 4 %247 
                                        f32 %249 = OpExtInst %1 40 %245 %248 
                                                     OpStore %69 %249 
                                        f32 %250 = OpLoad %69 
                                        f32 %251 = OpFDiv %46 %250 
                                                     OpStore %69 %251 
                               Private f32* %253 = OpAccessChain %36 %28 
                                        f32 %254 = OpLoad %253 
                                        f32 %255 = OpExtInst %1 4 %254 
                               Private f32* %256 = OpAccessChain %36 %40 
                                        f32 %257 = OpLoad %256 
                                        f32 %258 = OpExtInst %1 4 %257 
                                        f32 %259 = OpExtInst %1 37 %255 %258 
                                                     OpStore %252 %259 
                                        f32 %260 = OpLoad %69 
                                        f32 %261 = OpLoad %252 
                                        f32 %262 = OpFMul %260 %261 
                                                     OpStore %69 %262 
                                        f32 %263 = OpLoad %69 
                                        f32 %264 = OpLoad %69 
                                        f32 %265 = OpFMul %263 %264 
                                                     OpStore %252 %265 
                                        f32 %267 = OpLoad %252 
                                        f32 %268 = OpFMul %267 %71 
                                        f32 %269 = OpFAdd %268 %73 
                                                     OpStore %266 %269 
                                        f32 %270 = OpLoad %252 
                                        f32 %271 = OpLoad %266 
                                        f32 %272 = OpFMul %270 %271 
                                        f32 %273 = OpFAdd %272 %78 
                                                     OpStore %266 %273 
                                        f32 %274 = OpLoad %252 
                                        f32 %275 = OpLoad %266 
                                        f32 %276 = OpFMul %274 %275 
                                        f32 %277 = OpFAdd %276 %83 
                                                     OpStore %266 %277 
                                        f32 %278 = OpLoad %252 
                                        f32 %279 = OpLoad %266 
                                        f32 %280 = OpFMul %278 %279 
                                        f32 %281 = OpFAdd %280 %88 
                                                     OpStore %252 %281 
                                        f32 %282 = OpLoad %252 
                                        f32 %283 = OpLoad %69 
                                        f32 %284 = OpFMul %282 %283 
                                                     OpStore %266 %284 
                                        f32 %285 = OpLoad %266 
                                        f32 %286 = OpFMul %285 %95 
                                        f32 %287 = OpFAdd %286 %97 
                                                     OpStore %266 %287 
                               Private f32* %289 = OpAccessChain %36 %28 
                                        f32 %290 = OpLoad %289 
                                        f32 %291 = OpExtInst %1 4 %290 
                               Private f32* %292 = OpAccessChain %36 %40 
                                        f32 %293 = OpLoad %292 
                                        f32 %294 = OpExtInst %1 4 %293 
                                       bool %295 = OpFOrdLessThan %291 %294 
                                                     OpStore %288 %295 
                                       bool %297 = OpLoad %288 
                                                     OpSelectionMerge %299 None 
                                                     OpBranchConditional %297 %298 %301 
                                            %298 = OpLabel 
                                        f32 %300 = OpLoad %266 
                                                     OpStore %296 %300 
                                                     OpBranch %299 
                                            %301 = OpLabel 
                                                     OpStore %296 %116 
                                                     OpBranch %299 
                                            %299 = OpLabel 
                                        f32 %302 = OpLoad %296 
                                                     OpStore %266 %302 
                                        f32 %303 = OpLoad %69 
                                        f32 %304 = OpLoad %252 
                                        f32 %305 = OpFMul %303 %304 
                                        f32 %306 = OpLoad %266 
                                        f32 %307 = OpFAdd %305 %306 
                                                     OpStore %69 %307 
                               Private f32* %308 = OpAccessChain %36 %28 
                                        f32 %309 = OpLoad %308 
                               Private f32* %310 = OpAccessChain %36 %28 
                                        f32 %311 = OpLoad %310 
                                        f32 %312 = OpFNegate %311 
                                       bool %313 = OpFOrdLessThan %309 %312 
                                                     OpStore %101 %313 
                                       bool %315 = OpLoad %101 
                                                     OpSelectionMerge %317 None 
                                                     OpBranchConditional %315 %316 %318 
                                            %316 = OpLabel 
                                                     OpStore %314 %136 
                                                     OpBranch %317 
                                            %318 = OpLabel 
                                                     OpStore %314 %116 
                                                     OpBranch %317 
                                            %317 = OpLabel 
                                        f32 %319 = OpLoad %314 
                                                     OpStore %252 %319 
                                        f32 %320 = OpLoad %252 
                                        f32 %321 = OpLoad %69 
                                        f32 %322 = OpFAdd %320 %321 
                                                     OpStore %69 %322 
                               Private f32* %323 = OpAccessChain %36 %28 
                                        f32 %324 = OpLoad %323 
                               Private f32* %325 = OpAccessChain %36 %40 
                                        f32 %326 = OpLoad %325 
                                        f32 %327 = OpExtInst %1 37 %324 %326 
                                                     OpStore %252 %327 
                                        f32 %328 = OpLoad %252 
                                        f32 %329 = OpLoad %252 
                                        f32 %330 = OpFNegate %329 
                                       bool %331 = OpFOrdLessThan %328 %330 
                                                     OpStore %101 %331 
                               Private f32* %332 = OpAccessChain %36 %28 
                                        f32 %333 = OpLoad %332 
                               Private f32* %334 = OpAccessChain %36 %40 
                                        f32 %335 = OpLoad %334 
                                        f32 %336 = OpExtInst %1 40 %333 %335 
                                                     OpStore %266 %336 
                               Private f32* %337 = OpAccessChain %36 %40 
                                        f32 %338 = OpLoad %337 
                               Private f32* %339 = OpAccessChain %36 %40 
                                        f32 %340 = OpLoad %339 
                                        f32 %341 = OpFMul %338 %340 
                                                     OpStore %51 %341 
                               Private f32* %342 = OpAccessChain %36 %28 
                                        f32 %343 = OpLoad %342 
                               Private f32* %344 = OpAccessChain %36 %28 
                                        f32 %345 = OpLoad %344 
                                        f32 %346 = OpFMul %343 %345 
                                        f32 %347 = OpLoad %51 
                                        f32 %348 = OpFAdd %346 %347 
                               Private f32* %349 = OpAccessChain %36 %28 
                                                     OpStore %349 %348 
                               Private f32* %350 = OpAccessChain %36 %28 
                                        f32 %351 = OpLoad %350 
                               Private f32* %352 = OpAccessChain %9 %28 
                                        f32 %353 = OpLoad %352 
                                        f32 %354 = OpExtInst %1 37 %351 %353 
                               Private f32* %355 = OpAccessChain %9 %28 
                                                     OpStore %355 %354 
                               Private f32* %356 = OpAccessChain %9 %28 
                                        f32 %357 = OpLoad %356 
                                        f32 %358 = OpExtInst %1 31 %357 
                               Private f32* %359 = OpAccessChain %9 %28 
                                                     OpStore %359 %358 
                                        f32 %361 = OpLoad %266 
                                        f32 %362 = OpLoad %266 
                                        f32 %363 = OpFNegate %362 
                                       bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                     OpStore %360 %364 
                                       bool %365 = OpLoad %360 
                                       bool %366 = OpLoad %101 
                                       bool %367 = OpLogicalAnd %365 %366 
                                                     OpStore %360 %367 
                                       bool %369 = OpLoad %360 
                                                     OpSelectionMerge %371 None 
                                                     OpBranchConditional %369 %370 %374 
                                            %370 = OpLabel 
                                        f32 %372 = OpLoad %69 
                                        f32 %373 = OpFNegate %372 
                                                     OpStore %368 %373 
                                                     OpBranch %371 
                                            %374 = OpLabel 
                                        f32 %375 = OpLoad %69 
                                                     OpStore %368 %375 
                                                     OpBranch %371 
                                            %371 = OpLabel 
                                        f32 %376 = OpLoad %368 
                               Private f32* %377 = OpAccessChain %36 %28 
                                                     OpStore %377 %376 
                               Private f32* %378 = OpAccessChain %36 %28 
                                        f32 %379 = OpLoad %378 
                                        f32 %380 = OpFMul %379 %192 
                                        f32 %381 = OpFAdd %380 %194 
                                                     OpStore %51 %381 
                                        f32 %382 = OpLoad %51 
                                        f32 %383 = OpFNegate %382 
                               Uniform f32* %384 = OpAccessChain %16 %233 %200 
                                        f32 %385 = OpLoad %384 
                                        f32 %386 = OpFAdd %383 %385 
                                                     OpStore %51 %386 
                               Private f32* %387 = OpAccessChain %36 %28 
                                        f32 %388 = OpLoad %387 
                                        f32 %389 = OpFNegate %388 
                                        f32 %390 = OpFMul %389 %192 
                               Uniform f32* %391 = OpAccessChain %16 %233 %200 
                                        f32 %392 = OpLoad %391 
                                        f32 %393 = OpFAdd %390 %392 
                                                     OpStore %69 %393 
                                        f32 %394 = OpLoad %51 
                                        f32 %395 = OpExtInst %1 4 %394 
                                        f32 %396 = OpLoad %69 
                                        f32 %397 = OpExtInst %1 4 %396 
                                        f32 %398 = OpExtInst %1 37 %395 %397 
                                                     OpStore %51 %398 
                               Uniform f32* %399 = OpAccessChain %16 %233 %200 
                                        f32 %400 = OpLoad %399 
                                        f32 %401 = OpFAdd %400 %194 
                                                     OpStore %69 %401 
                               Private f32* %402 = OpAccessChain %36 %28 
                                        f32 %403 = OpLoad %402 
                                        f32 %404 = OpFNegate %403 
                                        f32 %405 = OpFMul %404 %192 
                                        f32 %406 = OpLoad %69 
                                        f32 %407 = OpFAdd %405 %406 
                               Private f32* %408 = OpAccessChain %36 %28 
                                                     OpStore %408 %407 
                                        f32 %409 = OpLoad %51 
                               Private f32* %410 = OpAccessChain %36 %28 
                                        f32 %411 = OpLoad %410 
                                        f32 %412 = OpExtInst %1 4 %411 
                                        f32 %413 = OpExtInst %1 37 %409 %412 
                               Private f32* %414 = OpAccessChain %36 %28 
                                                     OpStore %414 %413 
                               Private f32* %415 = OpAccessChain %36 %28 
                                        f32 %416 = OpLoad %415 
                                        f32 %417 = OpLoad %158 
                                        f32 %418 = OpExtInst %1 37 %416 %417 
                                                     OpStore %158 %418 
                                        f32 %419 = OpLoad %158 
                               Uniform f32* %421 = OpAccessChain %16 %420 
                                        f32 %422 = OpLoad %421 
                                        f32 %423 = OpFNegate %422 
                                        f32 %424 = OpFAdd %419 %423 
                                                     OpStore %158 %424 
                                        f32 %425 = OpLoad %158 
                               Uniform f32* %427 = OpAccessChain %16 %426 
                                        f32 %428 = OpLoad %427 
                                        f32 %429 = OpFAdd %425 %428 
                                                     OpStore %158 %429 
                                        f32 %430 = OpLoad %158 
                               Uniform f32* %431 = OpAccessChain %16 %426 
                                        f32 %432 = OpLoad %431 
                                        f32 %433 = OpFDiv %430 %432 
                                                     OpStore %158 %433 
                                        f32 %434 = OpLoad %158 
                                        f32 %435 = OpExtInst %1 43 %434 %116 %46 
                                                     OpStore %158 %435 
                                        f32 %436 = OpLoad %158 
                               Private f32* %437 = OpAccessChain %9 %28 
                                        f32 %438 = OpLoad %437 
                                        f32 %439 = OpFMul %436 %438 
                                        f32 %441 = OpFAdd %439 %440 
                               Private f32* %442 = OpAccessChain %9 %28 
                                                     OpStore %442 %441 
                               Private f32* %443 = OpAccessChain %9 %28 
                                        f32 %444 = OpLoad %443 
                                        f32 %446 = OpFMul %444 %445 
                               Private f32* %447 = OpAccessChain %9 %28 
                                                     OpStore %447 %446 
                               Private f32* %448 = OpAccessChain %9 %28 
                                        f32 %449 = OpLoad %448 
                                        f32 %450 = OpExtInst %1 43 %449 %116 %46 
                               Private f32* %451 = OpAccessChain %9 %28 
                                                     OpStore %451 %450 
                 read_only Texture2DSampled %457 = OpLoad %456 
                                      f32_2 %458 = OpLoad %12 
                                      f32_4 %459 = OpImageSampleImplicitLod %457 %458 
                                                     OpStore %452 %459 
                                      f32_4 %462 = OpLoad %452 
                                      f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                      f32_3 %466 = OpFAdd %463 %465 
                                      f32_4 %467 = OpLoad %460 
                                      f32_4 %468 = OpVectorShuffle %467 %466 4 5 6 3 
                                                     OpStore %460 %468 
                               Private f32* %469 = OpAccessChain %460 %40 
                                        f32 %470 = OpLoad %469 
                               Private f32* %471 = OpAccessChain %460 %28 
                                        f32 %472 = OpLoad %471 
                                        f32 %473 = OpFAdd %470 %472 
                               Private f32* %474 = OpAccessChain %460 %28 
                                                     OpStore %474 %473 
                               Private f32* %475 = OpAccessChain %460 %200 
                                        f32 %476 = OpLoad %475 
                               Private f32* %477 = OpAccessChain %460 %28 
                                        f32 %478 = OpLoad %477 
                                        f32 %479 = OpFAdd %476 %478 
                               Private f32* %480 = OpAccessChain %460 %28 
                                                     OpStore %480 %479 
                               Private f32* %481 = OpAccessChain %460 %28 
                                        f32 %482 = OpLoad %481 
                                        f32 %483 = OpExtInst %1 43 %482 %116 %46 
                               Private f32* %484 = OpAccessChain %460 %28 
                                                     OpStore %484 %483 
                               Private f32* %485 = OpAccessChain %460 %28 
                                        f32 %486 = OpLoad %485 
                                        f32 %488 = OpFMul %486 %487 
                                        f32 %490 = OpFAdd %488 %489 
                               Private f32* %491 = OpAccessChain %460 %28 
                                                     OpStore %491 %490 
                               Private f32* %492 = OpAccessChain %460 %28 
                                        f32 %493 = OpLoad %492 
                                        f32 %494 = OpExtInst %1 43 %493 %116 %46 
                               Private f32* %495 = OpAccessChain %460 %28 
                                                     OpStore %495 %494 
                               Private f32* %496 = OpAccessChain %460 %28 
                                        f32 %497 = OpLoad %496 
                                        f32 %499 = OpFMul %497 %498 
                               Private f32* %500 = OpAccessChain %460 %28 
                                                     OpStore %500 %499 
                               Private f32* %502 = OpAccessChain %460 %28 
                                        f32 %503 = OpLoad %502 
                                        f32 %504 = OpExtInst %1 37 %503 %46 
                                                     OpStore %501 %504 
                                      f32_4 %505 = OpLoad %452 
                                      f32_4 %506 = OpFNegate %505 
                                        f32 %507 = OpLoad %501 
                                      f32_4 %508 = OpCompositeConstruct %507 %507 %507 %507 
                                      f32_4 %509 = OpFAdd %506 %508 
                                                     OpStore %460 %509 
                                      f32_4 %510 = OpLoad %9 
                                      f32_4 %511 = OpVectorShuffle %510 %510 0 0 0 0 
                                      f32_4 %512 = OpLoad %460 
                                      f32_4 %513 = OpFMul %511 %512 
                                      f32_4 %514 = OpLoad %452 
                                      f32_4 %515 = OpFAdd %513 %514 
                                                     OpStore %9 %515 
                                      f32_4 %518 = OpLoad %9 
                                                     OpStore %517 %518 
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