//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/SimpleBraveOutlineSpriteMask" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_SelfIllumination ("Min Brightness", Float) = 0
_LuminanceCutoff ("Luminance Cutoff", Float) = 0
_AtlasData ("Atlas Data", Vector) = (1,1,1,1)
_ValueMaximum ("Max Value", Float) = 1
_ValueMinimum ("Min value", Float) = 1
}
SubShader {
 LOD 110
 Tags { "EnemyProjectile" = "EnemyProjectile" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" "UnlitTiltedOutline" = "UnlitTiltedOutline" }
 Pass {
  LOD 110
  Tags { "EnemyProjectile" = "EnemyProjectile" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" "UnlitTiltedOutline" = "UnlitTiltedOutline" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 16907
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _AtlasData;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec3 in_NORMAL0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_NORMAL0.xy * _AtlasData.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0625, 0.0625);
    u_xlat0.z = -1.0625;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _LuminanceCutoff;
uniform 	float _ValueMaximum;
uniform 	float _ValueMinimum;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = u_xlat0<_LuminanceCutoff;
    u_xlat0 = (u_xlatb0) ? 0.0 : u_xlat10_0.w;
    u_xlat1 = u_xlat0 + -0.100000001;
    SV_Target0.w = u_xlat0;
    u_xlatb0 = u_xlat1<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.x = 1.0;
    SV_Target0.yz = vec2(_ValueMaximum, _ValueMinimum);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 152
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %46 %102 %112 %113 %135 %143 
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
                                             %146 = OpTypePointer Output %6 
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
                                 Output f32* %147 = OpAccessChain %102 %55 %98 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                 Output f32* %150 = OpAccessChain %102 %55 %98 
                                                      OpStore %150 %149 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 87
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %60 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpMemberDecorate %34 0 Offset 34 
                                                    OpMemberDecorate %34 1 Offset 34 
                                                    OpMemberDecorate %34 2 Offset 34 
                                                    OpDecorate %34 Block 
                                                    OpDecorate %36 DescriptorSet 36 
                                                    OpDecorate %36 Binding 36 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %60 Location 60 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
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
                                            %22 = OpTypeVector %6 3 
                                        f32 %25 = OpConstant 3.67402E-40 
                                        f32 %26 = OpConstant 3.67402E-40 
                                        f32 %27 = OpConstant 3.67402E-40 
                                      f32_3 %28 = OpConstantComposite %25 %26 %27 
                                            %30 = OpTypeBool 
                                            %31 = OpTypePointer Private %30 
                              Private bool* %32 = OpVariable Private 
                                            %34 = OpTypeStruct %6 %6 %6 
                                            %35 = OpTypePointer Uniform %34 
           Uniform struct {f32; f32; f32;}* %36 = OpVariable Uniform 
                                            %37 = OpTypeInt 32 1 
                                        i32 %38 = OpConstant 0 
                                            %39 = OpTypePointer Uniform %6 
                                            %43 = OpTypePointer Function %6 
                                        f32 %48 = OpConstant 3.67402E-40 
                                            %50 = OpTypeInt 32 0 
                                        u32 %51 = OpConstant 3 
                               Private f32* %55 = OpVariable Private 
                                        f32 %57 = OpConstant 3.67402E-40 
                                            %59 = OpTypePointer Output %7 
                              Output f32_4* %60 = OpVariable Output 
                                            %62 = OpTypePointer Output %6 
                                        i32 %67 = OpConstant 1 
                                        i32 %69 = OpConstant -1 
                                        f32 %75 = OpConstant 3.67402E-40 
                                        u32 %76 = OpConstant 0 
                                        i32 %80 = OpConstant 2 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %44 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %23 = OpLoad %9 
                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32 %29 = OpDot %24 %28 
                                                    OpStore %21 %29 
                                        f32 %33 = OpLoad %21 
                               Uniform f32* %40 = OpAccessChain %36 %38 
                                        f32 %41 = OpLoad %40 
                                       bool %42 = OpFOrdLessThan %33 %41 
                                                    OpStore %32 %42 
                                       bool %45 = OpLoad %32 
                                                    OpSelectionMerge %47 None 
                                                    OpBranchConditional %45 %46 %49 
                                            %46 = OpLabel 
                                                    OpStore %44 %48 
                                                    OpBranch %47 
                                            %49 = OpLabel 
                               Private f32* %52 = OpAccessChain %9 %51 
                                        f32 %53 = OpLoad %52 
                                                    OpStore %44 %53 
                                                    OpBranch %47 
                                            %47 = OpLabel 
                                        f32 %54 = OpLoad %44 
                                                    OpStore %21 %54 
                                        f32 %56 = OpLoad %21 
                                        f32 %58 = OpFAdd %56 %57 
                                                    OpStore %55 %58 
                                        f32 %61 = OpLoad %21 
                                Output f32* %63 = OpAccessChain %60 %51 
                                                    OpStore %63 %61 
                                        f32 %64 = OpLoad %55 
                                       bool %65 = OpFOrdLessThan %64 %48 
                                                    OpStore %32 %65 
                                       bool %66 = OpLoad %32 
                                        i32 %68 = OpSelect %66 %67 %38 
                                        i32 %70 = OpIMul %68 %69 
                                       bool %71 = OpINotEqual %70 %38 
                                                    OpSelectionMerge %73 None 
                                                    OpBranchConditional %71 %72 %73 
                                            %72 = OpLabel 
                                                    OpKill
                                            %73 = OpLabel 
                                Output f32* %77 = OpAccessChain %60 %76 
                                                    OpStore %77 %75 
                               Uniform f32* %78 = OpAccessChain %36 %67 
                                        f32 %79 = OpLoad %78 
                               Uniform f32* %81 = OpAccessChain %36 %80 
                                        f32 %82 = OpLoad %81 
                                      f32_2 %83 = OpCompositeConstruct %79 %82 
                                      f32_4 %84 = OpLoad %60 
                                      f32_4 %85 = OpVectorShuffle %84 %83 0 4 5 3 
                                                    OpStore %60 %85 
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