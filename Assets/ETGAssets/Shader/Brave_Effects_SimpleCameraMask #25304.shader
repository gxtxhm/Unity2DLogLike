//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/SimpleCameraMask" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_BGTex ("BG (RGB)", 2D) = "white" { }
_MaskTex ("Mask (RGB)", 2D) = "white" { }
_MinimapMaskTexPng ("Minimap Mask (R)", 2D) = "white" { }
_Fade ("Fade", Range(0, 1)) = 1
_BGTexUV ("BGTexUV", Vector) = (0,0,0,0)
_CameraRect ("CameraRect", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest Always
  GpuProgramID 49430
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

uniform 	float _Fade;
uniform 	vec4 _BGTexUV;
uniform 	float _FullMapActive;
uniform 	vec4 _CameraRect;
uniform  sampler2D _BGTex;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
uniform  sampler2D _MinimapMaskTexPng;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
ivec2 u_xlati1;
vec4 u_xlat10_2;
vec2 u_xlat3;
ivec2 u_xlati3;
bool u_xlatb3;
vec2 u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_CameraRect.xy);
    u_xlat6.xy = vec2(1.0, 1.0) / _CameraRect.zw;
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
    u_xlat10_0 = texture(_MaskTex, u_xlat0.xy);
    u_xlatb3 = u_xlat10_0.x>=0.100000001;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat10_0.x * u_xlat3.x;
    u_xlat10_1 = texture(_MinimapMaskTexPng, vs_TEXCOORD0.xy);
    u_xlatb3 = u_xlat10_1.x>=0.100000001;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat0.y = u_xlat10_1.x * u_xlat3.x;
    u_xlat0.xy = u_xlat0.xy * vec2(_Fade);
    u_xlatb6 = 0.5<_FullMapActive;
    u_xlat0.x = (u_xlatb6) ? u_xlat0.x : u_xlat0.y;
    u_xlat3.xy = vs_TEXCOORD0.xy + (-_BGTexUV.xy);
    u_xlat1.xy = vec2(1.0, 1.0) / _BGTexUV.zw;
    u_xlat3.xy = u_xlat3.xy * u_xlat1.xy;
    u_xlat1.xy = (-u_xlat3.xy) * vec2(2.0, 2.0) + vec2(1.0, 1.0);
    u_xlat10_2 = texture(_BGTex, u_xlat3.xy);
    u_xlat3.xy = -abs(u_xlat1.xy) + vec2(1.0, 1.0);
    u_xlati1.xy = ivec2(uvec2(lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3.xyxx).xy) * 0xFFFFFFFFu);
    u_xlati3.xy = ivec2(uvec2(lessThan(u_xlat3.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy) * 0xFFFFFFFFu);
    u_xlati3.xy = (-u_xlati1.xy) + u_xlati3.xy;
    u_xlati3.xy = u_xlati3.xy + ivec2(1, 1);
    u_xlat3.xy = vec2(u_xlati3.xy);
    u_xlat3.xy = u_xlat3.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat1 = u_xlat3.xxxx * u_xlat10_2;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat1 * u_xlat3.yyyy + (-u_xlat10_2);
    SV_Target0 = u_xlat0.xxxx * u_xlat1 + u_xlat10_2;
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
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
                        Output f32_2* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_2 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 226
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %11 %218 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 RelaxedPrecision 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpMemberDecorate %14 1 Offset 14 
                                                     OpMemberDecorate %14 2 Offset 14 
                                                     OpMemberDecorate %14 3 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %38 RelaxedPrecision 
                                                     OpDecorate %38 DescriptorSet 38 
                                                     OpDecorate %38 Binding 38 
                                                     OpDecorate %39 RelaxedPrecision 
                                                     OpDecorate %44 RelaxedPrecision 
                                                     OpDecorate %78 RelaxedPrecision 
                                                     OpDecorate %78 DescriptorSet 78 
                                                     OpDecorate %78 Binding 78 
                                                     OpDecorate %79 RelaxedPrecision 
                                                     OpDecorate %80 RelaxedPrecision 
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %123 RelaxedPrecision 
                                                     OpDecorate %150 RelaxedPrecision 
                                                     OpDecorate %151 RelaxedPrecision 
                                                     OpDecorate %151 DescriptorSet 151 
                                                     OpDecorate %151 Binding 151 
                                                     OpDecorate %152 RelaxedPrecision 
                                                     OpDecorate %204 RelaxedPrecision 
                                                     OpDecorate %206 RelaxedPrecision 
                                                     OpDecorate %206 DescriptorSet 206 
                                                     OpDecorate %206 Binding 206 
                                                     OpDecorate %207 RelaxedPrecision 
                                                     OpDecorate %208 RelaxedPrecision 
                                                     OpDecorate %214 RelaxedPrecision 
                                                     OpDecorate %215 RelaxedPrecision 
                                                     OpDecorate %218 Location 218 
                                                     OpDecorate %223 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Private %7 
                               Private f32_2* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeStruct %6 %13 %6 %13 
                                             %15 = OpTypePointer Uniform %14 
   Uniform struct {f32; f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 3 
                                             %19 = OpTypePointer Uniform %13 
                              Private f32_2* %25 = OpVariable Private 
                                         f32 %26 = OpConstant 3.67402E-40 
                                       f32_2 %27 = OpConstantComposite %26 %26 
                                             %35 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %36 = OpTypeSampledImage %35 
                                             %37 = OpTypePointer UniformConstant %36 
 UniformConstant read_only Texture2DSampled* %38 = OpVariable UniformConstant 
                                             %42 = OpTypeInt 32 0 
                                         u32 %43 = OpConstant 0 
                                             %45 = OpTypePointer Private %6 
                                             %47 = OpTypeBool 
                                             %48 = OpTypePointer Private %47 
                               Private bool* %49 = OpVariable Private 
                                         f32 %52 = OpConstant 3.67402E-40 
                              Private f32_2* %54 = OpVariable Private 
                                             %55 = OpTypePointer Function %6 
                                         f32 %61 = OpConstant 3.67402E-40 
                                         i32 %72 = OpConstant 0 
                                             %73 = OpTypePointer Uniform %6 
 UniformConstant read_only Texture2DSampled* %78 = OpVariable UniformConstant 
                               Private bool* %84 = OpVariable Private 
                                        f32 %107 = OpConstant 3.67402E-40 
                                        i32 %108 = OpConstant 2 
                                        i32 %124 = OpConstant 1 
                                            %130 = OpTypePointer Private %13 
                             Private f32_4* %131 = OpVariable Private 
                                        f32 %144 = OpConstant 3.67402E-40 
                                      f32_2 %145 = OpConstantComposite %144 %144 
                             Private f32_4* %150 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %151 = OpVariable UniformConstant 
                                            %160 = OpTypeVector %17 2 
                                            %161 = OpTypePointer Private %160 
                             Private i32_2* %162 = OpVariable Private 
                                      f32_4 %163 = OpConstantComposite %61 %61 %61 %61 
                                            %166 = OpTypeVector %47 4 
                                            %168 = OpTypeVector %47 2 
                                            %170 = OpTypeVector %42 2 
                                        u32 %171 = OpConstant 1 
                                      u32_2 %172 = OpConstantComposite %43 %43 
                                      u32_2 %173 = OpConstantComposite %171 %171 
                                        u32 %175 = OpConstant 4294967295 
                             Private i32_2* %179 = OpVariable Private 
                                      i32_2 %193 = OpConstantComposite %124 %124 
UniformConstant read_only Texture2DSampled* %206 = OpVariable UniformConstant 
                                            %217 = OpTypePointer Output %13 
                              Output f32_4* %218 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %56 = OpVariable Function 
                               Function f32* %88 = OpVariable Function 
                              Function f32* %112 = OpVariable Function 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %20 = OpAccessChain %16 %18 
                                       f32_4 %21 = OpLoad %20 
                                       f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                       f32_2 %23 = OpFNegate %22 
                                       f32_2 %24 = OpFAdd %12 %23 
                                                     OpStore %9 %24 
                              Uniform f32_4* %28 = OpAccessChain %16 %18 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFDiv %27 %30 
                                                     OpStore %25 %31 
                                       f32_2 %32 = OpLoad %25 
                                       f32_2 %33 = OpLoad %9 
                                       f32_2 %34 = OpFMul %32 %33 
                                                     OpStore %9 %34 
                  read_only Texture2DSampled %39 = OpLoad %38 
                                       f32_2 %40 = OpLoad %9 
                                       f32_4 %41 = OpImageSampleImplicitLod %39 %40 
                                         f32 %44 = OpCompositeExtract %41 0 
                                Private f32* %46 = OpAccessChain %9 %43 
                                                     OpStore %46 %44 
                                Private f32* %50 = OpAccessChain %9 %43 
                                         f32 %51 = OpLoad %50 
                                        bool %53 = OpFOrdGreaterThanEqual %51 %52 
                                                     OpStore %49 %53 
                                        bool %57 = OpLoad %49 
                                                     OpSelectionMerge %59 None 
                                                     OpBranchConditional %57 %58 %60 
                                             %58 = OpLabel 
                                                     OpStore %56 %26 
                                                     OpBranch %59 
                                             %60 = OpLabel 
                                                     OpStore %56 %61 
                                                     OpBranch %59 
                                             %59 = OpLabel 
                                         f32 %62 = OpLoad %56 
                                Private f32* %63 = OpAccessChain %54 %43 
                                                     OpStore %63 %62 
                                Private f32* %64 = OpAccessChain %9 %43 
                                         f32 %65 = OpLoad %64 
                                Private f32* %66 = OpAccessChain %54 %43 
                                         f32 %67 = OpLoad %66 
                                         f32 %68 = OpFMul %65 %67 
                                Private f32* %69 = OpAccessChain %9 %43 
                                                     OpStore %69 %68 
                                Private f32* %70 = OpAccessChain %9 %43 
                                         f32 %71 = OpLoad %70 
                                Uniform f32* %74 = OpAccessChain %16 %72 
                                         f32 %75 = OpLoad %74 
                                         f32 %76 = OpFMul %71 %75 
                                Private f32* %77 = OpAccessChain %9 %43 
                                                     OpStore %77 %76 
                  read_only Texture2DSampled %79 = OpLoad %78 
                                       f32_2 %80 = OpLoad %11 
                                       f32_4 %81 = OpImageSampleImplicitLod %79 %80 
                                         f32 %82 = OpCompositeExtract %81 0 
                                Private f32* %83 = OpAccessChain %54 %43 
                                                     OpStore %83 %82 
                                Private f32* %85 = OpAccessChain %54 %43 
                                         f32 %86 = OpLoad %85 
                                        bool %87 = OpFOrdGreaterThanEqual %86 %52 
                                                     OpStore %84 %87 
                                        bool %89 = OpLoad %84 
                                                     OpSelectionMerge %91 None 
                                                     OpBranchConditional %89 %90 %92 
                                             %90 = OpLabel 
                                                     OpStore %88 %26 
                                                     OpBranch %91 
                                             %92 = OpLabel 
                                                     OpStore %88 %61 
                                                     OpBranch %91 
                                             %91 = OpLabel 
                                         f32 %93 = OpLoad %88 
                                Private f32* %94 = OpAccessChain %25 %43 
                                                     OpStore %94 %93 
                                Private f32* %95 = OpAccessChain %54 %43 
                                         f32 %96 = OpLoad %95 
                                Private f32* %97 = OpAccessChain %25 %43 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFMul %96 %98 
                               Private f32* %100 = OpAccessChain %54 %43 
                                                     OpStore %100 %99 
                               Private f32* %101 = OpAccessChain %54 %43 
                                        f32 %102 = OpLoad %101 
                               Uniform f32* %103 = OpAccessChain %16 %72 
                                        f32 %104 = OpLoad %103 
                                        f32 %105 = OpFMul %102 %104 
                               Private f32* %106 = OpAccessChain %54 %43 
                                                     OpStore %106 %105 
                               Uniform f32* %109 = OpAccessChain %16 %108 
                                        f32 %110 = OpLoad %109 
                                       bool %111 = OpFOrdLessThan %107 %110 
                                                     OpStore %84 %111 
                                       bool %113 = OpLoad %84 
                                                     OpSelectionMerge %115 None 
                                                     OpBranchConditional %113 %114 %118 
                                            %114 = OpLabel 
                               Private f32* %116 = OpAccessChain %9 %43 
                                        f32 %117 = OpLoad %116 
                                                     OpStore %112 %117 
                                                     OpBranch %115 
                                            %118 = OpLabel 
                               Private f32* %119 = OpAccessChain %54 %43 
                                        f32 %120 = OpLoad %119 
                                                     OpStore %112 %120 
                                                     OpBranch %115 
                                            %115 = OpLabel 
                                        f32 %121 = OpLoad %112 
                               Private f32* %122 = OpAccessChain %9 %43 
                                                     OpStore %122 %121 
                                      f32_2 %123 = OpLoad %11 
                             Uniform f32_4* %125 = OpAccessChain %16 %124 
                                      f32_4 %126 = OpLoad %125 
                                      f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                      f32_2 %128 = OpFNegate %127 
                                      f32_2 %129 = OpFAdd %123 %128 
                                                     OpStore %54 %129 
                             Uniform f32_4* %132 = OpAccessChain %16 %124 
                                      f32_4 %133 = OpLoad %132 
                                      f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                      f32_2 %135 = OpFDiv %27 %134 
                                      f32_4 %136 = OpLoad %131 
                                      f32_4 %137 = OpVectorShuffle %136 %135 4 5 2 3 
                                                     OpStore %131 %137 
                                      f32_2 %138 = OpLoad %54 
                                      f32_4 %139 = OpLoad %131 
                                      f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                      f32_2 %141 = OpFMul %138 %140 
                                                     OpStore %54 %141 
                                      f32_2 %142 = OpLoad %54 
                                      f32_2 %143 = OpFNegate %142 
                                      f32_2 %146 = OpFMul %143 %145 
                                      f32_2 %147 = OpFAdd %146 %27 
                                      f32_4 %148 = OpLoad %131 
                                      f32_4 %149 = OpVectorShuffle %148 %147 4 5 2 3 
                                                     OpStore %131 %149 
                 read_only Texture2DSampled %152 = OpLoad %151 
                                      f32_2 %153 = OpLoad %54 
                                      f32_4 %154 = OpImageSampleImplicitLod %152 %153 
                                                     OpStore %150 %154 
                                      f32_4 %155 = OpLoad %131 
                                      f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                                      f32_2 %157 = OpExtInst %1 4 %156 
                                      f32_2 %158 = OpFNegate %157 
                                      f32_2 %159 = OpFAdd %158 %27 
                                                     OpStore %54 %159 
                                      f32_2 %164 = OpLoad %54 
                                      f32_4 %165 = OpVectorShuffle %164 %164 0 1 0 0 
                                     bool_4 %167 = OpFOrdLessThan %163 %165 
                                     bool_2 %169 = OpVectorShuffle %167 %167 0 1 
                                      u32_2 %174 = OpSelect %169 %173 %172 
                                      u32_2 %176 = OpCompositeConstruct %175 %175 
                                      u32_2 %177 = OpIMul %174 %176 
                                      i32_2 %178 = OpBitcast %177 
                                                     OpStore %162 %178 
                                      f32_2 %180 = OpLoad %54 
                                      f32_4 %181 = OpVectorShuffle %180 %180 0 1 0 0 
                                     bool_4 %182 = OpFOrdLessThan %181 %163 
                                     bool_2 %183 = OpVectorShuffle %182 %182 0 1 
                                      u32_2 %184 = OpSelect %183 %173 %172 
                                      u32_2 %185 = OpCompositeConstruct %175 %175 
                                      u32_2 %186 = OpIMul %184 %185 
                                      i32_2 %187 = OpBitcast %186 
                                                     OpStore %179 %187 
                                      i32_2 %188 = OpLoad %162 
                                      i32_2 %189 = OpSNegate %188 
                                      i32_2 %190 = OpLoad %179 
                                      i32_2 %191 = OpIAdd %189 %190 
                                                     OpStore %179 %191 
                                      i32_2 %192 = OpLoad %179 
                                      i32_2 %194 = OpIAdd %192 %193 
                                                     OpStore %179 %194 
                                      i32_2 %195 = OpLoad %179 
                                      f32_2 %196 = OpConvertSToF %195 
                                                     OpStore %54 %196 
                                      f32_2 %197 = OpLoad %54 
                                                     OpStore %54 %197 
                                      f32_2 %198 = OpLoad %54 
                                      f32_2 %199 = OpCompositeConstruct %61 %61 
                                      f32_2 %200 = OpCompositeConstruct %26 %26 
                                      f32_2 %201 = OpExtInst %1 43 %198 %199 %200 
                                                     OpStore %54 %201 
                                      f32_2 %202 = OpLoad %54 
                                      f32_4 %203 = OpVectorShuffle %202 %202 0 0 0 0 
                                      f32_4 %204 = OpLoad %150 
                                      f32_4 %205 = OpFMul %203 %204 
                                                     OpStore %131 %205 
                 read_only Texture2DSampled %207 = OpLoad %206 
                                      f32_2 %208 = OpLoad %11 
                                      f32_4 %209 = OpImageSampleImplicitLod %207 %208 
                                                     OpStore %150 %209 
                                      f32_4 %210 = OpLoad %131 
                                      f32_2 %211 = OpLoad %54 
                                      f32_4 %212 = OpVectorShuffle %211 %211 1 1 1 1 
                                      f32_4 %213 = OpFMul %210 %212 
                                      f32_4 %214 = OpLoad %150 
                                      f32_4 %215 = OpFNegate %214 
                                      f32_4 %216 = OpFAdd %213 %215 
                                                     OpStore %131 %216 
                                      f32_2 %219 = OpLoad %9 
                                      f32_4 %220 = OpVectorShuffle %219 %219 0 0 0 0 
                                      f32_4 %221 = OpLoad %131 
                                      f32_4 %222 = OpFMul %220 %221 
                                      f32_4 %223 = OpLoad %150 
                                      f32_4 %224 = OpFAdd %222 %223 
                                                     OpStore %218 %224 
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
Fallback "Diffuse"
}