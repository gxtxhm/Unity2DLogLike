//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/BlendEmissiveMaskedCutout" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_MaskTex ("Mask", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_RevealAmount ("RevealAmount", Range(0, 1)) = 1
_BrightnessWarble ("Warble", Float) = 1
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend DstColor One, DstColor One
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 61662
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

uniform 	vec4 _OverrideColor;
uniform 	float _RevealAmount;
uniform 	float _BrightnessWarble;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat4;
float u_xlat16_4;
bool u_xlatb7;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = _RevealAmount + -0.0500000007;
    u_xlat10_2 = texture(_MaskTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat1.x + (-u_xlat10_2.x);
    u_xlat16_4 = (-u_xlat10_2.x) + 1.0;
    u_xlatb7 = u_xlat1.x<0.0;
    u_xlat1.x = u_xlat1.x * 3.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    if((int(u_xlatb7) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = _OverrideColor.xyz * vec3(5.0, 5.0, 5.0);
    u_xlat4.xyz = vec3(u_xlat16_4) * u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_BrightnessWarble);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.w = u_xlat0.w * 0.100000001;
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
; Bound: 145
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %29 %134 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %29 Location 29 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpMemberDecorate %61 0 RelaxedPrecision 
                                                    OpMemberDecorate %61 0 Offset 61 
                                                    OpMemberDecorate %61 1 Offset 61 
                                                    OpMemberDecorate %61 2 Offset 61 
                                                    OpDecorate %61 Block 
                                                    OpDecorate %63 DescriptorSet 63 
                                                    OpDecorate %63 Binding 63 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %71 DescriptorSet 71 
                                                    OpDecorate %71 Binding 71 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %110 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %121 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %130 RelaxedPrecision 
                                                    OpDecorate %134 RelaxedPrecision 
                                                    OpDecorate %134 Location 134 
                                                    OpDecorate %136 RelaxedPrecision 
                                                    OpDecorate %138 RelaxedPrecision 
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
                                            %20 = OpTypeVector %6 3 
                                            %21 = OpTypePointer Private %20 
                             Private f32_3* %22 = OpVariable Private 
                                            %23 = OpTypeInt 32 0 
                                        u32 %24 = OpConstant 3 
                                            %25 = OpTypePointer Private %6 
                                            %28 = OpTypePointer Input %7 
                               Input f32_4* %29 = OpVariable Input 
                                            %30 = OpTypePointer Input %6 
                                        f32 %34 = OpConstant 3.67402E-40 
                                        u32 %36 = OpConstant 0 
                             Private f32_4* %38 = OpVariable Private 
                                            %42 = OpTypeBool 
                                            %43 = OpTypePointer Private %42 
                              Private bool* %44 = OpVariable Private 
                                        f32 %47 = OpConstant 3.67402E-40 
                                            %50 = OpTypeInt 32 1 
                                        i32 %51 = OpConstant 0 
                                        i32 %52 = OpConstant 1 
                                        i32 %54 = OpConstant -1 
                             Private f32_3* %60 = OpVariable Private 
                                            %61 = OpTypeStruct %7 %6 %6 
                                            %62 = OpTypePointer Uniform %61 
         Uniform struct {f32_4; f32; f32;}* %63 = OpVariable Uniform 
                                            %64 = OpTypePointer Uniform %6 
                                        f32 %67 = OpConstant 3.67402E-40 
                               Private f32* %70 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %71 = OpVariable UniformConstant 
                                        f32 %84 = OpConstant 3.67402E-40 
                              Private bool* %87 = OpVariable Private 
                                        f32 %93 = OpConstant 3.67402E-40 
                            Private f32_3* %107 = OpVariable Private 
                                           %108 = OpTypePointer Uniform %7 
                                       f32 %112 = OpConstant 3.67402E-40 
                                     f32_3 %113 = OpConstantComposite %112 %112 %112 
                                       i32 %124 = OpConstant 2 
                                           %133 = OpTypePointer Output %7 
                             Output f32_4* %134 = OpVariable Output 
                                       f32 %137 = OpConstant 3.67402E-40 
                                           %139 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %26 = OpAccessChain %9 %24 
                                        f32 %27 = OpLoad %26 
                                 Input f32* %31 = OpAccessChain %29 %24 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %27 %32 
                                        f32 %35 = OpFAdd %33 %34 
                               Private f32* %37 = OpAccessChain %22 %36 
                                                    OpStore %37 %35 
                                      f32_4 %39 = OpLoad %9 
                                      f32_4 %40 = OpLoad %29 
                                      f32_4 %41 = OpFMul %39 %40 
                                                    OpStore %38 %41 
                               Private f32* %45 = OpAccessChain %22 %36 
                                        f32 %46 = OpLoad %45 
                                       bool %48 = OpFOrdLessThan %46 %47 
                                                    OpStore %44 %48 
                                       bool %49 = OpLoad %44 
                                        i32 %53 = OpSelect %49 %52 %51 
                                        i32 %55 = OpIMul %53 %54 
                                       bool %56 = OpINotEqual %55 %51 
                                                    OpSelectionMerge %58 None 
                                                    OpBranchConditional %56 %57 %58 
                                            %57 = OpLabel 
                                                    OpKill
                                            %58 = OpLabel 
                               Uniform f32* %65 = OpAccessChain %63 %52 
                                        f32 %66 = OpLoad %65 
                                        f32 %68 = OpFAdd %66 %67 
                               Private f32* %69 = OpAccessChain %60 %36 
                                                    OpStore %69 %68 
                 read_only Texture2DSampled %72 = OpLoad %71 
                                      f32_2 %73 = OpLoad %17 
                                      f32_4 %74 = OpImageSampleImplicitLod %72 %73 
                                        f32 %75 = OpCompositeExtract %74 0 
                                                    OpStore %70 %75 
                                        f32 %76 = OpLoad %70 
                                        f32 %77 = OpFNegate %76 
                               Private f32* %78 = OpAccessChain %60 %36 
                                        f32 %79 = OpLoad %78 
                                        f32 %80 = OpFAdd %77 %79 
                               Private f32* %81 = OpAccessChain %60 %36 
                                                    OpStore %81 %80 
                                        f32 %82 = OpLoad %70 
                                        f32 %83 = OpFNegate %82 
                                        f32 %85 = OpFAdd %83 %84 
                               Private f32* %86 = OpAccessChain %22 %36 
                                                    OpStore %86 %85 
                               Private f32* %88 = OpAccessChain %60 %36 
                                        f32 %89 = OpLoad %88 
                                       bool %90 = OpFOrdLessThan %89 %47 
                                                    OpStore %87 %90 
                               Private f32* %91 = OpAccessChain %60 %36 
                                        f32 %92 = OpLoad %91 
                                        f32 %94 = OpFMul %92 %93 
                               Private f32* %95 = OpAccessChain %60 %36 
                                                    OpStore %95 %94 
                               Private f32* %96 = OpAccessChain %60 %36 
                                        f32 %97 = OpLoad %96 
                                        f32 %98 = OpExtInst %1 43 %97 %47 %84 
                               Private f32* %99 = OpAccessChain %60 %36 
                                                    OpStore %99 %98 
                                      bool %100 = OpLoad %87 
                                       i32 %101 = OpSelect %100 %52 %51 
                                       i32 %102 = OpIMul %101 %54 
                                      bool %103 = OpINotEqual %102 %51 
                                                    OpSelectionMerge %105 None 
                                                    OpBranchConditional %103 %104 %105 
                                           %104 = OpLabel 
                                                    OpKill
                                           %105 = OpLabel 
                            Uniform f32_4* %109 = OpAccessChain %63 %51 
                                     f32_4 %110 = OpLoad %109 
                                     f32_3 %111 = OpVectorShuffle %110 %110 0 1 2 
                                     f32_3 %114 = OpFMul %111 %113 
                                                    OpStore %107 %114 
                                     f32_3 %115 = OpLoad %22 
                                     f32_3 %116 = OpVectorShuffle %115 %115 0 0 0 
                                     f32_3 %117 = OpLoad %107 
                                     f32_3 %118 = OpFMul %116 %117 
                                                    OpStore %22 %118 
                                     f32_3 %119 = OpLoad %60 
                                     f32_3 %120 = OpVectorShuffle %119 %119 0 0 0 
                                     f32_3 %121 = OpLoad %22 
                                     f32_3 %122 = OpFMul %120 %121 
                                                    OpStore %60 %122 
                                     f32_3 %123 = OpLoad %60 
                              Uniform f32* %125 = OpAccessChain %63 %124 
                                       f32 %126 = OpLoad %125 
                                     f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                     f32_3 %128 = OpFMul %123 %127 
                                                    OpStore %60 %128 
                                     f32_4 %129 = OpLoad %38 
                                     f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                     f32_3 %131 = OpLoad %60 
                                     f32_3 %132 = OpFMul %130 %131 
                                                    OpStore %60 %132 
                              Private f32* %135 = OpAccessChain %38 %24 
                                       f32 %136 = OpLoad %135 
                                       f32 %138 = OpFMul %136 %137 
                               Output f32* %140 = OpAccessChain %134 %24 
                                                    OpStore %140 %138 
                                     f32_3 %141 = OpLoad %60 
                                     f32_4 %142 = OpLoad %134 
                                     f32_4 %143 = OpVectorShuffle %142 %141 4 5 6 3 
                                                    OpStore %134 %143 
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