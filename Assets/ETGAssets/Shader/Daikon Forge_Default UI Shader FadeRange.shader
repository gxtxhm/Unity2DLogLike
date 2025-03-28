//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Daikon Forge/Default UI Shader FadeRange" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "white" { }
_XFadeStart ("X Fade Start", Float) = 0
_XFadeEnd ("X Fade End", Float) = 1
_YFadeStart ("Y Fade Start", Float) = 1
_YFadeEnd ("Y Fade End", Float) = 0
}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Overlay" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Offset -1, -1
  Stencil {
   Ref 2
   Comp Always
   Pass Replace
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 3434
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD1.xy = in_POSITION0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _XFadeStart;
uniform 	float _XFadeEnd;
uniform 	float _YFadeStart;
uniform 	float _YFadeEnd;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec2 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
float u_xlat2;
bvec3 u_xlatb2;
float u_xlat6;
void main()
{
    u_xlat0.x = max(abs(vs_TEXCOORD1.y), abs(vs_TEXCOORD1.x));
    u_xlatb0 = 1.0<u_xlat0.x;
    u_xlat0.x = (u_xlatb0) ? 0.0 : vs_COLOR0.w;
    u_xlatb2.xy = lessThan(vs_TEXCOORD2.xyxx, vec4(_XFadeStart, _YFadeEnd, _XFadeStart, _XFadeStart)).xy;
    u_xlat1 = vs_TEXCOORD2.xxyy + (-vec4(_XFadeStart, _XFadeEnd, _YFadeStart, _YFadeEnd));
    u_xlat1 = u_xlat1 * vec4(33.3333359, 33.3333359, 33.3333359, 33.3333359);
    u_xlat1 = min(abs(u_xlat1), vec4(1.0, 1.0, 1.0, 1.0));
    u_xlat6 = u_xlat1.x * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.x = (u_xlatb2.x) ? u_xlat6 : u_xlat0.x;
    u_xlatb2.xz = lessThan(vec4(_XFadeEnd, _XFadeEnd, _YFadeStart, _YFadeStart), vs_TEXCOORD2.xxyy).xz;
    u_xlat1.x = u_xlat1.y * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat0.x;
    u_xlat2 = u_xlat1.z * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.x = (u_xlatb2.z) ? u_xlat2 : u_xlat0.x;
    u_xlat2 = u_xlat1.w * (-u_xlat0.x) + u_xlat0.x;
    u_xlat0.w = (u_xlatb2.y) ? u_xlat2 : u_xlat0.x;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.xyz = vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 * u_xlat10_1;
    u_xlatb1 = u_xlat0.w==0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 135
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 %88 %99 %101 %123 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %77 0 BuiltIn 77 
                                                      OpMemberDecorate %77 1 BuiltIn 77 
                                                      OpMemberDecorate %77 2 BuiltIn 77 
                                                      OpDecorate %77 Block 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 Location 83 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %88 Location 88 
                                                      OpDecorate %99 Location 99 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate %123 Location 123 
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
                                              %18 = OpTypeStruct %7 %16 %17 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %75 = OpConstant 1 
                                              %76 = OpTypeArray %6 %75 
                                              %77 = OpTypeStruct %7 %6 %76 
                                              %78 = OpTypePointer Output %77 
         Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                              %81 = OpTypePointer Output %7 
                                Output f32_4* %83 = OpVariable Output 
                                 Input f32_4* %84 = OpVariable Input 
                                              %86 = OpTypeVector %6 2 
                                              %87 = OpTypePointer Output %86 
                                Output f32_2* %88 = OpVariable Output 
                                Output f32_2* %99 = OpVariable Output 
                                             %100 = OpTypePointer Input %86 
                                Input f32_2* %101 = OpVariable Input 
                                             %103 = OpTypePointer Private %6 
                                Private f32* %104 = OpVariable Private 
                                         u32 %107 = OpConstant 0 
                                             %108 = OpTypePointer Uniform %6 
                                         f32 %114 = OpConstant 3.67402E-40 
                                       f32_2 %115 = OpConstantComposite %114 %114 
                                         u32 %121 = OpConstant 3 
                               Output f32_2* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %13 %25 
                                                      OpStore %9 %26 
                               Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                               Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %48 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %80 = OpLoad %9 
                                Output f32_4* %82 = OpAccessChain %79 %27 
                                                      OpStore %82 %80 
                                        f32_4 %85 = OpLoad %84 
                                                      OpStore %83 %85 
                                        f32_4 %89 = OpLoad %11 
                                        f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                               Uniform f32_4* %91 = OpAccessChain %20 %44 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %94 = OpFMul %90 %93 
                               Uniform f32_4* %95 = OpAccessChain %20 %44 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                        f32_2 %98 = OpFAdd %94 %97 
                                                      OpStore %88 %98 
                                       f32_2 %102 = OpLoad %101 
                                                      OpStore %99 %102 
                                Private f32* %105 = OpAccessChain %9 %75 
                                         f32 %106 = OpLoad %105 
                                Uniform f32* %109 = OpAccessChain %20 %27 %107 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %106 %110 
                                                      OpStore %104 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 3 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 1 5 3 
                                                      OpStore %9 %118 
                                         f32 %119 = OpLoad %104 
                                         f32 %120 = OpFMul %119 %114 
                                Private f32* %122 = OpAccessChain %9 %121 
                                                      OpStore %122 %120 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 2 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 3 
                                       f32_2 %128 = OpFAdd %125 %127 
                                                      OpStore %123 %128 
                                 Output f32* %130 = OpAccessChain %79 %27 %75 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpFNegate %131 
                                 Output f32* %133 = OpAccessChain %79 %27 %75 
                                                      OpStore %133 %132 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 216
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %11 %43 %48 %188 %213 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %32 RelaxedPrecision 
                                                     OpDecorate %43 RelaxedPrecision 
                                                     OpDecorate %43 Location 43 
                                                     OpDecorate %46 RelaxedPrecision 
                                                     OpDecorate %47 RelaxedPrecision 
                                                     OpDecorate %48 Location 48 
                                                     OpMemberDecorate %51 0 Offset 51 
                                                     OpMemberDecorate %51 1 Offset 51 
                                                     OpMemberDecorate %51 2 Offset 51 
                                                     OpMemberDecorate %51 3 Offset 51 
                                                     OpDecorate %51 Block 
                                                     OpDecorate %53 DescriptorSet 53 
                                                     OpDecorate %53 Binding 53 
                                                     OpDecorate %101 RelaxedPrecision 
                                                     OpDecorate %102 RelaxedPrecision 
                                                     OpDecorate %104 RelaxedPrecision 
                                                     OpDecorate %113 RelaxedPrecision 
                                                     OpDecorate %133 RelaxedPrecision 
                                                     OpDecorate %134 RelaxedPrecision 
                                                     OpDecorate %136 RelaxedPrecision 
                                                     OpDecorate %145 RelaxedPrecision 
                                                     OpDecorate %150 RelaxedPrecision 
                                                     OpDecorate %151 RelaxedPrecision 
                                                     OpDecorate %153 RelaxedPrecision 
                                                     OpDecorate %162 RelaxedPrecision 
                                                     OpDecorate %166 RelaxedPrecision 
                                                     OpDecorate %167 RelaxedPrecision 
                                                     OpDecorate %169 RelaxedPrecision 
                                                     OpDecorate %171 RelaxedPrecision 
                                                     OpDecorate %179 RelaxedPrecision 
                                                     OpDecorate %182 RelaxedPrecision 
                                                     OpDecorate %186 RelaxedPrecision 
                                                     OpDecorate %186 DescriptorSet 186 
                                                     OpDecorate %186 Binding 186 
                                                     OpDecorate %187 RelaxedPrecision 
                                                     OpDecorate %188 Location 188 
                                                     OpDecorate %192 RelaxedPrecision 
                                                     OpDecorate %193 RelaxedPrecision 
                                                     OpDecorate %196 RelaxedPrecision 
                                                     OpDecorate %197 RelaxedPrecision 
                                                     OpDecorate %198 RelaxedPrecision 
                                                     OpDecorate %202 RelaxedPrecision 
                                                     OpDecorate %213 RelaxedPrecision 
                                                     OpDecorate %213 Location 213 
                                                     OpDecorate %214 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypePointer Private %6 
                                 Private f32* %8 = OpVariable Private 
                                              %9 = OpTypeVector %6 2 
                                             %10 = OpTypePointer Input %9 
                                Input f32_2* %11 = OpVariable Input 
                                             %12 = OpTypeInt 32 0 
                                         u32 %13 = OpConstant 1 
                                             %14 = OpTypePointer Input %6 
                                         u32 %18 = OpConstant 0 
                                             %23 = OpTypeBool 
                                             %24 = OpTypeVector %23 3 
                                             %25 = OpTypePointer Private %24 
                             Private bool_3* %26 = OpVariable Private 
                                         f32 %27 = OpConstant 3.67402E-40 
                                Private f32* %32 = OpVariable Private 
                                             %33 = OpTypePointer Function %6 
                                         f32 %39 = OpConstant 3.67402E-40 
                                             %41 = OpTypeVector %6 4 
                                             %42 = OpTypePointer Input %41 
                                Input f32_4* %43 = OpVariable Input 
                                         u32 %44 = OpConstant 3 
                                Input f32_2* %48 = OpVariable Input 
                                             %51 = OpTypeStruct %6 %6 %6 %6 
                                             %52 = OpTypePointer Uniform %51 
       Uniform struct {f32; f32; f32; f32;}* %53 = OpVariable Uniform 
                                             %54 = OpTypeInt 32 1 
                                         i32 %55 = OpConstant 0 
                                             %56 = OpTypePointer Uniform %6 
                                         i32 %59 = OpConstant 3 
                                             %67 = OpTypeVector %23 4 
                                             %69 = OpTypeVector %23 2 
                                             %73 = OpTypePointer Private %41 
                              Private f32_4* %74 = OpVariable Private 
                                         i32 %79 = OpConstant 1 
                                         i32 %82 = OpConstant 2 
                                         f32 %91 = OpConstant 3.67402E-40 
                                       f32_4 %92 = OpConstantComposite %91 %91 %91 %91 
                                       f32_4 %96 = OpConstantComposite %27 %27 %27 %27 
                                Private f32* %98 = OpVariable Private 
                               Private f32* %130 = OpVariable Private 
                                        u32 %147 = OpConstant 2 
                             Private f32_4* %171 = OpVariable Private 
                             Private f32_4* %182 = OpVariable Private 
                                            %183 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %184 = OpTypeSampledImage %183 
                                            %185 = OpTypePointer UniformConstant %184 
UniformConstant read_only Texture2DSampled* %186 = OpVariable UniformConstant 
                               Input f32_2* %188 = OpVariable Input 
                                            %191 = OpTypeVector %6 3 
                                            %199 = OpTypePointer Private %23 
                              Private bool* %200 = OpVariable Private 
                                        i32 %206 = OpConstant -1 
                                            %212 = OpTypePointer Output %41 
                              Output f32_4* %213 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %34 = OpVariable Function 
                              Function f32* %106 = OpVariable Function 
                              Function f32* %138 = OpVariable Function 
                              Function f32* %155 = OpVariable Function 
                              Function f32* %172 = OpVariable Function 
                                  Input f32* %15 = OpAccessChain %11 %13 
                                         f32 %16 = OpLoad %15 
                                         f32 %17 = OpExtInst %1 4 %16 
                                  Input f32* %19 = OpAccessChain %11 %18 
                                         f32 %20 = OpLoad %19 
                                         f32 %21 = OpExtInst %1 4 %20 
                                         f32 %22 = OpExtInst %1 40 %17 %21 
                                                     OpStore %8 %22 
                                         f32 %28 = OpLoad %8 
                                        bool %29 = OpFOrdLessThan %27 %28 
                                      bool_3 %30 = OpLoad %26 
                                      bool_3 %31 = OpCompositeInsert %29 %30 0 
                                                     OpStore %26 %31 
                                      bool_3 %35 = OpLoad %26 
                                        bool %36 = OpCompositeExtract %35 0 
                                                     OpSelectionMerge %38 None 
                                                     OpBranchConditional %36 %37 %40 
                                             %37 = OpLabel 
                                                     OpStore %34 %39 
                                                     OpBranch %38 
                                             %40 = OpLabel 
                                  Input f32* %45 = OpAccessChain %43 %44 
                                         f32 %46 = OpLoad %45 
                                                     OpStore %34 %46 
                                                     OpBranch %38 
                                             %38 = OpLabel 
                                         f32 %47 = OpLoad %34 
                                                     OpStore %32 %47 
                                       f32_2 %49 = OpLoad %48 
                                       f32_4 %50 = OpVectorShuffle %49 %49 0 1 0 0 
                                Uniform f32* %57 = OpAccessChain %53 %55 
                                         f32 %58 = OpLoad %57 
                                Uniform f32* %60 = OpAccessChain %53 %59 
                                         f32 %61 = OpLoad %60 
                                Uniform f32* %62 = OpAccessChain %53 %55 
                                         f32 %63 = OpLoad %62 
                                Uniform f32* %64 = OpAccessChain %53 %55 
                                         f32 %65 = OpLoad %64 
                                       f32_4 %66 = OpCompositeConstruct %58 %61 %63 %65 
                                      bool_4 %68 = OpFOrdLessThan %50 %66 
                                      bool_2 %70 = OpVectorShuffle %68 %68 0 1 
                                      bool_3 %71 = OpLoad %26 
                                      bool_3 %72 = OpVectorShuffle %71 %70 3 4 2 
                                                     OpStore %26 %72 
                                       f32_2 %75 = OpLoad %48 
                                       f32_4 %76 = OpVectorShuffle %75 %75 0 0 1 1 
                                Uniform f32* %77 = OpAccessChain %53 %55 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %80 = OpAccessChain %53 %79 
                                         f32 %81 = OpLoad %80 
                                Uniform f32* %83 = OpAccessChain %53 %82 
                                         f32 %84 = OpLoad %83 
                                Uniform f32* %85 = OpAccessChain %53 %59 
                                         f32 %86 = OpLoad %85 
                                       f32_4 %87 = OpCompositeConstruct %78 %81 %84 %86 
                                       f32_4 %88 = OpFNegate %87 
                                       f32_4 %89 = OpFAdd %76 %88 
                                                     OpStore %74 %89 
                                       f32_4 %90 = OpLoad %74 
                                       f32_4 %93 = OpFMul %90 %92 
                                                     OpStore %74 %93 
                                       f32_4 %94 = OpLoad %74 
                                       f32_4 %95 = OpExtInst %1 4 %94 
                                       f32_4 %97 = OpExtInst %1 37 %95 %96 
                                                     OpStore %74 %97 
                                Private f32* %99 = OpAccessChain %74 %18 
                                        f32 %100 = OpLoad %99 
                                        f32 %101 = OpLoad %32 
                                        f32 %102 = OpFNegate %101 
                                        f32 %103 = OpFMul %100 %102 
                                        f32 %104 = OpLoad %32 
                                        f32 %105 = OpFAdd %103 %104 
                                                     OpStore %98 %105 
                                     bool_3 %107 = OpLoad %26 
                                       bool %108 = OpCompositeExtract %107 0 
                                                     OpSelectionMerge %110 None 
                                                     OpBranchConditional %108 %109 %112 
                                            %109 = OpLabel 
                                        f32 %111 = OpLoad %98 
                                                     OpStore %106 %111 
                                                     OpBranch %110 
                                            %112 = OpLabel 
                                        f32 %113 = OpLoad %32 
                                                     OpStore %106 %113 
                                                     OpBranch %110 
                                            %110 = OpLabel 
                                        f32 %114 = OpLoad %106 
                                                     OpStore %32 %114 
                               Uniform f32* %115 = OpAccessChain %53 %79 
                                        f32 %116 = OpLoad %115 
                               Uniform f32* %117 = OpAccessChain %53 %79 
                                        f32 %118 = OpLoad %117 
                               Uniform f32* %119 = OpAccessChain %53 %82 
                                        f32 %120 = OpLoad %119 
                               Uniform f32* %121 = OpAccessChain %53 %79 
                                        f32 %122 = OpLoad %121 
                                      f32_4 %123 = OpCompositeConstruct %116 %118 %120 %122 
                                      f32_2 %124 = OpLoad %48 
                                      f32_4 %125 = OpVectorShuffle %124 %124 0 0 1 0 
                                     bool_4 %126 = OpFOrdLessThan %123 %125 
                                     bool_2 %127 = OpVectorShuffle %126 %126 0 2 
                                     bool_3 %128 = OpLoad %26 
                                     bool_3 %129 = OpVectorShuffle %128 %127 3 1 4 
                                                     OpStore %26 %129 
                               Private f32* %131 = OpAccessChain %74 %13 
                                        f32 %132 = OpLoad %131 
                                        f32 %133 = OpLoad %32 
                                        f32 %134 = OpFNegate %133 
                                        f32 %135 = OpFMul %132 %134 
                                        f32 %136 = OpLoad %32 
                                        f32 %137 = OpFAdd %135 %136 
                                                     OpStore %130 %137 
                                     bool_3 %139 = OpLoad %26 
                                       bool %140 = OpCompositeExtract %139 0 
                                                     OpSelectionMerge %142 None 
                                                     OpBranchConditional %140 %141 %144 
                                            %141 = OpLabel 
                                        f32 %143 = OpLoad %130 
                                                     OpStore %138 %143 
                                                     OpBranch %142 
                                            %144 = OpLabel 
                                        f32 %145 = OpLoad %32 
                                                     OpStore %138 %145 
                                                     OpBranch %142 
                                            %142 = OpLabel 
                                        f32 %146 = OpLoad %138 
                                                     OpStore %32 %146 
                               Private f32* %148 = OpAccessChain %74 %147 
                                        f32 %149 = OpLoad %148 
                                        f32 %150 = OpLoad %32 
                                        f32 %151 = OpFNegate %150 
                                        f32 %152 = OpFMul %149 %151 
                                        f32 %153 = OpLoad %32 
                                        f32 %154 = OpFAdd %152 %153 
                                                     OpStore %8 %154 
                                     bool_3 %156 = OpLoad %26 
                                       bool %157 = OpCompositeExtract %156 2 
                                                     OpSelectionMerge %159 None 
                                                     OpBranchConditional %157 %158 %161 
                                            %158 = OpLabel 
                                        f32 %160 = OpLoad %8 
                                                     OpStore %155 %160 
                                                     OpBranch %159 
                                            %161 = OpLabel 
                                        f32 %162 = OpLoad %32 
                                                     OpStore %155 %162 
                                                     OpBranch %159 
                                            %159 = OpLabel 
                                        f32 %163 = OpLoad %155 
                                                     OpStore %32 %163 
                               Private f32* %164 = OpAccessChain %74 %44 
                                        f32 %165 = OpLoad %164 
                                        f32 %166 = OpLoad %32 
                                        f32 %167 = OpFNegate %166 
                                        f32 %168 = OpFMul %165 %167 
                                        f32 %169 = OpLoad %32 
                                        f32 %170 = OpFAdd %168 %169 
                                                     OpStore %8 %170 
                                     bool_3 %173 = OpLoad %26 
                                       bool %174 = OpCompositeExtract %173 1 
                                                     OpSelectionMerge %176 None 
                                                     OpBranchConditional %174 %175 %178 
                                            %175 = OpLabel 
                                        f32 %177 = OpLoad %8 
                                                     OpStore %172 %177 
                                                     OpBranch %176 
                                            %178 = OpLabel 
                                        f32 %179 = OpLoad %32 
                                                     OpStore %172 %179 
                                                     OpBranch %176 
                                            %176 = OpLabel 
                                        f32 %180 = OpLoad %172 
                               Private f32* %181 = OpAccessChain %171 %44 
                                                     OpStore %181 %180 
                 read_only Texture2DSampled %187 = OpLoad %186 
                                      f32_2 %189 = OpLoad %188 
                                      f32_4 %190 = OpImageSampleImplicitLod %187 %189 
                                                     OpStore %182 %190 
                                      f32_4 %192 = OpLoad %43 
                                      f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                      f32_4 %194 = OpLoad %171 
                                      f32_4 %195 = OpVectorShuffle %194 %193 4 5 6 3 
                                                     OpStore %171 %195 
                                      f32_4 %196 = OpLoad %171 
                                      f32_4 %197 = OpLoad %182 
                                      f32_4 %198 = OpFMul %196 %197 
                                                     OpStore %171 %198 
                               Private f32* %201 = OpAccessChain %171 %44 
                                        f32 %202 = OpLoad %201 
                                       bool %203 = OpFOrdEqual %202 %39 
                                                     OpStore %200 %203 
                                       bool %204 = OpLoad %200 
                                        i32 %205 = OpSelect %204 %79 %55 
                                        i32 %207 = OpIMul %205 %206 
                                       bool %208 = OpINotEqual %207 %55 
                                                     OpSelectionMerge %210 None 
                                                     OpBranchConditional %208 %209 %210 
                                            %209 = OpLabel 
                                                     OpKill
                                            %210 = OpLabel 
                                      f32_4 %214 = OpLoad %171 
                                                     OpStore %213 %214 
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