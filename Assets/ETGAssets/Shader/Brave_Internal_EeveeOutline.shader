//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/EeveeOutline" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_LuminanceCutoff ("Luminance Cutoff", Float) = 0
_AtlasData ("Atlas Data", Vector) = (1,1,1,1)
_MaterialSourceIsSinglePassOutline ("Single Pass Outline", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Offset 0.125, -1
  Fog {
   Mode Off
  }
  GpuProgramID 50317
Program "vp" {
SubProgram "d3d11 " {
Keywords { "OUTLINE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _AtlasData;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec3 in_NORMAL0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_NORMAL0.xy * _AtlasData.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0625, 0.0625);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = (-in_NORMAL0.xy) + in_NORMAL0.yx;
    u_xlat0.xy = _AtlasData.zw * u_xlat0.xy + in_NORMAL0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_TexelSize.xy + in_TEXCOORD0.xy;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _OverrideColor;
uniform 	float _LuminanceCutoff;
uniform 	float _ReflectionYFactor;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat16_4;
vec2 u_xlat8;
float u_xlat16_8;
bool u_xlatb8;
vec2 u_xlat10;
void main()
{
    u_xlat0.x = (-_ReflectionYFactor) + 1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.y = _MainTex_TexelSize.y;
    u_xlat0.x = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy / _MainTex_TexelSize.xy;
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat0.xy = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat10_2.w * u_xlat16_0;
    u_xlat8.y = (-_MainTex_TexelSize.y);
    u_xlat4.xy = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat8.xy;
    u_xlat10_3 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_3.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat10_2.w, u_xlat10_3.w);
    u_xlat16_0 = max(u_xlat16_4, u_xlat16_0);
    u_xlat10.x = (-_MainTex_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat4.xz = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat10.xy;
    u_xlat10_3 = texture(_MainTex, u_xlat4.xz);
    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_3.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat16_8, u_xlat10_3.w);
    u_xlat16_0 = max(u_xlat16_0, u_xlat16_4);
    u_xlat2.x = _MainTex_TexelSize.x;
    u_xlat4.xz = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat2.xy;
    u_xlat10_1 = texture(_MainTex, u_xlat4.xz);
    u_xlat16_4 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_1.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat16_8, u_xlat10_1.w);
    u_xlat8.x = u_xlat16_8 + -0.100000001;
    u_xlatb8 = u_xlat8.x<0.0;
    u_xlat0.x = max(u_xlat16_0, u_xlat16_4);
    u_xlatb0 = u_xlat0.x<_LuminanceCutoff;
    u_xlatb0 = u_xlatb8 || u_xlatb0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.xyz = _OverrideColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "OUTLINE_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %46 %102 %112 %113 %135 %143 %147 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %100 0 BuiltIn 100 
                                                      OpMemberDecorate %100 1 BuiltIn 100 
                                                      OpMemberDecorate %100 2 BuiltIn 100 
                                                      OpDecorate %100 Block 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %18 %19 %7 %7 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                                          f32 %39 = OpConstant 3.67402E-40 
                                          u32 %40 = OpConstant 2 
                                              %41 = OpTypePointer Private %6 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                          i32 %67 = OpConstant 2 
                                          u32 %98 = OpConstant 1 
                                              %99 = OpTypeArray %6 %98 
                                             %100 = OpTypeStruct %7 %6 %99 
                                             %101 = OpTypePointer Output %100 
        Output struct {f32_4; f32; f32[1];}* %102 = OpVariable Output 
                                             %110 = OpTypePointer Output %7 
                               Output f32_4* %112 = OpVariable Output 
                                Input f32_4* %113 = OpVariable Input 
                                             %134 = OpTypePointer Output %13 
                               Output f32_2* %135 = OpVariable Output 
                                             %142 = OpTypePointer Input %13 
                                Input f32_2* %143 = OpVariable Input 
                                             %146 = OpTypePointer Output %10 
                               Output f32_3* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                                 Private f32* %42 = OpAccessChain %9 %40 
                                                      OpStore %42 %39 
                                        f32_4 %43 = OpLoad %9 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %44 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %9 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 1 1 1 1 
                               Uniform f32_4* %57 = OpAccessChain %22 %55 %56 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFMul %54 %58 
                                                      OpStore %52 %59 
                               Uniform f32_4* %60 = OpAccessChain %22 %55 %55 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %52 
                                        f32_4 %66 = OpFAdd %64 %65 
                                                      OpStore %52 %66 
                               Uniform f32_4* %68 = OpAccessChain %22 %55 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 2 2 2 2 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %52 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %75 = OpLoad %9 
                               Uniform f32_4* %76 = OpAccessChain %22 %55 %24 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpFAdd %75 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %79 1 1 1 1 
                               Uniform f32_4* %81 = OpAccessChain %22 %56 %56 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpFMul %80 %82 
                                                      OpStore %52 %83 
                               Uniform f32_4* %84 = OpAccessChain %22 %56 %55 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpVectorShuffle %86 %86 0 0 0 0 
                                        f32_4 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %52 
                                        f32_4 %90 = OpFAdd %88 %89 
                                                      OpStore %52 %90 
                               Uniform f32_4* %91 = OpAccessChain %22 %56 %67 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpVectorShuffle %93 %93 2 2 2 2 
                                        f32_4 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %52 
                                        f32_4 %97 = OpFAdd %95 %96 
                                                      OpStore %52 %97 
                              Uniform f32_4* %103 = OpAccessChain %22 %56 %24 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %105 3 3 3 3 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %52 
                                       f32_4 %109 = OpFAdd %107 %108 
                               Output f32_4* %111 = OpAccessChain %102 %55 
                                                      OpStore %111 %109 
                                       f32_4 %114 = OpLoad %113 
                                                      OpStore %112 %114 
                                       f32_3 %115 = OpLoad %12 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFNegate %116 
                                       f32_3 %118 = OpLoad %12 
                                       f32_2 %119 = OpVectorShuffle %118 %118 1 0 
                                       f32_2 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
                                                      OpStore %9 %122 
                              Uniform f32_4* %123 = OpAccessChain %22 %24 
                                       f32_4 %124 = OpLoad %123 
                                       f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %12 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 2 3 
                                                      OpStore %9 %133 
                                       f32_4 %136 = OpLoad %9 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %67 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %137 %140 
                                       f32_2 %144 = OpLoad %143 
                                       f32_2 %145 = OpFAdd %141 %144 
                                                      OpStore %135 %145 
                                       f32_3 %148 = OpLoad %12 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %102 %55 %98 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %102 %55 %98 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 221
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %52 %212 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpMemberDecorate %11 0 Offset 11 
                                                    OpMemberDecorate %11 1 RelaxedPrecision 
                                                    OpMemberDecorate %11 1 Offset 11 
                                                    OpMemberDecorate %11 2 Offset 11 
                                                    OpMemberDecorate %11 3 Offset 11 
                                                    OpDecorate %11 Block 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %52 Location 52 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %73 DescriptorSet 73 
                                                    OpDecorate %73 Binding 73 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                                    OpDecorate %112 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
                                                    OpDecorate %120 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %122 RelaxedPrecision 
                                                    OpDecorate %123 RelaxedPrecision 
                                                    OpDecorate %140 RelaxedPrecision 
                                                    OpDecorate %141 RelaxedPrecision 
                                                    OpDecorate %144 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %146 RelaxedPrecision 
                                                    OpDecorate %148 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %150 RelaxedPrecision 
                                                    OpDecorate %151 RelaxedPrecision 
                                                    OpDecorate %153 RelaxedPrecision 
                                                    OpDecorate %154 RelaxedPrecision 
                                                    OpDecorate %155 RelaxedPrecision 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %168 RelaxedPrecision 
                                                    OpDecorate %169 RelaxedPrecision 
                                                    OpDecorate %172 RelaxedPrecision 
                                                    OpDecorate %173 RelaxedPrecision 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %176 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %178 RelaxedPrecision 
                                                    OpDecorate %179 RelaxedPrecision 
                                                    OpDecorate %181 RelaxedPrecision 
                                                    OpDecorate %182 RelaxedPrecision 
                                                    OpDecorate %183 RelaxedPrecision 
                                                    OpDecorate %185 RelaxedPrecision 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %192 RelaxedPrecision 
                                                    OpDecorate %193 RelaxedPrecision 
                                                    OpDecorate %212 RelaxedPrecision 
                                                    OpDecorate %212 Location 212 
                                                    OpDecorate %214 RelaxedPrecision 
                                                    OpDecorate %215 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 4 
                                            %11 = OpTypeStruct %10 %10 %6 %6 
                                            %12 = OpTypePointer Uniform %11 
  Uniform struct {f32_4; f32_4; f32; f32;}* %13 = OpVariable Uniform 
                                            %14 = OpTypeInt 32 1 
                                        i32 %15 = OpConstant 3 
                                            %16 = OpTypePointer Uniform %6 
                                        f32 %20 = OpConstant 3.67402E-40 
                                            %22 = OpTypeInt 32 0 
                                        u32 %23 = OpConstant 0 
                                            %24 = OpTypePointer Private %6 
                                            %26 = OpTypeBool 
                                            %27 = OpTypePointer Private %26 
                              Private bool* %28 = OpVariable Private 
                                        f32 %31 = OpConstant 3.67402E-40 
                                        i32 %34 = OpConstant 0 
                                        i32 %35 = OpConstant 1 
                                        i32 %37 = OpConstant -1 
                                        u32 %43 = OpConstant 1 
                             Private f32_2* %48 = OpVariable Private 
                             Private f32_2* %50 = OpVariable Private 
                                            %51 = OpTypePointer Input %7 
                               Input f32_2* %52 = OpVariable Input 
                                            %54 = OpTypePointer Uniform %10 
                                            %68 = OpTypePointer Private %10 
                             Private f32_4* %69 = OpVariable Private 
                                            %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %71 = OpTypeSampledImage %70 
                                            %72 = OpTypePointer UniformConstant %71 
UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
                               Private f32* %77 = OpVariable Private 
                                            %78 = OpTypeVector %6 3 
                                        f32 %81 = OpConstant 3.67402E-40 
                                        f32 %82 = OpConstant 3.67402E-40 
                                        f32 %83 = OpConstant 3.67402E-40 
                                      f32_3 %84 = OpConstantComposite %81 %82 %83 
                                        u32 %86 = OpConstant 3 
                            Private f32_4* %102 = OpVariable Private 
                              Private f32* %106 = OpVariable Private 
                              Private f32* %114 = OpVariable Private 
                              Private f32* %120 = OpVariable Private 
                            Private f32_2* %124 = OpVariable Private 
                            Private f32_2* %129 = OpVariable Private 
                            Private f32_2* %132 = OpVariable Private 
                            Private f32_4* %140 = OpVariable Private 
                            Private f32_4* %168 = OpVariable Private 
                                       f32 %184 = OpConstant 3.67402E-40 
                             Private bool* %187 = OpVariable Private 
                                       i32 %197 = OpConstant 2 
                                           %211 = OpTypePointer Output %10 
                             Output f32_4* %212 = OpVariable Output 
                                           %218 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Uniform f32* %17 = OpAccessChain %13 %15 
                                        f32 %18 = OpLoad %17 
                                        f32 %19 = OpFNegate %18 
                                        f32 %21 = OpFAdd %19 %20 
                               Private f32* %25 = OpAccessChain %9 %23 
                                                    OpStore %25 %21 
                               Private f32* %29 = OpAccessChain %9 %23 
                                        f32 %30 = OpLoad %29 
                                       bool %32 = OpFOrdLessThan %30 %31 
                                                    OpStore %28 %32 
                                       bool %33 = OpLoad %28 
                                        i32 %36 = OpSelect %33 %35 %34 
                                        i32 %38 = OpIMul %36 %37 
                                       bool %39 = OpINotEqual %38 %34 
                                                    OpSelectionMerge %41 None 
                                                    OpBranchConditional %39 %40 %41 
                                            %40 = OpLabel 
                                                    OpKill
                                            %41 = OpLabel 
                               Uniform f32* %44 = OpAccessChain %13 %34 %43 
                                        f32 %45 = OpLoad %44 
                               Private f32* %46 = OpAccessChain %9 %43 
                                                    OpStore %46 %45 
                               Private f32* %47 = OpAccessChain %9 %23 
                                                    OpStore %47 %31 
                               Private f32* %49 = OpAccessChain %48 %23 
                                                    OpStore %49 %31 
                                      f32_2 %53 = OpLoad %52 
                             Uniform f32_4* %55 = OpAccessChain %13 %34 
                                      f32_4 %56 = OpLoad %55 
                                      f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                      f32_2 %58 = OpFDiv %53 %57 
                                                    OpStore %50 %58 
                                      f32_2 %59 = OpLoad %50 
                                      f32_2 %60 = OpExtInst %1 8 %59 
                                                    OpStore %50 %60 
                                      f32_2 %61 = OpLoad %50 
                             Uniform f32_4* %62 = OpAccessChain %13 %34 
                                      f32_4 %63 = OpLoad %62 
                                      f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                      f32_2 %65 = OpFMul %61 %64 
                                      f32_2 %66 = OpLoad %9 
                                      f32_2 %67 = OpFAdd %65 %66 
                                                    OpStore %9 %67 
                 read_only Texture2DSampled %74 = OpLoad %73 
                                      f32_2 %75 = OpLoad %9 
                                      f32_4 %76 = OpImageSampleImplicitLod %74 %75 
                                                    OpStore %69 %76 
                                      f32_4 %79 = OpLoad %69 
                                      f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32 %85 = OpDot %80 %84 
                                                    OpStore %77 %85 
                               Private f32* %87 = OpAccessChain %69 %86 
                                        f32 %88 = OpLoad %87 
                                        f32 %89 = OpLoad %77 
                                        f32 %90 = OpFMul %88 %89 
                                                    OpStore %77 %90 
                               Uniform f32* %91 = OpAccessChain %13 %34 %43 
                                        f32 %92 = OpLoad %91 
                                        f32 %93 = OpFNegate %92 
                               Private f32* %94 = OpAccessChain %48 %43 
                                                    OpStore %94 %93 
                                      f32_2 %95 = OpLoad %50 
                             Uniform f32_4* %96 = OpAccessChain %13 %34 
                                      f32_4 %97 = OpLoad %96 
                                      f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                      f32_2 %99 = OpFMul %95 %98 
                                     f32_2 %100 = OpLoad %48 
                                     f32_2 %101 = OpFAdd %99 %100 
                                                    OpStore %9 %101 
                read_only Texture2DSampled %103 = OpLoad %73 
                                     f32_2 %104 = OpLoad %9 
                                     f32_4 %105 = OpImageSampleImplicitLod %103 %104 
                                                    OpStore %102 %105 
                                     f32_4 %107 = OpLoad %102 
                                     f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32 %109 = OpDot %108 %84 
                                                    OpStore %106 %109 
                              Private f32* %110 = OpAccessChain %102 %86 
                                       f32 %111 = OpLoad %110 
                                       f32 %112 = OpLoad %106 
                                       f32 %113 = OpFMul %111 %112 
                                                    OpStore %106 %113 
                              Private f32* %115 = OpAccessChain %102 %86 
                                       f32 %116 = OpLoad %115 
                              Private f32* %117 = OpAccessChain %69 %86 
                                       f32 %118 = OpLoad %117 
                                       f32 %119 = OpExtInst %1 40 %116 %118 
                                                    OpStore %114 %119 
                                       f32 %121 = OpLoad %106 
                                       f32 %122 = OpLoad %77 
                                       f32 %123 = OpExtInst %1 40 %121 %122 
                                                    OpStore %120 %123 
                              Uniform f32* %125 = OpAccessChain %13 %34 %23 
                                       f32 %126 = OpLoad %125 
                                       f32 %127 = OpFNegate %126 
                              Private f32* %128 = OpAccessChain %124 %23 
                                                    OpStore %128 %127 
                              Private f32* %130 = OpAccessChain %129 %43 
                                                    OpStore %130 %31 
                              Private f32* %131 = OpAccessChain %124 %43 
                                                    OpStore %131 %31 
                                     f32_2 %133 = OpLoad %50 
                            Uniform f32_4* %134 = OpAccessChain %13 %34 
                                     f32_4 %135 = OpLoad %134 
                                     f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                     f32_2 %137 = OpFMul %133 %136 
                                     f32_2 %138 = OpLoad %124 
                                     f32_2 %139 = OpFAdd %137 %138 
                                                    OpStore %132 %139 
                read_only Texture2DSampled %141 = OpLoad %73 
                                     f32_2 %142 = OpLoad %132 
                                     f32_4 %143 = OpImageSampleImplicitLod %141 %142 
                                                    OpStore %140 %143 
                                     f32_4 %144 = OpLoad %140 
                                     f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32 %146 = OpDot %145 %84 
                                                    OpStore %77 %146 
                              Private f32* %147 = OpAccessChain %140 %86 
                                       f32 %148 = OpLoad %147 
                                       f32 %149 = OpLoad %77 
                                       f32 %150 = OpFMul %148 %149 
                                                    OpStore %77 %150 
                                       f32 %151 = OpLoad %114 
                              Private f32* %152 = OpAccessChain %140 %86 
                                       f32 %153 = OpLoad %152 
                                       f32 %154 = OpExtInst %1 40 %151 %153 
                                                    OpStore %106 %154 
                                       f32 %155 = OpLoad %120 
                                       f32 %156 = OpLoad %77 
                                       f32 %157 = OpExtInst %1 40 %155 %156 
                                                    OpStore %120 %157 
                              Uniform f32* %158 = OpAccessChain %13 %34 %23 
                                       f32 %159 = OpLoad %158 
                              Private f32* %160 = OpAccessChain %129 %23 
                                                    OpStore %160 %159 
                                     f32_2 %161 = OpLoad %50 
                            Uniform f32_4* %162 = OpAccessChain %13 %34 
                                     f32_4 %163 = OpLoad %162 
                                     f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                     f32_2 %165 = OpFMul %161 %164 
                                     f32_2 %166 = OpLoad %129 
                                     f32_2 %167 = OpFAdd %165 %166 
                                                    OpStore %132 %167 
                read_only Texture2DSampled %169 = OpLoad %73 
                                     f32_2 %170 = OpLoad %132 
                                     f32_4 %171 = OpImageSampleImplicitLod %169 %170 
                                                    OpStore %168 %171 
                                     f32_4 %172 = OpLoad %168 
                                     f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32 %174 = OpDot %173 %84 
                                                    OpStore %77 %174 
                              Private f32* %175 = OpAccessChain %168 %86 
                                       f32 %176 = OpLoad %175 
                                       f32 %177 = OpLoad %77 
                                       f32 %178 = OpFMul %176 %177 
                                                    OpStore %77 %178 
                                       f32 %179 = OpLoad %106 
                              Private f32* %180 = OpAccessChain %168 %86 
                                       f32 %181 = OpLoad %180 
                                       f32 %182 = OpExtInst %1 40 %179 %181 
                                                    OpStore %106 %182 
                                       f32 %183 = OpLoad %106 
                                       f32 %185 = OpFAdd %183 %184 
                              Private f32* %186 = OpAccessChain %132 %23 
                                                    OpStore %186 %185 
                              Private f32* %188 = OpAccessChain %132 %23 
                                       f32 %189 = OpLoad %188 
                                      bool %190 = OpFOrdLessThan %189 %31 
                                                    OpStore %187 %190 
                                       f32 %191 = OpLoad %120 
                                       f32 %192 = OpLoad %77 
                                       f32 %193 = OpExtInst %1 40 %191 %192 
                              Private f32* %194 = OpAccessChain %9 %23 
                                                    OpStore %194 %193 
                              Private f32* %195 = OpAccessChain %9 %23 
                                       f32 %196 = OpLoad %195 
                              Uniform f32* %198 = OpAccessChain %13 %197 
                                       f32 %199 = OpLoad %198 
                                      bool %200 = OpFOrdLessThan %196 %199 
                                                    OpStore %28 %200 
                                      bool %201 = OpLoad %187 
                                      bool %202 = OpLoad %28 
                                      bool %203 = OpLogicalOr %201 %202 
                                                    OpStore %28 %203 
                                      bool %204 = OpLoad %28 
                                       i32 %205 = OpSelect %204 %35 %34 
                                       i32 %206 = OpIMul %205 %37 
                                      bool %207 = OpINotEqual %206 %34 
                                                    OpSelectionMerge %209 None 
                                                    OpBranchConditional %207 %208 %209 
                                           %208 = OpLabel 
                                                    OpKill
                                           %209 = OpLabel 
                            Uniform f32_4* %213 = OpAccessChain %13 %35 
                                     f32_4 %214 = OpLoad %213 
                                     f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                     f32_4 %216 = OpLoad %212 
                                     f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                                    OpStore %212 %217 
                               Output f32* %219 = OpAccessChain %212 %86 
                                                    OpStore %219 %20 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "OUTLINE_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _AtlasData;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec3 in_NORMAL0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec3 vs_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_NORMAL0.xy * _AtlasData.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0625, 0.0625);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xy = (-in_NORMAL0.xy) + in_NORMAL0.yx;
    u_xlat0.xy = _AtlasData.zw * u_xlat0.xy + in_NORMAL0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _MainTex_TexelSize.xy + in_TEXCOORD0.xy;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _OverrideColor;
uniform 	float _LuminanceCutoff;
uniform 	float _ReflectionYFactor;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat16_4;
vec2 u_xlat8;
float u_xlat16_8;
bool u_xlatb8;
vec2 u_xlat10;
void main()
{
    u_xlat0.x = (-_ReflectionYFactor) + 1.0;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.y = _MainTex_TexelSize.y;
    u_xlat0.x = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy / _MainTex_TexelSize.xy;
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat0.xy = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat10_2.w * u_xlat16_0;
    u_xlat8.y = (-_MainTex_TexelSize.y);
    u_xlat4.xy = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat8.xy;
    u_xlat10_3 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_3.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat10_2.w, u_xlat10_3.w);
    u_xlat16_0 = max(u_xlat16_4, u_xlat16_0);
    u_xlat10.x = (-_MainTex_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat4.xz = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat10.xy;
    u_xlat10_3 = texture(_MainTex, u_xlat4.xz);
    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_3.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat16_8, u_xlat10_3.w);
    u_xlat16_0 = max(u_xlat16_0, u_xlat16_4);
    u_xlat2.x = _MainTex_TexelSize.x;
    u_xlat4.xz = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat2.xy;
    u_xlat10_1 = texture(_MainTex, u_xlat4.xz);
    u_xlat16_4 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_1.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat16_8, u_xlat10_1.w);
    u_xlat8.x = u_xlat16_8 + -0.100000001;
    u_xlatb8 = u_xlat8.x<0.0;
    u_xlat0.x = max(u_xlat16_0, u_xlat16_4);
    u_xlatb0 = u_xlat0.x<_LuminanceCutoff;
    u_xlatb0 = u_xlatb8 || u_xlatb0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.xyz = _OverrideColor.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "OUTLINE_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 155
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %46 %102 %112 %113 %135 %143 %147 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %100 0 BuiltIn 100 
                                                      OpMemberDecorate %100 1 BuiltIn 100 
                                                      OpMemberDecorate %100 2 BuiltIn 100 
                                                      OpDecorate %100 Block 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %135 Location 135 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %147 Location 147 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %18 %19 %7 %7 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                                          f32 %39 = OpConstant 3.67402E-40 
                                          u32 %40 = OpConstant 2 
                                              %41 = OpTypePointer Private %6 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                          i32 %67 = OpConstant 2 
                                          u32 %98 = OpConstant 1 
                                              %99 = OpTypeArray %6 %98 
                                             %100 = OpTypeStruct %7 %6 %99 
                                             %101 = OpTypePointer Output %100 
        Output struct {f32_4; f32; f32[1];}* %102 = OpVariable Output 
                                             %110 = OpTypePointer Output %7 
                               Output f32_4* %112 = OpVariable Output 
                                Input f32_4* %113 = OpVariable Input 
                                             %134 = OpTypePointer Output %13 
                               Output f32_2* %135 = OpVariable Output 
                                             %142 = OpTypePointer Input %13 
                                Input f32_2* %143 = OpVariable Input 
                                             %146 = OpTypePointer Output %10 
                               Output f32_3* %147 = OpVariable Output 
                                             %149 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                                 Private f32* %42 = OpAccessChain %9 %40 
                                                      OpStore %42 %39 
                                        f32_4 %43 = OpLoad %9 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %44 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %9 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 1 1 1 1 
                               Uniform f32_4* %57 = OpAccessChain %22 %55 %56 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFMul %54 %58 
                                                      OpStore %52 %59 
                               Uniform f32_4* %60 = OpAccessChain %22 %55 %55 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %52 
                                        f32_4 %66 = OpFAdd %64 %65 
                                                      OpStore %52 %66 
                               Uniform f32_4* %68 = OpAccessChain %22 %55 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 2 2 2 2 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %52 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %75 = OpLoad %9 
                               Uniform f32_4* %76 = OpAccessChain %22 %55 %24 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpFAdd %75 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %79 1 1 1 1 
                               Uniform f32_4* %81 = OpAccessChain %22 %56 %56 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpFMul %80 %82 
                                                      OpStore %52 %83 
                               Uniform f32_4* %84 = OpAccessChain %22 %56 %55 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpVectorShuffle %86 %86 0 0 0 0 
                                        f32_4 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %52 
                                        f32_4 %90 = OpFAdd %88 %89 
                                                      OpStore %52 %90 
                               Uniform f32_4* %91 = OpAccessChain %22 %56 %67 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpVectorShuffle %93 %93 2 2 2 2 
                                        f32_4 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %52 
                                        f32_4 %97 = OpFAdd %95 %96 
                                                      OpStore %52 %97 
                              Uniform f32_4* %103 = OpAccessChain %22 %56 %24 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %105 3 3 3 3 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %52 
                                       f32_4 %109 = OpFAdd %107 %108 
                               Output f32_4* %111 = OpAccessChain %102 %55 
                                                      OpStore %111 %109 
                                       f32_4 %114 = OpLoad %113 
                                                      OpStore %112 %114 
                                       f32_3 %115 = OpLoad %12 
                                       f32_2 %116 = OpVectorShuffle %115 %115 0 1 
                                       f32_2 %117 = OpFNegate %116 
                                       f32_3 %118 = OpLoad %12 
                                       f32_2 %119 = OpVectorShuffle %118 %118 1 0 
                                       f32_2 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %9 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
                                                      OpStore %9 %122 
                              Uniform f32_4* %123 = OpAccessChain %22 %24 
                                       f32_4 %124 = OpLoad %123 
                                       f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                                       f32_3 %129 = OpLoad %12 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 2 3 
                                                      OpStore %9 %133 
                                       f32_4 %136 = OpLoad %9 
                                       f32_2 %137 = OpVectorShuffle %136 %136 0 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %67 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %137 %140 
                                       f32_2 %144 = OpLoad %143 
                                       f32_2 %145 = OpFAdd %141 %144 
                                                      OpStore %135 %145 
                                       f32_3 %148 = OpLoad %12 
                                                      OpStore %147 %148 
                                 Output f32* %150 = OpAccessChain %102 %55 %98 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                 Output f32* %153 = OpAccessChain %102 %55 %98 
                                                      OpStore %153 %152 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 221
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %52 %212 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpMemberDecorate %11 0 Offset 11 
                                                    OpMemberDecorate %11 1 RelaxedPrecision 
                                                    OpMemberDecorate %11 1 Offset 11 
                                                    OpMemberDecorate %11 2 Offset 11 
                                                    OpMemberDecorate %11 3 Offset 11 
                                                    OpDecorate %11 Block 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %52 Location 52 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %73 DescriptorSet 73 
                                                    OpDecorate %73 Binding 73 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                                    OpDecorate %112 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
                                                    OpDecorate %120 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %122 RelaxedPrecision 
                                                    OpDecorate %123 RelaxedPrecision 
                                                    OpDecorate %140 RelaxedPrecision 
                                                    OpDecorate %141 RelaxedPrecision 
                                                    OpDecorate %144 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %146 RelaxedPrecision 
                                                    OpDecorate %148 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %150 RelaxedPrecision 
                                                    OpDecorate %151 RelaxedPrecision 
                                                    OpDecorate %153 RelaxedPrecision 
                                                    OpDecorate %154 RelaxedPrecision 
                                                    OpDecorate %155 RelaxedPrecision 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %168 RelaxedPrecision 
                                                    OpDecorate %169 RelaxedPrecision 
                                                    OpDecorate %172 RelaxedPrecision 
                                                    OpDecorate %173 RelaxedPrecision 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %176 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %178 RelaxedPrecision 
                                                    OpDecorate %179 RelaxedPrecision 
                                                    OpDecorate %181 RelaxedPrecision 
                                                    OpDecorate %182 RelaxedPrecision 
                                                    OpDecorate %183 RelaxedPrecision 
                                                    OpDecorate %185 RelaxedPrecision 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %192 RelaxedPrecision 
                                                    OpDecorate %193 RelaxedPrecision 
                                                    OpDecorate %212 RelaxedPrecision 
                                                    OpDecorate %212 Location 212 
                                                    OpDecorate %214 RelaxedPrecision 
                                                    OpDecorate %215 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 4 
                                            %11 = OpTypeStruct %10 %10 %6 %6 
                                            %12 = OpTypePointer Uniform %11 
  Uniform struct {f32_4; f32_4; f32; f32;}* %13 = OpVariable Uniform 
                                            %14 = OpTypeInt 32 1 
                                        i32 %15 = OpConstant 3 
                                            %16 = OpTypePointer Uniform %6 
                                        f32 %20 = OpConstant 3.67402E-40 
                                            %22 = OpTypeInt 32 0 
                                        u32 %23 = OpConstant 0 
                                            %24 = OpTypePointer Private %6 
                                            %26 = OpTypeBool 
                                            %27 = OpTypePointer Private %26 
                              Private bool* %28 = OpVariable Private 
                                        f32 %31 = OpConstant 3.67402E-40 
                                        i32 %34 = OpConstant 0 
                                        i32 %35 = OpConstant 1 
                                        i32 %37 = OpConstant -1 
                                        u32 %43 = OpConstant 1 
                             Private f32_2* %48 = OpVariable Private 
                             Private f32_2* %50 = OpVariable Private 
                                            %51 = OpTypePointer Input %7 
                               Input f32_2* %52 = OpVariable Input 
                                            %54 = OpTypePointer Uniform %10 
                                            %68 = OpTypePointer Private %10 
                             Private f32_4* %69 = OpVariable Private 
                                            %70 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %71 = OpTypeSampledImage %70 
                                            %72 = OpTypePointer UniformConstant %71 
UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
                               Private f32* %77 = OpVariable Private 
                                            %78 = OpTypeVector %6 3 
                                        f32 %81 = OpConstant 3.67402E-40 
                                        f32 %82 = OpConstant 3.67402E-40 
                                        f32 %83 = OpConstant 3.67402E-40 
                                      f32_3 %84 = OpConstantComposite %81 %82 %83 
                                        u32 %86 = OpConstant 3 
                            Private f32_4* %102 = OpVariable Private 
                              Private f32* %106 = OpVariable Private 
                              Private f32* %114 = OpVariable Private 
                              Private f32* %120 = OpVariable Private 
                            Private f32_2* %124 = OpVariable Private 
                            Private f32_2* %129 = OpVariable Private 
                            Private f32_2* %132 = OpVariable Private 
                            Private f32_4* %140 = OpVariable Private 
                            Private f32_4* %168 = OpVariable Private 
                                       f32 %184 = OpConstant 3.67402E-40 
                             Private bool* %187 = OpVariable Private 
                                       i32 %197 = OpConstant 2 
                                           %211 = OpTypePointer Output %10 
                             Output f32_4* %212 = OpVariable Output 
                                           %218 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Uniform f32* %17 = OpAccessChain %13 %15 
                                        f32 %18 = OpLoad %17 
                                        f32 %19 = OpFNegate %18 
                                        f32 %21 = OpFAdd %19 %20 
                               Private f32* %25 = OpAccessChain %9 %23 
                                                    OpStore %25 %21 
                               Private f32* %29 = OpAccessChain %9 %23 
                                        f32 %30 = OpLoad %29 
                                       bool %32 = OpFOrdLessThan %30 %31 
                                                    OpStore %28 %32 
                                       bool %33 = OpLoad %28 
                                        i32 %36 = OpSelect %33 %35 %34 
                                        i32 %38 = OpIMul %36 %37 
                                       bool %39 = OpINotEqual %38 %34 
                                                    OpSelectionMerge %41 None 
                                                    OpBranchConditional %39 %40 %41 
                                            %40 = OpLabel 
                                                    OpKill
                                            %41 = OpLabel 
                               Uniform f32* %44 = OpAccessChain %13 %34 %43 
                                        f32 %45 = OpLoad %44 
                               Private f32* %46 = OpAccessChain %9 %43 
                                                    OpStore %46 %45 
                               Private f32* %47 = OpAccessChain %9 %23 
                                                    OpStore %47 %31 
                               Private f32* %49 = OpAccessChain %48 %23 
                                                    OpStore %49 %31 
                                      f32_2 %53 = OpLoad %52 
                             Uniform f32_4* %55 = OpAccessChain %13 %34 
                                      f32_4 %56 = OpLoad %55 
                                      f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                      f32_2 %58 = OpFDiv %53 %57 
                                                    OpStore %50 %58 
                                      f32_2 %59 = OpLoad %50 
                                      f32_2 %60 = OpExtInst %1 8 %59 
                                                    OpStore %50 %60 
                                      f32_2 %61 = OpLoad %50 
                             Uniform f32_4* %62 = OpAccessChain %13 %34 
                                      f32_4 %63 = OpLoad %62 
                                      f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                      f32_2 %65 = OpFMul %61 %64 
                                      f32_2 %66 = OpLoad %9 
                                      f32_2 %67 = OpFAdd %65 %66 
                                                    OpStore %9 %67 
                 read_only Texture2DSampled %74 = OpLoad %73 
                                      f32_2 %75 = OpLoad %9 
                                      f32_4 %76 = OpImageSampleImplicitLod %74 %75 
                                                    OpStore %69 %76 
                                      f32_4 %79 = OpLoad %69 
                                      f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32 %85 = OpDot %80 %84 
                                                    OpStore %77 %85 
                               Private f32* %87 = OpAccessChain %69 %86 
                                        f32 %88 = OpLoad %87 
                                        f32 %89 = OpLoad %77 
                                        f32 %90 = OpFMul %88 %89 
                                                    OpStore %77 %90 
                               Uniform f32* %91 = OpAccessChain %13 %34 %43 
                                        f32 %92 = OpLoad %91 
                                        f32 %93 = OpFNegate %92 
                               Private f32* %94 = OpAccessChain %48 %43 
                                                    OpStore %94 %93 
                                      f32_2 %95 = OpLoad %50 
                             Uniform f32_4* %96 = OpAccessChain %13 %34 
                                      f32_4 %97 = OpLoad %96 
                                      f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                      f32_2 %99 = OpFMul %95 %98 
                                     f32_2 %100 = OpLoad %48 
                                     f32_2 %101 = OpFAdd %99 %100 
                                                    OpStore %9 %101 
                read_only Texture2DSampled %103 = OpLoad %73 
                                     f32_2 %104 = OpLoad %9 
                                     f32_4 %105 = OpImageSampleImplicitLod %103 %104 
                                                    OpStore %102 %105 
                                     f32_4 %107 = OpLoad %102 
                                     f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32 %109 = OpDot %108 %84 
                                                    OpStore %106 %109 
                              Private f32* %110 = OpAccessChain %102 %86 
                                       f32 %111 = OpLoad %110 
                                       f32 %112 = OpLoad %106 
                                       f32 %113 = OpFMul %111 %112 
                                                    OpStore %106 %113 
                              Private f32* %115 = OpAccessChain %102 %86 
                                       f32 %116 = OpLoad %115 
                              Private f32* %117 = OpAccessChain %69 %86 
                                       f32 %118 = OpLoad %117 
                                       f32 %119 = OpExtInst %1 40 %116 %118 
                                                    OpStore %114 %119 
                                       f32 %121 = OpLoad %106 
                                       f32 %122 = OpLoad %77 
                                       f32 %123 = OpExtInst %1 40 %121 %122 
                                                    OpStore %120 %123 
                              Uniform f32* %125 = OpAccessChain %13 %34 %23 
                                       f32 %126 = OpLoad %125 
                                       f32 %127 = OpFNegate %126 
                              Private f32* %128 = OpAccessChain %124 %23 
                                                    OpStore %128 %127 
                              Private f32* %130 = OpAccessChain %129 %43 
                                                    OpStore %130 %31 
                              Private f32* %131 = OpAccessChain %124 %43 
                                                    OpStore %131 %31 
                                     f32_2 %133 = OpLoad %50 
                            Uniform f32_4* %134 = OpAccessChain %13 %34 
                                     f32_4 %135 = OpLoad %134 
                                     f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                     f32_2 %137 = OpFMul %133 %136 
                                     f32_2 %138 = OpLoad %124 
                                     f32_2 %139 = OpFAdd %137 %138 
                                                    OpStore %132 %139 
                read_only Texture2DSampled %141 = OpLoad %73 
                                     f32_2 %142 = OpLoad %132 
                                     f32_4 %143 = OpImageSampleImplicitLod %141 %142 
                                                    OpStore %140 %143 
                                     f32_4 %144 = OpLoad %140 
                                     f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32 %146 = OpDot %145 %84 
                                                    OpStore %77 %146 
                              Private f32* %147 = OpAccessChain %140 %86 
                                       f32 %148 = OpLoad %147 
                                       f32 %149 = OpLoad %77 
                                       f32 %150 = OpFMul %148 %149 
                                                    OpStore %77 %150 
                                       f32 %151 = OpLoad %114 
                              Private f32* %152 = OpAccessChain %140 %86 
                                       f32 %153 = OpLoad %152 
                                       f32 %154 = OpExtInst %1 40 %151 %153 
                                                    OpStore %106 %154 
                                       f32 %155 = OpLoad %120 
                                       f32 %156 = OpLoad %77 
                                       f32 %157 = OpExtInst %1 40 %155 %156 
                                                    OpStore %120 %157 
                              Uniform f32* %158 = OpAccessChain %13 %34 %23 
                                       f32 %159 = OpLoad %158 
                              Private f32* %160 = OpAccessChain %129 %23 
                                                    OpStore %160 %159 
                                     f32_2 %161 = OpLoad %50 
                            Uniform f32_4* %162 = OpAccessChain %13 %34 
                                     f32_4 %163 = OpLoad %162 
                                     f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                                     f32_2 %165 = OpFMul %161 %164 
                                     f32_2 %166 = OpLoad %129 
                                     f32_2 %167 = OpFAdd %165 %166 
                                                    OpStore %132 %167 
                read_only Texture2DSampled %169 = OpLoad %73 
                                     f32_2 %170 = OpLoad %132 
                                     f32_4 %171 = OpImageSampleImplicitLod %169 %170 
                                                    OpStore %168 %171 
                                     f32_4 %172 = OpLoad %168 
                                     f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32 %174 = OpDot %173 %84 
                                                    OpStore %77 %174 
                              Private f32* %175 = OpAccessChain %168 %86 
                                       f32 %176 = OpLoad %175 
                                       f32 %177 = OpLoad %77 
                                       f32 %178 = OpFMul %176 %177 
                                                    OpStore %77 %178 
                                       f32 %179 = OpLoad %106 
                              Private f32* %180 = OpAccessChain %168 %86 
                                       f32 %181 = OpLoad %180 
                                       f32 %182 = OpExtInst %1 40 %179 %181 
                                                    OpStore %106 %182 
                                       f32 %183 = OpLoad %106 
                                       f32 %185 = OpFAdd %183 %184 
                              Private f32* %186 = OpAccessChain %132 %23 
                                                    OpStore %186 %185 
                              Private f32* %188 = OpAccessChain %132 %23 
                                       f32 %189 = OpLoad %188 
                                      bool %190 = OpFOrdLessThan %189 %31 
                                                    OpStore %187 %190 
                                       f32 %191 = OpLoad %120 
                                       f32 %192 = OpLoad %77 
                                       f32 %193 = OpExtInst %1 40 %191 %192 
                              Private f32* %194 = OpAccessChain %9 %23 
                                                    OpStore %194 %193 
                              Private f32* %195 = OpAccessChain %9 %23 
                                       f32 %196 = OpLoad %195 
                              Uniform f32* %198 = OpAccessChain %13 %197 
                                       f32 %199 = OpLoad %198 
                                      bool %200 = OpFOrdLessThan %196 %199 
                                                    OpStore %28 %200 
                                      bool %201 = OpLoad %187 
                                      bool %202 = OpLoad %28 
                                      bool %203 = OpLogicalOr %201 %202 
                                                    OpStore %28 %203 
                                      bool %204 = OpLoad %28 
                                       i32 %205 = OpSelect %204 %35 %34 
                                       i32 %206 = OpIMul %205 %37 
                                      bool %207 = OpINotEqual %206 %34 
                                                    OpSelectionMerge %209 None 
                                                    OpBranchConditional %207 %208 %209 
                                           %208 = OpLabel 
                                                    OpKill
                                           %209 = OpLabel 
                            Uniform f32_4* %213 = OpAccessChain %13 %35 
                                     f32_4 %214 = OpLoad %213 
                                     f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                     f32_4 %216 = OpLoad %212 
                                     f32_4 %217 = OpVectorShuffle %216 %215 4 5 6 3 
                                                    OpStore %212 %217 
                               Output f32* %219 = OpAccessChain %212 %86 
                                                    OpStore %219 %20 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "OUTLINE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "OUTLINE_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "OUTLINE_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_ON" }
""
}
SubProgram "vulkan " {
Keywords { "OUTLINE_ON" }
""
}
}
}
}
}