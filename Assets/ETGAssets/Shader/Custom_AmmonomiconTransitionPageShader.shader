//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/AmmonomiconTransitionPageShader" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_TopBezier ("Top Bezier", Vector) = (0,0,0,0)
_LeftBezier ("Left Bezier", Vector) = (0,0,0,0)
_BottomBezier ("Bottom Bezier", Vector) = (1,1,1,1)
_RightBezier ("Right Bezier", Vector) = (1,1,1,1)
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay+7500" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay+7500" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 3045
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
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TopBezier;
uniform 	vec4 _LeftBezier;
uniform 	vec4 _BottomBezier;
uniform 	vec4 _RightBezier;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
float u_xlat1;
vec2 u_xlat2;
float u_xlat3;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0 = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat3 = u_xlat0 * u_xlat0;
    u_xlat6 = u_xlat3 * u_xlat0;
    u_xlat9 = vs_TEXCOORD0.x * 3.0;
    u_xlat3 = u_xlat3 * u_xlat9;
    u_xlat9 = u_xlat9 * vs_TEXCOORD0.x;
    u_xlat0 = u_xlat0 * u_xlat9;
    u_xlat9 = vs_TEXCOORD0.x * vs_TEXCOORD0.x;
    u_xlat9 = u_xlat9 * vs_TEXCOORD0.x;
    u_xlat1 = u_xlat3 * _TopBezier.y;
    u_xlat1 = _TopBezier.x * u_xlat6 + u_xlat1;
    u_xlat1 = _TopBezier.z * u_xlat0 + u_xlat1;
    u_xlat1 = _TopBezier.w * u_xlat9 + u_xlat1;
    u_xlat3 = u_xlat3 * _BottomBezier.y;
    u_xlat3 = _BottomBezier.x * u_xlat6 + u_xlat3;
    u_xlat0 = _BottomBezier.z * u_xlat0 + u_xlat3;
    u_xlat0 = _BottomBezier.w * u_xlat9 + u_xlat0;
    u_xlatb3 = vs_TEXCOORD0.y<u_xlat1;
    u_xlatb6 = u_xlat0<vs_TEXCOORD0.y;
    u_xlatb3 = u_xlatb6 || u_xlatb3;
    if((int(u_xlatb3) * int(0xffffffffu))!=0){discard;}
    u_xlat3 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat6 = u_xlat3 * u_xlat3;
    u_xlat9 = u_xlat6 * u_xlat3;
    u_xlat4 = vs_TEXCOORD0.y * 3.0;
    u_xlat6 = u_xlat6 * u_xlat4;
    u_xlat4 = u_xlat4 * vs_TEXCOORD0.y;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat4 = vs_TEXCOORD0.y * vs_TEXCOORD0.y;
    u_xlat4 = u_xlat4 * vs_TEXCOORD0.y;
    u_xlat7 = u_xlat6 * _LeftBezier.y;
    u_xlat7 = _LeftBezier.x * u_xlat9 + u_xlat7;
    u_xlat7 = _LeftBezier.z * u_xlat3 + u_xlat7;
    u_xlat7 = _LeftBezier.w * u_xlat4 + u_xlat7;
    u_xlat6 = u_xlat6 * _RightBezier.y;
    u_xlat6 = _RightBezier.x * u_xlat9 + u_xlat6;
    u_xlat3 = _RightBezier.z * u_xlat3 + u_xlat6;
    u_xlat3 = _RightBezier.w * u_xlat4 + u_xlat3;
    u_xlatb6 = vs_TEXCOORD0.x<u_xlat7;
    u_xlatb9 = u_xlat3<vs_TEXCOORD0.x;
    u_xlatb6 = u_xlatb9 || u_xlatb6;
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = (-u_xlat7) + vs_TEXCOORD0.x;
    u_xlat3 = (-u_xlat7) + u_xlat3;
    u_xlat2.x = u_xlat6 / u_xlat3;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat3 = (-u_xlat1) + vs_TEXCOORD0.y;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat2.y = u_xlat3 / u_xlat0;
    u_xlat2.y = clamp(u_xlat2.y, 0.0, 1.0);
    SV_Target0 = texture(_MainTex, u_xlat2.xy);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 106
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %97 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %97 Location 97 
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
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Input %82 
                                Input f32_2* %84 = OpVariable Input 
                                             %96 = OpTypePointer Output %82 
                               Output f32_2* %97 = OpVariable Output 
                                            %100 = OpTypePointer Output %6 
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
                                       f32_2 %85 = OpLoad %84 
                              Uniform f32_4* %86 = OpAccessChain %20 %35 
                                       f32_4 %87 = OpLoad %86 
                                       f32_2 %88 = OpVectorShuffle %87 %87 0 1 
                                       f32_2 %89 = OpFMul %85 %88 
                              Uniform f32_4* %90 = OpAccessChain %20 %35 
                                       f32_4 %91 = OpLoad %90 
                                       f32_2 %92 = OpVectorShuffle %91 %91 2 3 
                                       f32_2 %93 = OpFAdd %89 %92 
                                       f32_4 %94 = OpLoad %9 
                                       f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                     OpStore %9 %95 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                                     OpStore %97 %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                        f32 %102 = OpLoad %101 
                                        f32 %103 = OpFNegate %102 
                                Output f32* %104 = OpAccessChain %72 %22 %68 
                                                     OpStore %104 %103 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 284
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %281 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %8 RelaxedPrecision 
                                                      OpDecorate %11 RelaxedPrecision 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 RelaxedPrecision 
                                                      OpDecorate %17 RelaxedPrecision 
                                                      OpDecorate %19 RelaxedPrecision 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %38 RelaxedPrecision 
                                                      OpDecorate %39 RelaxedPrecision 
                                                      OpDecorate %40 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpMemberDecorate %55 0 Offset 55 
                                                      OpMemberDecorate %55 1 Offset 55 
                                                      OpMemberDecorate %55 2 Offset 55 
                                                      OpMemberDecorate %55 3 Offset 55 
                                                      OpDecorate %55 Block 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %276 DescriptorSet 276 
                                                      OpDecorate %276 Binding 276 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %281 Location 281 
                                                      OpDecorate %282 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypePointer Private %6 
                                  Private f32* %8 = OpVariable Private 
                                               %9 = OpTypeVector %6 2 
                                              %10 = OpTypePointer Input %9 
                                 Input f32_2* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.67402E-40 
                                 Private f32* %20 = OpVariable Private 
                                 Private f32* %24 = OpVariable Private 
                                 Private f32* %28 = OpVariable Private 
                                          f32 %31 = OpConstant 3.67402E-40 
                                 Private f32* %52 = OpVariable Private 
                                              %54 = OpTypeVector %6 4 
                                              %55 = OpTypeStruct %54 %54 %54 %54 
                                              %56 = OpTypePointer Uniform %55 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %57 = OpVariable Uniform 
                                              %58 = OpTypeInt 32 1 
                                          i32 %59 = OpConstant 0 
                                          u32 %60 = OpConstant 1 
                                              %61 = OpTypePointer Uniform %6 
                                          u32 %71 = OpConstant 2 
                                          u32 %78 = OpConstant 3 
                                 Private f32* %85 = OpVariable Private 
                                          i32 %87 = OpConstant 2 
                                             %109 = OpTypeBool 
                                             %110 = OpTypePointer Private %109 
                               Private bool* %111 = OpVariable Private 
                               Private bool* %116 = OpVariable Private 
                                         i32 %125 = OpConstant 1 
                                         i32 %127 = OpConstant -1 
                                Private f32* %165 = OpVariable Private 
                                Private f32* %188 = OpVariable Private 
                                         i32 %190 = OpConstant 3 
                               Private bool* %212 = OpVariable Private 
                               Private bool* %217 = OpVariable Private 
                                             %232 = OpTypePointer Private %9 
                              Private f32_2* %233 = OpVariable Private 
                                         f32 %251 = OpConstant 3.67402E-40 
                                             %271 = OpTypePointer Private %54 
                              Private f32_4* %272 = OpVariable Private 
                                             %273 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %274 = OpTypeSampledImage %273 
                                             %275 = OpTypePointer UniformConstant %274 
 UniformConstant read_only Texture2DSampled* %276 = OpVariable UniformConstant 
                                             %280 = OpTypePointer Output %54 
                               Output f32_4* %281 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpFNegate %16 
                                          f32 %19 = OpFAdd %17 %18 
                                                      OpStore %8 %19 
                                          f32 %21 = OpLoad %8 
                                          f32 %22 = OpLoad %8 
                                          f32 %23 = OpFMul %21 %22 
                                                      OpStore %20 %23 
                                          f32 %25 = OpLoad %20 
                                          f32 %26 = OpLoad %8 
                                          f32 %27 = OpFMul %25 %26 
                                                      OpStore %24 %27 
                                   Input f32* %29 = OpAccessChain %11 %13 
                                          f32 %30 = OpLoad %29 
                                          f32 %32 = OpFMul %30 %31 
                                                      OpStore %28 %32 
                                          f32 %33 = OpLoad %20 
                                          f32 %34 = OpLoad %28 
                                          f32 %35 = OpFMul %33 %34 
                                                      OpStore %20 %35 
                                          f32 %36 = OpLoad %28 
                                   Input f32* %37 = OpAccessChain %11 %13 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                                      OpStore %28 %39 
                                          f32 %40 = OpLoad %8 
                                          f32 %41 = OpLoad %28 
                                          f32 %42 = OpFMul %40 %41 
                                                      OpStore %8 %42 
                                   Input f32* %43 = OpAccessChain %11 %13 
                                          f32 %44 = OpLoad %43 
                                   Input f32* %45 = OpAccessChain %11 %13 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFMul %44 %46 
                                                      OpStore %28 %47 
                                          f32 %48 = OpLoad %28 
                                   Input f32* %49 = OpAccessChain %11 %13 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFMul %48 %50 
                                                      OpStore %28 %51 
                                          f32 %53 = OpLoad %20 
                                 Uniform f32* %62 = OpAccessChain %57 %59 %60 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFMul %53 %63 
                                                      OpStore %52 %64 
                                 Uniform f32* %65 = OpAccessChain %57 %59 %13 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpLoad %24 
                                          f32 %68 = OpFMul %66 %67 
                                          f32 %69 = OpLoad %52 
                                          f32 %70 = OpFAdd %68 %69 
                                                      OpStore %52 %70 
                                 Uniform f32* %72 = OpAccessChain %57 %59 %71 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpLoad %8 
                                          f32 %75 = OpFMul %73 %74 
                                          f32 %76 = OpLoad %52 
                                          f32 %77 = OpFAdd %75 %76 
                                                      OpStore %52 %77 
                                 Uniform f32* %79 = OpAccessChain %57 %59 %78 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpLoad %28 
                                          f32 %82 = OpFMul %80 %81 
                                          f32 %83 = OpLoad %52 
                                          f32 %84 = OpFAdd %82 %83 
                                                      OpStore %52 %84 
                                          f32 %86 = OpLoad %20 
                                 Uniform f32* %88 = OpAccessChain %57 %87 %60 
                                          f32 %89 = OpLoad %88 
                                          f32 %90 = OpFMul %86 %89 
                                                      OpStore %85 %90 
                                 Uniform f32* %91 = OpAccessChain %57 %87 %13 
                                          f32 %92 = OpLoad %91 
                                          f32 %93 = OpLoad %24 
                                          f32 %94 = OpFMul %92 %93 
                                          f32 %95 = OpLoad %85 
                                          f32 %96 = OpFAdd %94 %95 
                                                      OpStore %85 %96 
                                 Uniform f32* %97 = OpAccessChain %57 %87 %71 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpLoad %8 
                                         f32 %100 = OpFMul %98 %99 
                                         f32 %101 = OpLoad %85 
                                         f32 %102 = OpFAdd %100 %101 
                                                      OpStore %85 %102 
                                Uniform f32* %103 = OpAccessChain %57 %87 %78 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpLoad %28 
                                         f32 %106 = OpFMul %104 %105 
                                         f32 %107 = OpLoad %85 
                                         f32 %108 = OpFAdd %106 %107 
                                                      OpStore %85 %108 
                                  Input f32* %112 = OpAccessChain %11 %60 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpLoad %52 
                                        bool %115 = OpFOrdLessThan %113 %114 
                                                      OpStore %111 %115 
                                         f32 %117 = OpLoad %85 
                                  Input f32* %118 = OpAccessChain %11 %60 
                                         f32 %119 = OpLoad %118 
                                        bool %120 = OpFOrdLessThan %117 %119 
                                                      OpStore %116 %120 
                                        bool %121 = OpLoad %116 
                                        bool %122 = OpLoad %111 
                                        bool %123 = OpLogicalOr %121 %122 
                                                      OpStore %111 %123 
                                        bool %124 = OpLoad %111 
                                         i32 %126 = OpSelect %124 %125 %59 
                                         i32 %128 = OpIMul %126 %127 
                                        bool %129 = OpINotEqual %128 %59 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %131 
                                             %130 = OpLabel 
                                                      OpKill
                                             %131 = OpLabel 
                                  Input f32* %133 = OpAccessChain %11 %60 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                         f32 %136 = OpFAdd %135 %18 
                                                      OpStore %8 %136 
                                         f32 %137 = OpLoad %8 
                                         f32 %138 = OpLoad %8 
                                         f32 %139 = OpFMul %137 %138 
                                                      OpStore %20 %139 
                                         f32 %140 = OpLoad %20 
                                         f32 %141 = OpLoad %8 
                                         f32 %142 = OpFMul %140 %141 
                                                      OpStore %24 %142 
                                  Input f32* %143 = OpAccessChain %11 %60 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFMul %144 %31 
                                                      OpStore %28 %145 
                                         f32 %146 = OpLoad %20 
                                         f32 %147 = OpLoad %28 
                                         f32 %148 = OpFMul %146 %147 
                                                      OpStore %20 %148 
                                         f32 %149 = OpLoad %28 
                                  Input f32* %150 = OpAccessChain %11 %60 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFMul %149 %151 
                                                      OpStore %28 %152 
                                         f32 %153 = OpLoad %8 
                                         f32 %154 = OpLoad %28 
                                         f32 %155 = OpFMul %153 %154 
                                                      OpStore %8 %155 
                                  Input f32* %156 = OpAccessChain %11 %60 
                                         f32 %157 = OpLoad %156 
                                  Input f32* %158 = OpAccessChain %11 %60 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFMul %157 %159 
                                                      OpStore %28 %160 
                                         f32 %161 = OpLoad %28 
                                  Input f32* %162 = OpAccessChain %11 %60 
                                         f32 %163 = OpLoad %162 
                                         f32 %164 = OpFMul %161 %163 
                                                      OpStore %28 %164 
                                         f32 %166 = OpLoad %20 
                                Uniform f32* %167 = OpAccessChain %57 %125 %60 
                                         f32 %168 = OpLoad %167 
                                         f32 %169 = OpFMul %166 %168 
                                                      OpStore %165 %169 
                                Uniform f32* %170 = OpAccessChain %57 %125 %13 
                                         f32 %171 = OpLoad %170 
                                         f32 %172 = OpLoad %24 
                                         f32 %173 = OpFMul %171 %172 
                                         f32 %174 = OpLoad %165 
                                         f32 %175 = OpFAdd %173 %174 
                                                      OpStore %165 %175 
                                Uniform f32* %176 = OpAccessChain %57 %125 %71 
                                         f32 %177 = OpLoad %176 
                                         f32 %178 = OpLoad %8 
                                         f32 %179 = OpFMul %177 %178 
                                         f32 %180 = OpLoad %165 
                                         f32 %181 = OpFAdd %179 %180 
                                                      OpStore %165 %181 
                                Uniform f32* %182 = OpAccessChain %57 %125 %78 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpLoad %28 
                                         f32 %185 = OpFMul %183 %184 
                                         f32 %186 = OpLoad %165 
                                         f32 %187 = OpFAdd %185 %186 
                                                      OpStore %165 %187 
                                         f32 %189 = OpLoad %20 
                                Uniform f32* %191 = OpAccessChain %57 %190 %60 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %189 %192 
                                                      OpStore %188 %193 
                                Uniform f32* %194 = OpAccessChain %57 %190 %13 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpLoad %24 
                                         f32 %197 = OpFMul %195 %196 
                                         f32 %198 = OpLoad %188 
                                         f32 %199 = OpFAdd %197 %198 
                                                      OpStore %188 %199 
                                Uniform f32* %200 = OpAccessChain %57 %190 %71 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpLoad %8 
                                         f32 %203 = OpFMul %201 %202 
                                         f32 %204 = OpLoad %188 
                                         f32 %205 = OpFAdd %203 %204 
                                                      OpStore %188 %205 
                                Uniform f32* %206 = OpAccessChain %57 %190 %78 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpLoad %28 
                                         f32 %209 = OpFMul %207 %208 
                                         f32 %210 = OpLoad %188 
                                         f32 %211 = OpFAdd %209 %210 
                                                      OpStore %188 %211 
                                  Input f32* %213 = OpAccessChain %11 %13 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpLoad %165 
                                        bool %216 = OpFOrdLessThan %214 %215 
                                                      OpStore %212 %216 
                                         f32 %218 = OpLoad %188 
                                  Input f32* %219 = OpAccessChain %11 %13 
                                         f32 %220 = OpLoad %219 
                                        bool %221 = OpFOrdLessThan %218 %220 
                                                      OpStore %217 %221 
                                        bool %222 = OpLoad %217 
                                        bool %223 = OpLoad %212 
                                        bool %224 = OpLogicalOr %222 %223 
                                                      OpStore %212 %224 
                                        bool %225 = OpLoad %212 
                                         i32 %226 = OpSelect %225 %125 %59 
                                         i32 %227 = OpIMul %226 %127 
                                        bool %228 = OpINotEqual %227 %59 
                                                      OpSelectionMerge %230 None 
                                                      OpBranchConditional %228 %229 %230 
                                             %229 = OpLabel 
                                                      OpKill
                                             %230 = OpLabel 
                                         f32 %234 = OpLoad %165 
                                         f32 %235 = OpFNegate %234 
                                  Input f32* %236 = OpAccessChain %11 %13 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                Private f32* %239 = OpAccessChain %233 %13 
                                                      OpStore %239 %238 
                                         f32 %240 = OpLoad %165 
                                         f32 %241 = OpFNegate %240 
                                         f32 %242 = OpLoad %188 
                                         f32 %243 = OpFAdd %241 %242 
                                                      OpStore %165 %243 
                                Private f32* %244 = OpAccessChain %233 %13 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpLoad %165 
                                         f32 %247 = OpFDiv %245 %246 
                                Private f32* %248 = OpAccessChain %233 %13 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %233 %13 
                                         f32 %250 = OpLoad %249 
                                         f32 %252 = OpExtInst %1 43 %250 %251 %18 
                                Private f32* %253 = OpAccessChain %233 %13 
                                                      OpStore %253 %252 
                                         f32 %254 = OpLoad %52 
                                         f32 %255 = OpFNegate %254 
                                  Input f32* %256 = OpAccessChain %11 %60 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFAdd %255 %257 
                                                      OpStore %165 %258 
                                         f32 %259 = OpLoad %52 
                                         f32 %260 = OpFNegate %259 
                                         f32 %261 = OpLoad %85 
                                         f32 %262 = OpFAdd %260 %261 
                                                      OpStore %52 %262 
                                         f32 %263 = OpLoad %165 
                                         f32 %264 = OpLoad %52 
                                         f32 %265 = OpFDiv %263 %264 
                                Private f32* %266 = OpAccessChain %233 %60 
                                                      OpStore %266 %265 
                                Private f32* %267 = OpAccessChain %233 %60 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpExtInst %1 43 %268 %251 %18 
                                Private f32* %270 = OpAccessChain %233 %60 
                                                      OpStore %270 %269 
                  read_only Texture2DSampled %277 = OpLoad %276 
                                       f32_2 %278 = OpLoad %233 
                                       f32_4 %279 = OpImageSampleImplicitLod %277 %278 
                                                      OpStore %272 %279 
                                       f32_4 %282 = OpLoad %272 
                                                      OpStore %281 %282 
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