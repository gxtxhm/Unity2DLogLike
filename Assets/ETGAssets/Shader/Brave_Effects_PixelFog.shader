//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/PixelFog" {
Properties {
_Color ("Color", Color) = (1,1,1,1)
_MainTex ("Texture", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 48794
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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

uniform 	vec4 _Time;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _NoiseTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec2 u_xlat1;
vec2 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
float u_xlat6;
float u_xlat16_6;
float u_xlat16_9;
void main()
{
    u_xlat0.xyz = _Time.xxx * vec3(-0.333333343, -0.166666672, 5.0);
    u_xlat6 = sin(u_xlat0.z);
    u_xlat6 = u_xlat6 + 1.0;
    u_xlat6 = u_xlat6 * 7.5 + 20.0;
    u_xlat1.xy = _MainTex_TexelSize.xy + _MainTex_TexelSize.xy;
    u_xlat1.xy = vs_TEXCOORD0.xy / u_xlat1.xy;
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat1.xy * vec2(6.0, 6.0) + u_xlat0.xy;
    u_xlat1.xy = u_xlat1.xy + u_xlat1.xy;
    u_xlat10_2 = texture(_NoiseTex, u_xlat0.xy);
    u_xlat0.x = u_xlat10_2.x + (-_Time.x);
    u_xlat3.x = _Time.x * 0.5 + u_xlat10_2.y;
    u_xlat0.x = u_xlat1.x * u_xlat6 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat2.x = u_xlat0.x * 0.5;
    u_xlat0.x = _Time.x * 3.0;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * 6.0 + 15.0;
    u_xlat0.x = (-u_xlat1.x) * u_xlat0.x + u_xlat3.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat2.y = u_xlat0.x * 0.5;
    u_xlat0.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * u_xlat2.xy;
    u_xlat10_2 = texture(_NoiseTex, u_xlat1.xy);
    u_xlat16_6 = u_xlat10_2.z * u_xlat10_2.z;
    u_xlat16_9 = u_xlat16_6 * u_xlat10_2.z;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_9 = u_xlat16_6 * u_xlat16_9;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_9;
    u_xlat0.x = u_xlat0.x * u_xlat0.y + u_xlat16_6;
    u_xlat10_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 43758.5469;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + _Time.x;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 0.400000006;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat10_2.w;
    u_xlat0.x = u_xlat0.x * 0.800000012;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat3.xy = (-vs_TEXCOORD0.xy) + vec2(0.629999995, 0.0);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat6 = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat6 * u_xlat3.x;
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 20.0;
    u_xlat0.x = floor(u_xlat0.x);
    SV_Target0.w = u_xlat0.x * 0.0500000007;
    SV_Target0.xyz = _Color.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 102
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %86 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpMemberDecorate %84 0 BuiltIn 84 
                                                     OpMemberDecorate %84 1 BuiltIn 84 
                                                     OpMemberDecorate %84 2 BuiltIn 84 
                                                     OpDecorate %84 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                                Output f32_2* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                                         i32 %58 = OpConstant 3 
                              Private f32_4* %62 = OpVariable Private 
                                         u32 %82 = OpConstant 1 
                                             %83 = OpTypeArray %6 %82 
                                             %84 = OpTypeStruct %13 %6 %83 
                                             %85 = OpTypePointer Output %84 
        Output struct {f32_4; f32; f32[1];}* %86 = OpVariable Output 
                                             %94 = OpTypePointer Output %13 
                                             %96 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore %9 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %57 = OpLoad %33 
                              Uniform f32_4* %59 = OpAccessChain %20 %38 %58 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFAdd %57 %60 
                                                     OpStore %33 %61 
                                       f32_4 %63 = OpLoad %33 
                                       f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                              Uniform f32_4* %65 = OpAccessChain %20 %39 %39 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpFMul %64 %66 
                                                     OpStore %62 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %39 %38 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpVectorShuffle %70 %70 0 0 0 0 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %62 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %62 %74 
                              Uniform f32_4* %75 = OpAccessChain %20 %39 %22 
                                       f32_4 %76 = OpLoad %75 
                                       f32_4 %77 = OpLoad %33 
                                       f32_4 %78 = OpVectorShuffle %77 %77 2 2 2 2 
                                       f32_4 %79 = OpFMul %76 %78 
                                       f32_4 %80 = OpLoad %62 
                                       f32_4 %81 = OpFAdd %79 %80 
                                                     OpStore %62 %81 
                              Uniform f32_4* %87 = OpAccessChain %20 %39 %58 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpVectorShuffle %89 %89 3 3 3 3 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %62 
                                       f32_4 %93 = OpFAdd %91 %92 
                               Output f32_4* %95 = OpAccessChain %86 %38 
                                                     OpStore %95 %93 
                                 Output f32* %97 = OpAccessChain %86 %38 %82 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %86 %38 %82 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 339
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %52 %325 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %11 0 Offset 11 
                                                     OpMemberDecorate %11 1 Offset 11 
                                                     OpMemberDecorate %11 2 Offset 11 
                                                     OpDecorate %11 Block 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate %52 Location 52 
                                                     OpDecorate %75 RelaxedPrecision 
                                                     OpDecorate %79 RelaxedPrecision 
                                                     OpDecorate %79 DescriptorSet 79 
                                                     OpDecorate %79 Binding 79 
                                                     OpDecorate %80 RelaxedPrecision 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %101 RelaxedPrecision 
                                                     OpDecorate %166 RelaxedPrecision 
                                                     OpDecorate %171 RelaxedPrecision 
                                                     OpDecorate %173 RelaxedPrecision 
                                                     OpDecorate %176 RelaxedPrecision 
                                                     OpDecorate %178 RelaxedPrecision 
                                                     OpDecorate %180 RelaxedPrecision 
                                                     OpDecorate %182 RelaxedPrecision 
                                                     OpDecorate %183 RelaxedPrecision 
                                                     OpDecorate %184 RelaxedPrecision 
                                                     OpDecorate %186 RelaxedPrecision 
                                                     OpDecorate %187 RelaxedPrecision 
                                                     OpDecorate %188 RelaxedPrecision 
                                                     OpDecorate %189 RelaxedPrecision 
                                                     OpDecorate %190 RelaxedPrecision 
                                                     OpDecorate %191 RelaxedPrecision 
                                                     OpDecorate %192 RelaxedPrecision 
                                                     OpDecorate %193 RelaxedPrecision 
                                                     OpDecorate %194 RelaxedPrecision 
                                                     OpDecorate %195 RelaxedPrecision 
                                                     OpDecorate %196 RelaxedPrecision 
                                                     OpDecorate %197 RelaxedPrecision 
                                                     OpDecorate %198 RelaxedPrecision 
                                                     OpDecorate %199 RelaxedPrecision 
                                                     OpDecorate %200 RelaxedPrecision 
                                                     OpDecorate %202 RelaxedPrecision 
                                                     OpDecorate %204 RelaxedPrecision 
                                                     OpDecorate %205 RelaxedPrecision 
                                                     OpDecorate %206 RelaxedPrecision 
                                                     OpDecorate %207 RelaxedPrecision 
                                                     OpDecorate %209 RelaxedPrecision 
                                                     OpDecorate %209 DescriptorSet 209 
                                                     OpDecorate %209 Binding 209 
                                                     OpDecorate %210 RelaxedPrecision 
                                                     OpDecorate %214 RelaxedPrecision 
                                                     OpDecorate %255 RelaxedPrecision 
                                                     OpDecorate %257 RelaxedPrecision 
                                                     OpDecorate %258 RelaxedPrecision 
                                                     OpDecorate %261 RelaxedPrecision 
                                                     OpDecorate %263 RelaxedPrecision 
                                                     OpDecorate %268 RelaxedPrecision 
                                                     OpDecorate %321 RelaxedPrecision 
                                                     OpDecorate %322 RelaxedPrecision 
                                                     OpDecorate %325 RelaxedPrecision 
                                                     OpDecorate %325 Location 325 
                                                     OpDecorate %327 RelaxedPrecision 
                                                     OpDecorate %329 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 4 
                                             %11 = OpTypeStruct %10 %10 %10 
                                             %12 = OpTypePointer Uniform %11 
      Uniform struct {f32_4; f32_4; f32_4;}* %13 = OpVariable Uniform 
                                             %14 = OpTypeInt 32 1 
                                         i32 %15 = OpConstant 0 
                                             %16 = OpTypePointer Uniform %10 
                                         f32 %20 = OpConstant 3.67402E-40 
                                         f32 %21 = OpConstant 3.67402E-40 
                                         f32 %22 = OpConstant 3.67402E-40 
                                       f32_3 %23 = OpConstantComposite %20 %21 %22 
                                             %25 = OpTypePointer Private %6 
                                Private f32* %26 = OpVariable Private 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 2 
                                         f32 %33 = OpConstant 3.67402E-40 
                                         f32 %36 = OpConstant 3.67402E-40 
                                         f32 %38 = OpConstant 3.67402E-40 
                                             %40 = OpTypeVector %6 2 
                                             %41 = OpTypePointer Private %40 
                              Private f32_2* %42 = OpVariable Private 
                                         i32 %43 = OpConstant 1 
                                             %51 = OpTypePointer Input %40 
                                Input f32_2* %52 = OpVariable Input 
                                         f32 %64 = OpConstant 3.67402E-40 
                                       f32_2 %65 = OpConstantComposite %64 %64 
                              Private f32_2* %75 = OpVariable Private 
                                             %76 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %77 = OpTypeSampledImage %76 
                                             %78 = OpTypePointer UniformConstant %77 
 UniformConstant read_only Texture2DSampled* %79 = OpVariable UniformConstant 
                                         u32 %85 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                              Private f32_2* %94 = OpVariable Private 
                                         f32 %97 = OpConstant 3.67402E-40 
                                         u32 %99 = OpConstant 1 
                             Private f32_2* %120 = OpVariable Private 
                                        f32 %127 = OpConstant 3.67402E-40 
                                        f32 %141 = OpConstant 3.67402E-40 
                             Private f32_2* %166 = OpVariable Private 
                               Private f32* %178 = OpVariable Private 
                               Private f32* %184 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %209 = OpVariable UniformConstant 
                                        u32 %213 = OpConstant 3 
                                        f32 %217 = OpConstant 3.67402E-40 
                                        f32 %218 = OpConstant 3.67402E-40 
                                      f32_2 %219 = OpConstantComposite %217 %218 
                                        f32 %228 = OpConstant 3.67402E-40 
                                        f32 %247 = OpConstant 3.67402E-40 
                                        f32 %262 = OpConstant 3.67402E-40 
                                        f32 %273 = OpConstant 3.67402E-40 
                                        f32 %274 = OpConstant 3.67402E-40 
                                      f32_2 %275 = OpConstantComposite %273 %274 
                                            %324 = OpTypePointer Output %10 
                              Output f32_4* %325 = OpVariable Output 
                                        f32 %328 = OpConstant 3.67402E-40 
                                            %330 = OpTypePointer Output %6 
                                        i32 %332 = OpConstant 2 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Uniform f32_4* %17 = OpAccessChain %13 %15 
                                       f32_4 %18 = OpLoad %17 
                                       f32_3 %19 = OpVectorShuffle %18 %18 0 0 0 
                                       f32_3 %24 = OpFMul %19 %23 
                                                     OpStore %9 %24 
                                Private f32* %29 = OpAccessChain %9 %28 
                                         f32 %30 = OpLoad %29 
                                         f32 %31 = OpExtInst %1 13 %30 
                                                     OpStore %26 %31 
                                         f32 %32 = OpLoad %26 
                                         f32 %34 = OpFAdd %32 %33 
                                                     OpStore %26 %34 
                                         f32 %35 = OpLoad %26 
                                         f32 %37 = OpFMul %35 %36 
                                         f32 %39 = OpFAdd %37 %38 
                                                     OpStore %26 %39 
                              Uniform f32_4* %44 = OpAccessChain %13 %43 
                                       f32_4 %45 = OpLoad %44 
                                       f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                              Uniform f32_4* %47 = OpAccessChain %13 %43 
                                       f32_4 %48 = OpLoad %47 
                                       f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                                       f32_2 %50 = OpFAdd %46 %49 
                                                     OpStore %42 %50 
                                       f32_2 %53 = OpLoad %52 
                                       f32_2 %54 = OpLoad %42 
                                       f32_2 %55 = OpFDiv %53 %54 
                                                     OpStore %42 %55 
                                       f32_2 %56 = OpLoad %42 
                                       f32_2 %57 = OpExtInst %1 8 %56 
                                                     OpStore %42 %57 
                                       f32_2 %58 = OpLoad %42 
                              Uniform f32_4* %59 = OpAccessChain %13 %43 
                                       f32_4 %60 = OpLoad %59 
                                       f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                       f32_2 %62 = OpFMul %58 %61 
                                                     OpStore %42 %62 
                                       f32_2 %63 = OpLoad %42 
                                       f32_2 %66 = OpFMul %63 %65 
                                       f32_3 %67 = OpLoad %9 
                                       f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                       f32_2 %69 = OpFAdd %66 %68 
                                       f32_3 %70 = OpLoad %9 
                                       f32_3 %71 = OpVectorShuffle %70 %69 3 4 2 
                                                     OpStore %9 %71 
                                       f32_2 %72 = OpLoad %42 
                                       f32_2 %73 = OpLoad %42 
                                       f32_2 %74 = OpFAdd %72 %73 
                                                     OpStore %42 %74 
                  read_only Texture2DSampled %80 = OpLoad %79 
                                       f32_3 %81 = OpLoad %9 
                                       f32_2 %82 = OpVectorShuffle %81 %81 0 1 
                                       f32_4 %83 = OpImageSampleImplicitLod %80 %82 
                                       f32_2 %84 = OpVectorShuffle %83 %83 0 1 
                                                     OpStore %75 %84 
                                Private f32* %86 = OpAccessChain %75 %85 
                                         f32 %87 = OpLoad %86 
                                Uniform f32* %89 = OpAccessChain %13 %15 %85 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFNegate %90 
                                         f32 %92 = OpFAdd %87 %91 
                                Private f32* %93 = OpAccessChain %9 %85 
                                                     OpStore %93 %92 
                                Uniform f32* %95 = OpAccessChain %13 %15 %85 
                                         f32 %96 = OpLoad %95 
                                         f32 %98 = OpFMul %96 %97 
                               Private f32* %100 = OpAccessChain %75 %99 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFAdd %98 %101 
                               Private f32* %103 = OpAccessChain %94 %85 
                                                     OpStore %103 %102 
                               Private f32* %104 = OpAccessChain %42 %85 
                                        f32 %105 = OpLoad %104 
                                        f32 %106 = OpLoad %26 
                                        f32 %107 = OpFMul %105 %106 
                               Private f32* %108 = OpAccessChain %9 %85 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFAdd %107 %109 
                               Private f32* %111 = OpAccessChain %9 %85 
                                                     OpStore %111 %110 
                               Private f32* %112 = OpAccessChain %9 %85 
                                        f32 %113 = OpLoad %112 
                                        f32 %114 = OpExtInst %1 13 %113 
                               Private f32* %115 = OpAccessChain %9 %85 
                                                     OpStore %115 %114 
                               Private f32* %116 = OpAccessChain %9 %85 
                                        f32 %117 = OpLoad %116 
                                        f32 %118 = OpFAdd %117 %33 
                               Private f32* %119 = OpAccessChain %9 %85 
                                                     OpStore %119 %118 
                               Private f32* %121 = OpAccessChain %9 %85 
                                        f32 %122 = OpLoad %121 
                                        f32 %123 = OpFMul %122 %97 
                               Private f32* %124 = OpAccessChain %120 %85 
                                                     OpStore %124 %123 
                               Uniform f32* %125 = OpAccessChain %13 %15 %85 
                                        f32 %126 = OpLoad %125 
                                        f32 %128 = OpFMul %126 %127 
                               Private f32* %129 = OpAccessChain %9 %85 
                                                     OpStore %129 %128 
                               Private f32* %130 = OpAccessChain %9 %85 
                                        f32 %131 = OpLoad %130 
                                        f32 %132 = OpExtInst %1 13 %131 
                               Private f32* %133 = OpAccessChain %9 %85 
                                                     OpStore %133 %132 
                               Private f32* %134 = OpAccessChain %9 %85 
                                        f32 %135 = OpLoad %134 
                                        f32 %136 = OpFAdd %135 %33 
                               Private f32* %137 = OpAccessChain %9 %85 
                                                     OpStore %137 %136 
                               Private f32* %138 = OpAccessChain %9 %85 
                                        f32 %139 = OpLoad %138 
                                        f32 %140 = OpFMul %139 %64 
                                        f32 %142 = OpFAdd %140 %141 
                               Private f32* %143 = OpAccessChain %9 %85 
                                                     OpStore %143 %142 
                               Private f32* %144 = OpAccessChain %42 %85 
                                        f32 %145 = OpLoad %144 
                                        f32 %146 = OpFNegate %145 
                               Private f32* %147 = OpAccessChain %9 %85 
                                        f32 %148 = OpLoad %147 
                                        f32 %149 = OpFMul %146 %148 
                               Private f32* %150 = OpAccessChain %94 %85 
                                        f32 %151 = OpLoad %150 
                                        f32 %152 = OpFAdd %149 %151 
                               Private f32* %153 = OpAccessChain %9 %85 
                                                     OpStore %153 %152 
                               Private f32* %154 = OpAccessChain %9 %85 
                                        f32 %155 = OpLoad %154 
                                        f32 %156 = OpExtInst %1 13 %155 
                               Private f32* %157 = OpAccessChain %9 %85 
                                                     OpStore %157 %156 
                               Private f32* %158 = OpAccessChain %9 %85 
                                        f32 %159 = OpLoad %158 
                                        f32 %160 = OpFAdd %159 %33 
                               Private f32* %161 = OpAccessChain %9 %85 
                                                     OpStore %161 %160 
                               Private f32* %162 = OpAccessChain %9 %85 
                                        f32 %163 = OpLoad %162 
                                        f32 %164 = OpFMul %163 %97 
                               Private f32* %165 = OpAccessChain %120 %99 
                                                     OpStore %165 %164 
                                      f32_2 %167 = OpLoad %120 
                                      f32_2 %168 = OpLoad %120 
                                      f32_2 %169 = OpFMul %167 %168 
                                                     OpStore %166 %169 
                                      f32_2 %170 = OpLoad %120 
                                      f32_2 %171 = OpLoad %166 
                                      f32_2 %172 = OpFMul %170 %171 
                                                     OpStore %166 %172 
                 read_only Texture2DSampled %173 = OpLoad %79 
                                      f32_2 %174 = OpLoad %42 
                                      f32_4 %175 = OpImageSampleImplicitLod %173 %174 
                                        f32 %176 = OpCompositeExtract %175 2 
                               Private f32* %177 = OpAccessChain %75 %85 
                                                     OpStore %177 %176 
                               Private f32* %179 = OpAccessChain %75 %85 
                                        f32 %180 = OpLoad %179 
                               Private f32* %181 = OpAccessChain %75 %85 
                                        f32 %182 = OpLoad %181 
                                        f32 %183 = OpFMul %180 %182 
                                                     OpStore %178 %183 
                               Private f32* %185 = OpAccessChain %75 %85 
                                        f32 %186 = OpLoad %185 
                                        f32 %187 = OpLoad %178 
                                        f32 %188 = OpFMul %186 %187 
                                                     OpStore %184 %188 
                                        f32 %189 = OpLoad %178 
                                        f32 %190 = OpLoad %178 
                                        f32 %191 = OpFMul %189 %190 
                                                     OpStore %178 %191 
                                        f32 %192 = OpLoad %178 
                                        f32 %193 = OpLoad %184 
                                        f32 %194 = OpFMul %192 %193 
                                                     OpStore %184 %194 
                                        f32 %195 = OpLoad %178 
                                        f32 %196 = OpLoad %178 
                                        f32 %197 = OpFMul %195 %196 
                                                     OpStore %178 %197 
                                        f32 %198 = OpLoad %178 
                                        f32 %199 = OpLoad %184 
                                        f32 %200 = OpFMul %198 %199 
                                                     OpStore %178 %200 
                               Private f32* %201 = OpAccessChain %166 %85 
                                        f32 %202 = OpLoad %201 
                               Private f32* %203 = OpAccessChain %166 %99 
                                        f32 %204 = OpLoad %203 
                                        f32 %205 = OpFMul %202 %204 
                                        f32 %206 = OpLoad %178 
                                        f32 %207 = OpFAdd %205 %206 
                               Private f32* %208 = OpAccessChain %166 %85 
                                                     OpStore %208 %207 
                 read_only Texture2DSampled %210 = OpLoad %209 
                                      f32_2 %211 = OpLoad %42 
                                      f32_4 %212 = OpImageSampleImplicitLod %210 %211 
                                        f32 %214 = OpCompositeExtract %212 3 
                               Private f32* %215 = OpAccessChain %75 %85 
                                                     OpStore %215 %214 
                                      f32_2 %216 = OpLoad %42 
                                        f32 %220 = OpDot %216 %219 
                               Private f32* %221 = OpAccessChain %94 %85 
                                                     OpStore %221 %220 
                               Private f32* %222 = OpAccessChain %94 %85 
                                        f32 %223 = OpLoad %222 
                                        f32 %224 = OpExtInst %1 13 %223 
                               Private f32* %225 = OpAccessChain %94 %85 
                                                     OpStore %225 %224 
                               Private f32* %226 = OpAccessChain %94 %85 
                                        f32 %227 = OpLoad %226 
                                        f32 %229 = OpFMul %227 %228 
                               Private f32* %230 = OpAccessChain %94 %85 
                                                     OpStore %230 %229 
                               Private f32* %231 = OpAccessChain %94 %85 
                                        f32 %232 = OpLoad %231 
                                        f32 %233 = OpExtInst %1 10 %232 
                               Private f32* %234 = OpAccessChain %94 %85 
                                                     OpStore %234 %233 
                               Private f32* %235 = OpAccessChain %94 %85 
                                        f32 %236 = OpLoad %235 
                               Uniform f32* %237 = OpAccessChain %13 %15 %85 
                                        f32 %238 = OpLoad %237 
                                        f32 %239 = OpFAdd %236 %238 
                               Private f32* %240 = OpAccessChain %94 %85 
                                                     OpStore %240 %239 
                               Private f32* %241 = OpAccessChain %94 %85 
                                        f32 %242 = OpLoad %241 
                                        f32 %243 = OpExtInst %1 10 %242 
                               Private f32* %244 = OpAccessChain %94 %85 
                                                     OpStore %244 %243 
                               Private f32* %245 = OpAccessChain %94 %85 
                                        f32 %246 = OpLoad %245 
                                        f32 %248 = OpFAdd %246 %247 
                               Private f32* %249 = OpAccessChain %94 %85 
                                                     OpStore %249 %248 
                               Private f32* %250 = OpAccessChain %94 %85 
                                        f32 %251 = OpLoad %250 
                                        f32 %252 = OpExtInst %1 37 %251 %33 
                               Private f32* %253 = OpAccessChain %94 %85 
                                                     OpStore %253 %252 
                               Private f32* %254 = OpAccessChain %166 %85 
                                        f32 %255 = OpLoad %254 
                               Private f32* %256 = OpAccessChain %75 %85 
                                        f32 %257 = OpLoad %256 
                                        f32 %258 = OpFMul %255 %257 
                               Private f32* %259 = OpAccessChain %166 %85 
                                                     OpStore %259 %258 
                               Private f32* %260 = OpAccessChain %166 %85 
                                        f32 %261 = OpLoad %260 
                                        f32 %263 = OpFMul %261 %262 
                               Private f32* %264 = OpAccessChain %166 %85 
                                                     OpStore %264 %263 
                               Private f32* %265 = OpAccessChain %94 %85 
                                        f32 %266 = OpLoad %265 
                               Private f32* %267 = OpAccessChain %166 %85 
                                        f32 %268 = OpLoad %267 
                                        f32 %269 = OpFMul %266 %268 
                               Private f32* %270 = OpAccessChain %9 %85 
                                                     OpStore %270 %269 
                                      f32_2 %271 = OpLoad %52 
                                      f32_2 %272 = OpFNegate %271 
                                      f32_2 %276 = OpFAdd %272 %275 
                                                     OpStore %94 %276 
                                      f32_2 %277 = OpLoad %94 
                                      f32_2 %278 = OpLoad %94 
                                        f32 %279 = OpDot %277 %278 
                               Private f32* %280 = OpAccessChain %94 %85 
                                                     OpStore %280 %279 
                               Private f32* %281 = OpAccessChain %94 %85 
                                        f32 %282 = OpLoad %281 
                                        f32 %283 = OpExtInst %1 31 %282 
                               Private f32* %284 = OpAccessChain %94 %85 
                                                     OpStore %284 %283 
                               Private f32* %285 = OpAccessChain %94 %85 
                                        f32 %286 = OpLoad %285 
                               Private f32* %287 = OpAccessChain %94 %85 
                                        f32 %288 = OpLoad %287 
                                        f32 %289 = OpFAdd %286 %288 
                               Private f32* %290 = OpAccessChain %94 %85 
                                                     OpStore %290 %289 
                               Private f32* %291 = OpAccessChain %94 %85 
                                        f32 %292 = OpLoad %291 
                                        f32 %293 = OpExtInst %1 37 %292 %33 
                               Private f32* %294 = OpAccessChain %94 %85 
                                                     OpStore %294 %293 
                               Private f32* %295 = OpAccessChain %94 %85 
                                        f32 %296 = OpLoad %295 
                                        f32 %297 = OpFNegate %296 
                                        f32 %298 = OpFAdd %297 %33 
                               Private f32* %299 = OpAccessChain %94 %85 
                                                     OpStore %299 %298 
                               Private f32* %300 = OpAccessChain %94 %85 
                                        f32 %301 = OpLoad %300 
                               Private f32* %302 = OpAccessChain %94 %85 
                                        f32 %303 = OpLoad %302 
                                        f32 %304 = OpFMul %301 %303 
                                                     OpStore %26 %304 
                                        f32 %305 = OpLoad %26 
                               Private f32* %306 = OpAccessChain %94 %85 
                                        f32 %307 = OpLoad %306 
                                        f32 %308 = OpFMul %305 %307 
                               Private f32* %309 = OpAccessChain %94 %85 
                                                     OpStore %309 %308 
                               Private f32* %310 = OpAccessChain %94 %85 
                                        f32 %311 = OpLoad %310 
                               Private f32* %312 = OpAccessChain %9 %85 
                                        f32 %313 = OpLoad %312 
                                        f32 %314 = OpFMul %311 %313 
                               Private f32* %315 = OpAccessChain %9 %85 
                                                     OpStore %315 %314 
                               Private f32* %316 = OpAccessChain %9 %85 
                                        f32 %317 = OpLoad %316 
                                        f32 %318 = OpFMul %317 %38 
                               Private f32* %319 = OpAccessChain %166 %85 
                                                     OpStore %319 %318 
                               Private f32* %320 = OpAccessChain %166 %85 
                                        f32 %321 = OpLoad %320 
                                        f32 %322 = OpExtInst %1 8 %321 
                               Private f32* %323 = OpAccessChain %166 %85 
                                                     OpStore %323 %322 
                               Private f32* %326 = OpAccessChain %166 %85 
                                        f32 %327 = OpLoad %326 
                                        f32 %329 = OpFMul %327 %328 
                                Output f32* %331 = OpAccessChain %325 %213 
                                                     OpStore %331 %329 
                             Uniform f32_4* %333 = OpAccessChain %13 %332 
                                      f32_4 %334 = OpLoad %333 
                                      f32_3 %335 = OpVectorShuffle %334 %334 0 1 2 
                                      f32_4 %336 = OpLoad %325 
                                      f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                     OpStore %325 %337 
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