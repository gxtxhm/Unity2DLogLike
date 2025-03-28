//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/HologramShader" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_ValueMaximum ("Value Maximum", Float) = 1
_IsGreen ("IsGreen", Float) = 0
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 65424
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
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _OverrideColor;
uniform 	float _IsGreen;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
float u_xlat10;
float u_xlat15;
void main()
{
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat1.xyz = vs_TEXCOORD1.xyy * vec3(16.0, 16.0, 16.0);
    u_xlat1.xyz = floor(u_xlat1.xyz);
    u_xlat2.xz = u_xlat1.xz * vec2(0.0625, 0.200000003);
    u_xlat10 = (-_IsGreen);
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat3.xyz = vec3(u_xlat10) * vec3(-0.5, -0.25, -0.5) + vec3(1.0, 1.25, 1.75);
    u_xlat1.xw = u_xlat3.xx * _Time.xz;
    u_xlat15 = u_xlat1.w * 2.0 + u_xlat2.z;
    u_xlat15 = sin(u_xlat15);
    u_xlat15 = u_xlat15 + -0.899999976;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = u_xlat15 * _MainTex_TexelSize.x;
    u_xlat0.x = (-u_xlat15) * 10.0 + vs_TEXCOORD0.x;
    u_xlat10_4 = texture(_MainTex, u_xlat0.xy);
    u_xlat4 = u_xlat10_4 * vs_COLOR0;
    u_xlat0.x = (-u_xlat1.w) * 5.0 + u_xlat1.z;
    u_xlat2.w = u_xlat1.y * 0.0625 + (-u_xlat1.x);
    u_xlat5.x = dot(u_xlat2.xw, vec2(12.9898005, 78.2330017));
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * 43758.5469;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.800000012;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = u_xlat5.x + 0.800000012;
    u_xlat1.xyz = u_xlat0.xxx * vec3(0.0833333358, 0.0833333358, 0.03125);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(12.0, 12.0, 32.0);
    u_xlat1.xyz = floor(u_xlat1.xyz);
    u_xlati1.xyz = ivec3(u_xlat1.xyz);
    u_xlatb1.xyz = equal(u_xlati1.xyzx, ivec4(5, 8, 4, 0)).xyz;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat10 : u_xlat4.w;
    u_xlat15 = u_xlat0.x + -0.100000001;
    u_xlat2.w = u_xlat0.x * 0.5;
    u_xlatb0 = u_xlat15<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat3.xyw = u_xlat3.yyy * u_xlat4.xyz;
    u_xlat1.xzw = (u_xlatb1.x) ? u_xlat3.xyw : u_xlat4.xyz;
    u_xlat3.xyz = u_xlat3.zzz * u_xlat1.xzw;
    u_xlat1.xyz = (u_xlatb1.y) ? u_xlat3.xyz : u_xlat1.xzw;
    u_xlat0.x = (-u_xlat5.x) + 1.0;
    u_xlat0.x = u_xlat10 * u_xlat0.x + u_xlat5.x;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat0.xxx + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat1.xyz + u_xlat5.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.x = u_xlat0.x * 0.800000012 + 0.649999976;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat3 = vec4(_IsGreen) * vec4(15.0, 1.50999999, 151.259995, -151.75) + vec4(5.0, 0.99000001, 1.99000001, 153.25);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.xyz = u_xlat3.yzw * u_xlat0.xxx;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5);
    u_xlatb0 = _IsGreen<0.0;
    u_xlat1.w = 1.0;
    SV_Target0 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 138
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %41 %81 %113 %123 %124 %128 %130 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %41 Location 41 
                                                      OpDecorate %81 Location 81 
                                                      OpMemberDecorate %111 0 BuiltIn 111 
                                                      OpMemberDecorate %111 1 BuiltIn 111 
                                                      OpMemberDecorate %111 2 BuiltIn 111 
                                                      OpDecorate %111 Block 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %130 Location 130 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %12 %13 %6 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4[4]; f32_4[4]; f32; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 3 
                                              %19 = OpTypePointer Uniform %6 
                                          i32 %22 = OpConstant 2 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                          f32 %31 = OpConstant 3.67402E-40 
                                 Private f32* %34 = OpVariable Private 
                                          f32 %38 = OpConstant 3.67402E-40 
                                              %40 = OpTypePointer Input %7 
                                 Input f32_4* %41 = OpVariable Input 
                                          u32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Input %6 
                                          i32 %54 = OpConstant 0 
                                          i32 %55 = OpConstant 1 
                                              %56 = OpTypePointer Uniform %7 
                               Private f32_4* %74 = OpVariable Private 
                                              %79 = OpTypeVector %6 3 
                                              %80 = OpTypePointer Output %79 
                                Output f32_3* %81 = OpVariable Output 
                                             %110 = OpTypeArray %6 %42 
                                             %111 = OpTypeStruct %7 %6 %110 
                                             %112 = OpTypePointer Output %111 
        Output struct {f32_4; f32; f32[1];}* %113 = OpVariable Output 
                                             %121 = OpTypePointer Output %7 
                               Output f32_4* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                             %129 = OpTypePointer Input %126 
                                Input f32_2* %130 = OpVariable Input 
                                             %132 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                 Uniform f32* %23 = OpAccessChain %16 %22 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFMul %21 %24 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                                      OpStore %28 %25 
                                 Private f32* %29 = OpAccessChain %9 %26 
                                          f32 %30 = OpLoad %29 
                                          f32 %32 = OpFMul %30 %31 
                                 Private f32* %33 = OpAccessChain %9 %26 
                                                      OpStore %33 %32 
                                 Uniform f32* %35 = OpAccessChain %16 %22 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %39 = OpFAdd %37 %38 
                                                      OpStore %34 %39 
                                   Input f32* %44 = OpAccessChain %41 %42 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpLoad %34 
                                          f32 %47 = OpFMul %45 %46 
                                 Private f32* %48 = OpAccessChain %9 %26 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %9 %26 
                                                      OpStore %51 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
                               Uniform f32_4* %57 = OpAccessChain %16 %54 %55 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFMul %53 %58 
                                                      OpStore %9 %59 
                               Uniform f32_4* %60 = OpAccessChain %16 %54 %54 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpLoad %41 
                                        f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpFAdd %64 %65 
                                                      OpStore %9 %66 
                               Uniform f32_4* %67 = OpAccessChain %16 %54 %22 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpLoad %41 
                                        f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                        f32_4 %71 = OpFMul %68 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpFAdd %71 %72 
                                                      OpStore %9 %73 
                                        f32_4 %75 = OpLoad %9 
                               Uniform f32_4* %76 = OpAccessChain %16 %54 %18 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpFAdd %75 %77 
                                                      OpStore %74 %78 
                               Uniform f32_4* %82 = OpAccessChain %16 %54 %18 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_4 %85 = OpLoad %41 
                                        f32_3 %86 = OpVectorShuffle %85 %85 3 3 3 
                                        f32_3 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFAdd %87 %89 
                                                      OpStore %81 %90 
                                        f32_4 %91 = OpLoad %74 
                                        f32_4 %92 = OpVectorShuffle %91 %91 1 1 1 1 
                               Uniform f32_4* %93 = OpAccessChain %16 %55 %55 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpFMul %92 %94 
                                                      OpStore %9 %95 
                               Uniform f32_4* %96 = OpAccessChain %16 %55 %54 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %74 
                                        f32_4 %99 = OpVectorShuffle %98 %98 0 0 0 0 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %9 %102 
                              Uniform f32_4* %103 = OpAccessChain %16 %55 %22 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %74 
                                       f32_4 %106 = OpVectorShuffle %105 %105 2 2 2 2 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpFAdd %107 %108 
                                                      OpStore %9 %109 
                              Uniform f32_4* %114 = OpAccessChain %16 %55 %18 
                                       f32_4 %115 = OpLoad %114 
                                       f32_4 %116 = OpLoad %74 
                                       f32_4 %117 = OpVectorShuffle %116 %116 3 3 3 3 
                                       f32_4 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpFAdd %118 %119 
                               Output f32_4* %122 = OpAccessChain %113 %54 
                                                      OpStore %122 %120 
                                       f32_4 %125 = OpLoad %124 
                                                      OpStore %123 %125 
                                       f32_2 %131 = OpLoad %130 
                                                      OpStore %128 %131 
                                 Output f32* %133 = OpAccessChain %113 %54 %42 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                 Output f32* %136 = OpAccessChain %113 %54 %42 
                                                      OpStore %136 %135 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 413
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %12 %24 %124 %389 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %12 Location 12 
                                                     OpDecorate %24 Location 24 
                                                     OpMemberDecorate %47 0 Offset 47 
                                                     OpMemberDecorate %47 1 Offset 47 
                                                     OpMemberDecorate %47 2 RelaxedPrecision 
                                                     OpMemberDecorate %47 2 Offset 47 
                                                     OpMemberDecorate %47 3 Offset 47 
                                                     OpDecorate %47 Block 
                                                     OpDecorate %49 DescriptorSet 49 
                                                     OpDecorate %49 Binding 49 
                                                     OpDecorate %112 RelaxedPrecision 
                                                     OpDecorate %116 RelaxedPrecision 
                                                     OpDecorate %116 DescriptorSet 116 
                                                     OpDecorate %116 Binding 116 
                                                     OpDecorate %117 RelaxedPrecision 
                                                     OpDecorate %121 RelaxedPrecision 
                                                     OpDecorate %122 RelaxedPrecision 
                                                     OpDecorate %124 RelaxedPrecision 
                                                     OpDecorate %124 Location 124 
                                                     OpDecorate %125 RelaxedPrecision 
                                                     OpDecorate %126 RelaxedPrecision 
                                                     OpDecorate %225 RelaxedPrecision 
                                                     OpDecorate %235 RelaxedPrecision 
                                                     OpDecorate %237 RelaxedPrecision 
                                                     OpDecorate %238 RelaxedPrecision 
                                                     OpDecorate %240 RelaxedPrecision 
                                                     OpDecorate %242 RelaxedPrecision 
                                                     OpDecorate %244 RelaxedPrecision 
                                                     OpDecorate %248 RelaxedPrecision 
                                                     OpDecorate %260 RelaxedPrecision 
                                                     OpDecorate %261 RelaxedPrecision 
                                                     OpDecorate %274 RelaxedPrecision 
                                                     OpDecorate %275 RelaxedPrecision 
                                                     OpDecorate %279 RelaxedPrecision 
                                                     OpDecorate %291 RelaxedPrecision 
                                                     OpDecorate %308 RelaxedPrecision 
                                                     OpDecorate %310 RelaxedPrecision 
                                                     OpDecorate %311 RelaxedPrecision 
                                                     OpDecorate %317 RelaxedPrecision 
                                                     OpDecorate %318 RelaxedPrecision 
                                                     OpDecorate %321 RelaxedPrecision 
                                                     OpDecorate %322 RelaxedPrecision 
                                                     OpDecorate %323 RelaxedPrecision 
                                                     OpDecorate %324 RelaxedPrecision 
                                                     OpDecorate %327 RelaxedPrecision 
                                                     OpDecorate %328 RelaxedPrecision 
                                                     OpDecorate %330 RelaxedPrecision 
                                                     OpDecorate %331 RelaxedPrecision 
                                                     OpDecorate %336 RelaxedPrecision 
                                                     OpDecorate %338 RelaxedPrecision 
                                                     OpDecorate %340 RelaxedPrecision 
                                                     OpDecorate %341 RelaxedPrecision 
                                                     OpDecorate %343 RelaxedPrecision 
                                                     OpDecorate %344 RelaxedPrecision 
                                                     OpDecorate %345 RelaxedPrecision 
                                                     OpDecorate %346 RelaxedPrecision 
                                                     OpDecorate %347 RelaxedPrecision 
                                                     OpDecorate %348 RelaxedPrecision 
                                                     OpDecorate %363 RelaxedPrecision 
                                                     OpDecorate %389 RelaxedPrecision 
                                                     OpDecorate %389 Location 389 
                                                     OpDecorate %394 RelaxedPrecision 
                                                     OpDecorate %406 RelaxedPrecision 
                                                     OpDecorate %408 RelaxedPrecision 
                                                     OpDecorate %409 RelaxedPrecision 
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
                                             %18 = OpTypePointer Private %6 
                                             %20 = OpTypeVector %6 4 
                                             %21 = OpTypePointer Private %20 
                              Private f32_4* %22 = OpVariable Private 
                                             %23 = OpTypePointer Input %7 
                                Input f32_3* %24 = OpVariable Input 
                                         f32 %27 = OpConstant 3.67402E-40 
                                       f32_3 %28 = OpConstantComposite %27 %27 %27 
                              Private f32_4* %37 = OpVariable Private 
                                         f32 %40 = OpConstant 3.67402E-40 
                                         f32 %41 = OpConstant 3.67402E-40 
                                       f32_2 %42 = OpConstantComposite %40 %41 
                                Private f32* %46 = OpVariable Private 
                                             %47 = OpTypeStruct %20 %20 %20 %6 
                                             %48 = OpTypePointer Uniform %47 
 Uniform struct {f32_4; f32_4; f32_4; f32;}* %49 = OpVariable Uniform 
                                             %50 = OpTypeInt 32 1 
                                         i32 %51 = OpConstant 3 
                                             %52 = OpTypePointer Uniform %6 
                                         f32 %57 = OpConstant 3.67402E-40 
                                         f32 %58 = OpConstant 3.67402E-40 
                              Private f32_3* %60 = OpVariable Private 
                                         f32 %63 = OpConstant 3.67402E-40 
                                         f32 %64 = OpConstant 3.67402E-40 
                                       f32_3 %65 = OpConstantComposite %63 %64 %63 
                                         f32 %67 = OpConstant 3.67402E-40 
                                         f32 %68 = OpConstant 3.67402E-40 
                                       f32_3 %69 = OpConstantComposite %58 %67 %68 
                                         i32 %73 = OpConstant 0 
                                             %74 = OpTypePointer Uniform %20 
                                Private f32* %81 = OpVariable Private 
                                         u32 %82 = OpConstant 3 
                                         f32 %85 = OpConstant 3.67402E-40 
                                         u32 %87 = OpConstant 2 
                                         f32 %94 = OpConstant 3.67402E-40 
                                         i32 %99 = OpConstant 1 
                                        u32 %100 = OpConstant 0 
                                        f32 %106 = OpConstant 3.67402E-40 
                             Private f32_4* %112 = OpVariable Private 
                                            %113 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %114 = OpTypeSampledImage %113 
                                            %115 = OpTypePointer UniformConstant %114 
UniformConstant read_only Texture2DSampled* %116 = OpVariable UniformConstant 
                             Private f32_4* %121 = OpVariable Private 
                                            %123 = OpTypePointer Input %20 
                               Input f32_4* %124 = OpVariable Input 
                                        f32 %130 = OpConstant 3.67402E-40 
                             Private f32_3* %144 = OpVariable Private 
                                        f32 %147 = OpConstant 3.67402E-40 
                                        f32 %148 = OpConstant 3.67402E-40 
                                      f32_2 %149 = OpConstantComposite %147 %148 
                                        f32 %158 = OpConstant 3.67402E-40 
                                        f32 %167 = OpConstant 3.67402E-40 
                                        f32 %176 = OpConstant 3.67402E-40 
                                        f32 %181 = OpConstant 3.67402E-40 
                                        f32 %182 = OpConstant 3.67402E-40 
                                      f32_3 %183 = OpConstantComposite %181 %181 %182 
                                        f32 %194 = OpConstant 3.67402E-40 
                                        f32 %195 = OpConstant 3.67402E-40 
                                      f32_3 %196 = OpConstantComposite %194 %194 %195 
                                            %205 = OpTypeVector %50 3 
                                            %206 = OpTypePointer Private %205 
                             Private i32_3* %207 = OpVariable Private 
                                            %211 = OpTypeBool 
                                            %212 = OpTypeVector %211 3 
                                            %213 = OpTypePointer Private %212 
                            Private bool_3* %214 = OpVariable Private 
                                            %215 = OpTypeVector %50 4 
                                        i32 %218 = OpConstant 5 
                                        i32 %219 = OpConstant 8 
                                        i32 %220 = OpConstant 4 
                                      i32_4 %221 = OpConstantComposite %218 %219 %220 %73 
                                            %222 = OpTypeVector %211 4 
                               Private f32* %225 = OpVariable Private 
                                            %226 = OpTypePointer Function %6 
                             Private f32_3* %237 = OpVariable Private 
                                        f32 %239 = OpConstant 3.67402E-40 
                                        f32 %243 = OpConstant 3.67402E-40 
                                            %245 = OpTypePointer Private %211 
                              Private bool* %246 = OpVariable Private 
                                        i32 %252 = OpConstant -1 
                                            %265 = OpTypePointer Function %7 
                                        i32 %315 = OpConstant 2 
                             Private f32_3* %327 = OpVariable Private 
                                      f32_3 %329 = OpConstantComposite %176 %176 %176 
                                        f32 %332 = OpConstant 3.67402E-40 
                                        f32 %333 = OpConstant 3.67402E-40 
                                        f32 %334 = OpConstant 3.67402E-40 
                                      f32_3 %335 = OpConstantComposite %332 %333 %334 
                               Private f32* %338 = OpVariable Private 
                                        f32 %342 = OpConstant 3.67402E-40 
                                        f32 %352 = OpConstant 3.67402E-40 
                                        f32 %353 = OpConstant 3.67402E-40 
                                        f32 %354 = OpConstant 3.67402E-40 
                                        f32 %355 = OpConstant 3.67402E-40 
                                      f32_4 %356 = OpConstantComposite %352 %353 %354 %355 
                                        f32 %358 = OpConstant 3.67402E-40 
                                        f32 %359 = OpConstant 3.67402E-40 
                                        f32 %360 = OpConstant 3.67402E-40 
                                      f32_4 %361 = OpConstantComposite %130 %358 %359 %360 
                                      f32_3 %382 = OpConstantComposite %243 %243 %243 
                              Private bool* %384 = OpVariable Private 
                                            %388 = OpTypePointer Output %20 
                              Output f32_4* %389 = OpVariable Output 
                                            %410 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %227 = OpVariable Function 
                            Function f32_3* %266 = OpVariable Function 
                            Function f32_3* %283 = OpVariable Function 
                            Function f32_3* %390 = OpVariable Function 
                              Function f32* %401 = OpVariable Function 
                                  Input f32* %16 = OpAccessChain %12 %14 
                                         f32 %17 = OpLoad %16 
                                Private f32* %19 = OpAccessChain %9 %14 
                                                     OpStore %19 %17 
                                       f32_3 %25 = OpLoad %24 
                                       f32_3 %26 = OpVectorShuffle %25 %25 0 1 1 
                                       f32_3 %29 = OpFMul %26 %28 
                                       f32_4 %30 = OpLoad %22 
                                       f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                     OpStore %22 %31 
                                       f32_4 %32 = OpLoad %22 
                                       f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                       f32_3 %34 = OpExtInst %1 8 %33 
                                       f32_4 %35 = OpLoad %22 
                                       f32_4 %36 = OpVectorShuffle %35 %34 4 5 6 3 
                                                     OpStore %22 %36 
                                       f32_4 %38 = OpLoad %22 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 2 
                                       f32_2 %43 = OpFMul %39 %42 
                                       f32_4 %44 = OpLoad %37 
                                       f32_4 %45 = OpVectorShuffle %44 %43 4 1 5 3 
                                                     OpStore %37 %45 
                                Uniform f32* %53 = OpAccessChain %49 %51 
                                         f32 %54 = OpLoad %53 
                                         f32 %55 = OpFNegate %54 
                                                     OpStore %46 %55 
                                         f32 %56 = OpLoad %46 
                                         f32 %59 = OpExtInst %1 43 %56 %57 %58 
                                                     OpStore %46 %59 
                                         f32 %61 = OpLoad %46 
                                       f32_3 %62 = OpCompositeConstruct %61 %61 %61 
                                       f32_3 %66 = OpFMul %62 %65 
                                       f32_3 %70 = OpFAdd %66 %69 
                                                     OpStore %60 %70 
                                       f32_3 %71 = OpLoad %60 
                                       f32_2 %72 = OpVectorShuffle %71 %71 0 0 
                              Uniform f32_4* %75 = OpAccessChain %49 %73 
                                       f32_4 %76 = OpLoad %75 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 2 
                                       f32_2 %78 = OpFMul %72 %77 
                                       f32_4 %79 = OpLoad %22 
                                       f32_4 %80 = OpVectorShuffle %79 %78 4 1 2 5 
                                                     OpStore %22 %80 
                                Private f32* %83 = OpAccessChain %22 %82 
                                         f32 %84 = OpLoad %83 
                                         f32 %86 = OpFMul %84 %85 
                                Private f32* %88 = OpAccessChain %37 %87 
                                         f32 %89 = OpLoad %88 
                                         f32 %90 = OpFAdd %86 %89 
                                                     OpStore %81 %90 
                                         f32 %91 = OpLoad %81 
                                         f32 %92 = OpExtInst %1 13 %91 
                                                     OpStore %81 %92 
                                         f32 %93 = OpLoad %81 
                                         f32 %95 = OpFAdd %93 %94 
                                                     OpStore %81 %95 
                                         f32 %96 = OpLoad %81 
                                         f32 %97 = OpExtInst %1 40 %96 %57 
                                                     OpStore %81 %97 
                                         f32 %98 = OpLoad %81 
                               Uniform f32* %101 = OpAccessChain %49 %99 %100 
                                        f32 %102 = OpLoad %101 
                                        f32 %103 = OpFMul %98 %102 
                                                     OpStore %81 %103 
                                        f32 %104 = OpLoad %81 
                                        f32 %105 = OpFNegate %104 
                                        f32 %107 = OpFMul %105 %106 
                                 Input f32* %108 = OpAccessChain %12 %100 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFAdd %107 %109 
                               Private f32* %111 = OpAccessChain %9 %100 
                                                     OpStore %111 %110 
                 read_only Texture2DSampled %117 = OpLoad %116 
                                      f32_3 %118 = OpLoad %9 
                                      f32_2 %119 = OpVectorShuffle %118 %118 0 1 
                                      f32_4 %120 = OpImageSampleImplicitLod %117 %119 
                                                     OpStore %112 %120 
                                      f32_4 %122 = OpLoad %112 
                                      f32_4 %125 = OpLoad %124 
                                      f32_4 %126 = OpFMul %122 %125 
                                                     OpStore %121 %126 
                               Private f32* %127 = OpAccessChain %22 %82 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpFNegate %128 
                                        f32 %131 = OpFMul %129 %130 
                               Private f32* %132 = OpAccessChain %22 %87 
                                        f32 %133 = OpLoad %132 
                                        f32 %134 = OpFAdd %131 %133 
                               Private f32* %135 = OpAccessChain %9 %100 
                                                     OpStore %135 %134 
                               Private f32* %136 = OpAccessChain %22 %14 
                                        f32 %137 = OpLoad %136 
                                        f32 %138 = OpFMul %137 %40 
                               Private f32* %139 = OpAccessChain %22 %100 
                                        f32 %140 = OpLoad %139 
                                        f32 %141 = OpFNegate %140 
                                        f32 %142 = OpFAdd %138 %141 
                               Private f32* %143 = OpAccessChain %37 %82 
                                                     OpStore %143 %142 
                                      f32_4 %145 = OpLoad %37 
                                      f32_2 %146 = OpVectorShuffle %145 %145 0 3 
                                        f32 %150 = OpDot %146 %149 
                               Private f32* %151 = OpAccessChain %144 %100 
                                                     OpStore %151 %150 
                               Private f32* %152 = OpAccessChain %144 %100 
                                        f32 %153 = OpLoad %152 
                                        f32 %154 = OpExtInst %1 13 %153 
                               Private f32* %155 = OpAccessChain %144 %100 
                                                     OpStore %155 %154 
                               Private f32* %156 = OpAccessChain %144 %100 
                                        f32 %157 = OpLoad %156 
                                        f32 %159 = OpFMul %157 %158 
                               Private f32* %160 = OpAccessChain %144 %100 
                                                     OpStore %160 %159 
                               Private f32* %161 = OpAccessChain %144 %100 
                                        f32 %162 = OpLoad %161 
                                        f32 %163 = OpExtInst %1 10 %162 
                               Private f32* %164 = OpAccessChain %144 %100 
                                                     OpStore %164 %163 
                               Private f32* %165 = OpAccessChain %144 %100 
                                        f32 %166 = OpLoad %165 
                                        f32 %168 = OpFAdd %166 %167 
                               Private f32* %169 = OpAccessChain %144 %100 
                                                     OpStore %169 %168 
                               Private f32* %170 = OpAccessChain %144 %100 
                                        f32 %171 = OpLoad %170 
                                        f32 %172 = OpExtInst %1 40 %171 %57 
                               Private f32* %173 = OpAccessChain %144 %100 
                                                     OpStore %173 %172 
                               Private f32* %174 = OpAccessChain %144 %100 
                                        f32 %175 = OpLoad %174 
                                        f32 %177 = OpFAdd %175 %176 
                               Private f32* %178 = OpAccessChain %144 %100 
                                                     OpStore %178 %177 
                                      f32_3 %179 = OpLoad %9 
                                      f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                                      f32_3 %184 = OpFMul %180 %183 
                                      f32_4 %185 = OpLoad %22 
                                      f32_4 %186 = OpVectorShuffle %185 %184 4 5 6 3 
                                                     OpStore %22 %186 
                                      f32_4 %187 = OpLoad %22 
                                      f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                      f32_3 %189 = OpExtInst %1 10 %188 
                                      f32_4 %190 = OpLoad %22 
                                      f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                     OpStore %22 %191 
                                      f32_4 %192 = OpLoad %22 
                                      f32_3 %193 = OpVectorShuffle %192 %192 0 1 2 
                                      f32_3 %197 = OpFMul %193 %196 
                                      f32_4 %198 = OpLoad %22 
                                      f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                     OpStore %22 %199 
                                      f32_4 %200 = OpLoad %22 
                                      f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                                      f32_3 %202 = OpExtInst %1 8 %201 
                                      f32_4 %203 = OpLoad %22 
                                      f32_4 %204 = OpVectorShuffle %203 %202 4 5 6 3 
                                                     OpStore %22 %204 
                                      f32_4 %208 = OpLoad %22 
                                      f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                      i32_3 %210 = OpConvertFToS %209 
                                                     OpStore %207 %210 
                                      i32_3 %216 = OpLoad %207 
                                      i32_4 %217 = OpVectorShuffle %216 %216 0 1 2 0 
                                     bool_4 %223 = OpIEqual %217 %221 
                                     bool_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                                     OpStore %214 %224 
                                     bool_3 %228 = OpLoad %214 
                                       bool %229 = OpCompositeExtract %228 2 
                                                     OpSelectionMerge %231 None 
                                                     OpBranchConditional %229 %230 %233 
                                            %230 = OpLabel 
                                        f32 %232 = OpLoad %46 
                                                     OpStore %227 %232 
                                                     OpBranch %231 
                                            %233 = OpLabel 
                               Private f32* %234 = OpAccessChain %121 %82 
                                        f32 %235 = OpLoad %234 
                                                     OpStore %227 %235 
                                                     OpBranch %231 
                                            %231 = OpLabel 
                                        f32 %236 = OpLoad %227 
                                                     OpStore %225 %236 
                                        f32 %238 = OpLoad %225 
                                        f32 %240 = OpFAdd %238 %239 
                               Private f32* %241 = OpAccessChain %237 %100 
                                                     OpStore %241 %240 
                                        f32 %242 = OpLoad %225 
                                        f32 %244 = OpFMul %242 %243 
                                                     OpStore %225 %244 
                               Private f32* %247 = OpAccessChain %237 %100 
                                        f32 %248 = OpLoad %247 
                                       bool %249 = OpFOrdLessThan %248 %57 
                                                     OpStore %246 %249 
                                       bool %250 = OpLoad %246 
                                        i32 %251 = OpSelect %250 %99 %73 
                                        i32 %253 = OpIMul %251 %252 
                                       bool %254 = OpINotEqual %253 %73 
                                                     OpSelectionMerge %256 None 
                                                     OpBranchConditional %254 %255 %256 
                                            %255 = OpLabel 
                                                     OpKill
                                            %256 = OpLabel 
                                      f32_3 %258 = OpLoad %60 
                                      f32_3 %259 = OpVectorShuffle %258 %258 1 1 1 
                                      f32_4 %260 = OpLoad %121 
                                      f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                      f32_3 %262 = OpFMul %259 %261 
                                      f32_4 %263 = OpLoad %37 
                                      f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                     OpStore %37 %264 
                                     bool_3 %267 = OpLoad %214 
                                       bool %268 = OpCompositeExtract %267 0 
                                                     OpSelectionMerge %270 None 
                                                     OpBranchConditional %268 %269 %273 
                                            %269 = OpLabel 
                                      f32_4 %271 = OpLoad %37 
                                      f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                                     OpStore %266 %272 
                                                     OpBranch %270 
                                            %273 = OpLabel 
                                      f32_4 %274 = OpLoad %121 
                                      f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                                     OpStore %266 %275 
                                                     OpBranch %270 
                                            %270 = OpLabel 
                                      f32_3 %276 = OpLoad %266 
                                                     OpStore %237 %276 
                                      f32_3 %277 = OpLoad %60 
                                      f32_3 %278 = OpVectorShuffle %277 %277 2 2 2 
                                      f32_3 %279 = OpLoad %237 
                                      f32_3 %280 = OpFMul %278 %279 
                                      f32_4 %281 = OpLoad %22 
                                      f32_4 %282 = OpVectorShuffle %281 %280 4 1 5 6 
                                                     OpStore %22 %282 
                                     bool_3 %284 = OpLoad %214 
                                       bool %285 = OpCompositeExtract %284 1 
                                                     OpSelectionMerge %287 None 
                                                     OpBranchConditional %285 %286 %290 
                                            %286 = OpLabel 
                                      f32_4 %288 = OpLoad %22 
                                      f32_3 %289 = OpVectorShuffle %288 %288 0 2 3 
                                                     OpStore %283 %289 
                                                     OpBranch %287 
                                            %290 = OpLabel 
                                      f32_3 %291 = OpLoad %237 
                                                     OpStore %283 %291 
                                                     OpBranch %287 
                                            %287 = OpLabel 
                                      f32_3 %292 = OpLoad %283 
                                                     OpStore %237 %292 
                               Private f32* %293 = OpAccessChain %144 %100 
                                        f32 %294 = OpLoad %293 
                                        f32 %295 = OpFNegate %294 
                                        f32 %296 = OpFAdd %295 %58 
                               Private f32* %297 = OpAccessChain %9 %100 
                                                     OpStore %297 %296 
                                        f32 %298 = OpLoad %46 
                               Private f32* %299 = OpAccessChain %9 %100 
                                        f32 %300 = OpLoad %299 
                                        f32 %301 = OpFMul %298 %300 
                               Private f32* %302 = OpAccessChain %144 %100 
                                        f32 %303 = OpLoad %302 
                                        f32 %304 = OpFAdd %301 %303 
                               Private f32* %305 = OpAccessChain %9 %100 
                                                     OpStore %305 %304 
                                      f32_3 %306 = OpLoad %9 
                                      f32_3 %307 = OpVectorShuffle %306 %306 0 0 0 
                                      f32_3 %308 = OpLoad %237 
                                      f32_3 %309 = OpFMul %307 %308 
                                                     OpStore %144 %309 
                                      f32_3 %310 = OpLoad %237 
                                      f32_3 %311 = OpFNegate %310 
                                      f32_3 %312 = OpLoad %9 
                                      f32_3 %313 = OpVectorShuffle %312 %312 0 0 0 
                                      f32_3 %314 = OpFMul %311 %313 
                             Uniform f32_4* %316 = OpAccessChain %49 %315 
                                      f32_4 %317 = OpLoad %316 
                                      f32_3 %318 = OpVectorShuffle %317 %317 0 1 2 
                                      f32_3 %319 = OpFAdd %314 %318 
                                                     OpStore %237 %319 
                             Uniform f32_4* %320 = OpAccessChain %49 %315 
                                      f32_4 %321 = OpLoad %320 
                                      f32_3 %322 = OpVectorShuffle %321 %321 3 3 3 
                                      f32_3 %323 = OpLoad %237 
                                      f32_3 %324 = OpFMul %322 %323 
                                      f32_3 %325 = OpLoad %144 
                                      f32_3 %326 = OpFAdd %324 %325 
                                                     OpStore %237 %326 
                                      f32_3 %328 = OpLoad %237 
                                      f32_3 %330 = OpFMul %328 %329 
                                                     OpStore %327 %330 
                                      f32_3 %331 = OpLoad %237 
                                        f32 %336 = OpDot %331 %335 
                               Private f32* %337 = OpAccessChain %237 %100 
                                                     OpStore %337 %336 
                               Private f32* %339 = OpAccessChain %237 %100 
                                        f32 %340 = OpLoad %339 
                                        f32 %341 = OpFMul %340 %176 
                                        f32 %343 = OpFAdd %341 %342 
                                                     OpStore %338 %343 
                                        f32 %344 = OpLoad %338 
                                        f32 %345 = OpExtInst %1 30 %344 
                                                     OpStore %338 %345 
                                      f32_3 %346 = OpLoad %327 
                                      f32_3 %347 = OpLoad %327 
                                      f32_3 %348 = OpFMul %346 %347 
                                                     OpStore %237 %348 
                               Uniform f32* %349 = OpAccessChain %49 %51 
                                        f32 %350 = OpLoad %349 
                                      f32_4 %351 = OpCompositeConstruct %350 %350 %350 %350 
                                      f32_4 %357 = OpFMul %351 %356 
                                      f32_4 %362 = OpFAdd %357 %361 
                                                     OpStore %22 %362 
                                        f32 %363 = OpLoad %338 
                               Private f32* %364 = OpAccessChain %22 %100 
                                        f32 %365 = OpLoad %364 
                                        f32 %366 = OpFMul %363 %365 
                               Private f32* %367 = OpAccessChain %9 %100 
                                                     OpStore %367 %366 
                               Private f32* %368 = OpAccessChain %9 %100 
                                        f32 %369 = OpLoad %368 
                                        f32 %370 = OpExtInst %1 29 %369 
                               Private f32* %371 = OpAccessChain %9 %100 
                                                     OpStore %371 %370 
                               Private f32* %372 = OpAccessChain %9 %100 
                                        f32 %373 = OpLoad %372 
                                        f32 %374 = OpExtInst %1 37 %373 %58 
                               Private f32* %375 = OpAccessChain %9 %100 
                                                     OpStore %375 %374 
                                      f32_4 %376 = OpLoad %22 
                                      f32_3 %377 = OpVectorShuffle %376 %376 1 2 3 
                                      f32_3 %378 = OpLoad %9 
                                      f32_3 %379 = OpVectorShuffle %378 %378 0 0 0 
                                      f32_3 %380 = OpFMul %377 %379 
                                                     OpStore %9 %380 
                                      f32_3 %381 = OpLoad %9 
                                      f32_3 %383 = OpFMul %381 %382 
                                                     OpStore %9 %383 
                               Uniform f32* %385 = OpAccessChain %49 %51 
                                        f32 %386 = OpLoad %385 
                                       bool %387 = OpFOrdLessThan %386 %57 
                                                     OpStore %384 %387 
                                       bool %391 = OpLoad %384 
                                                     OpSelectionMerge %393 None 
                                                     OpBranchConditional %391 %392 %395 
                                            %392 = OpLabel 
                                      f32_3 %394 = OpLoad %237 
                                                     OpStore %390 %394 
                                                     OpBranch %393 
                                            %395 = OpLabel 
                                      f32_3 %396 = OpLoad %9 
                                                     OpStore %390 %396 
                                                     OpBranch %393 
                                            %393 = OpLabel 
                                      f32_3 %397 = OpLoad %390 
                                      f32_4 %398 = OpLoad %389 
                                      f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                     OpStore %389 %399 
                               Private f32* %400 = OpAccessChain %237 %100 
                                                     OpStore %400 %58 
                                       bool %402 = OpLoad %384 
                                                     OpSelectionMerge %404 None 
                                                     OpBranchConditional %402 %403 %407 
                                            %403 = OpLabel 
                               Private f32* %405 = OpAccessChain %237 %100 
                                        f32 %406 = OpLoad %405 
                                                     OpStore %401 %406 
                                                     OpBranch %404 
                                            %407 = OpLabel 
                                        f32 %408 = OpLoad %225 
                                                     OpStore %401 %408 
                                                     OpBranch %404 
                                            %404 = OpLabel 
                                        f32 %409 = OpLoad %401 
                                Output f32* %411 = OpAccessChain %389 %82 
                                                     OpStore %411 %409 
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