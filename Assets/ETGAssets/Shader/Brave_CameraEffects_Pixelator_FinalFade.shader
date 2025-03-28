//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/CameraEffects/Pixelator_FinalFade" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_VignettePower ("VignettePower", Range(0, 6)) = 5.5
_VignetteColor ("VignetteColor", Color) = (0,0,0,1)
_Saturation ("Saturation", Range(0, 1)) = 1
_SaturationColor ("Sat Color", Color) = (1,1,1,1)
_Fade ("Fade", Range(0, 1)) = 1
_FadeColor ("FadeColor", Color) = (0,0,0,1)
_LetterboxFrac ("Letterbox", Range(0, 0.5)) = 0.5
_WindowboxFrac ("Windowbox", Range(0, 0.5)) = 0.5
_DamagedTex ("Damaged Vignette", 2D) = "black" { }
_DamagedPower ("Damaged Power", Range(0, 1)) = 0
}
SubShader {
 Pass {
  ZTest Always
  GpuProgramID 22393
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
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

uniform 	float _VignettePower;
uniform 	vec4 _VignetteColor;
uniform 	float _Saturation;
uniform 	vec4 _SaturationColor;
uniform 	float _Fade;
uniform 	vec4 _FadeColor;
uniform 	float _LetterboxFrac;
uniform 	float _WindowboxFrac;
uniform 	float _DamagedPower;
uniform 	float _Tubiness;
uniform  sampler2D _MainTex;
uniform  sampler2D _DamagedTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat9;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 + (-_VignetteColor);
    u_xlat1.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat9 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlatb1.xy = greaterThanEqual(abs(u_xlat1.xyxx), vec4(_LetterboxFrac, _WindowboxFrac, _LetterboxFrac, _LetterboxFrac)).xy;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat5.x = (-u_xlat9) * _VignettePower + 1.0;
    u_xlat0 = u_xlat5.xxxx * u_xlat0 + _VignetteColor;
    u_xlat5.x = (-u_xlat0.w) + 1.0;
    u_xlat5.x = _Tubiness * u_xlat5.x + _Saturation;
    u_xlat9 = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
    u_xlat2.xyz = (-vec3(u_xlat9)) * _SaturationColor.xyz + u_xlat0.xyz;
    u_xlat3.xyz = vec3(u_xlat9) * _SaturationColor.xyz;
    u_xlat5.xyz = u_xlat5.xxx * u_xlat2.xyz + u_xlat3.xyz;
    u_xlat10_2 = texture(_DamagedTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = (-u_xlat5.xyz) + u_xlat10_2.xyz;
    u_xlat14 = u_xlat10_2.w * _DamagedPower;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat2.xyz + u_xlat5.xyz;
    u_xlat2 = u_xlat0;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat0 = u_xlat0 + (-u_xlat2);
    u_xlatb5 = 1.0>=_Fade;
    u_xlat5.x = u_xlatb5 ? 1.0 : float(0.0);
    u_xlat0 = u_xlat5.xxxx * u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat0 + (-_FadeColor);
    u_xlat0 = vec4(_Fade) * u_xlat0 + _FadeColor;
    u_xlat2 = (-u_xlat0) + vec4(0.0, 0.0, 0.0, 1.0);
    SV_Target0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 124
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %102 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %91 RelaxedPrecision 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %102 RelaxedPrecision 
                                                     OpDecorate %102 Location 102 
                                                     OpDecorate %108 RelaxedPrecision 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %112 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                                             %82 = OpTypeBool 
                                             %83 = OpTypePointer Private %82 
                               Private bool* %84 = OpVariable Private 
                                             %85 = OpTypePointer Uniform %6 
                                         f32 %88 = OpConstant 3.67402E-40 
                                             %90 = OpTypePointer Private %6 
                                Private f32* %91 = OpVariable Private 
                                             %92 = OpTypeVector %6 2 
                                             %93 = OpTypePointer Input %92 
                                Input f32_2* %94 = OpVariable Input 
                                             %95 = OpTypePointer Input %6 
                                         f32 %99 = OpConstant 3.67402E-40 
                                            %101 = OpTypePointer Output %92 
                              Output f32_2* %102 = OpVariable Output 
                                            %103 = OpTypePointer Function %6 
                                            %113 = OpTypePointer Output %6 
                                        u32 %115 = OpConstant 0 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %104 = OpVariable Function 
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
                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
                                         f32 %87 = OpLoad %86 
                                        bool %89 = OpFOrdLessThan %87 %88 
                                                     OpStore %84 %89 
                                  Input f32* %96 = OpAccessChain %94 %68 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFNegate %97 
                                        f32 %100 = OpFAdd %98 %99 
                                                     OpStore %91 %100 
                                       bool %105 = OpLoad %84 
                                                     OpSelectionMerge %107 None 
                                                     OpBranchConditional %105 %106 %109 
                                            %106 = OpLabel 
                                        f32 %108 = OpLoad %91 
                                                     OpStore %104 %108 
                                                     OpBranch %107 
                                            %109 = OpLabel 
                                 Input f32* %110 = OpAccessChain %94 %68 
                                        f32 %111 = OpLoad %110 
                                                     OpStore %104 %111 
                                                     OpBranch %107 
                                            %107 = OpLabel 
                                        f32 %112 = OpLoad %104 
                                Output f32* %114 = OpAccessChain %102 %68 
                                                     OpStore %114 %112 
                                 Input f32* %116 = OpAccessChain %94 %115 
                                        f32 %117 = OpLoad %116 
                                Output f32* %118 = OpAccessChain %102 %115 
                                                     OpStore %118 %117 
                                Output f32* %119 = OpAccessChain %72 %22 %68 
                                        f32 %120 = OpLoad %119 
                                        f32 %121 = OpFNegate %120 
                                Output f32* %122 = OpAccessChain %72 %22 %68 
                                                     OpStore %122 %121 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %228 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %18 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpMemberDecorate %22 8 Offset 22 
                                                      OpMemberDecorate %22 9 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %153 DescriptorSet 153 
                                                      OpDecorate %153 Binding 153 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %228 Location 228 
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
                                              %22 = OpTypeStruct %6 %7 %6 %7 %6 %7 %6 %6 %6 %6 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32; f32_4; f32; f32_4; f32; f32_4; f32; f32; f32; f32;}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                              %32 = OpTypePointer Private %15 
                               Private f32_2* %33 = OpVariable Private 
                                          f32 %36 = OpConstant 3.67402E-40 
                                        f32_2 %37 = OpConstantComposite %36 %36 
                                              %39 = OpTypePointer Private %6 
                                 Private f32* %40 = OpVariable Private 
                                              %44 = OpTypeBool 
                                              %45 = OpTypeVector %44 2 
                                              %46 = OpTypePointer Private %45 
                              Private bool_2* %47 = OpVariable Private 
                                          i32 %51 = OpConstant 6 
                                              %52 = OpTypePointer Uniform %6 
                                          i32 %55 = OpConstant 7 
                                              %63 = OpTypeVector %44 4 
                                          f32 %66 = OpConstant 3.67402E-40 
                                        f32_2 %67 = OpConstantComposite %66 %66 
                                          f32 %68 = OpConstant 3.67402E-40 
                                        f32_2 %69 = OpConstantComposite %68 %68 
                                              %73 = OpTypeInt 32 0 
                                          u32 %74 = OpConstant 1 
                                          u32 %77 = OpConstant 0 
                                              %82 = OpTypeVector %6 3 
                                              %83 = OpTypePointer Private %82 
                               Private f32_3* %84 = OpVariable Private 
                                          i32 %87 = OpConstant 0 
                                         u32 %100 = OpConstant 3 
                                         i32 %106 = OpConstant 9 
                                         i32 %112 = OpConstant 2 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         f32 %120 = OpConstant 3.67402E-40 
                                         f32 %121 = OpConstant 3.67402E-40 
                                       f32_3 %122 = OpConstantComposite %119 %120 %121 
                              Private f32_4* %124 = OpVariable Private 
                                         i32 %128 = OpConstant 3 
                              Private f32_3* %138 = OpVariable Private 
                              Private f32_4* %152 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %153 = OpVariable UniformConstant 
                                Private f32* %164 = OpVariable Private 
                                         i32 %167 = OpConstant 8 
                                             %189 = OpTypePointer Private %44 
                               Private bool* %190 = OpVariable Private 
                                         i32 %191 = OpConstant 4 
                                             %195 = OpTypePointer Function %6 
                                         i32 %210 = OpConstant 5 
                                       f32_4 %225 = OpConstantComposite %66 %66 %66 %68 
                                             %227 = OpTypePointer Output %7 
                               Output f32_4* %228 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %196 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                               Uniform f32_4* %28 = OpAccessChain %24 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFNegate %29 
                                        f32_4 %31 = OpFAdd %21 %30 
                                                      OpStore %20 %31 
                                        f32_2 %34 = OpLoad %17 
                                        f32_2 %35 = OpVectorShuffle %34 %34 1 0 
                                        f32_2 %38 = OpFAdd %35 %37 
                                                      OpStore %33 %38 
                                        f32_2 %41 = OpLoad %33 
                                        f32_2 %42 = OpLoad %33 
                                          f32 %43 = OpDot %41 %42 
                                                      OpStore %40 %43 
                                        f32_2 %48 = OpLoad %33 
                                        f32_4 %49 = OpVectorShuffle %48 %48 0 1 0 0 
                                        f32_4 %50 = OpExtInst %1 4 %49 
                                 Uniform f32* %53 = OpAccessChain %24 %51 
                                          f32 %54 = OpLoad %53 
                                 Uniform f32* %56 = OpAccessChain %24 %55 
                                          f32 %57 = OpLoad %56 
                                 Uniform f32* %58 = OpAccessChain %24 %51 
                                          f32 %59 = OpLoad %58 
                                 Uniform f32* %60 = OpAccessChain %24 %51 
                                          f32 %61 = OpLoad %60 
                                        f32_4 %62 = OpCompositeConstruct %54 %57 %59 %61 
                                       bool_4 %64 = OpFOrdGreaterThanEqual %50 %62 
                                       bool_2 %65 = OpVectorShuffle %64 %64 0 1 
                                                      OpStore %47 %65 
                                       bool_2 %70 = OpLoad %47 
                                        f32_2 %71 = OpSelect %70 %69 %67 
                                        f32_2 %72 = OpExtInst %1 46 %67 %69 %71 
                                                      OpStore %33 %72 
                                 Private f32* %75 = OpAccessChain %33 %74 
                                          f32 %76 = OpLoad %75 
                                 Private f32* %78 = OpAccessChain %33 %77 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFAdd %76 %79 
                                 Private f32* %81 = OpAccessChain %33 %77 
                                                      OpStore %81 %80 
                                          f32 %85 = OpLoad %40 
                                          f32 %86 = OpFNegate %85 
                                 Uniform f32* %88 = OpAccessChain %24 %87 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFMul %86 %89 
                                          f32 %91 = OpFAdd %90 %68 
                                 Private f32* %92 = OpAccessChain %84 %77 
                                                      OpStore %92 %91 
                                        f32_3 %93 = OpLoad %84 
                                        f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
                                        f32_4 %95 = OpLoad %20 
                                        f32_4 %96 = OpFMul %94 %95 
                               Uniform f32_4* %97 = OpAccessChain %24 %26 
                                        f32_4 %98 = OpLoad %97 
                                        f32_4 %99 = OpFAdd %96 %98 
                                                      OpStore %20 %99 
                                Private f32* %101 = OpAccessChain %20 %100 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFNegate %102 
                                         f32 %104 = OpFAdd %103 %68 
                                Private f32* %105 = OpAccessChain %84 %77 
                                                      OpStore %105 %104 
                                Uniform f32* %107 = OpAccessChain %24 %106 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %84 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                Uniform f32* %113 = OpAccessChain %24 %112 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFAdd %111 %114 
                                Private f32* %116 = OpAccessChain %84 %77 
                                                      OpStore %116 %115 
                                       f32_4 %117 = OpLoad %20 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                         f32 %123 = OpDot %118 %122 
                                                      OpStore %40 %123 
                                         f32 %125 = OpLoad %40 
                                       f32_3 %126 = OpCompositeConstruct %125 %125 %125 
                                       f32_3 %127 = OpFNegate %126 
                              Uniform f32_4* %129 = OpAccessChain %24 %128 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %127 %131 
                                       f32_4 %133 = OpLoad %20 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFAdd %132 %134 
                                       f32_4 %136 = OpLoad %124 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %124 %137 
                                         f32 %139 = OpLoad %40 
                                       f32_3 %140 = OpCompositeConstruct %139 %139 %139 
                              Uniform f32_4* %141 = OpAccessChain %24 %128 
                                       f32_4 %142 = OpLoad %141 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                       f32_3 %144 = OpFMul %140 %143 
                                                      OpStore %138 %144 
                                       f32_3 %145 = OpLoad %84 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 0 0 
                                       f32_4 %147 = OpLoad %124 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %146 %148 
                                       f32_3 %150 = OpLoad %138 
                                       f32_3 %151 = OpFAdd %149 %150 
                                                      OpStore %84 %151 
                  read_only Texture2DSampled %154 = OpLoad %153 
                                       f32_2 %155 = OpLoad %17 
                                       f32_4 %156 = OpImageSampleImplicitLod %154 %155 
                                                      OpStore %152 %156 
                                       f32_3 %157 = OpLoad %84 
                                       f32_3 %158 = OpFNegate %157 
                                       f32_4 %159 = OpLoad %152 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_3 %161 = OpFAdd %158 %160 
                                       f32_4 %162 = OpLoad %124 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %124 %163 
                                Private f32* %165 = OpAccessChain %152 %100 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %168 = OpAccessChain %24 %167 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFMul %166 %169 
                                                      OpStore %164 %170 
                                         f32 %171 = OpLoad %164 
                                       f32_3 %172 = OpCompositeConstruct %171 %171 %171 
                                       f32_4 %173 = OpLoad %124 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %172 %174 
                                       f32_3 %176 = OpLoad %84 
                                       f32_3 %177 = OpFAdd %175 %176 
                                       f32_4 %178 = OpLoad %20 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %20 %179 
                                       f32_4 %180 = OpLoad %20 
                                                      OpStore %124 %180 
                                       f32_4 %181 = OpLoad %124 
                                       f32_4 %182 = OpCompositeConstruct %66 %66 %66 %66 
                                       f32_4 %183 = OpCompositeConstruct %68 %68 %68 %68 
                                       f32_4 %184 = OpExtInst %1 43 %181 %182 %183 
                                                      OpStore %124 %184 
                                       f32_4 %185 = OpLoad %20 
                                       f32_4 %186 = OpLoad %124 
                                       f32_4 %187 = OpFNegate %186 
                                       f32_4 %188 = OpFAdd %185 %187 
                                                      OpStore %20 %188 
                                Uniform f32* %192 = OpAccessChain %24 %191 
                                         f32 %193 = OpLoad %192 
                                        bool %194 = OpFOrdGreaterThanEqual %68 %193 
                                                      OpStore %190 %194 
                                        bool %197 = OpLoad %190 
                                                      OpSelectionMerge %199 None 
                                                      OpBranchConditional %197 %198 %200 
                                             %198 = OpLabel 
                                                      OpStore %196 %68 
                                                      OpBranch %199 
                                             %200 = OpLabel 
                                                      OpStore %196 %66 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                         f32 %201 = OpLoad %196 
                                Private f32* %202 = OpAccessChain %84 %77 
                                                      OpStore %202 %201 
                                       f32_3 %203 = OpLoad %84 
                                       f32_4 %204 = OpVectorShuffle %203 %203 0 0 0 0 
                                       f32_4 %205 = OpLoad %20 
                                       f32_4 %206 = OpFMul %204 %205 
                                       f32_4 %207 = OpLoad %124 
                                       f32_4 %208 = OpFAdd %206 %207 
                                                      OpStore %20 %208 
                                       f32_4 %209 = OpLoad %20 
                              Uniform f32_4* %211 = OpAccessChain %24 %210 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpFNegate %212 
                                       f32_4 %214 = OpFAdd %209 %213 
                                                      OpStore %20 %214 
                                Uniform f32* %215 = OpAccessChain %24 %191 
                                         f32 %216 = OpLoad %215 
                                       f32_4 %217 = OpCompositeConstruct %216 %216 %216 %216 
                                       f32_4 %218 = OpLoad %20 
                                       f32_4 %219 = OpFMul %217 %218 
                              Uniform f32_4* %220 = OpAccessChain %24 %210 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpFAdd %219 %221 
                                                      OpStore %20 %222 
                                       f32_4 %223 = OpLoad %20 
                                       f32_4 %224 = OpFNegate %223 
                                       f32_4 %226 = OpFAdd %224 %225 
                                                      OpStore %124 %226 
                                       f32_2 %229 = OpLoad %33 
                                       f32_4 %230 = OpVectorShuffle %229 %229 0 0 0 0 
                                       f32_4 %231 = OpLoad %124 
                                       f32_4 %232 = OpFMul %230 %231 
                                       f32_4 %233 = OpLoad %20 
                                       f32_4 %234 = OpFAdd %232 %233 
                                                      OpStore %228 %234 
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