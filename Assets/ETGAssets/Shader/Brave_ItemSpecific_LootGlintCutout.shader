//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/ItemSpecific/LootGlintCutout" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_PixelWidth ("Shine Width", Float) = 1.5
_Period ("Shine Period", Float) = 3
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 49670
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
uniform 	float _Perpendicular;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.x = in_POSITION0.y * hlslcc_mtx4x4unity_ObjectToWorld[1].y;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[0].y * in_POSITION0.x + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[2].y * in_POSITION0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_ObjectToWorld[3].y * in_POSITION0.w + u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-hlslcc_mtx4x4unity_ObjectToWorld[3].y);
    u_xlatb2 = 0.0<_Perpendicular;
    u_xlat2 = (u_xlatb2) ? -1.0 : 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2 + in_POSITION0.z;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec4 _OverrideColor;
uniform 	float _Period;
uniform 	float _PixelWidth;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat10_1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat4;
bool u_xlatb4;
float u_xlat6;
void main()
{
    u_xlat0 = (-vs_TEXCOORD1.y) + vs_TEXCOORD1.x;
    u_xlat0 = u_xlat0 * 0.5;
    u_xlat0 = u_xlat0 / _Period;
    u_xlatb2 = u_xlat0>=(-u_xlat0);
    u_xlat0 = fract(abs(u_xlat0));
    u_xlat0 = (u_xlatb2) ? u_xlat0 : (-u_xlat0);
    u_xlat0 = u_xlat0 * _Period;
    u_xlat2.x = _Time.y * 1.75;
    u_xlat2.x = u_xlat2.x / _Period;
    u_xlatb4 = u_xlat2.x>=(-u_xlat2.x);
    u_xlat2.x = fract(abs(u_xlat2.x));
    u_xlat2.x = (u_xlatb4) ? u_xlat2.x : (-u_xlat2.x);
    u_xlat4 = _PixelWidth * 0.03125;
    u_xlat6 = u_xlat2.x * _Period + (-u_xlat4);
    u_xlat2.x = u_xlat2.x * _Period + u_xlat4;
    u_xlatb2 = u_xlat0<u_xlat2.x;
    u_xlatb0 = u_xlat6<u_xlat0;
    u_xlatb0 = u_xlatb2 && u_xlatb0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * _OverrideColor.xyz;
    SV_Target0.w = u_xlat10_1.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(1.0, 1.0, 1.0) : u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 176
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %122 %152 %161 %162 %166 %168 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %18 ArrayStride 18 
                                                   OpDecorate %19 ArrayStride 19 
                                                   OpMemberDecorate %20 0 Offset 20 
                                                   OpMemberDecorate %20 1 Offset 20 
                                                   OpMemberDecorate %20 2 Offset 20 
                                                   OpDecorate %20 Block 
                                                   OpDecorate %22 DescriptorSet 22 
                                                   OpDecorate %22 Binding 22 
                                                   OpDecorate %122 Location 122 
                                                   OpMemberDecorate %150 0 BuiltIn 150 
                                                   OpMemberDecorate %150 1 BuiltIn 150 
                                                   OpMemberDecorate %150 2 BuiltIn 150 
                                                   OpDecorate %150 Block 
                                                   OpDecorate %161 RelaxedPrecision 
                                                   OpDecorate %161 Location 161 
                                                   OpDecorate %162 Location 162 
                                                   OpDecorate %166 Location 166 
                                                   OpDecorate %168 Location 168 
                                            %2 = OpTypeVoid 
                                            %3 = OpTypeFunction %2 
                                            %6 = OpTypeFloat 32 
                                            %7 = OpTypeVector %6 4 
                                            %8 = OpTypePointer Private %7 
                             Private f32_4* %9 = OpVariable Private 
                                           %10 = OpTypePointer Input %7 
                              Input f32_4* %11 = OpVariable Input 
                                           %12 = OpTypeInt 32 0 
                                       u32 %13 = OpConstant 1 
                                           %14 = OpTypePointer Input %6 
                                       u32 %17 = OpConstant 4 
                                           %18 = OpTypeArray %7 %17 
                                           %19 = OpTypeArray %7 %17 
                                           %20 = OpTypeStruct %18 %19 %6 
                                           %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %22 = OpVariable Uniform 
                                           %23 = OpTypeInt 32 1 
                                       i32 %24 = OpConstant 0 
                                       i32 %25 = OpConstant 1 
                                           %26 = OpTypePointer Uniform %6 
                                       u32 %30 = OpConstant 0 
                                           %31 = OpTypePointer Private %6 
                                       i32 %42 = OpConstant 2 
                                       u32 %45 = OpConstant 2 
                                       i32 %53 = OpConstant 3 
                                       u32 %56 = OpConstant 3 
                                           %71 = OpTypeBool 
                                           %72 = OpTypePointer Private %71 
                             Private bool* %73 = OpVariable Private 
                                       f32 %74 = OpConstant 3.67402E-40 
                              Private f32* %78 = OpVariable Private 
                                           %79 = OpTypePointer Function %6 
                                       f32 %84 = OpConstant 3.67402E-40 
                                       f32 %86 = OpConstant 3.67402E-40 
                            Private f32_4* %96 = OpVariable Private 
                                           %99 = OpTypePointer Uniform %7 
                                          %121 = OpTypePointer Output %7 
                            Output f32_4* %122 = OpVariable Output 
                                          %149 = OpTypeArray %6 %13 
                                          %150 = OpTypeStruct %7 %6 %149 
                                          %151 = OpTypePointer Output %150 
     Output struct {f32_4; f32; f32[1];}* %152 = OpVariable Output 
                            Output f32_4* %161 = OpVariable Output 
                             Input f32_4* %162 = OpVariable Input 
                                          %164 = OpTypeVector %6 2 
                                          %165 = OpTypePointer Output %164 
                            Output f32_2* %166 = OpVariable Output 
                                          %167 = OpTypePointer Input %164 
                             Input f32_2* %168 = OpVariable Input 
                                          %170 = OpTypePointer Output %6 
                                       void %4 = OpFunction None %3 
                                            %5 = OpLabel 
                             Function f32* %80 = OpVariable Function 
                                Input f32* %15 = OpAccessChain %11 %13 
                                       f32 %16 = OpLoad %15 
                              Uniform f32* %27 = OpAccessChain %22 %24 %25 %13 
                                       f32 %28 = OpLoad %27 
                                       f32 %29 = OpFMul %16 %28 
                              Private f32* %32 = OpAccessChain %9 %30 
                                                   OpStore %32 %29 
                              Uniform f32* %33 = OpAccessChain %22 %24 %24 %13 
                                       f32 %34 = OpLoad %33 
                                Input f32* %35 = OpAccessChain %11 %30 
                                       f32 %36 = OpLoad %35 
                                       f32 %37 = OpFMul %34 %36 
                              Private f32* %38 = OpAccessChain %9 %30 
                                       f32 %39 = OpLoad %38 
                                       f32 %40 = OpFAdd %37 %39 
                              Private f32* %41 = OpAccessChain %9 %30 
                                                   OpStore %41 %40 
                              Uniform f32* %43 = OpAccessChain %22 %24 %42 %13 
                                       f32 %44 = OpLoad %43 
                                Input f32* %46 = OpAccessChain %11 %45 
                                       f32 %47 = OpLoad %46 
                                       f32 %48 = OpFMul %44 %47 
                              Private f32* %49 = OpAccessChain %9 %30 
                                       f32 %50 = OpLoad %49 
                                       f32 %51 = OpFAdd %48 %50 
                              Private f32* %52 = OpAccessChain %9 %30 
                                                   OpStore %52 %51 
                              Uniform f32* %54 = OpAccessChain %22 %24 %53 %13 
                                       f32 %55 = OpLoad %54 
                                Input f32* %57 = OpAccessChain %11 %56 
                                       f32 %58 = OpLoad %57 
                                       f32 %59 = OpFMul %55 %58 
                              Private f32* %60 = OpAccessChain %9 %30 
                                       f32 %61 = OpLoad %60 
                                       f32 %62 = OpFAdd %59 %61 
                              Private f32* %63 = OpAccessChain %9 %30 
                                                   OpStore %63 %62 
                              Private f32* %64 = OpAccessChain %9 %30 
                                       f32 %65 = OpLoad %64 
                              Uniform f32* %66 = OpAccessChain %22 %24 %53 %13 
                                       f32 %67 = OpLoad %66 
                                       f32 %68 = OpFNegate %67 
                                       f32 %69 = OpFAdd %65 %68 
                              Private f32* %70 = OpAccessChain %9 %30 
                                                   OpStore %70 %69 
                              Uniform f32* %75 = OpAccessChain %22 %42 
                                       f32 %76 = OpLoad %75 
                                      bool %77 = OpFOrdLessThan %74 %76 
                                                   OpStore %73 %77 
                                      bool %81 = OpLoad %73 
                                                   OpSelectionMerge %83 None 
                                                   OpBranchConditional %81 %82 %85 
                                           %82 = OpLabel 
                                                   OpStore %80 %84 
                                                   OpBranch %83 
                                           %85 = OpLabel 
                                                   OpStore %80 %86 
                                                   OpBranch %83 
                                           %83 = OpLabel 
                                       f32 %87 = OpLoad %80 
                                                   OpStore %78 %87 
                              Private f32* %88 = OpAccessChain %9 %30 
                                       f32 %89 = OpLoad %88 
                                       f32 %90 = OpLoad %78 
                                       f32 %91 = OpFMul %89 %90 
                                Input f32* %92 = OpAccessChain %11 %45 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %91 %93 
                              Private f32* %95 = OpAccessChain %9 %30 
                                                   OpStore %95 %94 
                                     f32_4 %97 = OpLoad %11 
                                     f32_4 %98 = OpVectorShuffle %97 %97 1 1 1 1 
                           Uniform f32_4* %100 = OpAccessChain %22 %24 %25 
                                    f32_4 %101 = OpLoad %100 
                                    f32_4 %102 = OpFMul %98 %101 
                                                   OpStore %96 %102 
                           Uniform f32_4* %103 = OpAccessChain %22 %24 %24 
                                    f32_4 %104 = OpLoad %103 
                                    f32_4 %105 = OpLoad %11 
                                    f32_4 %106 = OpVectorShuffle %105 %105 0 0 0 0 
                                    f32_4 %107 = OpFMul %104 %106 
                                    f32_4 %108 = OpLoad %96 
                                    f32_4 %109 = OpFAdd %107 %108 
                                                   OpStore %96 %109 
                           Uniform f32_4* %110 = OpAccessChain %22 %24 %42 
                                    f32_4 %111 = OpLoad %110 
                                    f32_4 %112 = OpLoad %9 
                                    f32_4 %113 = OpVectorShuffle %112 %112 0 0 0 0 
                                    f32_4 %114 = OpFMul %111 %113 
                                    f32_4 %115 = OpLoad %96 
                                    f32_4 %116 = OpFAdd %114 %115 
                                                   OpStore %9 %116 
                                    f32_4 %117 = OpLoad %9 
                           Uniform f32_4* %118 = OpAccessChain %22 %24 %53 
                                    f32_4 %119 = OpLoad %118 
                                    f32_4 %120 = OpFAdd %117 %119 
                                                   OpStore %96 %120 
                           Uniform f32_4* %123 = OpAccessChain %22 %24 %53 
                                    f32_4 %124 = OpLoad %123 
                                    f32_4 %125 = OpLoad %11 
                                    f32_4 %126 = OpVectorShuffle %125 %125 3 3 3 3 
                                    f32_4 %127 = OpFMul %124 %126 
                                    f32_4 %128 = OpLoad %9 
                                    f32_4 %129 = OpFAdd %127 %128 
                                                   OpStore %122 %129 
                                    f32_4 %130 = OpLoad %96 
                                    f32_4 %131 = OpVectorShuffle %130 %130 1 1 1 1 
                           Uniform f32_4* %132 = OpAccessChain %22 %25 %25 
                                    f32_4 %133 = OpLoad %132 
                                    f32_4 %134 = OpFMul %131 %133 
                                                   OpStore %9 %134 
                           Uniform f32_4* %135 = OpAccessChain %22 %25 %24 
                                    f32_4 %136 = OpLoad %135 
                                    f32_4 %137 = OpLoad %96 
                                    f32_4 %138 = OpVectorShuffle %137 %137 0 0 0 0 
                                    f32_4 %139 = OpFMul %136 %138 
                                    f32_4 %140 = OpLoad %9 
                                    f32_4 %141 = OpFAdd %139 %140 
                                                   OpStore %9 %141 
                           Uniform f32_4* %142 = OpAccessChain %22 %25 %42 
                                    f32_4 %143 = OpLoad %142 
                                    f32_4 %144 = OpLoad %96 
                                    f32_4 %145 = OpVectorShuffle %144 %144 2 2 2 2 
                                    f32_4 %146 = OpFMul %143 %145 
                                    f32_4 %147 = OpLoad %9 
                                    f32_4 %148 = OpFAdd %146 %147 
                                                   OpStore %9 %148 
                           Uniform f32_4* %153 = OpAccessChain %22 %25 %53 
                                    f32_4 %154 = OpLoad %153 
                                    f32_4 %155 = OpLoad %96 
                                    f32_4 %156 = OpVectorShuffle %155 %155 3 3 3 3 
                                    f32_4 %157 = OpFMul %154 %156 
                                    f32_4 %158 = OpLoad %9 
                                    f32_4 %159 = OpFAdd %157 %158 
                            Output f32_4* %160 = OpAccessChain %152 %24 
                                                   OpStore %160 %159 
                                    f32_4 %163 = OpLoad %162 
                                                   OpStore %161 %163 
                                    f32_2 %169 = OpLoad %168 
                                                   OpStore %166 %169 
                              Output f32* %171 = OpAccessChain %152 %24 %13 
                                      f32 %172 = OpLoad %171 
                                      f32 %173 = OpFNegate %172 
                              Output f32* %174 = OpAccessChain %152 %24 %13 
                                                   OpStore %174 %173 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 172
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %11 %141 %153 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 Location 11 
                                                     OpMemberDecorate %26 0 Offset 26 
                                                     OpMemberDecorate %26 1 Offset 26 
                                                     OpMemberDecorate %26 2 Offset 26 
                                                     OpMemberDecorate %26 3 Offset 26 
                                                     OpDecorate %26 Block 
                                                     OpDecorate %28 DescriptorSet 28 
                                                     OpDecorate %28 Binding 28 
                                                     OpDecorate %133 RelaxedPrecision 
                                                     OpDecorate %137 RelaxedPrecision 
                                                     OpDecorate %137 DescriptorSet 137 
                                                     OpDecorate %137 Binding 137 
                                                     OpDecorate %138 RelaxedPrecision 
                                                     OpDecorate %141 Location 141 
                                                     OpDecorate %144 RelaxedPrecision 
                                                     OpDecorate %145 RelaxedPrecision 
                                                     OpDecorate %153 RelaxedPrecision 
                                                     OpDecorate %153 Location 153 
                                                     OpDecorate %156 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypePointer Private %6 
                                 Private f32* %8 = OpVariable Private 
                                              %9 = OpTypeVector %6 4 
                                             %10 = OpTypePointer Input %9 
                                Input f32_4* %11 = OpVariable Input 
                                             %12 = OpTypeInt 32 0 
                                         u32 %13 = OpConstant 1 
                                             %14 = OpTypePointer Input %6 
                                         u32 %18 = OpConstant 0 
                                         f32 %23 = OpConstant 3.67402E-40 
                                             %26 = OpTypeStruct %9 %9 %6 %6 
                                             %27 = OpTypePointer Uniform %26 
   Uniform struct {f32_4; f32_4; f32; f32;}* %28 = OpVariable Uniform 
                                             %29 = OpTypeInt 32 1 
                                         i32 %30 = OpConstant 2 
                                             %31 = OpTypePointer Uniform %6 
                                             %35 = OpTypeBool 
                                             %36 = OpTypePointer Private %35 
                               Private bool* %37 = OpVariable Private 
                                             %45 = OpTypePointer Function %6 
                                             %59 = OpTypeVector %6 3 
                                             %60 = OpTypePointer Private %59 
                              Private f32_3* %61 = OpVariable Private 
                                         i32 %62 = OpConstant 0 
                                         f32 %65 = OpConstant 3.67402E-40 
                               Private bool* %74 = OpVariable Private 
                                Private f32* %98 = OpVariable Private 
                                         i32 %99 = OpConstant 3 
                                        f32 %102 = OpConstant 3.67402E-40 
                               Private f32* %104 = OpVariable Private 
                              Private bool* %125 = OpVariable Private 
                                            %132 = OpTypePointer Private %9 
                             Private f32_4* %133 = OpVariable Private 
                                            %134 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %135 = OpTypeSampledImage %134 
                                            %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2DSampled* %137 = OpVariable UniformConstant 
                                            %139 = OpTypeVector %6 2 
                                            %140 = OpTypePointer Input %139 
                               Input f32_2* %141 = OpVariable Input 
                                        i32 %146 = OpConstant 1 
                                            %147 = OpTypePointer Uniform %9 
                                            %152 = OpTypePointer Output %9 
                              Output f32_4* %153 = OpVariable Output 
                                        u32 %154 = OpConstant 3 
                                            %157 = OpTypePointer Output %6 
                                            %159 = OpTypePointer Function %59 
                                        f32 %164 = OpConstant 3.67402E-40 
                                      f32_3 %165 = OpConstantComposite %164 %164 %164 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                               Function f32* %46 = OpVariable Function 
                               Function f32* %86 = OpVariable Function 
                            Function f32_3* %160 = OpVariable Function 
                                  Input f32* %15 = OpAccessChain %11 %13 
                                         f32 %16 = OpLoad %15 
                                         f32 %17 = OpFNegate %16 
                                  Input f32* %19 = OpAccessChain %11 %18 
                                         f32 %20 = OpLoad %19 
                                         f32 %21 = OpFAdd %17 %20 
                                                     OpStore %8 %21 
                                         f32 %22 = OpLoad %8 
                                         f32 %24 = OpFMul %22 %23 
                                                     OpStore %8 %24 
                                         f32 %25 = OpLoad %8 
                                Uniform f32* %32 = OpAccessChain %28 %30 
                                         f32 %33 = OpLoad %32 
                                         f32 %34 = OpFDiv %25 %33 
                                                     OpStore %8 %34 
                                         f32 %38 = OpLoad %8 
                                         f32 %39 = OpLoad %8 
                                         f32 %40 = OpFNegate %39 
                                        bool %41 = OpFOrdGreaterThanEqual %38 %40 
                                                     OpStore %37 %41 
                                         f32 %42 = OpLoad %8 
                                         f32 %43 = OpExtInst %1 4 %42 
                                         f32 %44 = OpExtInst %1 10 %43 
                                                     OpStore %8 %44 
                                        bool %47 = OpLoad %37 
                                                     OpSelectionMerge %49 None 
                                                     OpBranchConditional %47 %48 %51 
                                             %48 = OpLabel 
                                         f32 %50 = OpLoad %8 
                                                     OpStore %46 %50 
                                                     OpBranch %49 
                                             %51 = OpLabel 
                                         f32 %52 = OpLoad %8 
                                         f32 %53 = OpFNegate %52 
                                                     OpStore %46 %53 
                                                     OpBranch %49 
                                             %49 = OpLabel 
                                         f32 %54 = OpLoad %46 
                                                     OpStore %8 %54 
                                         f32 %55 = OpLoad %8 
                                Uniform f32* %56 = OpAccessChain %28 %30 
                                         f32 %57 = OpLoad %56 
                                         f32 %58 = OpFMul %55 %57 
                                                     OpStore %8 %58 
                                Uniform f32* %63 = OpAccessChain %28 %62 %13 
                                         f32 %64 = OpLoad %63 
                                         f32 %66 = OpFMul %64 %65 
                                Private f32* %67 = OpAccessChain %61 %18 
                                                     OpStore %67 %66 
                                Private f32* %68 = OpAccessChain %61 %18 
                                         f32 %69 = OpLoad %68 
                                Uniform f32* %70 = OpAccessChain %28 %30 
                                         f32 %71 = OpLoad %70 
                                         f32 %72 = OpFDiv %69 %71 
                                Private f32* %73 = OpAccessChain %61 %18 
                                                     OpStore %73 %72 
                                Private f32* %75 = OpAccessChain %61 %18 
                                         f32 %76 = OpLoad %75 
                                Private f32* %77 = OpAccessChain %61 %18 
                                         f32 %78 = OpLoad %77 
                                         f32 %79 = OpFNegate %78 
                                        bool %80 = OpFOrdGreaterThanEqual %76 %79 
                                                     OpStore %74 %80 
                                Private f32* %81 = OpAccessChain %61 %18 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpExtInst %1 4 %82 
                                         f32 %84 = OpExtInst %1 10 %83 
                                Private f32* %85 = OpAccessChain %61 %18 
                                                     OpStore %85 %84 
                                        bool %87 = OpLoad %74 
                                                     OpSelectionMerge %89 None 
                                                     OpBranchConditional %87 %88 %92 
                                             %88 = OpLabel 
                                Private f32* %90 = OpAccessChain %61 %18 
                                         f32 %91 = OpLoad %90 
                                                     OpStore %86 %91 
                                                     OpBranch %89 
                                             %92 = OpLabel 
                                Private f32* %93 = OpAccessChain %61 %18 
                                         f32 %94 = OpLoad %93 
                                         f32 %95 = OpFNegate %94 
                                                     OpStore %86 %95 
                                                     OpBranch %89 
                                             %89 = OpLabel 
                                         f32 %96 = OpLoad %86 
                                Private f32* %97 = OpAccessChain %61 %18 
                                                     OpStore %97 %96 
                               Uniform f32* %100 = OpAccessChain %28 %99 
                                        f32 %101 = OpLoad %100 
                                        f32 %103 = OpFMul %101 %102 
                                                     OpStore %98 %103 
                               Private f32* %105 = OpAccessChain %61 %18 
                                        f32 %106 = OpLoad %105 
                               Uniform f32* %107 = OpAccessChain %28 %30 
                                        f32 %108 = OpLoad %107 
                                        f32 %109 = OpFMul %106 %108 
                                        f32 %110 = OpLoad %98 
                                        f32 %111 = OpFNegate %110 
                                        f32 %112 = OpFAdd %109 %111 
                                                     OpStore %104 %112 
                               Private f32* %113 = OpAccessChain %61 %18 
                                        f32 %114 = OpLoad %113 
                               Uniform f32* %115 = OpAccessChain %28 %30 
                                        f32 %116 = OpLoad %115 
                                        f32 %117 = OpFMul %114 %116 
                                        f32 %118 = OpLoad %98 
                                        f32 %119 = OpFAdd %117 %118 
                               Private f32* %120 = OpAccessChain %61 %18 
                                                     OpStore %120 %119 
                                        f32 %121 = OpLoad %8 
                               Private f32* %122 = OpAccessChain %61 %18 
                                        f32 %123 = OpLoad %122 
                                       bool %124 = OpFOrdLessThan %121 %123 
                                                     OpStore %37 %124 
                                        f32 %126 = OpLoad %104 
                                        f32 %127 = OpLoad %8 
                                       bool %128 = OpFOrdLessThan %126 %127 
                                                     OpStore %125 %128 
                                       bool %129 = OpLoad %37 
                                       bool %130 = OpLoad %125 
                                       bool %131 = OpLogicalAnd %129 %130 
                                                     OpStore %125 %131 
                 read_only Texture2DSampled %138 = OpLoad %137 
                                      f32_2 %142 = OpLoad %141 
                                      f32_4 %143 = OpImageSampleImplicitLod %138 %142 
                                                     OpStore %133 %143 
                                      f32_4 %144 = OpLoad %133 
                                      f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                             Uniform f32_4* %148 = OpAccessChain %28 %146 
                                      f32_4 %149 = OpLoad %148 
                                      f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                      f32_3 %151 = OpFMul %145 %150 
                                                     OpStore %61 %151 
                               Private f32* %155 = OpAccessChain %133 %154 
                                        f32 %156 = OpLoad %155 
                                Output f32* %158 = OpAccessChain %153 %154 
                                                     OpStore %158 %156 
                                       bool %161 = OpLoad %125 
                                                     OpSelectionMerge %163 None 
                                                     OpBranchConditional %161 %162 %166 
                                            %162 = OpLabel 
                                                     OpStore %160 %165 
                                                     OpBranch %163 
                                            %166 = OpLabel 
                                      f32_3 %167 = OpLoad %61 
                                                     OpStore %160 %167 
                                                     OpBranch %163 
                                            %163 = OpLabel 
                                      f32_3 %168 = OpLoad %160 
                                      f32_4 %169 = OpLoad %153 
                                      f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                     OpStore %153 %170 
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