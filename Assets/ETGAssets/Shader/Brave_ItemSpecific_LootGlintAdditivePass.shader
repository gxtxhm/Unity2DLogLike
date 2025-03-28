//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/ItemSpecific/LootGlintAdditivePass" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_PixelWidth ("Shine Width", Float) = 1.5
_Period ("Shine Period", Float) = 3
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 17336
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _OverrideColor;
uniform 	float _Period;
uniform 	float _PixelWidth;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat4;
bool u_xlatb4;
float u_xlat7;
bool u_xlatb7;
float u_xlat10;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat0.w + -0.100000001;
    u_xlatb1 = u_xlat1<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = (-vs_TEXCOORD1.y) + vs_TEXCOORD1.x;
    u_xlat1 = u_xlat1 * 0.5;
    u_xlat1 = u_xlat1 / _Period;
    u_xlatb4 = u_xlat1>=(-u_xlat1);
    u_xlat1 = fract(abs(u_xlat1));
    u_xlat1 = (u_xlatb4) ? u_xlat1 : (-u_xlat1);
    u_xlat1 = u_xlat1 * _Period;
    u_xlat4.x = _Time.y * 1.75;
    u_xlat4.x = u_xlat4.x / _Period;
    u_xlatb7 = u_xlat4.x>=(-u_xlat4.x);
    u_xlat4.x = fract(abs(u_xlat4.x));
    u_xlat4.x = (u_xlatb7) ? u_xlat4.x : (-u_xlat4.x);
    u_xlat7 = _PixelWidth * 0.03125;
    u_xlat10 = u_xlat4.x * _Period + (-u_xlat7);
    u_xlat4.x = u_xlat4.x * _Period + u_xlat7;
    u_xlatb4 = u_xlat1<u_xlat4.x;
    u_xlatb1 = u_xlat10<u_xlat1;
    u_xlatb1 = u_xlatb4 && u_xlatb1;
    u_xlat4.xyz = u_xlat0.xyz * _OverrideColor.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat4.x = u_xlat4.x * 1.25;
    u_xlat2.xyz = u_xlat4.xxx * _OverrideColor.xyz + (-u_xlat4.xxx);
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat4.xxx;
    SV_Target0 = (bool(u_xlatb1)) ? vec4(1.0, 1.0, 1.0, 1.0) : u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 99
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 %91 
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
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %82 Location 82 
                                              OpDecorate %83 Location 83 
                                              OpDecorate %87 Location 87 
                                              OpDecorate %89 Location 89 
                                              OpDecorate %91 Location 91 
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
                        Output f32_4* %82 = OpVariable Output 
                         Input f32_4* %83 = OpVariable Input 
                                      %85 = OpTypeVector %6 2 
                                      %86 = OpTypePointer Output %85 
                        Output f32_2* %87 = OpVariable Output 
                                      %88 = OpTypePointer Input %85 
                         Input f32_2* %89 = OpVariable Input 
                        Output f32_4* %91 = OpVariable Output 
                                      %93 = OpTypePointer Output %6 
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
                                f32_4 %84 = OpLoad %83 
                                              OpStore %82 %84 
                                f32_2 %90 = OpLoad %89 
                                              OpStore %87 %90 
                                f32_4 %92 = OpLoad %11 
                                              OpStore %91 %92 
                          Output f32* %94 = OpAccessChain %72 %22 %68 
                                  f32 %95 = OpLoad %94 
                                  f32 %96 = OpFNegate %95 
                          Output f32* %97 = OpAccessChain %72 %22 %68 
                                              OpStore %97 %96 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 211
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %47 %199 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %47 Location 47 
                                                    OpMemberDecorate %61 0 Offset 61 
                                                    OpMemberDecorate %61 1 Offset 61 
                                                    OpMemberDecorate %61 2 Offset 61 
                                                    OpMemberDecorate %61 3 Offset 61 
                                                    OpDecorate %61 Block 
                                                    OpDecorate %63 DescriptorSet 63 
                                                    OpDecorate %63 Binding 63 
                                                    OpDecorate %175 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %178 RelaxedPrecision 
                                                    OpDecorate %184 RelaxedPrecision 
                                                    OpDecorate %193 RelaxedPrecision 
                                                    OpDecorate %199 RelaxedPrecision 
                                                    OpDecorate %199 Location 199 
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
                                            %20 = OpTypePointer Private %6 
                               Private f32* %21 = OpVariable Private 
                                            %22 = OpTypeInt 32 0 
                                        u32 %23 = OpConstant 3 
                                        f32 %26 = OpConstant 3.67402E-40 
                                            %28 = OpTypeBool 
                                            %29 = OpTypePointer Private %28 
                              Private bool* %30 = OpVariable Private 
                                        f32 %32 = OpConstant 3.67402E-40 
                                            %35 = OpTypeInt 32 1 
                                        i32 %36 = OpConstant 0 
                                        i32 %37 = OpConstant 1 
                                        i32 %39 = OpConstant -1 
                               Private f32* %45 = OpVariable Private 
                                            %46 = OpTypePointer Input %7 
                               Input f32_4* %47 = OpVariable Input 
                                        u32 %48 = OpConstant 1 
                                            %49 = OpTypePointer Input %6 
                                        u32 %53 = OpConstant 0 
                                        f32 %58 = OpConstant 3.67402E-40 
                                            %61 = OpTypeStruct %7 %7 %6 %6 
                                            %62 = OpTypePointer Uniform %61 
  Uniform struct {f32_4; f32_4; f32; f32;}* %63 = OpVariable Uniform 
                                        i32 %64 = OpConstant 2 
                                            %65 = OpTypePointer Uniform %6 
                              Private bool* %69 = OpVariable Private 
                                            %77 = OpTypePointer Function %6 
                                            %91 = OpTypeVector %6 3 
                                            %92 = OpTypePointer Private %91 
                             Private f32_3* %93 = OpVariable Private 
                                        f32 %96 = OpConstant 3.67402E-40 
                             Private bool* %105 = OpVariable Private 
                              Private f32* %129 = OpVariable Private 
                                       i32 %130 = OpConstant 3 
                                       f32 %133 = OpConstant 3.67402E-40 
                              Private f32* %135 = OpVariable Private 
                                           %164 = OpTypePointer Uniform %7 
                                       f32 %170 = OpConstant 3.67402E-40 
                                       f32 %171 = OpConstant 3.67402E-40 
                                       f32 %172 = OpConstant 3.67402E-40 
                                     f32_3 %173 = OpConstantComposite %170 %171 %172 
                                       f32 %176 = OpConstant 3.67402E-40 
                                           %198 = OpTypePointer Output %7 
                             Output f32_4* %199 = OpVariable Output 
                                           %200 = OpTypePointer Function %7 
                                       f32 %205 = OpConstant 3.67402E-40 
                                     f32_4 %206 = OpConstantComposite %205 %205 %205 %205 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %78 = OpVariable Function 
                             Function f32* %117 = OpVariable Function 
                           Function f32_4* %201 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %24 = OpAccessChain %9 %23 
                                        f32 %25 = OpLoad %24 
                                        f32 %27 = OpFAdd %25 %26 
                                                    OpStore %21 %27 
                                        f32 %31 = OpLoad %21 
                                       bool %33 = OpFOrdLessThan %31 %32 
                                                    OpStore %30 %33 
                                       bool %34 = OpLoad %30 
                                        i32 %38 = OpSelect %34 %37 %36 
                                        i32 %40 = OpIMul %38 %39 
                                       bool %41 = OpINotEqual %40 %36 
                                                    OpSelectionMerge %43 None 
                                                    OpBranchConditional %41 %42 %43 
                                            %42 = OpLabel 
                                                    OpKill
                                            %43 = OpLabel 
                                 Input f32* %50 = OpAccessChain %47 %48 
                                        f32 %51 = OpLoad %50 
                                        f32 %52 = OpFNegate %51 
                                 Input f32* %54 = OpAccessChain %47 %53 
                                        f32 %55 = OpLoad %54 
                                        f32 %56 = OpFAdd %52 %55 
                                                    OpStore %45 %56 
                                        f32 %57 = OpLoad %45 
                                        f32 %59 = OpFMul %57 %58 
                                                    OpStore %45 %59 
                                        f32 %60 = OpLoad %45 
                               Uniform f32* %66 = OpAccessChain %63 %64 
                                        f32 %67 = OpLoad %66 
                                        f32 %68 = OpFDiv %60 %67 
                                                    OpStore %45 %68 
                                        f32 %70 = OpLoad %45 
                                        f32 %71 = OpLoad %45 
                                        f32 %72 = OpFNegate %71 
                                       bool %73 = OpFOrdGreaterThanEqual %70 %72 
                                                    OpStore %69 %73 
                                        f32 %74 = OpLoad %45 
                                        f32 %75 = OpExtInst %1 4 %74 
                                        f32 %76 = OpExtInst %1 10 %75 
                                                    OpStore %45 %76 
                                       bool %79 = OpLoad %69 
                                                    OpSelectionMerge %81 None 
                                                    OpBranchConditional %79 %80 %83 
                                            %80 = OpLabel 
                                        f32 %82 = OpLoad %45 
                                                    OpStore %78 %82 
                                                    OpBranch %81 
                                            %83 = OpLabel 
                                        f32 %84 = OpLoad %45 
                                        f32 %85 = OpFNegate %84 
                                                    OpStore %78 %85 
                                                    OpBranch %81 
                                            %81 = OpLabel 
                                        f32 %86 = OpLoad %78 
                                                    OpStore %45 %86 
                                        f32 %87 = OpLoad %45 
                               Uniform f32* %88 = OpAccessChain %63 %64 
                                        f32 %89 = OpLoad %88 
                                        f32 %90 = OpFMul %87 %89 
                                                    OpStore %45 %90 
                               Uniform f32* %94 = OpAccessChain %63 %36 %48 
                                        f32 %95 = OpLoad %94 
                                        f32 %97 = OpFMul %95 %96 
                               Private f32* %98 = OpAccessChain %93 %53 
                                                    OpStore %98 %97 
                               Private f32* %99 = OpAccessChain %93 %53 
                                       f32 %100 = OpLoad %99 
                              Uniform f32* %101 = OpAccessChain %63 %64 
                                       f32 %102 = OpLoad %101 
                                       f32 %103 = OpFDiv %100 %102 
                              Private f32* %104 = OpAccessChain %93 %53 
                                                    OpStore %104 %103 
                              Private f32* %106 = OpAccessChain %93 %53 
                                       f32 %107 = OpLoad %106 
                              Private f32* %108 = OpAccessChain %93 %53 
                                       f32 %109 = OpLoad %108 
                                       f32 %110 = OpFNegate %109 
                                      bool %111 = OpFOrdGreaterThanEqual %107 %110 
                                                    OpStore %105 %111 
                              Private f32* %112 = OpAccessChain %93 %53 
                                       f32 %113 = OpLoad %112 
                                       f32 %114 = OpExtInst %1 4 %113 
                                       f32 %115 = OpExtInst %1 10 %114 
                              Private f32* %116 = OpAccessChain %93 %53 
                                                    OpStore %116 %115 
                                      bool %118 = OpLoad %105 
                                                    OpSelectionMerge %120 None 
                                                    OpBranchConditional %118 %119 %123 
                                           %119 = OpLabel 
                              Private f32* %121 = OpAccessChain %93 %53 
                                       f32 %122 = OpLoad %121 
                                                    OpStore %117 %122 
                                                    OpBranch %120 
                                           %123 = OpLabel 
                              Private f32* %124 = OpAccessChain %93 %53 
                                       f32 %125 = OpLoad %124 
                                       f32 %126 = OpFNegate %125 
                                                    OpStore %117 %126 
                                                    OpBranch %120 
                                           %120 = OpLabel 
                                       f32 %127 = OpLoad %117 
                              Private f32* %128 = OpAccessChain %93 %53 
                                                    OpStore %128 %127 
                              Uniform f32* %131 = OpAccessChain %63 %130 
                                       f32 %132 = OpLoad %131 
                                       f32 %134 = OpFMul %132 %133 
                                                    OpStore %129 %134 
                              Private f32* %136 = OpAccessChain %93 %53 
                                       f32 %137 = OpLoad %136 
                              Uniform f32* %138 = OpAccessChain %63 %64 
                                       f32 %139 = OpLoad %138 
                                       f32 %140 = OpFMul %137 %139 
                                       f32 %141 = OpLoad %129 
                                       f32 %142 = OpFNegate %141 
                                       f32 %143 = OpFAdd %140 %142 
                                                    OpStore %135 %143 
                              Private f32* %144 = OpAccessChain %93 %53 
                                       f32 %145 = OpLoad %144 
                              Uniform f32* %146 = OpAccessChain %63 %64 
                                       f32 %147 = OpLoad %146 
                                       f32 %148 = OpFMul %145 %147 
                                       f32 %149 = OpLoad %129 
                                       f32 %150 = OpFAdd %148 %149 
                              Private f32* %151 = OpAccessChain %93 %53 
                                                    OpStore %151 %150 
                                       f32 %152 = OpLoad %45 
                              Private f32* %153 = OpAccessChain %93 %53 
                                       f32 %154 = OpLoad %153 
                                      bool %155 = OpFOrdLessThan %152 %154 
                                                    OpStore %69 %155 
                                       f32 %156 = OpLoad %135 
                                       f32 %157 = OpLoad %45 
                                      bool %158 = OpFOrdLessThan %156 %157 
                                                    OpStore %30 %158 
                                      bool %159 = OpLoad %69 
                                      bool %160 = OpLoad %30 
                                      bool %161 = OpLogicalAnd %159 %160 
                                                    OpStore %30 %161 
                                     f32_4 %162 = OpLoad %9 
                                     f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                            Uniform f32_4* %165 = OpAccessChain %63 %37 
                                     f32_4 %166 = OpLoad %165 
                                     f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                     f32_3 %168 = OpFMul %163 %167 
                                                    OpStore %93 %168 
                                     f32_3 %169 = OpLoad %93 
                                       f32 %174 = OpDot %169 %173 
                                                    OpStore %21 %174 
                                       f32 %175 = OpLoad %21 
                                       f32 %177 = OpFMul %175 %176 
                                                    OpStore %21 %177 
                                       f32 %178 = OpLoad %21 
                                     f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                            Uniform f32_4* %180 = OpAccessChain %63 %37 
                                     f32_4 %181 = OpLoad %180 
                                     f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                     f32_3 %183 = OpFMul %179 %182 
                                       f32 %184 = OpLoad %21 
                                     f32_3 %185 = OpCompositeConstruct %184 %184 %184 
                                     f32_3 %186 = OpFNegate %185 
                                     f32_3 %187 = OpFAdd %183 %186 
                                                    OpStore %93 %187 
                            Uniform f32_4* %188 = OpAccessChain %63 %37 
                                     f32_4 %189 = OpLoad %188 
                                     f32_3 %190 = OpVectorShuffle %189 %189 3 3 3 
                                     f32_3 %191 = OpLoad %93 
                                     f32_3 %192 = OpFMul %190 %191 
                                       f32 %193 = OpLoad %21 
                                     f32_3 %194 = OpCompositeConstruct %193 %193 %193 
                                     f32_3 %195 = OpFAdd %192 %194 
                                     f32_4 %196 = OpLoad %9 
                                     f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                                    OpStore %9 %197 
                                      bool %202 = OpLoad %30 
                                                    OpSelectionMerge %204 None 
                                                    OpBranchConditional %202 %203 %207 
                                           %203 = OpLabel 
                                                    OpStore %201 %206 
                                                    OpBranch %204 
                                           %207 = OpLabel 
                                     f32_4 %208 = OpLoad %9 
                                                    OpStore %201 %208 
                                                    OpBranch %204 
                                           %204 = OpLabel 
                                     f32_4 %209 = OpLoad %201 
                                                    OpStore %199 %209 
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
Fallback "tk2d/BlendVertexColor"
}