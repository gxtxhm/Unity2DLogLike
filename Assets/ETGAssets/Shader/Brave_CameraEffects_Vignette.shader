//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/CameraEffects/Vignette" {
Properties {
_MainTex ("Base (RGB)", 2D) = "black" { }
_GBuffer ("G Buffer", 2D) = "white" { }
_OcclusionMap ("OcclusionMap", 2D) = "white" { }
_OcclusionUV ("OcclusionUV", Vector) = (0,0,0,0)
_OcclusionFallbackColor ("Occlusion Fallback Color", Color) = (0,0,0,1)
_TextureOcclusionTex ("Textured Occlusion", 2D) = "black" { }
}
SubShader {
 Pass {
  ZTest Always
  GpuProgramID 43269
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
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
out vec4 vs_TEXCOORD1;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat1.xyz = _WorldSpaceCameraPos.xyz * vec3(0.0670000017, -0.119999997, 1.0);
    u_xlat1.w = 0.0;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OcclusionUV;
uniform 	vec4 _OcclusionFallbackColor;
uniform  sampler2D _MainTex;
uniform  sampler2D _GBuffer;
uniform  sampler2D _OcclusionMap;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
void main()
{
    u_xlat0.xy = (-_OcclusionUV.xy) + _OcclusionUV.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * u_xlat0.xy + _OcclusionUV.xy;
    u_xlat10_1 = texture(_OcclusionMap, u_xlat0.xy);
    u_xlatb0 = u_xlat0.x<0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 1.0) : u_xlat10_1.xw;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = (-u_xlat1.xyz) + _OcclusionFallbackColor.xyz;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xzw * u_xlat0.yyy;
    u_xlat10_0 = texture(_GBuffer, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 167
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %96 %104 %154 
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
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %104 Location 104 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %154 Location 154 
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
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                              %84 = OpTypeBool 
                                              %85 = OpTypePointer Private %84 
                                Private bool* %86 = OpVariable Private 
                                              %87 = OpTypePointer Uniform %6 
                                          f32 %90 = OpConstant 3.67402E-40 
                                              %92 = OpTypePointer Private %6 
                                 Private f32* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 2 
                                              %95 = OpTypePointer Input %94 
                                 Input f32_2* %96 = OpVariable Input 
                                              %97 = OpTypePointer Input %6 
                                         f32 %101 = OpConstant 3.67402E-40 
                                             %103 = OpTypePointer Output %94 
                               Output f32_2* %104 = OpVariable Output 
                                             %105 = OpTypePointer Function %6 
                                             %115 = OpTypePointer Output %6 
                                         u32 %117 = OpConstant 0 
                                             %121 = OpTypePointer Uniform %14 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         f32 %125 = OpConstant 3.67402E-40 
                                       f32_3 %126 = OpConstantComposite %124 %125 %101 
                                         u32 %130 = OpConstant 3 
                               Output f32_4* %154 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %106 = OpVariable Function 
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
                               Uniform f32_4* %69 = OpAccessChain %21 %36 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                 Uniform f32* %88 = OpAccessChain %21 %45 %76 
                                          f32 %89 = OpLoad %88 
                                         bool %91 = OpFOrdLessThan %89 %90 
                                                      OpStore %86 %91 
                                   Input f32* %98 = OpAccessChain %96 %76 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpFNegate %99 
                                         f32 %102 = OpFAdd %100 %101 
                                                      OpStore %93 %102 
                                        bool %107 = OpLoad %86 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %111 
                                             %108 = OpLabel 
                                         f32 %110 = OpLoad %93 
                                                      OpStore %106 %110 
                                                      OpBranch %109 
                                             %111 = OpLabel 
                                  Input f32* %112 = OpAccessChain %96 %76 
                                         f32 %113 = OpLoad %112 
                                                      OpStore %106 %113 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                         f32 %114 = OpLoad %106 
                                 Output f32* %116 = OpAccessChain %104 %76 
                                                      OpStore %116 %114 
                                  Input f32* %118 = OpAccessChain %96 %117 
                                         f32 %119 = OpLoad %118 
                                 Output f32* %120 = OpAccessChain %104 %117 
                                                      OpStore %120 %119 
                              Uniform f32_3* %122 = OpAccessChain %21 %28 
                                       f32_3 %123 = OpLoad %122 
                                       f32_3 %127 = OpFMul %123 %126 
                                       f32_4 %128 = OpLoad %49 
                                       f32_4 %129 = OpVectorShuffle %128 %127 4 5 6 3 
                                                      OpStore %49 %129 
                                Private f32* %131 = OpAccessChain %49 %130 
                                                      OpStore %131 %90 
                                       f32_4 %132 = OpLoad %9 
                                       f32_4 %133 = OpLoad %49 
                                       f32_4 %134 = OpFAdd %132 %133 
                                                      OpStore %9 %134 
                                       f32_4 %135 = OpLoad %9 
                                       f32_4 %136 = OpVectorShuffle %135 %135 1 1 1 1 
                              Uniform f32_4* %137 = OpAccessChain %21 %23 %23 
                                       f32_4 %138 = OpLoad %137 
                                       f32_4 %139 = OpFMul %136 %138 
                                                      OpStore %49 %139 
                              Uniform f32_4* %140 = OpAccessChain %21 %23 %28 
                                       f32_4 %141 = OpLoad %140 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %142 0 0 0 0 
                                       f32_4 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %49 
                                       f32_4 %146 = OpFAdd %144 %145 
                                                      OpStore %49 %146 
                              Uniform f32_4* %147 = OpAccessChain %21 %23 %36 
                                       f32_4 %148 = OpLoad %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %149 2 2 2 2 
                                       f32_4 %151 = OpFMul %148 %150 
                                       f32_4 %152 = OpLoad %49 
                                       f32_4 %153 = OpFAdd %151 %152 
                                                      OpStore %49 %153 
                              Uniform f32_4* %155 = OpAccessChain %21 %23 %45 
                                       f32_4 %156 = OpLoad %155 
                                       f32_4 %157 = OpLoad %9 
                                       f32_4 %158 = OpVectorShuffle %157 %157 3 3 3 3 
                                       f32_4 %159 = OpFMul %156 %158 
                                       f32_4 %160 = OpLoad %49 
                                       f32_4 %161 = OpFAdd %159 %160 
                                                      OpStore %154 %161 
                                 Output f32* %162 = OpAccessChain %80 %28 %76 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFNegate %163 
                                 Output f32* %165 = OpAccessChain %80 %28 %76 
                                                      OpStore %165 %164 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 115
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %28 %110 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %10 0 Offset 10 
                                                     OpMemberDecorate %10 1 Offset 10 
                                                     OpDecorate %10 Block 
                                                     OpDecorate %12 DescriptorSet 12 
                                                     OpDecorate %12 Binding 12 
                                                     OpDecorate %28 Location 28 
                                                     OpDecorate %44 RelaxedPrecision 
                                                     OpDecorate %44 DescriptorSet 44 
                                                     OpDecorate %44 Binding 44 
                                                     OpDecorate %45 RelaxedPrecision 
                                                     OpDecorate %49 RelaxedPrecision 
                                                     OpDecorate %73 RelaxedPrecision 
                                                     OpDecorate %73 DescriptorSet 73 
                                                     OpDecorate %73 Binding 73 
                                                     OpDecorate %74 RelaxedPrecision 
                                                     OpDecorate %104 RelaxedPrecision 
                                                     OpDecorate %105 RelaxedPrecision 
                                                     OpDecorate %105 DescriptorSet 105 
                                                     OpDecorate %105 Binding 105 
                                                     OpDecorate %106 RelaxedPrecision 
                                                     OpDecorate %110 Location 110 
                                                     OpDecorate %111 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeStruct %7 %7 
                                             %11 = OpTypePointer Uniform %10 
             Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                             %13 = OpTypeInt 32 1 
                                         i32 %14 = OpConstant 0 
                                             %15 = OpTypeVector %6 2 
                                             %16 = OpTypePointer Uniform %7 
                                             %27 = OpTypePointer Input %15 
                                Input f32_2* %28 = OpVariable Input 
                                             %39 = OpTypePointer Private %15 
                              Private f32_2* %40 = OpVariable Private 
                                             %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %42 = OpTypeSampledImage %41 
                                             %43 = OpTypePointer UniformConstant %42 
 UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                             %50 = OpTypeBool 
                                             %51 = OpTypePointer Private %50 
                               Private bool* %52 = OpVariable Private 
                                             %53 = OpTypeInt 32 0 
                                         u32 %54 = OpConstant 0 
                                             %55 = OpTypePointer Private %6 
                                         f32 %58 = OpConstant 3.67402E-40 
                                             %60 = OpTypePointer Function %15 
                                         f32 %65 = OpConstant 3.67402E-40 
                                       f32_2 %66 = OpConstantComposite %58 %65 
                              Private f32_4* %72 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
                                             %77 = OpTypeVector %6 3 
                                             %78 = OpTypePointer Private %77 
                              Private f32_3* %79 = OpVariable Private 
                                         i32 %83 = OpConstant 1 
                             Private f32_4* %104 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %105 = OpVariable UniformConstant 
                                            %109 = OpTypePointer Output %7 
                              Output f32_4* %110 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                             Function f32_2* %61 = OpVariable Function 
                              Uniform f32_4* %17 = OpAccessChain %12 %14 
                                       f32_4 %18 = OpLoad %17 
                                       f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                                       f32_2 %20 = OpFNegate %19 
                              Uniform f32_4* %21 = OpAccessChain %12 %14 
                                       f32_4 %22 = OpLoad %21 
                                       f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                                       f32_2 %24 = OpFAdd %20 %23 
                                       f32_4 %25 = OpLoad %9 
                                       f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                                     OpStore %9 %26 
                                       f32_2 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %9 
                                       f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                       f32_2 %32 = OpFMul %29 %31 
                              Uniform f32_4* %33 = OpAccessChain %12 %14 
                                       f32_4 %34 = OpLoad %33 
                                       f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                                       f32_2 %36 = OpFAdd %32 %35 
                                       f32_4 %37 = OpLoad %9 
                                       f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                     OpStore %9 %38 
                  read_only Texture2DSampled %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %9 
                                       f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                                       f32_4 %48 = OpImageSampleImplicitLod %45 %47 
                                       f32_2 %49 = OpVectorShuffle %48 %48 0 3 
                                                     OpStore %40 %49 
                                Private f32* %56 = OpAccessChain %9 %54 
                                         f32 %57 = OpLoad %56 
                                        bool %59 = OpFOrdLessThan %57 %58 
                                                     OpStore %52 %59 
                                        bool %62 = OpLoad %52 
                                                     OpSelectionMerge %64 None 
                                                     OpBranchConditional %62 %63 %67 
                                             %63 = OpLabel 
                                                     OpStore %61 %66 
                                                     OpBranch %64 
                                             %67 = OpLabel 
                                       f32_2 %68 = OpLoad %40 
                                                     OpStore %61 %68 
                                                     OpBranch %64 
                                             %64 = OpLabel 
                                       f32_2 %69 = OpLoad %61 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %69 4 5 2 3 
                                                     OpStore %9 %71 
                  read_only Texture2DSampled %74 = OpLoad %73 
                                       f32_2 %75 = OpLoad %28 
                                       f32_4 %76 = OpImageSampleImplicitLod %74 %75 
                                                     OpStore %72 %76 
                                       f32_4 %80 = OpLoad %72 
                                       f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                       f32_3 %82 = OpFNegate %81 
                              Uniform f32_4* %84 = OpAccessChain %12 %83 
                                       f32_4 %85 = OpLoad %84 
                                       f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                       f32_3 %87 = OpFAdd %82 %86 
                                                     OpStore %79 %87 
                                       f32_4 %88 = OpLoad %9 
                                       f32_3 %89 = OpVectorShuffle %88 %88 0 0 0 
                                       f32_3 %90 = OpLoad %79 
                                       f32_3 %91 = OpFMul %89 %90 
                                       f32_4 %92 = OpLoad %72 
                                       f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                       f32_3 %94 = OpFAdd %91 %93 
                                       f32_4 %95 = OpLoad %9 
                                       f32_4 %96 = OpVectorShuffle %95 %94 4 1 5 6 
                                                     OpStore %9 %96 
                                       f32_4 %97 = OpLoad %9 
                                       f32_3 %98 = OpVectorShuffle %97 %97 0 2 3 
                                       f32_4 %99 = OpLoad %9 
                                      f32_3 %100 = OpVectorShuffle %99 %99 1 1 1 
                                      f32_3 %101 = OpFMul %98 %100 
                                      f32_4 %102 = OpLoad %72 
                                      f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                     OpStore %72 %103 
                 read_only Texture2DSampled %106 = OpLoad %105 
                                      f32_2 %107 = OpLoad %28 
                                      f32_4 %108 = OpImageSampleImplicitLod %106 %107 
                                                     OpStore %104 %108 
                                      f32_4 %111 = OpLoad %104 
                                      f32_4 %112 = OpLoad %72 
                                      f32_4 %113 = OpFMul %111 %112 
                                                     OpStore %110 %113 
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