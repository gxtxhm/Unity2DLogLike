//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "tk2d/BlendVertexColorFadeRange" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_Saturation ("Saturation", Float) = 1
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_XFadeStart ("X Fade Start", Float) = 0
_XFadeEnd ("X Fade End", Float) = 1
_YFadeStart ("Y Fade Start", Float) = 1
_YFadeEnd ("Y Fade End", Float) = 0
_DivPower ("Div Power", Float) = 1
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
  GpuProgramID 18917
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
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform 	float _XFadeStart;
uniform 	float _XFadeEnd;
uniform 	float _Saturation;
uniform 	float _YFadeStart;
uniform 	float _YFadeEnd;
uniform 	float _DivPower;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat10_2;
vec4 u_xlat3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_YFadeEnd);
    u_xlat0.x = u_xlat0.x * 33.3333359;
    u_xlat0.x = abs(u_xlat0.x) * _DivPower;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb4 = vs_TEXCOORD1.x<_XFadeStart;
    u_xlat1.xyz = vs_TEXCOORD1.xxy + (-vec3(_XFadeStart, _XFadeEnd, _YFadeStart));
    u_xlat1.xyz = u_xlat1.xyz * vec3(33.3333359, 33.3333359, 33.3333359);
    u_xlat1.xyz = abs(u_xlat1.xyz) * vec3(vec3(_DivPower, _DivPower, _DivPower));
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_2 * vs_COLOR0;
    u_xlat8 = u_xlat1.x * (-u_xlat3.w) + u_xlat3.w;
    u_xlat4 = (u_xlatb4) ? u_xlat8 : u_xlat3.w;
    u_xlat8 = dot(u_xlat3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat8 = u_xlat8 * 0.75;
    u_xlat12 = u_xlat1.y * (-u_xlat4) + u_xlat4;
    u_xlatb1.xy = lessThan(vec4(_XFadeEnd, _YFadeStart, _XFadeEnd, _XFadeEnd), vs_TEXCOORD1.xyxx).xy;
    u_xlat4 = (u_xlatb1.x) ? u_xlat12 : u_xlat4;
    u_xlat12 = u_xlat1.z * (-u_xlat4) + u_xlat4;
    u_xlat4 = (u_xlatb1.y) ? u_xlat12 : u_xlat4;
    u_xlat0.x = u_xlat0.x * (-u_xlat4) + u_xlat4;
    u_xlatb12 = vs_TEXCOORD1.y<_YFadeEnd;
    u_xlat0.x = (u_xlatb12) ? u_xlat0.x : u_xlat4;
    u_xlat4 = u_xlat0.x + -0.100000001;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat4<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.xyw = u_xlat10_2.xyz * vs_COLOR0.xyz + (-vec3(u_xlat8));
    u_xlat0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyw + vec3(u_xlat8);
    u_xlat1.xyz = (-u_xlat0.xyz) + _OverrideColor.xyz;
    SV_Target0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat0.xyz;
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
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 %108 %114 %116 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate %84 Location 84 
                                                     OpDecorate %108 Location 108 
                                                     OpDecorate %114 Location 114 
                                                     OpDecorate %116 Location 116 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
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
                                             %86 = OpTypePointer Private %6 
                                Private f32* %87 = OpVariable Private 
                                         u32 %90 = OpConstant 0 
                                             %91 = OpTypePointer Uniform %6 
                                             %95 = OpTypeVector %6 2 
                                         f32 %98 = OpConstant 3.67402E-40 
                                       f32_2 %99 = OpConstantComposite %98 %98 
                                        u32 %105 = OpConstant 3 
                                            %107 = OpTypePointer Output %95 
                              Output f32_2* %108 = OpVariable Output 
                              Output f32_2* %114 = OpVariable Output 
                                            %115 = OpTypePointer Input %95 
                               Input f32_2* %116 = OpVariable Input 
                                            %118 = OpTypePointer Output %6 
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
                                Private f32* %88 = OpAccessChain %9 %75 
                                         f32 %89 = OpLoad %88 
                                Uniform f32* %92 = OpAccessChain %20 %27 %90 
                                         f32 %93 = OpLoad %92 
                                         f32 %94 = OpFMul %89 %93 
                                                     OpStore %87 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_2 %97 = OpVectorShuffle %96 %96 0 3 
                                      f32_2 %100 = OpFMul %97 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 1 5 3 
                                                     OpStore %9 %102 
                                        f32 %103 = OpLoad %87 
                                        f32 %104 = OpFMul %103 %98 
                               Private f32* %106 = OpAccessChain %9 %105 
                                                     OpStore %106 %104 
                                      f32_4 %109 = OpLoad %9 
                                      f32_2 %110 = OpVectorShuffle %109 %109 2 2 
                                      f32_4 %111 = OpLoad %9 
                                      f32_2 %112 = OpVectorShuffle %111 %111 0 3 
                                      f32_2 %113 = OpFAdd %110 %112 
                                                     OpStore %108 %113 
                                      f32_2 %117 = OpLoad %116 
                                                     OpStore %114 %117 
                                Output f32* %119 = OpAccessChain %79 %27 %75 
                                        f32 %120 = OpLoad %119 
                                        f32 %121 = OpFNegate %120 
                                Output f32* %122 = OpAccessChain %79 %27 %75 
                                                     OpStore %122 %121 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 297
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %102 %108 %236 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %19 0 RelaxedPrecision 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %100 DescriptorSet 100 
                                                      OpDecorate %100 Binding 100 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 Location 102 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %108 Location 108 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %117 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %122 RelaxedPrecision 
                                                      OpDecorate %131 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %236 Location 236 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 2 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_2* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 1 
                                              %15 = OpTypePointer Input %6 
                                              %18 = OpTypeVector %6 4 
                                              %19 = OpTypeStruct %18 %6 %6 %6 %6 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32; f32; f32; f32; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 5 
                                              %24 = OpTypePointer Uniform %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                          i32 %40 = OpConstant 6 
                                          f32 %47 = OpConstant 3.67402E-40 
                                          f32 %48 = OpConstant 3.67402E-40 
                                              %51 = OpTypeBool 
                                              %52 = OpTypePointer Private %51 
                                Private bool* %53 = OpVariable Private 
                                          i32 %56 = OpConstant 1 
                               Private f32_3* %60 = OpVariable Private 
                                          i32 %65 = OpConstant 2 
                                          i32 %68 = OpConstant 4 
                                        f32_3 %75 = OpConstantComposite %34 %34 %34 
                                              %95 = OpTypePointer Private %18 
                               Private f32_4* %96 = OpVariable Private 
                                              %97 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %98 = OpTypeSampledImage %97 
                                              %99 = OpTypePointer UniformConstant %98 
 UniformConstant read_only Texture2DSampled* %100 = OpVariable UniformConstant 
                                Input f32_2* %102 = OpVariable Input 
                              Private f32_4* %105 = OpVariable Private 
                                             %107 = OpTypePointer Input %18 
                                Input f32_4* %108 = OpVariable Input 
                                Private f32* %111 = OpVariable Private 
                                         u32 %114 = OpConstant 3 
                              Private f32_3* %122 = OpVariable Private 
                                             %123 = OpTypePointer Function %6 
                                Private f32* %134 = OpVariable Private 
                                         f32 %137 = OpConstant 3.67402E-40 
                                         f32 %138 = OpConstant 3.67402E-40 
                                         f32 %139 = OpConstant 3.67402E-40 
                                       f32_3 %140 = OpConstantComposite %137 %138 %139 
                                         f32 %143 = OpConstant 3.67402E-40 
                                Private f32* %145 = OpVariable Private 
                                             %155 = OpTypeVector %51 2 
                                             %156 = OpTypePointer Private %155 
                             Private bool_2* %157 = OpVariable Private 
                                             %169 = OpTypeVector %51 4 
                                         u32 %183 = OpConstant 2 
                                Private f32* %230 = OpVariable Private 
                                         f32 %233 = OpConstant 3.67402E-40 
                                             %235 = OpTypePointer Output %18 
                               Output f32_4* %236 = OpVariable Output 
                                             %239 = OpTypePointer Output %6 
                               Private bool* %241 = OpVariable Private 
                                         i32 %245 = OpConstant 0 
                                         i32 %247 = OpConstant -1 
                              Private f32_3* %253 = OpVariable Private 
                                         i32 %263 = OpConstant 3 
                                             %282 = OpTypePointer Uniform %18 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %124 = OpVariable Function 
                               Function f32* %172 = OpVariable Function 
                               Function f32* %193 = OpVariable Function 
                               Function f32* %219 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                 Uniform f32* %25 = OpAccessChain %21 %23 
                                          f32 %26 = OpLoad %25 
                                          f32 %27 = OpFNegate %26 
                                          f32 %28 = OpFAdd %17 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                 Private f32* %32 = OpAccessChain %9 %29 
                                          f32 %33 = OpLoad %32 
                                          f32 %35 = OpFMul %33 %34 
                                 Private f32* %36 = OpAccessChain %9 %29 
                                                      OpStore %36 %35 
                                 Private f32* %37 = OpAccessChain %9 %29 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpExtInst %1 4 %38 
                                 Uniform f32* %41 = OpAccessChain %21 %40 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFMul %39 %42 
                                 Private f32* %44 = OpAccessChain %9 %29 
                                                      OpStore %44 %43 
                                 Private f32* %45 = OpAccessChain %9 %29 
                                          f32 %46 = OpLoad %45 
                                          f32 %49 = OpExtInst %1 43 %46 %47 %48 
                                 Private f32* %50 = OpAccessChain %9 %29 
                                                      OpStore %50 %49 
                                   Input f32* %54 = OpAccessChain %12 %29 
                                          f32 %55 = OpLoad %54 
                                 Uniform f32* %57 = OpAccessChain %21 %56 
                                          f32 %58 = OpLoad %57 
                                         bool %59 = OpFOrdLessThan %55 %58 
                                                      OpStore %53 %59 
                                        f32_2 %61 = OpLoad %12 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 0 1 
                                 Uniform f32* %63 = OpAccessChain %21 %56 
                                          f32 %64 = OpLoad %63 
                                 Uniform f32* %66 = OpAccessChain %21 %65 
                                          f32 %67 = OpLoad %66 
                                 Uniform f32* %69 = OpAccessChain %21 %68 
                                          f32 %70 = OpLoad %69 
                                        f32_3 %71 = OpCompositeConstruct %64 %67 %70 
                                        f32_3 %72 = OpFNegate %71 
                                        f32_3 %73 = OpFAdd %62 %72 
                                                      OpStore %60 %73 
                                        f32_3 %74 = OpLoad %60 
                                        f32_3 %76 = OpFMul %74 %75 
                                                      OpStore %60 %76 
                                        f32_3 %77 = OpLoad %60 
                                        f32_3 %78 = OpExtInst %1 4 %77 
                                 Uniform f32* %79 = OpAccessChain %21 %40 
                                          f32 %80 = OpLoad %79 
                                 Uniform f32* %81 = OpAccessChain %21 %40 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %21 %40 
                                          f32 %84 = OpLoad %83 
                                        f32_3 %85 = OpCompositeConstruct %80 %82 %84 
                                          f32 %86 = OpCompositeExtract %85 0 
                                          f32 %87 = OpCompositeExtract %85 1 
                                          f32 %88 = OpCompositeExtract %85 2 
                                        f32_3 %89 = OpCompositeConstruct %86 %87 %88 
                                        f32_3 %90 = OpFMul %78 %89 
                                                      OpStore %60 %90 
                                        f32_3 %91 = OpLoad %60 
                                        f32_3 %92 = OpCompositeConstruct %47 %47 %47 
                                        f32_3 %93 = OpCompositeConstruct %48 %48 %48 
                                        f32_3 %94 = OpExtInst %1 43 %91 %92 %93 
                                                      OpStore %60 %94 
                  read_only Texture2DSampled %101 = OpLoad %100 
                                       f32_2 %103 = OpLoad %102 
                                       f32_4 %104 = OpImageSampleImplicitLod %101 %103 
                                                      OpStore %96 %104 
                                       f32_4 %106 = OpLoad %96 
                                       f32_4 %109 = OpLoad %108 
                                       f32_4 %110 = OpFMul %106 %109 
                                                      OpStore %105 %110 
                                Private f32* %112 = OpAccessChain %60 %29 
                                         f32 %113 = OpLoad %112 
                                Private f32* %115 = OpAccessChain %105 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFNegate %116 
                                         f32 %118 = OpFMul %113 %117 
                                Private f32* %119 = OpAccessChain %105 %114 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFAdd %118 %120 
                                                      OpStore %111 %121 
                                        bool %125 = OpLoad %53 
                                                      OpSelectionMerge %127 None 
                                                      OpBranchConditional %125 %126 %129 
                                             %126 = OpLabel 
                                         f32 %128 = OpLoad %111 
                                                      OpStore %124 %128 
                                                      OpBranch %127 
                                             %129 = OpLabel 
                                Private f32* %130 = OpAccessChain %105 %114 
                                         f32 %131 = OpLoad %130 
                                                      OpStore %124 %131 
                                                      OpBranch %127 
                                             %127 = OpLabel 
                                         f32 %132 = OpLoad %124 
                                Private f32* %133 = OpAccessChain %122 %29 
                                                      OpStore %133 %132 
                                       f32_4 %135 = OpLoad %105 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                         f32 %141 = OpDot %136 %140 
                                                      OpStore %134 %141 
                                         f32 %142 = OpLoad %134 
                                         f32 %144 = OpFMul %142 %143 
                                                      OpStore %134 %144 
                                Private f32* %146 = OpAccessChain %60 %14 
                                         f32 %147 = OpLoad %146 
                                Private f32* %148 = OpAccessChain %122 %29 
                                         f32 %149 = OpLoad %148 
                                         f32 %150 = OpFNegate %149 
                                         f32 %151 = OpFMul %147 %150 
                                Private f32* %152 = OpAccessChain %122 %29 
                                         f32 %153 = OpLoad %152 
                                         f32 %154 = OpFAdd %151 %153 
                                                      OpStore %145 %154 
                                Uniform f32* %158 = OpAccessChain %21 %65 
                                         f32 %159 = OpLoad %158 
                                Uniform f32* %160 = OpAccessChain %21 %68 
                                         f32 %161 = OpLoad %160 
                                Uniform f32* %162 = OpAccessChain %21 %65 
                                         f32 %163 = OpLoad %162 
                                Uniform f32* %164 = OpAccessChain %21 %68 
                                         f32 %165 = OpLoad %164 
                                       f32_4 %166 = OpCompositeConstruct %159 %161 %163 %165 
                                       f32_2 %167 = OpLoad %12 
                                       f32_4 %168 = OpVectorShuffle %167 %167 0 1 0 1 
                                      bool_4 %170 = OpFOrdLessThan %166 %168 
                                      bool_2 %171 = OpVectorShuffle %170 %170 0 1 
                                                      OpStore %157 %171 
                                      bool_2 %173 = OpLoad %157 
                                        bool %174 = OpCompositeExtract %173 0 
                                                      OpSelectionMerge %176 None 
                                                      OpBranchConditional %174 %175 %178 
                                             %175 = OpLabel 
                                         f32 %177 = OpLoad %145 
                                                      OpStore %172 %177 
                                                      OpBranch %176 
                                             %178 = OpLabel 
                                Private f32* %179 = OpAccessChain %122 %29 
                                         f32 %180 = OpLoad %179 
                                                      OpStore %172 %180 
                                                      OpBranch %176 
                                             %176 = OpLabel 
                                         f32 %181 = OpLoad %172 
                                Private f32* %182 = OpAccessChain %122 %29 
                                                      OpStore %182 %181 
                                Private f32* %184 = OpAccessChain %60 %183 
                                         f32 %185 = OpLoad %184 
                                Private f32* %186 = OpAccessChain %122 %29 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFNegate %187 
                                         f32 %189 = OpFMul %185 %188 
                                Private f32* %190 = OpAccessChain %122 %29 
                                         f32 %191 = OpLoad %190 
                                         f32 %192 = OpFAdd %189 %191 
                                                      OpStore %145 %192 
                                      bool_2 %194 = OpLoad %157 
                                        bool %195 = OpCompositeExtract %194 1 
                                                      OpSelectionMerge %197 None 
                                                      OpBranchConditional %195 %196 %199 
                                             %196 = OpLabel 
                                         f32 %198 = OpLoad %145 
                                                      OpStore %193 %198 
                                                      OpBranch %197 
                                             %199 = OpLabel 
                                Private f32* %200 = OpAccessChain %122 %29 
                                         f32 %201 = OpLoad %200 
                                                      OpStore %193 %201 
                                                      OpBranch %197 
                                             %197 = OpLabel 
                                         f32 %202 = OpLoad %193 
                                Private f32* %203 = OpAccessChain %122 %29 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %9 %29 
                                         f32 %205 = OpLoad %204 
                                Private f32* %206 = OpAccessChain %122 %29 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFMul %205 %208 
                                Private f32* %210 = OpAccessChain %122 %29 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFAdd %209 %211 
                                Private f32* %213 = OpAccessChain %9 %29 
                                                      OpStore %213 %212 
                                  Input f32* %214 = OpAccessChain %12 %14 
                                         f32 %215 = OpLoad %214 
                                Uniform f32* %216 = OpAccessChain %21 %23 
                                         f32 %217 = OpLoad %216 
                                        bool %218 = OpFOrdLessThan %215 %217 
                                                      OpStore %53 %218 
                                        bool %220 = OpLoad %53 
                                                      OpSelectionMerge %222 None 
                                                      OpBranchConditional %220 %221 %225 
                                             %221 = OpLabel 
                                Private f32* %223 = OpAccessChain %9 %29 
                                         f32 %224 = OpLoad %223 
                                                      OpStore %219 %224 
                                                      OpBranch %222 
                                             %225 = OpLabel 
                                Private f32* %226 = OpAccessChain %122 %29 
                                         f32 %227 = OpLoad %226 
                                                      OpStore %219 %227 
                                                      OpBranch %222 
                                             %222 = OpLabel 
                                         f32 %228 = OpLoad %219 
                                Private f32* %229 = OpAccessChain %122 %29 
                                                      OpStore %229 %228 
                                Private f32* %231 = OpAccessChain %122 %29 
                                         f32 %232 = OpLoad %231 
                                         f32 %234 = OpFAdd %232 %233 
                                                      OpStore %230 %234 
                                Private f32* %237 = OpAccessChain %122 %29 
                                         f32 %238 = OpLoad %237 
                                 Output f32* %240 = OpAccessChain %236 %114 
                                                      OpStore %240 %238 
                                         f32 %242 = OpLoad %230 
                                        bool %243 = OpFOrdLessThan %242 %47 
                                                      OpStore %241 %243 
                                        bool %244 = OpLoad %241 
                                         i32 %246 = OpSelect %244 %56 %245 
                                         i32 %248 = OpIMul %246 %247 
                                        bool %249 = OpINotEqual %248 %245 
                                                      OpSelectionMerge %251 None 
                                                      OpBranchConditional %249 %250 %251 
                                             %250 = OpLabel 
                                                      OpKill
                                             %251 = OpLabel 
                                       f32_4 %254 = OpLoad %96 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 1 2 
                                       f32_4 %256 = OpLoad %108 
                                       f32_3 %257 = OpVectorShuffle %256 %256 0 1 2 
                                       f32_3 %258 = OpFMul %255 %257 
                                         f32 %259 = OpLoad %134 
                                       f32_3 %260 = OpCompositeConstruct %259 %259 %259 
                                       f32_3 %261 = OpFNegate %260 
                                       f32_3 %262 = OpFAdd %258 %261 
                                                      OpStore %253 %262 
                                Uniform f32* %264 = OpAccessChain %21 %263 
                                         f32 %265 = OpLoad %264 
                                Uniform f32* %266 = OpAccessChain %21 %263 
                                         f32 %267 = OpLoad %266 
                                Uniform f32* %268 = OpAccessChain %21 %263 
                                         f32 %269 = OpLoad %268 
                                       f32_3 %270 = OpCompositeConstruct %265 %267 %269 
                                         f32 %271 = OpCompositeExtract %270 0 
                                         f32 %272 = OpCompositeExtract %270 1 
                                         f32 %273 = OpCompositeExtract %270 2 
                                       f32_3 %274 = OpCompositeConstruct %271 %272 %273 
                                       f32_3 %275 = OpLoad %253 
                                       f32_3 %276 = OpFMul %274 %275 
                                         f32 %277 = OpLoad %134 
                                       f32_3 %278 = OpCompositeConstruct %277 %277 %277 
                                       f32_3 %279 = OpFAdd %276 %278 
                                                      OpStore %9 %279 
                                       f32_3 %280 = OpLoad %9 
                                       f32_3 %281 = OpFNegate %280 
                              Uniform f32_4* %283 = OpAccessChain %21 %245 
                                       f32_4 %284 = OpLoad %283 
                                       f32_3 %285 = OpVectorShuffle %284 %284 0 1 2 
                                       f32_3 %286 = OpFAdd %281 %285 
                                                      OpStore %122 %286 
                              Uniform f32_4* %287 = OpAccessChain %21 %245 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 3 3 3 
                                       f32_3 %290 = OpLoad %122 
                                       f32_3 %291 = OpFMul %289 %290 
                                       f32_3 %292 = OpLoad %9 
                                       f32_3 %293 = OpFAdd %291 %292 
                                       f32_4 %294 = OpLoad %236 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %236 %295 
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