//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "tk2d/CutoutVertexColorTintableTilted" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_SaturationModifier ("Saturation", Float) = 1
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
  GpuProgramID 33857
Program "vp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
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
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform 	float _SaturationModifier;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat3.x = u_xlat1 * 1.125 + 0.25;
    u_xlat3.xyz = u_xlat3.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat0.xyz = (-vec3(u_xlat1)) + u_xlat0.xyz;
    SV_Target0.xyz = vec3(vec3(_SaturationModifier, _SaturationModifier, _SaturationModifier)) * u_xlat0.xyz + vec3(u_xlat1);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 131
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %106 %116 %117 %121 %123 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %104 0 BuiltIn 104 
                                                      OpMemberDecorate %104 1 BuiltIn 104 
                                                      OpMemberDecorate %104 2 BuiltIn 104 
                                                      OpDecorate %104 Block 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %123 Location 123 
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
                                          f32 %22 = OpConstant 3.67402E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          i32 %29 = OpConstant 2 
                                          f32 %36 = OpConstant 3.67402E-40 
                                 Private f32* %39 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                          i32 %59 = OpConstant 0 
                                          i32 %60 = OpConstant 1 
                                              %61 = OpTypePointer Uniform %7 
                               Private f32_4* %83 = OpVariable Private 
                                             %103 = OpTypeArray %6 %47 
                                             %104 = OpTypeStruct %7 %6 %103 
                                             %105 = OpTypePointer Output %104 
        Output struct {f32_4; f32; f32[1];}* %106 = OpVariable Output 
                                             %114 = OpTypePointer Output %7 
                               Output f32_4* %116 = OpVariable Output 
                                Input f32_4* %117 = OpVariable Input 
                                             %119 = OpTypeVector %6 2 
                                             %120 = OpTypePointer Output %119 
                               Output f32_2* %121 = OpVariable Output 
                                             %122 = OpTypePointer Input %119 
                                Input f32_2* %123 = OpVariable Input 
                                             %125 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %16 %29 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpFMul %28 %31 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                                      OpStore %33 %32 
                                 Private f32* %34 = OpAccessChain %9 %24 
                                          f32 %35 = OpLoad %34 
                                          f32 %37 = OpFMul %35 %36 
                                 Private f32* %38 = OpAccessChain %9 %24 
                                                      OpStore %38 %37 
                                 Uniform f32* %40 = OpAccessChain %16 %29 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFAdd %42 %43 
                                                      OpStore %39 %44 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %39 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFAdd %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %24 
                                                      OpStore %56 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                               Uniform f32_4* %62 = OpAccessChain %16 %59 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %58 %63 
                                                      OpStore %9 %64 
                               Uniform f32_4* %65 = OpAccessChain %16 %59 %59 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %9 %71 
                               Uniform f32_4* %72 = OpAccessChain %16 %59 %29 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                               Uniform f32_4* %80 = OpAccessChain %16 %59 %18 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %79 %81 
                                                      OpStore %9 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %16 %60 %60 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %85 %87 
                                                      OpStore %83 %88 
                               Uniform f32_4* %89 = OpAccessChain %16 %60 %59 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %83 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %83 %95 
                               Uniform f32_4* %96 = OpAccessChain %16 %60 %29 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %83 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %83 %102 
                              Uniform f32_4* %107 = OpAccessChain %16 %60 %18 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %83 
                                       f32_4 %113 = OpFAdd %111 %112 
                               Output f32_4* %115 = OpAccessChain %106 %59 
                                                      OpStore %115 %113 
                                       f32_4 %118 = OpLoad %117 
                                                      OpStore %116 %118 
                                       f32_2 %124 = OpLoad %123 
                                                      OpStore %121 %124 
                                 Output f32* %126 = OpAccessChain %106 %59 %47 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFNegate %127 
                                 Output f32* %129 = OpAccessChain %106 %59 %47 
                                                      OpStore %129 %128 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 127
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %27 %95 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %27 Location 27 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpMemberDecorate %74 0 RelaxedPrecision 
                                                    OpMemberDecorate %74 0 Offset 74 
                                                    OpMemberDecorate %74 1 Offset 74 
                                                    OpDecorate %74 Block 
                                                    OpDecorate %76 DescriptorSet 76 
                                                    OpDecorate %76 Binding 76 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %95 Location 95 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
                                                    OpDecorate %120 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %122 RelaxedPrecision 
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
                                            %26 = OpTypePointer Input %7 
                               Input f32_4* %27 = OpVariable Input 
                                            %28 = OpTypePointer Input %6 
                                        f32 %32 = OpConstant 3.67402E-40 
                             Private f32_4* %34 = OpVariable Private 
                                            %38 = OpTypeBool 
                                            %39 = OpTypePointer Private %38 
                              Private bool* %40 = OpVariable Private 
                                        f32 %42 = OpConstant 3.67402E-40 
                                            %45 = OpTypeInt 32 1 
                                        i32 %46 = OpConstant 0 
                                        i32 %47 = OpConstant 1 
                                        i32 %49 = OpConstant -1 
                                            %55 = OpTypeVector %6 3 
                                        f32 %58 = OpConstant 3.67402E-40 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        f32 %60 = OpConstant 3.67402E-40 
                                      f32_3 %61 = OpConstantComposite %58 %59 %60 
                                            %63 = OpTypePointer Private %55 
                             Private f32_3* %64 = OpVariable Private 
                                        f32 %66 = OpConstant 3.67402E-40 
                                        f32 %68 = OpConstant 3.67402E-40 
                                        u32 %70 = OpConstant 0 
                                            %74 = OpTypeStruct %7 %6 
                                            %75 = OpTypePointer Uniform %74 
              Uniform struct {f32_4; f32;}* %76 = OpVariable Uniform 
                                            %77 = OpTypePointer Uniform %7 
                                            %94 = OpTypePointer Output %7 
                              Output f32_4* %95 = OpVariable Output 
                                            %98 = OpTypePointer Output %6 
                            Private f32_3* %105 = OpVariable Private 
                                           %106 = OpTypePointer Uniform %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %24 = OpAccessChain %9 %23 
                                        f32 %25 = OpLoad %24 
                                 Input f32* %29 = OpAccessChain %27 %23 
                                        f32 %30 = OpLoad %29 
                                        f32 %31 = OpFMul %25 %30 
                                        f32 %33 = OpFAdd %31 %32 
                                                    OpStore %21 %33 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpLoad %27 
                                      f32_4 %37 = OpFMul %35 %36 
                                                    OpStore %34 %37 
                                        f32 %41 = OpLoad %21 
                                       bool %43 = OpFOrdLessThan %41 %42 
                                                    OpStore %40 %43 
                                       bool %44 = OpLoad %40 
                                        i32 %48 = OpSelect %44 %47 %46 
                                        i32 %50 = OpIMul %48 %49 
                                       bool %51 = OpINotEqual %50 %46 
                                                    OpSelectionMerge %53 None 
                                                    OpBranchConditional %51 %52 %53 
                                            %52 = OpLabel 
                                                    OpKill
                                            %53 = OpLabel 
                                      f32_4 %56 = OpLoad %34 
                                      f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32 %62 = OpDot %57 %61 
                                                    OpStore %21 %62 
                                        f32 %65 = OpLoad %21 
                                        f32 %67 = OpFMul %65 %66 
                                        f32 %69 = OpFAdd %67 %68 
                               Private f32* %71 = OpAccessChain %64 %70 
                                                    OpStore %71 %69 
                                      f32_3 %72 = OpLoad %64 
                                      f32_3 %73 = OpVectorShuffle %72 %72 0 0 0 
                             Uniform f32_4* %78 = OpAccessChain %76 %46 
                                      f32_4 %79 = OpLoad %78 
                                      f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                      f32_3 %81 = OpFMul %73 %80 
                                      f32_4 %82 = OpLoad %34 
                                      f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                      f32_3 %84 = OpFNegate %83 
                                      f32_3 %85 = OpFAdd %81 %84 
                                                    OpStore %64 %85 
                             Uniform f32_4* %86 = OpAccessChain %76 %46 
                                      f32_4 %87 = OpLoad %86 
                                      f32_3 %88 = OpVectorShuffle %87 %87 3 3 3 
                                      f32_3 %89 = OpLoad %64 
                                      f32_3 %90 = OpFMul %88 %89 
                                      f32_4 %91 = OpLoad %34 
                                      f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                      f32_3 %93 = OpFAdd %90 %92 
                                                    OpStore %64 %93 
                               Private f32* %96 = OpAccessChain %34 %23 
                                        f32 %97 = OpLoad %96 
                                Output f32* %99 = OpAccessChain %95 %23 
                                                    OpStore %99 %97 
                                       f32 %100 = OpLoad %21 
                                     f32_3 %101 = OpCompositeConstruct %100 %100 %100 
                                     f32_3 %102 = OpFNegate %101 
                                     f32_3 %103 = OpLoad %64 
                                     f32_3 %104 = OpFAdd %102 %103 
                                                    OpStore %64 %104 
                              Uniform f32* %107 = OpAccessChain %76 %47 
                                       f32 %108 = OpLoad %107 
                              Uniform f32* %109 = OpAccessChain %76 %47 
                                       f32 %110 = OpLoad %109 
                              Uniform f32* %111 = OpAccessChain %76 %47 
                                       f32 %112 = OpLoad %111 
                                     f32_3 %113 = OpCompositeConstruct %108 %110 %112 
                                       f32 %114 = OpCompositeExtract %113 0 
                                       f32 %115 = OpCompositeExtract %113 1 
                                       f32 %116 = OpCompositeExtract %113 2 
                                     f32_3 %117 = OpCompositeConstruct %114 %115 %116 
                                     f32_3 %118 = OpLoad %64 
                                     f32_3 %119 = OpFMul %117 %118 
                                       f32 %120 = OpLoad %21 
                                     f32_3 %121 = OpCompositeConstruct %120 %120 %120 
                                     f32_3 %122 = OpFAdd %119 %121 
                                                    OpStore %105 %122 
                                     f32_3 %123 = OpLoad %105 
                                     f32_4 %124 = OpLoad %95 
                                     f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                    OpStore %95 %125 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
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
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = _ReflectionYOffset + -0.0625;
    u_xlat0.x = u_xlat0.x * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat2 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat2 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform 	float _SaturationModifier;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat1.x * 1.125 + 0.25;
    u_xlat5.xyz = u_xlat5.xxx * _OverrideColor.xyz + (-u_xlat0.xyz);
    u_xlat0.xyz = _OverrideColor.www * u_xlat5.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat0.xyz = (-u_xlat1.xxx) + u_xlat0.xyz;
    u_xlat0.xyw = vec3(vec3(_SaturationModifier, _SaturationModifier, _SaturationModifier)) * u_xlat0.yzx + u_xlat1.xxx;
    u_xlatb1 = u_xlat0.x>=u_xlat0.y;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat1.xxxx * u_xlat3 + u_xlat2;
    u_xlatb2 = u_xlat0.w>=u_xlat1.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat1.xyw;
    u_xlat1.xyw = u_xlat0.wyx;
    u_xlat1 = (-u_xlat0) + u_xlat1;
    u_xlat0 = u_xlat2.xxxx * u_xlat1 + u_xlat0;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat5.x = u_xlat1.x * 6.0 + 1.00000001e-010;
    u_xlat4.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat4.x = u_xlat4.x / u_xlat5.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat4.xyz = abs(u_xlat4.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat0.x + 1.00000001e-010;
    u_xlat1.x = u_xlat1.x / u_xlat5.x;
    u_xlat4.xyz = u_xlat1.xxx * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 131
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %106 %116 %117 %121 %123 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %104 0 BuiltIn 104 
                                                      OpMemberDecorate %104 1 BuiltIn 104 
                                                      OpMemberDecorate %104 2 BuiltIn 104 
                                                      OpDecorate %104 Block 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %116 Location 116 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %123 Location 123 
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
                                          f32 %22 = OpConstant 3.67402E-40 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                          i32 %29 = OpConstant 2 
                                          f32 %36 = OpConstant 3.67402E-40 
                                 Private f32* %39 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                                          u32 %47 = OpConstant 1 
                                              %48 = OpTypePointer Input %6 
                                          i32 %59 = OpConstant 0 
                                          i32 %60 = OpConstant 1 
                                              %61 = OpTypePointer Uniform %7 
                               Private f32_4* %83 = OpVariable Private 
                                             %103 = OpTypeArray %6 %47 
                                             %104 = OpTypeStruct %7 %6 %103 
                                             %105 = OpTypePointer Output %104 
        Output struct {f32_4; f32; f32[1];}* %106 = OpVariable Output 
                                             %114 = OpTypePointer Output %7 
                               Output f32_4* %116 = OpVariable Output 
                                Input f32_4* %117 = OpVariable Input 
                                             %119 = OpTypeVector %6 2 
                                             %120 = OpTypePointer Output %119 
                               Output f32_2* %121 = OpVariable Output 
                                             %122 = OpTypePointer Input %119 
                                Input f32_2* %123 = OpVariable Input 
                                             %125 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                          f32 %23 = OpFAdd %21 %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Private f32* %27 = OpAccessChain %9 %24 
                                          f32 %28 = OpLoad %27 
                                 Uniform f32* %30 = OpAccessChain %16 %29 
                                          f32 %31 = OpLoad %30 
                                          f32 %32 = OpFMul %28 %31 
                                 Private f32* %33 = OpAccessChain %9 %24 
                                                      OpStore %33 %32 
                                 Private f32* %34 = OpAccessChain %9 %24 
                                          f32 %35 = OpLoad %34 
                                          f32 %37 = OpFMul %35 %36 
                                 Private f32* %38 = OpAccessChain %9 %24 
                                                      OpStore %38 %37 
                                 Uniform f32* %40 = OpAccessChain %16 %29 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFNegate %41 
                                          f32 %44 = OpFAdd %42 %43 
                                                      OpStore %39 %44 
                                   Input f32* %49 = OpAccessChain %46 %47 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpLoad %39 
                                          f32 %52 = OpFMul %50 %51 
                                 Private f32* %53 = OpAccessChain %9 %24 
                                          f32 %54 = OpLoad %53 
                                          f32 %55 = OpFAdd %52 %54 
                                 Private f32* %56 = OpAccessChain %9 %24 
                                                      OpStore %56 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                               Uniform f32_4* %62 = OpAccessChain %16 %59 %60 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %58 %63 
                                                      OpStore %9 %64 
                               Uniform f32_4* %65 = OpAccessChain %16 %59 %59 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %9 %71 
                               Uniform f32_4* %72 = OpAccessChain %16 %59 %29 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                               Uniform f32_4* %80 = OpAccessChain %16 %59 %18 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %79 %81 
                                                      OpStore %9 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %16 %60 %60 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %85 %87 
                                                      OpStore %83 %88 
                               Uniform f32_4* %89 = OpAccessChain %16 %60 %59 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %83 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %83 %95 
                               Uniform f32_4* %96 = OpAccessChain %16 %60 %29 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %83 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %83 %102 
                              Uniform f32_4* %107 = OpAccessChain %16 %60 %18 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %109 3 3 3 3 
                                       f32_4 %111 = OpFMul %108 %110 
                                       f32_4 %112 = OpLoad %83 
                                       f32_4 %113 = OpFAdd %111 %112 
                               Output f32_4* %115 = OpAccessChain %106 %59 
                                                      OpStore %115 %113 
                                       f32_4 %118 = OpLoad %117 
                                                      OpStore %116 %118 
                                       f32_2 %124 = OpLoad %123 
                                                      OpStore %121 %124 
                                 Output f32* %126 = OpAccessChain %106 %59 %47 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFNegate %127 
                                 Output f32* %129 = OpAccessChain %106 %59 %47 
                                                      OpStore %129 %128 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 286
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %27 %95 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %27 Location 27 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpMemberDecorate %74 0 RelaxedPrecision 
                                                    OpMemberDecorate %74 0 Offset 74 
                                                    OpMemberDecorate %74 1 Offset 74 
                                                    OpDecorate %74 Block 
                                                    OpDecorate %76 DescriptorSet 76 
                                                    OpDecorate %76 Binding 76 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %95 Location 95 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
                                                    OpDecorate %120 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %122 RelaxedPrecision 
                                                    OpDecorate %123 RelaxedPrecision 
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
                                            %26 = OpTypePointer Input %7 
                               Input f32_4* %27 = OpVariable Input 
                                            %28 = OpTypePointer Input %6 
                                        f32 %32 = OpConstant 3.67402E-40 
                             Private f32_4* %34 = OpVariable Private 
                                            %38 = OpTypeBool 
                                            %39 = OpTypePointer Private %38 
                              Private bool* %40 = OpVariable Private 
                                        f32 %42 = OpConstant 3.67402E-40 
                                            %45 = OpTypeInt 32 1 
                                        i32 %46 = OpConstant 0 
                                        i32 %47 = OpConstant 1 
                                        i32 %49 = OpConstant -1 
                                            %55 = OpTypeVector %6 3 
                                        f32 %58 = OpConstant 3.67402E-40 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        f32 %60 = OpConstant 3.67402E-40 
                                      f32_3 %61 = OpConstantComposite %58 %59 %60 
                                            %63 = OpTypePointer Private %55 
                             Private f32_3* %64 = OpVariable Private 
                                        f32 %66 = OpConstant 3.67402E-40 
                                        f32 %68 = OpConstant 3.67402E-40 
                                        u32 %70 = OpConstant 0 
                                            %74 = OpTypeStruct %7 %6 
                                            %75 = OpTypePointer Uniform %74 
              Uniform struct {f32_4; f32;}* %76 = OpVariable Uniform 
                                            %77 = OpTypePointer Uniform %7 
                                            %94 = OpTypePointer Output %7 
                              Output f32_4* %95 = OpVariable Output 
                                            %98 = OpTypePointer Output %6 
                            Private f32_4* %105 = OpVariable Private 
                                           %106 = OpTypePointer Uniform %6 
                                       u32 %128 = OpConstant 1 
                            Private f32_3* %132 = OpVariable Private 
                                           %133 = OpTypePointer Function %6 
                                       f32 %138 = OpConstant 3.67402E-40 
                            Private f32_4* %142 = OpVariable Private 
                            Private f32_4* %147 = OpVariable Private 
                                       f32 %156 = OpConstant 3.67402E-40 
                                       u32 %157 = OpConstant 2 
                                       f32 %159 = OpConstant 3.67402E-40 
                            Private f32_3* %212 = OpVariable Private 
                                       f32 %215 = OpConstant 3.67402E-40 
                                       f32 %217 = OpConstant 3.67402E-40 
                              Private f32* %220 = OpVariable Private 
                                       f32 %241 = OpConstant 3.67402E-40 
                                     f32_3 %242 = OpConstantComposite %138 %159 %241 
                                     f32_3 %247 = OpConstantComposite %215 %215 %215 
                                       f32 %249 = OpConstant 3.67402E-40 
                                     f32_3 %250 = OpConstantComposite %249 %249 %249 
                                     f32_3 %254 = OpConstantComposite %156 %156 %156 
                                     f32_3 %276 = OpConstantComposite %138 %138 %138 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                             Function f32* %134 = OpVariable Function 
                             Function f32* %174 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %24 = OpAccessChain %9 %23 
                                        f32 %25 = OpLoad %24 
                                 Input f32* %29 = OpAccessChain %27 %23 
                                        f32 %30 = OpLoad %29 
                                        f32 %31 = OpFMul %25 %30 
                                        f32 %33 = OpFAdd %31 %32 
                                                    OpStore %21 %33 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpLoad %27 
                                      f32_4 %37 = OpFMul %35 %36 
                                                    OpStore %34 %37 
                                        f32 %41 = OpLoad %21 
                                       bool %43 = OpFOrdLessThan %41 %42 
                                                    OpStore %40 %43 
                                       bool %44 = OpLoad %40 
                                        i32 %48 = OpSelect %44 %47 %46 
                                        i32 %50 = OpIMul %48 %49 
                                       bool %51 = OpINotEqual %50 %46 
                                                    OpSelectionMerge %53 None 
                                                    OpBranchConditional %51 %52 %53 
                                            %52 = OpLabel 
                                                    OpKill
                                            %53 = OpLabel 
                                      f32_4 %56 = OpLoad %34 
                                      f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32 %62 = OpDot %57 %61 
                                                    OpStore %21 %62 
                                        f32 %65 = OpLoad %21 
                                        f32 %67 = OpFMul %65 %66 
                                        f32 %69 = OpFAdd %67 %68 
                               Private f32* %71 = OpAccessChain %64 %70 
                                                    OpStore %71 %69 
                                      f32_3 %72 = OpLoad %64 
                                      f32_3 %73 = OpVectorShuffle %72 %72 0 0 0 
                             Uniform f32_4* %78 = OpAccessChain %76 %46 
                                      f32_4 %79 = OpLoad %78 
                                      f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                      f32_3 %81 = OpFMul %73 %80 
                                      f32_4 %82 = OpLoad %34 
                                      f32_3 %83 = OpVectorShuffle %82 %82 0 1 2 
                                      f32_3 %84 = OpFNegate %83 
                                      f32_3 %85 = OpFAdd %81 %84 
                                                    OpStore %64 %85 
                             Uniform f32_4* %86 = OpAccessChain %76 %46 
                                      f32_4 %87 = OpLoad %86 
                                      f32_3 %88 = OpVectorShuffle %87 %87 3 3 3 
                                      f32_3 %89 = OpLoad %64 
                                      f32_3 %90 = OpFMul %88 %89 
                                      f32_4 %91 = OpLoad %34 
                                      f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                      f32_3 %93 = OpFAdd %90 %92 
                                                    OpStore %64 %93 
                               Private f32* %96 = OpAccessChain %34 %23 
                                        f32 %97 = OpLoad %96 
                                Output f32* %99 = OpAccessChain %95 %23 
                                                    OpStore %99 %97 
                                       f32 %100 = OpLoad %21 
                                     f32_3 %101 = OpCompositeConstruct %100 %100 %100 
                                     f32_3 %102 = OpFNegate %101 
                                     f32_3 %103 = OpLoad %64 
                                     f32_3 %104 = OpFAdd %102 %103 
                                                    OpStore %64 %104 
                              Uniform f32* %107 = OpAccessChain %76 %47 
                                       f32 %108 = OpLoad %107 
                              Uniform f32* %109 = OpAccessChain %76 %47 
                                       f32 %110 = OpLoad %109 
                              Uniform f32* %111 = OpAccessChain %76 %47 
                                       f32 %112 = OpLoad %111 
                                     f32_3 %113 = OpCompositeConstruct %108 %110 %112 
                                       f32 %114 = OpCompositeExtract %113 0 
                                       f32 %115 = OpCompositeExtract %113 1 
                                       f32 %116 = OpCompositeExtract %113 2 
                                     f32_3 %117 = OpCompositeConstruct %114 %115 %116 
                                     f32_3 %118 = OpLoad %64 
                                     f32_3 %119 = OpVectorShuffle %118 %118 1 2 0 
                                     f32_3 %120 = OpFMul %117 %119 
                                       f32 %121 = OpLoad %21 
                                     f32_3 %122 = OpCompositeConstruct %121 %121 %121 
                                     f32_3 %123 = OpFAdd %120 %122 
                                     f32_4 %124 = OpLoad %105 
                                     f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 6 
                                                    OpStore %105 %125 
                              Private f32* %126 = OpAccessChain %105 %70 
                                       f32 %127 = OpLoad %126 
                              Private f32* %129 = OpAccessChain %105 %128 
                                       f32 %130 = OpLoad %129 
                                      bool %131 = OpFOrdGreaterThanEqual %127 %130 
                                                    OpStore %40 %131 
                                      bool %135 = OpLoad %40 
                                                    OpSelectionMerge %137 None 
                                                    OpBranchConditional %135 %136 %139 
                                           %136 = OpLabel 
                                                    OpStore %134 %138 
                                                    OpBranch %137 
                                           %139 = OpLabel 
                                                    OpStore %134 %42 
                                                    OpBranch %137 
                                           %137 = OpLabel 
                                       f32 %140 = OpLoad %134 
                              Private f32* %141 = OpAccessChain %132 %70 
                                                    OpStore %141 %140 
                                     f32_4 %143 = OpLoad %105 
                                     f32_2 %144 = OpVectorShuffle %143 %143 1 0 
                                     f32_4 %145 = OpLoad %142 
                                     f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
                                                    OpStore %142 %146 
                                     f32_4 %148 = OpLoad %105 
                                     f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                     f32_4 %150 = OpLoad %142 
                                     f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                     f32_2 %152 = OpFNegate %151 
                                     f32_2 %153 = OpFAdd %149 %152 
                                     f32_4 %154 = OpLoad %147 
                                     f32_4 %155 = OpVectorShuffle %154 %153 4 5 2 3 
                                                    OpStore %147 %155 
                              Private f32* %158 = OpAccessChain %142 %157 
                                                    OpStore %158 %156 
                              Private f32* %160 = OpAccessChain %142 %23 
                                                    OpStore %160 %159 
                              Private f32* %161 = OpAccessChain %147 %157 
                                                    OpStore %161 %138 
                              Private f32* %162 = OpAccessChain %147 %23 
                                                    OpStore %162 %156 
                                     f32_3 %163 = OpLoad %132 
                                     f32_4 %164 = OpVectorShuffle %163 %163 0 0 0 0 
                                     f32_4 %165 = OpLoad %147 
                                     f32_4 %166 = OpFMul %164 %165 
                                     f32_4 %167 = OpLoad %142 
                                     f32_4 %168 = OpFAdd %166 %167 
                                                    OpStore %142 %168 
                              Private f32* %169 = OpAccessChain %105 %23 
                                       f32 %170 = OpLoad %169 
                              Private f32* %171 = OpAccessChain %142 %70 
                                       f32 %172 = OpLoad %171 
                                      bool %173 = OpFOrdGreaterThanEqual %170 %172 
                                                    OpStore %40 %173 
                                      bool %175 = OpLoad %40 
                                                    OpSelectionMerge %177 None 
                                                    OpBranchConditional %175 %176 %178 
                                           %176 = OpLabel 
                                                    OpStore %174 %138 
                                                    OpBranch %177 
                                           %178 = OpLabel 
                                                    OpStore %174 %42 
                                                    OpBranch %177 
                                           %177 = OpLabel 
                                       f32 %179 = OpLoad %174 
                              Private f32* %180 = OpAccessChain %132 %70 
                                                    OpStore %180 %179 
                                     f32_4 %181 = OpLoad %142 
                                     f32_3 %182 = OpVectorShuffle %181 %181 0 1 3 
                                     f32_4 %183 = OpLoad %105 
                                     f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                    OpStore %105 %184 
                                     f32_4 %185 = OpLoad %105 
                                     f32_3 %186 = OpVectorShuffle %185 %185 3 1 0 
                                     f32_4 %187 = OpLoad %142 
                                     f32_4 %188 = OpVectorShuffle %187 %186 4 5 2 6 
                                                    OpStore %142 %188 
                                     f32_4 %189 = OpLoad %105 
                                     f32_4 %190 = OpFNegate %189 
                                     f32_4 %191 = OpLoad %142 
                                     f32_4 %192 = OpFAdd %190 %191 
                                                    OpStore %142 %192 
                                     f32_3 %193 = OpLoad %132 
                                     f32_4 %194 = OpVectorShuffle %193 %193 0 0 0 0 
                                     f32_4 %195 = OpLoad %142 
                                     f32_4 %196 = OpFMul %194 %195 
                                     f32_4 %197 = OpLoad %105 
                                     f32_4 %198 = OpFAdd %196 %197 
                                                    OpStore %105 %198 
                              Private f32* %199 = OpAccessChain %105 %128 
                                       f32 %200 = OpLoad %199 
                              Private f32* %201 = OpAccessChain %105 %23 
                                       f32 %202 = OpLoad %201 
                                       f32 %203 = OpExtInst %1 37 %200 %202 
                              Private f32* %204 = OpAccessChain %132 %70 
                                                    OpStore %204 %203 
                              Private f32* %205 = OpAccessChain %105 %70 
                                       f32 %206 = OpLoad %205 
                              Private f32* %207 = OpAccessChain %132 %70 
                                       f32 %208 = OpLoad %207 
                                       f32 %209 = OpFNegate %208 
                                       f32 %210 = OpFAdd %206 %209 
                              Private f32* %211 = OpAccessChain %132 %70 
                                                    OpStore %211 %210 
                              Private f32* %213 = OpAccessChain %132 %70 
                                       f32 %214 = OpLoad %213 
                                       f32 %216 = OpFMul %214 %215 
                                       f32 %218 = OpFAdd %216 %217 
                              Private f32* %219 = OpAccessChain %212 %70 
                                                    OpStore %219 %218 
                              Private f32* %221 = OpAccessChain %105 %128 
                                       f32 %222 = OpLoad %221 
                                       f32 %223 = OpFNegate %222 
                              Private f32* %224 = OpAccessChain %105 %23 
                                       f32 %225 = OpLoad %224 
                                       f32 %226 = OpFAdd %223 %225 
                                                    OpStore %220 %226 
                                       f32 %227 = OpLoad %220 
                              Private f32* %228 = OpAccessChain %212 %70 
                                       f32 %229 = OpLoad %228 
                                       f32 %230 = OpFDiv %227 %229 
                              Private f32* %231 = OpAccessChain %212 %70 
                                                    OpStore %231 %230 
                              Private f32* %232 = OpAccessChain %105 %157 
                                       f32 %233 = OpLoad %232 
                              Private f32* %234 = OpAccessChain %212 %70 
                                       f32 %235 = OpLoad %234 
                                       f32 %236 = OpFAdd %233 %235 
                              Private f32* %237 = OpAccessChain %212 %70 
                                                    OpStore %237 %236 
                                     f32_3 %238 = OpLoad %212 
                                     f32_3 %239 = OpVectorShuffle %238 %238 0 0 0 
                                     f32_3 %240 = OpExtInst %1 4 %239 
                                     f32_3 %243 = OpFAdd %240 %242 
                                                    OpStore %212 %243 
                                     f32_3 %244 = OpLoad %212 
                                     f32_3 %245 = OpExtInst %1 10 %244 
                                                    OpStore %212 %245 
                                     f32_3 %246 = OpLoad %212 
                                     f32_3 %248 = OpFMul %246 %247 
                                     f32_3 %251 = OpFAdd %248 %250 
                                                    OpStore %212 %251 
                                     f32_3 %252 = OpLoad %212 
                                     f32_3 %253 = OpExtInst %1 4 %252 
                                     f32_3 %255 = OpFAdd %253 %254 
                                                    OpStore %212 %255 
                                     f32_3 %256 = OpLoad %212 
                                     f32_3 %257 = OpCompositeConstruct %42 %42 %42 
                                     f32_3 %258 = OpCompositeConstruct %138 %138 %138 
                                     f32_3 %259 = OpExtInst %1 43 %256 %257 %258 
                                                    OpStore %212 %259 
                                     f32_3 %260 = OpLoad %212 
                                     f32_3 %261 = OpFAdd %260 %254 
                                                    OpStore %212 %261 
                              Private f32* %262 = OpAccessChain %105 %70 
                                       f32 %263 = OpLoad %262 
                                       f32 %264 = OpFAdd %263 %217 
                              Private f32* %265 = OpAccessChain %147 %70 
                                                    OpStore %265 %264 
                              Private f32* %266 = OpAccessChain %132 %70 
                                       f32 %267 = OpLoad %266 
                              Private f32* %268 = OpAccessChain %147 %70 
                                       f32 %269 = OpLoad %268 
                                       f32 %270 = OpFDiv %267 %269 
                              Private f32* %271 = OpAccessChain %132 %70 
                                                    OpStore %271 %270 
                                     f32_3 %272 = OpLoad %132 
                                     f32_3 %273 = OpVectorShuffle %272 %272 0 0 0 
                                     f32_3 %274 = OpLoad %212 
                                     f32_3 %275 = OpFMul %273 %274 
                                     f32_3 %277 = OpFAdd %275 %276 
                                                    OpStore %132 %277 
                                     f32_4 %278 = OpLoad %105 
                                     f32_3 %279 = OpVectorShuffle %278 %278 0 0 0 
                                     f32_3 %280 = OpLoad %132 
                                     f32_3 %281 = OpFMul %279 %280 
                                                    OpStore %132 %281 
                                     f32_3 %282 = OpLoad %132 
                                     f32_4 %283 = OpLoad %95 
                                     f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                    OpStore %95 %284 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
}
}
}
}