//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/CameraEffects/Pixelator_VignetteFade" {
Properties {
_MainTex ("Base (RGB)", 2D) = "black" { }
_GBuffer ("G Buffer", 2D) = "white" { }
_OcclusionMap ("OcclusionMap", 2D) = "white" { }
_OcclusionUV ("OcclusionUV", Vector) = (0,0,0,0)
_OcclusionFallbackColor ("Occlusion Fallback Color", Color) = (0,0,0,1)
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
_GammaGamma ("Gamma", Float) = 1
_LowlightColor ("Lowlight Color", Vector) = (1,0,-1,0)
}
SubShader {
 Pass {
  ZTest Always
  GpuProgramID 51163
Program "vp" {
SubProgram "d3d11 " {
Keywords { "LOWLIGHT_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LOWLIGHT_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OcclusionUV;
uniform 	vec4 _OcclusionFallbackColor;
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
uniform 	float _GammaGamma;
uniform  sampler2D _MainTex;
uniform  sampler2D _GBuffer;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _DamagedTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
float u_xlat5;
float u_xlat10;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_GBuffer, vs_TEXCOORD0.xy);
    u_xlat2.xy = (-_OcclusionUV.xy) + _OcclusionUV.zw;
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + _OcclusionUV.xy;
    u_xlat10_3 = texture(_OcclusionMap, u_xlat2.xy);
    u_xlatb2 = u_xlat2.x<0.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(0.0, 1.0) : u_xlat10_3.xw;
    u_xlat3.xyz = (-u_xlat0.xyz) + _OcclusionFallbackColor.xyz;
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xzw * u_xlat2.yyy;
    u_xlat2.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat10 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat10 = (-u_xlat10) * _VignettePower + 1.0;
    u_xlat0 = u_xlat0 * u_xlat10_1 + (-_VignetteColor);
    u_xlat0 = vec4(u_xlat10) * u_xlat0 + _VignetteColor;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
    u_xlat5 = (-u_xlat0.w) + 1.0;
    u_xlat5 = _Tubiness * u_xlat5 + _Saturation;
    u_xlat3.xyz = u_xlat1.xxx * _SaturationColor.xyz;
    u_xlat1.xzw = (-u_xlat1.xxx) * _SaturationColor.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xzw + u_xlat3.xyz;
    u_xlat10_3 = texture(_DamagedTex, vs_TEXCOORD0.xy);
    u_xlat13 = u_xlat10_3.w * _DamagedPower;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlatb1.x = 1.0>=_Fade;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat3 = u_xlat0;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 + (-_FadeColor);
    u_xlat0 = vec4(_Fade) * u_xlat0 + _FadeColor;
    u_xlatb1.xy = greaterThanEqual(abs(u_xlat2.xyxx), vec4(_LetterboxFrac, _WindowboxFrac, _LetterboxFrac, _LetterboxFrac)).xy;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat2 = (-u_xlat0) + vec4(0.0, 0.0, 0.0, 1.0);
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    u_xlatb1.x = _GammaGamma==1.0;
    if(u_xlatb1.x){
        SV_Target0 = u_xlat0;
        return;
    } else {
        u_xlat0.xyz = log2(u_xlat0.xyz);
        u_xlat0.xyz = u_xlat0.xyz * vec3(_GammaGamma);
        SV_Target0.xyz = exp2(u_xlat0.xyz);
        SV_Target0.w = u_xlat0.w;
        return;
    //ENDIF
    }
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "LOWLIGHT_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 128
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %102 %121 
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
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %102 Location 102 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
                                                     OpDecorate %121 Location 121 
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
                                            %119 = OpTypeVector %6 3 
                                            %120 = OpTypePointer Output %119 
                              Output f32_3* %121 = OpVariable Output 
                                      f32_3 %122 = OpConstantComposite %88 %88 %88 
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
                                                     OpStore %121 %122 
                                Output f32* %123 = OpAccessChain %72 %22 %68 
                                        f32 %124 = OpLoad %123 
                                        f32 %125 = OpFNegate %124 
                                Output f32* %126 = OpAccessChain %72 %22 %68 
                                                     OpStore %126 %125 
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
                                                      OpEntryPoint Fragment %4 "main" %17 %337 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpMemberDecorate %26 0 Offset 26 
                                                      OpMemberDecorate %26 1 Offset 26 
                                                      OpMemberDecorate %26 2 Offset 26 
                                                      OpMemberDecorate %26 3 Offset 26 
                                                      OpMemberDecorate %26 4 Offset 26 
                                                      OpMemberDecorate %26 5 Offset 26 
                                                      OpMemberDecorate %26 6 Offset 26 
                                                      OpMemberDecorate %26 7 Offset 26 
                                                      OpMemberDecorate %26 8 Offset 26 
                                                      OpMemberDecorate %26 9 Offset 26 
                                                      OpMemberDecorate %26 10 Offset 26 
                                                      OpMemberDecorate %26 11 Offset 26 
                                                      OpMemberDecorate %26 12 Offset 26 
                                                      OpDecorate %26 Block 
                                                      OpDecorate %28 DescriptorSet 28 
                                                      OpDecorate %28 Binding 28 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %54 DescriptorSet 54 
                                                      OpDecorate %54 Binding 54 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %333 SpecId 333 
                                                      OpDecorate %337 Location 337 
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
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                               Private f32_4* %25 = OpVariable Private 
                                              %26 = OpTypeStruct %7 %7 %6 %7 %6 %7 %6 %7 %6 %6 %6 %6 %6 
                                              %27 = OpTypePointer Uniform %26 
Uniform struct {f32_4; f32_4; f32; f32_4; f32; f32_4; f32; f32_4; f32; f32; f32; f32; f32;}* %28 = OpVariable Uniform 
                                              %29 = OpTypeInt 32 1 
                                          i32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Uniform %7 
                                              %52 = OpTypePointer Private %15 
                               Private f32_2* %53 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %54 = OpVariable UniformConstant 
                                              %60 = OpTypeBool 
                                              %61 = OpTypePointer Private %60 
                                Private bool* %62 = OpVariable Private 
                                              %63 = OpTypeInt 32 0 
                                          u32 %64 = OpConstant 0 
                                              %65 = OpTypePointer Private %6 
                                          f32 %68 = OpConstant 3.67402E-40 
                                              %70 = OpTypePointer Function %15 
                                          f32 %75 = OpConstant 3.67402E-40 
                                        f32_2 %76 = OpConstantComposite %68 %75 
                               Private f32_4* %82 = OpVariable Private 
                                              %83 = OpTypeVector %6 3 
                                          i32 %87 = OpConstant 1 
                                         f32 %113 = OpConstant 3.67402E-40 
                                       f32_2 %114 = OpConstantComposite %113 %113 
                                Private f32* %118 = OpVariable Private 
                                         i32 %126 = OpConstant 2 
                                             %127 = OpTypePointer Uniform %6 
                                         i32 %135 = OpConstant 3 
                              Private f32_4* %147 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %152 = OpConstant 3.67402E-40 
                                       f32_3 %153 = OpConstantComposite %150 %151 %152 
                                Private f32* %156 = OpVariable Private 
                                         u32 %157 = OpConstant 3 
                                         i32 %162 = OpConstant 11 
                                         i32 %167 = OpConstant 4 
                                         i32 %173 = OpConstant 5 
                              Private f32_4* %202 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %203 = OpVariable UniformConstant 
                                Private f32* %207 = OpVariable Private 
                                         i32 %210 = OpConstant 10 
                                             %232 = OpTypeVector %60 2 
                                             %233 = OpTypePointer Private %232 
                             Private bool_2* %234 = OpVariable Private 
                                         i32 %235 = OpConstant 6 
                                             %241 = OpTypePointer Function %6 
                                         i32 %266 = OpConstant 7 
                                         i32 %282 = OpConstant 8 
                                         i32 %285 = OpConstant 9 
                                             %293 = OpTypeVector %60 4 
                                       f32_2 %296 = OpConstantComposite %68 %68 
                                       f32_2 %297 = OpConstantComposite %75 %75 
                                         u32 %303 = OpConstant 1 
                                       f32_4 %312 = OpConstantComposite %68 %68 %68 %75 
                                         i32 %320 = OpConstant 12 
                                        bool %326 = OpConstantFalse 
                                        bool %333 = OpSpecConstantFalse 
                                             %336 = OpTypePointer Output %7 
                               Output f32_4* %337 = OpVariable Output 
                                             %361 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %71 = OpVariable Function 
                               Function f32* %242 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                                      OpStore %20 %24 
                               Uniform f32_4* %32 = OpAccessChain %28 %30 
                                        f32_4 %33 = OpLoad %32 
                                        f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                        f32_2 %35 = OpFNegate %34 
                               Uniform f32_4* %36 = OpAccessChain %28 %30 
                                        f32_4 %37 = OpLoad %36 
                                        f32_2 %38 = OpVectorShuffle %37 %37 2 3 
                                        f32_2 %39 = OpFAdd %35 %38 
                                        f32_4 %40 = OpLoad %25 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 2 3 
                                                      OpStore %25 %41 
                                        f32_2 %42 = OpLoad %17 
                                        f32_4 %43 = OpLoad %25 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_2 %45 = OpFMul %42 %44 
                               Uniform f32_4* %46 = OpAccessChain %28 %30 
                                        f32_4 %47 = OpLoad %46 
                                        f32_2 %48 = OpVectorShuffle %47 %47 0 1 
                                        f32_2 %49 = OpFAdd %45 %48 
                                        f32_4 %50 = OpLoad %25 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 2 3 
                                                      OpStore %25 %51 
                   read_only Texture2DSampled %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %25 
                                        f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                        f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                        f32_2 %59 = OpVectorShuffle %58 %58 0 3 
                                                      OpStore %53 %59 
                                 Private f32* %66 = OpAccessChain %25 %64 
                                          f32 %67 = OpLoad %66 
                                         bool %69 = OpFOrdLessThan %67 %68 
                                                      OpStore %62 %69 
                                         bool %72 = OpLoad %62 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %77 
                                              %73 = OpLabel 
                                                      OpStore %71 %76 
                                                      OpBranch %74 
                                              %77 = OpLabel 
                                        f32_2 %78 = OpLoad %53 
                                                      OpStore %71 %78 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                        f32_2 %79 = OpLoad %71 
                                        f32_4 %80 = OpLoad %25 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 2 3 
                                                      OpStore %25 %81 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFNegate %85 
                               Uniform f32_4* %88 = OpAccessChain %28 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                        f32_3 %91 = OpFAdd %86 %90 
                                        f32_4 %92 = OpLoad %82 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %82 %93 
                                        f32_4 %94 = OpLoad %25 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_4 %96 = OpLoad %82 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %9 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32_3 %101 = OpFAdd %98 %100 
                                       f32_4 %102 = OpLoad %25 
                                       f32_4 %103 = OpVectorShuffle %102 %101 4 1 5 6 
                                                      OpStore %25 %103 
                                       f32_4 %104 = OpLoad %25 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 2 3 
                                       f32_4 %106 = OpLoad %25 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                                       f32_3 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 6 3 
                                                      OpStore %9 %110 
                                       f32_2 %111 = OpLoad %17 
                                       f32_2 %112 = OpVectorShuffle %111 %111 1 0 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %25 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %25 %117 
                                       f32_4 %119 = OpLoad %25 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %25 
                                       f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                         f32 %123 = OpDot %120 %122 
                                                      OpStore %118 %123 
                                         f32 %124 = OpLoad %118 
                                         f32 %125 = OpFNegate %124 
                                Uniform f32* %128 = OpAccessChain %28 %126 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %125 %129 
                                         f32 %131 = OpFAdd %130 %75 
                                                      OpStore %118 %131 
                                       f32_4 %132 = OpLoad %9 
                                       f32_4 %133 = OpLoad %20 
                                       f32_4 %134 = OpFMul %132 %133 
                              Uniform f32_4* %136 = OpAccessChain %28 %135 
                                       f32_4 %137 = OpLoad %136 
                                       f32_4 %138 = OpFNegate %137 
                                       f32_4 %139 = OpFAdd %134 %138 
                                                      OpStore %9 %139 
                                         f32 %140 = OpLoad %118 
                                       f32_4 %141 = OpCompositeConstruct %140 %140 %140 %140 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpFMul %141 %142 
                              Uniform f32_4* %144 = OpAccessChain %28 %135 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpFAdd %143 %145 
                                                      OpStore %9 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %154 = OpDot %149 %153 
                                Private f32* %155 = OpAccessChain %147 %64 
                                                      OpStore %155 %154 
                                Private f32* %158 = OpAccessChain %9 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFNegate %159 
                                         f32 %161 = OpFAdd %160 %75 
                                                      OpStore %156 %161 
                                Uniform f32* %163 = OpAccessChain %28 %162 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpLoad %156 
                                         f32 %166 = OpFMul %164 %165 
                                Uniform f32* %168 = OpAccessChain %28 %167 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFAdd %166 %169 
                                                      OpStore %156 %170 
                                       f32_4 %171 = OpLoad %147 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 0 0 
                              Uniform f32_4* %174 = OpAccessChain %28 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %172 %176 
                                       f32_4 %178 = OpLoad %82 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %82 %179 
                                       f32_4 %180 = OpLoad %147 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 0 0 
                                       f32_3 %182 = OpFNegate %181 
                              Uniform f32_4* %183 = OpAccessChain %28 %173 
                                       f32_4 %184 = OpLoad %183 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFMul %182 %185 
                                       f32_4 %187 = OpLoad %9 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %186 %188 
                                       f32_4 %190 = OpLoad %147 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 1 5 6 
                                                      OpStore %147 %191 
                                         f32 %192 = OpLoad %156 
                                       f32_3 %193 = OpCompositeConstruct %192 %192 %192 
                                       f32_4 %194 = OpLoad %147 
                                       f32_3 %195 = OpVectorShuffle %194 %194 0 2 3 
                                       f32_3 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %82 
                                       f32_3 %198 = OpVectorShuffle %197 %197 0 1 2 
                                       f32_3 %199 = OpFAdd %196 %198 
                                       f32_4 %200 = OpLoad %147 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 5 6 3 
                                                      OpStore %147 %201 
                  read_only Texture2DSampled %204 = OpLoad %203 
                                       f32_2 %205 = OpLoad %17 
                                       f32_4 %206 = OpImageSampleImplicitLod %204 %205 
                                                      OpStore %202 %206 
                                Private f32* %208 = OpAccessChain %202 %157 
                                         f32 %209 = OpLoad %208 
                                Uniform f32* %211 = OpAccessChain %28 %210 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %209 %212 
                                                      OpStore %207 %213 
                                       f32_4 %214 = OpLoad %147 
                                       f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                       f32_3 %216 = OpFNegate %215 
                                       f32_4 %217 = OpLoad %202 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                       f32_3 %219 = OpFAdd %216 %218 
                                       f32_4 %220 = OpLoad %82 
                                       f32_4 %221 = OpVectorShuffle %220 %219 4 5 6 3 
                                                      OpStore %82 %221 
                                         f32 %222 = OpLoad %207 
                                       f32_3 %223 = OpCompositeConstruct %222 %222 %222 
                                       f32_4 %224 = OpLoad %82 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                       f32_3 %226 = OpFMul %223 %225 
                                       f32_4 %227 = OpLoad %147 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_3 %229 = OpFAdd %226 %228 
                                       f32_4 %230 = OpLoad %9 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %9 %231 
                                Uniform f32* %236 = OpAccessChain %28 %235 
                                         f32 %237 = OpLoad %236 
                                        bool %238 = OpFOrdGreaterThanEqual %75 %237 
                                      bool_2 %239 = OpLoad %234 
                                      bool_2 %240 = OpCompositeInsert %238 %239 0 
                                                      OpStore %234 %240 
                                      bool_2 %243 = OpLoad %234 
                                        bool %244 = OpCompositeExtract %243 0 
                                                      OpSelectionMerge %246 None 
                                                      OpBranchConditional %244 %245 %247 
                                             %245 = OpLabel 
                                                      OpStore %242 %75 
                                                      OpBranch %246 
                                             %247 = OpLabel 
                                                      OpStore %242 %68 
                                                      OpBranch %246 
                                             %246 = OpLabel 
                                         f32 %248 = OpLoad %242 
                                Private f32* %249 = OpAccessChain %147 %64 
                                                      OpStore %249 %248 
                                       f32_4 %250 = OpLoad %9 
                                                      OpStore %82 %250 
                                       f32_4 %251 = OpLoad %82 
                                       f32_4 %252 = OpCompositeConstruct %68 %68 %68 %68 
                                       f32_4 %253 = OpCompositeConstruct %75 %75 %75 %75 
                                       f32_4 %254 = OpExtInst %1 43 %251 %252 %253 
                                                      OpStore %82 %254 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpLoad %82 
                                       f32_4 %257 = OpFNegate %256 
                                       f32_4 %258 = OpFAdd %255 %257 
                                                      OpStore %9 %258 
                                       f32_4 %259 = OpLoad %147 
                                       f32_4 %260 = OpVectorShuffle %259 %259 0 0 0 0 
                                       f32_4 %261 = OpLoad %9 
                                       f32_4 %262 = OpFMul %260 %261 
                                       f32_4 %263 = OpLoad %82 
                                       f32_4 %264 = OpFAdd %262 %263 
                                                      OpStore %9 %264 
                                       f32_4 %265 = OpLoad %9 
                              Uniform f32_4* %267 = OpAccessChain %28 %266 
                                       f32_4 %268 = OpLoad %267 
                                       f32_4 %269 = OpFNegate %268 
                                       f32_4 %270 = OpFAdd %265 %269 
                                                      OpStore %9 %270 
                                Uniform f32* %271 = OpAccessChain %28 %235 
                                         f32 %272 = OpLoad %271 
                                       f32_4 %273 = OpCompositeConstruct %272 %272 %272 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpFMul %273 %274 
                              Uniform f32_4* %276 = OpAccessChain %28 %266 
                                       f32_4 %277 = OpLoad %276 
                                       f32_4 %278 = OpFAdd %275 %277 
                                                      OpStore %9 %278 
                                       f32_4 %279 = OpLoad %25 
                                       f32_4 %280 = OpVectorShuffle %279 %279 0 1 0 0 
                                       f32_4 %281 = OpExtInst %1 4 %280 
                                Uniform f32* %283 = OpAccessChain %28 %282 
                                         f32 %284 = OpLoad %283 
                                Uniform f32* %286 = OpAccessChain %28 %285 
                                         f32 %287 = OpLoad %286 
                                Uniform f32* %288 = OpAccessChain %28 %282 
                                         f32 %289 = OpLoad %288 
                                Uniform f32* %290 = OpAccessChain %28 %282 
                                         f32 %291 = OpLoad %290 
                                       f32_4 %292 = OpCompositeConstruct %284 %287 %289 %291 
                                      bool_4 %294 = OpFOrdGreaterThanEqual %281 %292 
                                      bool_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %234 %295 
                                      bool_2 %298 = OpLoad %234 
                                       f32_2 %299 = OpSelect %298 %297 %296 
                                       f32_2 %300 = OpExtInst %1 46 %296 %297 %299 
                                       f32_4 %301 = OpLoad %147 
                                       f32_4 %302 = OpVectorShuffle %301 %300 4 5 2 3 
                                                      OpStore %147 %302 
                                Private f32* %304 = OpAccessChain %147 %303 
                                         f32 %305 = OpLoad %304 
                                Private f32* %306 = OpAccessChain %147 %64 
                                         f32 %307 = OpLoad %306 
                                         f32 %308 = OpFAdd %305 %307 
                                Private f32* %309 = OpAccessChain %147 %64 
                                                      OpStore %309 %308 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpFNegate %310 
                                       f32_4 %313 = OpFAdd %311 %312 
                                                      OpStore %25 %313 
                                       f32_4 %314 = OpLoad %147 
                                       f32_4 %315 = OpVectorShuffle %314 %314 0 0 0 0 
                                       f32_4 %316 = OpLoad %25 
                                       f32_4 %317 = OpFMul %315 %316 
                                       f32_4 %318 = OpLoad %9 
                                       f32_4 %319 = OpFAdd %317 %318 
                                                      OpStore %9 %319 
                                Uniform f32* %321 = OpAccessChain %28 %320 
                                         f32 %322 = OpLoad %321 
                                        bool %323 = OpFOrdEqual %322 %75 
                                      bool_2 %324 = OpLoad %234 
                                      bool_2 %325 = OpCompositeInsert %323 %324 0 
                                                      OpStore %234 %325 
                                                      OpSelectionMerge %328 None 
                                                      OpBranchConditional %326 %327 %328 
                                             %327 = OpLabel 
                                      bool_2 %329 = OpLoad %234 
                                        bool %330 = OpCompositeExtract %329 0 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %330 %331 %332 
                                             %331 = OpLabel 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                                      OpBranch %328 
                                             %328 = OpLabel 
                                                      OpSelectionMerge %335 None 
                                                      OpBranchConditional %333 %334 %340 
                                             %334 = OpLabel 
                                       f32_4 %338 = OpLoad %9 
                                                      OpStore %337 %338 
                                                      OpReturn
                                             %340 = OpLabel 
                                       f32_4 %341 = OpLoad %9 
                                       f32_3 %342 = OpVectorShuffle %341 %341 0 1 2 
                                       f32_3 %343 = OpExtInst %1 30 %342 
                                       f32_4 %344 = OpLoad %9 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 5 6 3 
                                                      OpStore %9 %345 
                                       f32_4 %346 = OpLoad %9 
                                       f32_3 %347 = OpVectorShuffle %346 %346 0 1 2 
                                Uniform f32* %348 = OpAccessChain %28 %320 
                                         f32 %349 = OpLoad %348 
                                       f32_3 %350 = OpCompositeConstruct %349 %349 %349 
                                       f32_3 %351 = OpFMul %347 %350 
                                       f32_4 %352 = OpLoad %9 
                                       f32_4 %353 = OpVectorShuffle %352 %351 4 5 6 3 
                                                      OpStore %9 %353 
                                       f32_4 %354 = OpLoad %9 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_3 %356 = OpExtInst %1 29 %355 
                                       f32_4 %357 = OpLoad %337 
                                       f32_4 %358 = OpVectorShuffle %357 %356 4 5 6 3 
                                                      OpStore %337 %358 
                                Private f32* %359 = OpAccessChain %9 %157 
                                         f32 %360 = OpLoad %359 
                                 Output f32* %362 = OpAccessChain %337 %157 
                                                      OpStore %362 %360 
                                                      OpReturn
                                             %335 = OpLabel 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "LOWLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LOWLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    u_xlat0.xyz = in_POSITION0.xyz * vec3(30.0, 16.875, 1.0) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = u_xlat0.y * 0.2588;
    vs_TEXCOORD1.x = u_xlat0.x * 0.964999974 + (-u_xlat6);
    vs_TEXCOORD1.y = dot(u_xlat0.xy, vec2(0.2588, 0.964999974));
    vs_TEXCOORD1.z = u_xlat0.z;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OcclusionUV;
uniform 	vec4 _OcclusionFallbackColor;
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
uniform 	float _GammaGamma;
uniform 	vec4 _LowlightColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _GBuffer;
uniform  sampler2D _OcclusionMap;
uniform  sampler2D _DamagedTex;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat10_3;
float u_xlat5;
float u_xlat6;
float u_xlat10;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_GBuffer, vs_TEXCOORD0.xy);
    u_xlat2.xy = vs_TEXCOORD1.xy * vec2(0.200000003, 0.200000003);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 0.449999988;
    u_xlat6 = cos(u_xlat2.y);
    u_xlat2.x = u_xlat6 * u_xlat2.x;
    u_xlat1 = _LowlightColor * u_xlat2.xxxx + u_xlat10_1;
    u_xlat2.xy = (-_OcclusionUV.xy) + _OcclusionUV.zw;
    u_xlat2.xy = vs_TEXCOORD0.xy * u_xlat2.xy + _OcclusionUV.xy;
    u_xlat10_3 = texture(_OcclusionMap, u_xlat2.xy);
    u_xlatb2 = u_xlat2.x<0.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(0.0, 1.0) : u_xlat10_3.xw;
    u_xlat3.xyz = (-u_xlat0.xyz) + _OcclusionFallbackColor.xyz;
    u_xlat2.xzw = u_xlat2.xxx * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat2.xzw * u_xlat2.yyy;
    u_xlat2.xy = vs_TEXCOORD0.yx + vec2(-0.5, -0.5);
    u_xlat10 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat10 = (-u_xlat10) * _VignettePower + 1.0;
    u_xlat0 = u_xlat0 * u_xlat1 + (-_VignetteColor);
    u_xlat0 = vec4(u_xlat10) * u_xlat0 + _VignetteColor;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.222000003, 0.707000017, 0.0710000023));
    u_xlat5 = (-u_xlat0.w) + 1.0;
    u_xlat5 = _Tubiness * u_xlat5 + _Saturation;
    u_xlat3.xyz = u_xlat1.xxx * _SaturationColor.xyz;
    u_xlat1.xzw = (-u_xlat1.xxx) * _SaturationColor.xyz + u_xlat0.xyz;
    u_xlat1.xyz = vec3(u_xlat5) * u_xlat1.xzw + u_xlat3.xyz;
    u_xlat10_3 = texture(_DamagedTex, vs_TEXCOORD0.xy);
    u_xlat13 = u_xlat10_3.w * _DamagedPower;
    u_xlat3.xyz = (-u_xlat1.xyz) + u_xlat10_3.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlatb1.x = 1.0>=_Fade;
    u_xlat1.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat3 = u_xlat0;
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 + (-_FadeColor);
    u_xlat0 = vec4(_Fade) * u_xlat0 + _FadeColor;
    u_xlatb1.xy = greaterThanEqual(abs(u_xlat2.xyxx), vec4(_LetterboxFrac, _WindowboxFrac, _LetterboxFrac, _LetterboxFrac)).xy;
    u_xlat1.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb1.xy));
    u_xlat1.x = u_xlat1.y + u_xlat1.x;
    u_xlat2 = (-u_xlat0) + vec4(0.0, 0.0, 0.0, 1.0);
    u_xlat0 = u_xlat1.xxxx * u_xlat2 + u_xlat0;
    u_xlatb1.x = _GammaGamma==1.0;
    if(u_xlatb1.x){
        SV_Target0 = u_xlat0;
        return;
    } else {
        u_xlat0.xyz = log2(u_xlat0.xyz);
        u_xlat0.xyz = u_xlat0.xyz * vec3(_GammaGamma);
        SV_Target0.xyz = exp2(u_xlat0.xyz);
        SV_Target0.w = u_xlat0.w;
        return;
    //ENDIF
    }
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "LOWLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %73 %95 %103 %138 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %71 0 BuiltIn 71 
                                                      OpMemberDecorate %71 1 BuiltIn 71 
                                                      OpMemberDecorate %71 2 BuiltIn 71 
                                                      OpDecorate %71 Block 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %138 Location 138 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %14 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_3; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %69 = OpConstant 1 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeStruct %7 %6 %70 
                                              %72 = OpTypePointer Output %71 
         Output struct {f32_4; f32; f32[1];}* %73 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                              %83 = OpTypeBool 
                                              %84 = OpTypePointer Private %83 
                                Private bool* %85 = OpVariable Private 
                                              %86 = OpTypePointer Uniform %6 
                                          f32 %89 = OpConstant 3.67402E-40 
                                              %91 = OpTypePointer Private %6 
                                 Private f32* %92 = OpVariable Private 
                                              %93 = OpTypeVector %6 2 
                                              %94 = OpTypePointer Input %93 
                                 Input f32_2* %95 = OpVariable Input 
                                              %96 = OpTypePointer Input %6 
                                         f32 %100 = OpConstant 3.67402E-40 
                                             %102 = OpTypePointer Output %93 
                               Output f32_2* %103 = OpVariable Output 
                                             %104 = OpTypePointer Function %6 
                                             %114 = OpTypePointer Output %6 
                                         u32 %116 = OpConstant 0 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                                       f32_3 %124 = OpConstantComposite %122 %123 %100 
                                             %126 = OpTypePointer Uniform %14 
                                Private f32* %132 = OpVariable Private 
                                         f32 %135 = OpConstant 3.67402E-40 
                                             %137 = OpTypePointer Output %14 
                               Output f32_3* %138 = OpVariable Output 
                                         f32 %141 = OpConstant 3.67402E-40 
                                       f32_2 %149 = OpConstantComposite %135 %141 
                                         u32 %152 = OpConstant 2 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %105 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %36 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %36 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %36 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %74 = OpAccessChain %21 %36 %45 
                                        f32_4 %75 = OpLoad %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %49 
                                        f32_4 %80 = OpFAdd %78 %79 
                                Output f32_4* %82 = OpAccessChain %73 %28 
                                                      OpStore %82 %80 
                                 Uniform f32* %87 = OpAccessChain %21 %45 %69 
                                          f32 %88 = OpLoad %87 
                                         bool %90 = OpFOrdLessThan %88 %89 
                                                      OpStore %85 %90 
                                   Input f32* %97 = OpAccessChain %95 %69 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFNegate %98 
                                         f32 %101 = OpFAdd %99 %100 
                                                      OpStore %92 %101 
                                        bool %106 = OpLoad %85 
                                                      OpSelectionMerge %108 None 
                                                      OpBranchConditional %106 %107 %110 
                                             %107 = OpLabel 
                                         f32 %109 = OpLoad %92 
                                                      OpStore %105 %109 
                                                      OpBranch %108 
                                             %110 = OpLabel 
                                  Input f32* %111 = OpAccessChain %95 %69 
                                         f32 %112 = OpLoad %111 
                                                      OpStore %105 %112 
                                                      OpBranch %108 
                                             %108 = OpLabel 
                                         f32 %113 = OpLoad %105 
                                 Output f32* %115 = OpAccessChain %103 %69 
                                                      OpStore %115 %113 
                                  Input f32* %117 = OpAccessChain %95 %116 
                                         f32 %118 = OpLoad %117 
                                 Output f32* %119 = OpAccessChain %103 %116 
                                                      OpStore %119 %118 
                                       f32_4 %120 = OpLoad %11 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 1 2 
                                       f32_3 %125 = OpFMul %121 %124 
                              Uniform f32_3* %127 = OpAccessChain %21 %28 
                                       f32_3 %128 = OpLoad %127 
                                       f32_3 %129 = OpFAdd %125 %128 
                                       f32_4 %130 = OpLoad %9 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %9 %131 
                                Private f32* %133 = OpAccessChain %9 %69 
                                         f32 %134 = OpLoad %133 
                                         f32 %136 = OpFMul %134 %135 
                                                      OpStore %132 %136 
                                Private f32* %139 = OpAccessChain %9 %116 
                                         f32 %140 = OpLoad %139 
                                         f32 %142 = OpFMul %140 %141 
                                         f32 %143 = OpLoad %132 
                                         f32 %144 = OpFNegate %143 
                                         f32 %145 = OpFAdd %142 %144 
                                 Output f32* %146 = OpAccessChain %138 %116 
                                                      OpStore %146 %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 1 
                                         f32 %150 = OpDot %148 %149 
                                 Output f32* %151 = OpAccessChain %138 %69 
                                                      OpStore %151 %150 
                                Private f32* %153 = OpAccessChain %9 %152 
                                         f32 %154 = OpLoad %153 
                                 Output f32* %155 = OpAccessChain %138 %152 
                                                      OpStore %155 %154 
                                 Output f32* %156 = OpAccessChain %73 %28 %69 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %73 %28 %69 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %28 %373 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %28 Location 28 
                                                      OpMemberDecorate %62 0 Offset 62 
                                                      OpMemberDecorate %62 1 Offset 62 
                                                      OpMemberDecorate %62 2 Offset 62 
                                                      OpMemberDecorate %62 3 Offset 62 
                                                      OpMemberDecorate %62 4 Offset 62 
                                                      OpMemberDecorate %62 5 Offset 62 
                                                      OpMemberDecorate %62 6 Offset 62 
                                                      OpMemberDecorate %62 7 Offset 62 
                                                      OpMemberDecorate %62 8 Offset 62 
                                                      OpMemberDecorate %62 9 Offset 62 
                                                      OpMemberDecorate %62 10 Offset 62 
                                                      OpMemberDecorate %62 11 Offset 62 
                                                      OpMemberDecorate %62 12 Offset 62 
                                                      OpMemberDecorate %62 13 Offset 62 
                                                      OpDecorate %62 Block 
                                                      OpDecorate %64 DescriptorSet 64 
                                                      OpDecorate %64 Binding 64 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %96 DescriptorSet 96 
                                                      OpDecorate %96 Binding 96 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %240 DescriptorSet 240 
                                                      OpDecorate %240 Binding 240 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %369 SpecId 369 
                                                      OpDecorate %373 Location 373 
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
  UniformConstant read_only Texture2DSampled* %21 = OpVariable UniformConstant 
                               Private f32_4* %25 = OpVariable Private 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypePointer Input %26 
                                 Input f32_3* %28 = OpVariable Input 
                                          f32 %31 = OpConstant 3.67402E-40 
                                        f32_2 %32 = OpConstantComposite %31 %31 
                                              %36 = OpTypeInt 32 0 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                          f32 %45 = OpConstant 3.67402E-40 
                                              %48 = OpTypePointer Private %15 
                               Private f32_2* %49 = OpVariable Private 
                                          u32 %50 = OpConstant 1 
                               Private f32_4* %61 = OpVariable Private 
                                              %62 = OpTypeStruct %7 %7 %6 %7 %6 %7 %6 %7 %6 %6 %6 %6 %6 %7 
                                              %63 = OpTypePointer Uniform %62 
Uniform struct {f32_4; f32_4; f32; f32_4; f32; f32_4; f32; f32_4; f32; f32; f32; f32; f32; f32_4;}* %64 = OpVariable Uniform 
                                              %65 = OpTypeInt 32 1 
                                          i32 %66 = OpConstant 13 
                                              %67 = OpTypePointer Uniform %7 
                                          i32 %75 = OpConstant 0 
  UniformConstant read_only Texture2DSampled* %96 = OpVariable UniformConstant 
                                             %102 = OpTypeBool 
                                             %103 = OpTypePointer Private %102 
                               Private bool* %104 = OpVariable Private 
                                         f32 %107 = OpConstant 3.67402E-40 
                                             %109 = OpTypePointer Function %15 
                                         f32 %114 = OpConstant 3.67402E-40 
                                       f32_2 %115 = OpConstantComposite %107 %114 
                              Private f32_4* %121 = OpVariable Private 
                                         i32 %125 = OpConstant 1 
                                         f32 %151 = OpConstant 3.67402E-40 
                                       f32_2 %152 = OpConstantComposite %151 %151 
                                Private f32* %156 = OpVariable Private 
                                         i32 %164 = OpConstant 2 
                                             %165 = OpTypePointer Uniform %6 
                                         i32 %173 = OpConstant 3 
                                         f32 %187 = OpConstant 3.67402E-40 
                                         f32 %188 = OpConstant 3.67402E-40 
                                         f32 %189 = OpConstant 3.67402E-40 
                                       f32_3 %190 = OpConstantComposite %187 %188 %189 
                                Private f32* %193 = OpVariable Private 
                                         u32 %194 = OpConstant 3 
                                         i32 %199 = OpConstant 11 
                                         i32 %204 = OpConstant 4 
                                         i32 %210 = OpConstant 5 
                              Private f32_4* %239 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %240 = OpVariable UniformConstant 
                                Private f32* %244 = OpVariable Private 
                                         i32 %247 = OpConstant 10 
                                             %269 = OpTypeVector %102 2 
                                             %270 = OpTypePointer Private %269 
                             Private bool_2* %271 = OpVariable Private 
                                         i32 %272 = OpConstant 6 
                                             %278 = OpTypePointer Function %6 
                                         i32 %303 = OpConstant 7 
                                         i32 %319 = OpConstant 8 
                                         i32 %322 = OpConstant 9 
                                             %330 = OpTypeVector %102 4 
                                       f32_2 %333 = OpConstantComposite %107 %107 
                                       f32_2 %334 = OpConstantComposite %114 %114 
                                       f32_4 %348 = OpConstantComposite %107 %107 %107 %114 
                                         i32 %356 = OpConstant 12 
                                        bool %362 = OpConstantFalse 
                                        bool %369 = OpSpecConstantFalse 
                                             %372 = OpTypePointer Output %7 
                               Output f32_4* %373 = OpVariable Output 
                                             %397 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %110 = OpVariable Function 
                               Function f32* %279 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                   read_only Texture2DSampled %22 = OpLoad %21 
                                        f32_2 %23 = OpLoad %17 
                                        f32_4 %24 = OpImageSampleImplicitLod %22 %23 
                                                      OpStore %20 %24 
                                        f32_3 %29 = OpLoad %28 
                                        f32_2 %30 = OpVectorShuffle %29 %29 0 1 
                                        f32_2 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %25 
                                        f32_4 %35 = OpVectorShuffle %34 %33 4 5 2 3 
                                                      OpStore %25 %35 
                                 Private f32* %39 = OpAccessChain %25 %37 
                                          f32 %40 = OpLoad %39 
                                          f32 %41 = OpExtInst %1 13 %40 
                                 Private f32* %42 = OpAccessChain %25 %37 
                                                      OpStore %42 %41 
                                 Private f32* %43 = OpAccessChain %25 %37 
                                          f32 %44 = OpLoad %43 
                                          f32 %46 = OpFMul %44 %45 
                                 Private f32* %47 = OpAccessChain %25 %37 
                                                      OpStore %47 %46 
                                 Private f32* %51 = OpAccessChain %25 %50 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpExtInst %1 14 %52 
                                 Private f32* %54 = OpAccessChain %49 %37 
                                                      OpStore %54 %53 
                                 Private f32* %55 = OpAccessChain %49 %37 
                                          f32 %56 = OpLoad %55 
                                 Private f32* %57 = OpAccessChain %25 %37 
                                          f32 %58 = OpLoad %57 
                                          f32 %59 = OpFMul %56 %58 
                                 Private f32* %60 = OpAccessChain %25 %37 
                                                      OpStore %60 %59 
                               Uniform f32_4* %68 = OpAccessChain %64 %66 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %25 
                                        f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %20 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %61 %74 
                               Uniform f32_4* %76 = OpAccessChain %64 %75 
                                        f32_4 %77 = OpLoad %76 
                                        f32_2 %78 = OpVectorShuffle %77 %77 0 1 
                                        f32_2 %79 = OpFNegate %78 
                               Uniform f32_4* %80 = OpAccessChain %64 %75 
                                        f32_4 %81 = OpLoad %80 
                                        f32_2 %82 = OpVectorShuffle %81 %81 2 3 
                                        f32_2 %83 = OpFAdd %79 %82 
                                        f32_4 %84 = OpLoad %25 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 2 3 
                                                      OpStore %25 %85 
                                        f32_2 %86 = OpLoad %17 
                                        f32_4 %87 = OpLoad %25 
                                        f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                        f32_2 %89 = OpFMul %86 %88 
                               Uniform f32_4* %90 = OpAccessChain %64 %75 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFAdd %89 %92 
                                        f32_4 %94 = OpLoad %25 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %25 %95 
                   read_only Texture2DSampled %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %25 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                       f32_4 %100 = OpImageSampleImplicitLod %97 %99 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 3 
                                                      OpStore %49 %101 
                                Private f32* %105 = OpAccessChain %25 %37 
                                         f32 %106 = OpLoad %105 
                                        bool %108 = OpFOrdLessThan %106 %107 
                                                      OpStore %104 %108 
                                        bool %111 = OpLoad %104 
                                                      OpSelectionMerge %113 None 
                                                      OpBranchConditional %111 %112 %116 
                                             %112 = OpLabel 
                                                      OpStore %110 %115 
                                                      OpBranch %113 
                                             %116 = OpLabel 
                                       f32_2 %117 = OpLoad %49 
                                                      OpStore %110 %117 
                                                      OpBranch %113 
                                             %113 = OpLabel 
                                       f32_2 %118 = OpLoad %110 
                                       f32_4 %119 = OpLoad %25 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %25 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                                       f32_3 %124 = OpFNegate %123 
                              Uniform f32_4* %126 = OpAccessChain %64 %125 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %124 %128 
                                       f32_4 %130 = OpLoad %121 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %121 %131 
                                       f32_4 %132 = OpLoad %25 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 0 0 
                                       f32_4 %134 = OpLoad %121 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %25 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 1 5 6 
                                                      OpStore %25 %141 
                                       f32_4 %142 = OpLoad %25 
                                       f32_3 %143 = OpVectorShuffle %142 %142 0 2 3 
                                       f32_4 %144 = OpLoad %25 
                                       f32_3 %145 = OpVectorShuffle %144 %144 1 1 1 
                                       f32_3 %146 = OpFMul %143 %145 
                                       f32_4 %147 = OpLoad %9 
                                       f32_4 %148 = OpVectorShuffle %147 %146 4 5 6 3 
                                                      OpStore %9 %148 
                                       f32_2 %149 = OpLoad %17 
                                       f32_2 %150 = OpVectorShuffle %149 %149 1 0 
                                       f32_2 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %25 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 2 3 
                                                      OpStore %25 %155 
                                       f32_4 %157 = OpLoad %25 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_4 %159 = OpLoad %25 
                                       f32_2 %160 = OpVectorShuffle %159 %159 0 1 
                                         f32 %161 = OpDot %158 %160 
                                                      OpStore %156 %161 
                                         f32 %162 = OpLoad %156 
                                         f32 %163 = OpFNegate %162 
                                Uniform f32* %166 = OpAccessChain %64 %164 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFMul %163 %167 
                                         f32 %169 = OpFAdd %168 %114 
                                                      OpStore %156 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpLoad %61 
                                       f32_4 %172 = OpFMul %170 %171 
                              Uniform f32_4* %174 = OpAccessChain %64 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpFNegate %175 
                                       f32_4 %177 = OpFAdd %172 %176 
                                                      OpStore %9 %177 
                                         f32 %178 = OpLoad %156 
                                       f32_4 %179 = OpCompositeConstruct %178 %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_4 %181 = OpFMul %179 %180 
                              Uniform f32_4* %182 = OpAccessChain %64 %173 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpFAdd %181 %183 
                                                      OpStore %9 %184 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                         f32 %191 = OpDot %186 %190 
                                Private f32* %192 = OpAccessChain %61 %37 
                                                      OpStore %192 %191 
                                Private f32* %195 = OpAccessChain %9 %194 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFNegate %196 
                                         f32 %198 = OpFAdd %197 %114 
                                                      OpStore %193 %198 
                                Uniform f32* %200 = OpAccessChain %64 %199 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpLoad %193 
                                         f32 %203 = OpFMul %201 %202 
                                Uniform f32* %205 = OpAccessChain %64 %204 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFAdd %203 %206 
                                                      OpStore %193 %207 
                                       f32_4 %208 = OpLoad %61 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 0 0 
                              Uniform f32_4* %211 = OpAccessChain %64 %210 
                                       f32_4 %212 = OpLoad %211 
                                       f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                                       f32_3 %214 = OpFMul %209 %213 
                                       f32_4 %215 = OpLoad %121 
                                       f32_4 %216 = OpVectorShuffle %215 %214 4 5 6 3 
                                                      OpStore %121 %216 
                                       f32_4 %217 = OpLoad %61 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 0 0 
                                       f32_3 %219 = OpFNegate %218 
                              Uniform f32_4* %220 = OpAccessChain %64 %210 
                                       f32_4 %221 = OpLoad %220 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFMul %219 %222 
                                       f32_4 %224 = OpLoad %9 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                       f32_3 %226 = OpFAdd %223 %225 
                                       f32_4 %227 = OpLoad %61 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 1 5 6 
                                                      OpStore %61 %228 
                                         f32 %229 = OpLoad %193 
                                       f32_3 %230 = OpCompositeConstruct %229 %229 %229 
                                       f32_4 %231 = OpLoad %61 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 2 3 
                                       f32_3 %233 = OpFMul %230 %232 
                                       f32_4 %234 = OpLoad %121 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFAdd %233 %235 
                                       f32_4 %237 = OpLoad %61 
                                       f32_4 %238 = OpVectorShuffle %237 %236 4 5 6 3 
                                                      OpStore %61 %238 
                  read_only Texture2DSampled %241 = OpLoad %240 
                                       f32_2 %242 = OpLoad %17 
                                       f32_4 %243 = OpImageSampleImplicitLod %241 %242 
                                                      OpStore %239 %243 
                                Private f32* %245 = OpAccessChain %239 %194 
                                         f32 %246 = OpLoad %245 
                                Uniform f32* %248 = OpAccessChain %64 %247 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFMul %246 %249 
                                                      OpStore %244 %250 
                                       f32_4 %251 = OpLoad %61 
                                       f32_3 %252 = OpVectorShuffle %251 %251 0 1 2 
                                       f32_3 %253 = OpFNegate %252 
                                       f32_4 %254 = OpLoad %239 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_3 %256 = OpFAdd %253 %255 
                                       f32_4 %257 = OpLoad %121 
                                       f32_4 %258 = OpVectorShuffle %257 %256 4 5 6 3 
                                                      OpStore %121 %258 
                                         f32 %259 = OpLoad %244 
                                       f32_3 %260 = OpCompositeConstruct %259 %259 %259 
                                       f32_4 %261 = OpLoad %121 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                                       f32_3 %263 = OpFMul %260 %262 
                                       f32_4 %264 = OpLoad %61 
                                       f32_3 %265 = OpVectorShuffle %264 %264 0 1 2 
                                       f32_3 %266 = OpFAdd %263 %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %9 %268 
                                Uniform f32* %273 = OpAccessChain %64 %272 
                                         f32 %274 = OpLoad %273 
                                        bool %275 = OpFOrdGreaterThanEqual %114 %274 
                                      bool_2 %276 = OpLoad %271 
                                      bool_2 %277 = OpCompositeInsert %275 %276 0 
                                                      OpStore %271 %277 
                                      bool_2 %280 = OpLoad %271 
                                        bool %281 = OpCompositeExtract %280 0 
                                                      OpSelectionMerge %283 None 
                                                      OpBranchConditional %281 %282 %284 
                                             %282 = OpLabel 
                                                      OpStore %279 %114 
                                                      OpBranch %283 
                                             %284 = OpLabel 
                                                      OpStore %279 %107 
                                                      OpBranch %283 
                                             %283 = OpLabel 
                                         f32 %285 = OpLoad %279 
                                Private f32* %286 = OpAccessChain %61 %37 
                                                      OpStore %286 %285 
                                       f32_4 %287 = OpLoad %9 
                                                      OpStore %121 %287 
                                       f32_4 %288 = OpLoad %121 
                                       f32_4 %289 = OpCompositeConstruct %107 %107 %107 %107 
                                       f32_4 %290 = OpCompositeConstruct %114 %114 %114 %114 
                                       f32_4 %291 = OpExtInst %1 43 %288 %289 %290 
                                                      OpStore %121 %291 
                                       f32_4 %292 = OpLoad %9 
                                       f32_4 %293 = OpLoad %121 
                                       f32_4 %294 = OpFNegate %293 
                                       f32_4 %295 = OpFAdd %292 %294 
                                                      OpStore %9 %295 
                                       f32_4 %296 = OpLoad %61 
                                       f32_4 %297 = OpVectorShuffle %296 %296 0 0 0 0 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpFMul %297 %298 
                                       f32_4 %300 = OpLoad %121 
                                       f32_4 %301 = OpFAdd %299 %300 
                                                      OpStore %9 %301 
                                       f32_4 %302 = OpLoad %9 
                              Uniform f32_4* %304 = OpAccessChain %64 %303 
                                       f32_4 %305 = OpLoad %304 
                                       f32_4 %306 = OpFNegate %305 
                                       f32_4 %307 = OpFAdd %302 %306 
                                                      OpStore %9 %307 
                                Uniform f32* %308 = OpAccessChain %64 %272 
                                         f32 %309 = OpLoad %308 
                                       f32_4 %310 = OpCompositeConstruct %309 %309 %309 %309 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %312 = OpFMul %310 %311 
                              Uniform f32_4* %313 = OpAccessChain %64 %303 
                                       f32_4 %314 = OpLoad %313 
                                       f32_4 %315 = OpFAdd %312 %314 
                                                      OpStore %9 %315 
                                       f32_4 %316 = OpLoad %25 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 1 0 0 
                                       f32_4 %318 = OpExtInst %1 4 %317 
                                Uniform f32* %320 = OpAccessChain %64 %319 
                                         f32 %321 = OpLoad %320 
                                Uniform f32* %323 = OpAccessChain %64 %322 
                                         f32 %324 = OpLoad %323 
                                Uniform f32* %325 = OpAccessChain %64 %319 
                                         f32 %326 = OpLoad %325 
                                Uniform f32* %327 = OpAccessChain %64 %319 
                                         f32 %328 = OpLoad %327 
                                       f32_4 %329 = OpCompositeConstruct %321 %324 %326 %328 
                                      bool_4 %331 = OpFOrdGreaterThanEqual %318 %329 
                                      bool_2 %332 = OpVectorShuffle %331 %331 0 1 
                                                      OpStore %271 %332 
                                      bool_2 %335 = OpLoad %271 
                                       f32_2 %336 = OpSelect %335 %334 %333 
                                       f32_2 %337 = OpExtInst %1 46 %333 %334 %336 
                                       f32_4 %338 = OpLoad %61 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 2 3 
                                                      OpStore %61 %339 
                                Private f32* %340 = OpAccessChain %61 %50 
                                         f32 %341 = OpLoad %340 
                                Private f32* %342 = OpAccessChain %61 %37 
                                         f32 %343 = OpLoad %342 
                                         f32 %344 = OpFAdd %341 %343 
                                Private f32* %345 = OpAccessChain %61 %37 
                                                      OpStore %345 %344 
                                       f32_4 %346 = OpLoad %9 
                                       f32_4 %347 = OpFNegate %346 
                                       f32_4 %349 = OpFAdd %347 %348 
                                                      OpStore %25 %349 
                                       f32_4 %350 = OpLoad %61 
                                       f32_4 %351 = OpVectorShuffle %350 %350 0 0 0 0 
                                       f32_4 %352 = OpLoad %25 
                                       f32_4 %353 = OpFMul %351 %352 
                                       f32_4 %354 = OpLoad %9 
                                       f32_4 %355 = OpFAdd %353 %354 
                                                      OpStore %9 %355 
                                Uniform f32* %357 = OpAccessChain %64 %356 
                                         f32 %358 = OpLoad %357 
                                        bool %359 = OpFOrdEqual %358 %114 
                                      bool_2 %360 = OpLoad %271 
                                      bool_2 %361 = OpCompositeInsert %359 %360 0 
                                                      OpStore %271 %361 
                                                      OpSelectionMerge %364 None 
                                                      OpBranchConditional %362 %363 %364 
                                             %363 = OpLabel 
                                      bool_2 %365 = OpLoad %271 
                                        bool %366 = OpCompositeExtract %365 0 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %366 %367 %368 
                                             %367 = OpLabel 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                                      OpBranch %364 
                                             %364 = OpLabel 
                                                      OpSelectionMerge %371 None 
                                                      OpBranchConditional %369 %370 %376 
                                             %370 = OpLabel 
                                       f32_4 %374 = OpLoad %9 
                                                      OpStore %373 %374 
                                                      OpReturn
                                             %376 = OpLabel 
                                       f32_4 %377 = OpLoad %9 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpExtInst %1 30 %378 
                                       f32_4 %380 = OpLoad %9 
                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
                                                      OpStore %9 %381 
                                       f32_4 %382 = OpLoad %9 
                                       f32_3 %383 = OpVectorShuffle %382 %382 0 1 2 
                                Uniform f32* %384 = OpAccessChain %64 %356 
                                         f32 %385 = OpLoad %384 
                                       f32_3 %386 = OpCompositeConstruct %385 %385 %385 
                                       f32_3 %387 = OpFMul %383 %386 
                                       f32_4 %388 = OpLoad %9 
                                       f32_4 %389 = OpVectorShuffle %388 %387 4 5 6 3 
                                                      OpStore %9 %389 
                                       f32_4 %390 = OpLoad %9 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
                                       f32_3 %392 = OpExtInst %1 29 %391 
                                       f32_4 %393 = OpLoad %373 
                                       f32_4 %394 = OpVectorShuffle %393 %392 4 5 6 3 
                                                      OpStore %373 %394 
                                Private f32* %395 = OpAccessChain %9 %194 
                                         f32 %396 = OpLoad %395 
                                 Output f32* %398 = OpAccessChain %373 %194 
                                                      OpStore %398 %396 
                                                      OpReturn
                                             %371 = OpLabel 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "LOWLIGHT_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LOWLIGHT_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "LOWLIGHT_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "LOWLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "LOWLIGHT_ON" }
""
}
SubProgram "vulkan " {
Keywords { "LOWLIGHT_ON" }
""
}
}
}
}
}