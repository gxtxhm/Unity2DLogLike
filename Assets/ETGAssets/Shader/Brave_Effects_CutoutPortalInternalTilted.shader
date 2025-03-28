//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/CutoutPortalInternalTilted" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_MaskTex ("Mask (RGB)", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_DepthOffset ("Depth Offset", Float) = 0
_Saturation ("Saturation", Float) = 1
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
  GpuProgramID 61444
Program "vp" {
SubProgram "d3d11 " {
Keywords { "SATURATION_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_OFF" }
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

uniform 	vec4 _Time;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
float u_xlat2;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * 15.0;
    u_xlat0.x = _Time.z * 2.5 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture(_MaskTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0.x * u_xlat10_0.w;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat2 = u_xlat1.w * u_xlat16_0 + -0.100000001;
    u_xlat0.x = u_xlat16_0 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat2<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SATURATION_OFF" }
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
; Bound: 119
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %78 %94 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpMemberDecorate %23 0 Offset 23 
                                                    OpDecorate %23 Block 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %58 DescriptorSet 58 
                                                    OpDecorate %58 Binding 58 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %71 DescriptorSet 71 
                                                    OpDecorate %71 Binding 71 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %78 Location 78 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %89 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %94 Location 94 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 1 
                                            %14 = OpTypePointer Input %6 
                                        f32 %17 = OpConstant 3.67402E-40 
                                        u32 %19 = OpConstant 0 
                                            %20 = OpTypePointer Private %6 
                                            %22 = OpTypeVector %6 4 
                                            %23 = OpTypeStruct %22 
                                            %24 = OpTypePointer Uniform %23 
                   Uniform struct {f32_4;}* %25 = OpVariable Uniform 
                                            %26 = OpTypeInt 32 1 
                                        i32 %27 = OpConstant 0 
                                        u32 %28 = OpConstant 2 
                                            %29 = OpTypePointer Uniform %6 
                                        f32 %32 = OpConstant 3.67402E-40 
                                        f32 %44 = OpConstant 3.67402E-40 
                                            %53 = OpTypePointer Private %22 
                             Private f32_4* %54 = OpVariable Private 
                                            %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %56 = OpTypeSampledImage %55 
                                            %57 = OpTypePointer UniformConstant %56 
UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                               Private f32* %65 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %71 = OpVariable UniformConstant 
                             Private f32_4* %75 = OpVariable Private 
                                            %77 = OpTypePointer Input %22 
                               Input f32_4* %78 = OpVariable Input 
                               Private f32* %81 = OpVariable Private 
                                        u32 %82 = OpConstant 3 
                                        f32 %87 = OpConstant 3.67402E-40 
                                            %93 = OpTypePointer Output %22 
                              Output f32_4* %94 = OpVariable Output 
                                            %95 = OpTypeVector %6 3 
                                           %101 = OpTypePointer Output %6 
                                           %103 = OpTypeBool 
                                           %104 = OpTypePointer Private %103 
                             Private bool* %105 = OpVariable Private 
                                       f32 %107 = OpConstant 3.67402E-40 
                                       i32 %110 = OpConstant 1 
                                       i32 %112 = OpConstant -1 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                                        f32 %18 = OpFMul %16 %17 
                               Private f32* %21 = OpAccessChain %9 %19 
                                                    OpStore %21 %18 
                               Uniform f32* %30 = OpAccessChain %25 %27 %28 
                                        f32 %31 = OpLoad %30 
                                        f32 %33 = OpFMul %31 %32 
                               Private f32* %34 = OpAccessChain %9 %19 
                                        f32 %35 = OpLoad %34 
                                        f32 %36 = OpFAdd %33 %35 
                               Private f32* %37 = OpAccessChain %9 %19 
                                                    OpStore %37 %36 
                               Private f32* %38 = OpAccessChain %9 %19 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpExtInst %1 13 %39 
                               Private f32* %41 = OpAccessChain %9 %19 
                                                    OpStore %41 %40 
                               Private f32* %42 = OpAccessChain %9 %19 
                                        f32 %43 = OpLoad %42 
                                        f32 %45 = OpFMul %43 %44 
                                 Input f32* %46 = OpAccessChain %11 %19 
                                        f32 %47 = OpLoad %46 
                                        f32 %48 = OpFAdd %45 %47 
                               Private f32* %49 = OpAccessChain %9 %19 
                                                    OpStore %49 %48 
                                 Input f32* %50 = OpAccessChain %11 %13 
                                        f32 %51 = OpLoad %50 
                               Private f32* %52 = OpAccessChain %9 %13 
                                                    OpStore %52 %51 
                 read_only Texture2DSampled %59 = OpLoad %58 
                                      f32_2 %60 = OpLoad %9 
                                      f32_4 %61 = OpImageSampleImplicitLod %59 %60 
                                      f32_2 %62 = OpVectorShuffle %61 %61 0 3 
                                      f32_4 %63 = OpLoad %54 
                                      f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                                    OpStore %54 %64 
                               Private f32* %66 = OpAccessChain %54 %19 
                                        f32 %67 = OpLoad %66 
                               Private f32* %68 = OpAccessChain %54 %13 
                                        f32 %69 = OpLoad %68 
                                        f32 %70 = OpFMul %67 %69 
                                                    OpStore %65 %70 
                 read_only Texture2DSampled %72 = OpLoad %71 
                                      f32_2 %73 = OpLoad %11 
                                      f32_4 %74 = OpImageSampleImplicitLod %72 %73 
                                                    OpStore %54 %74 
                                      f32_4 %76 = OpLoad %54 
                                      f32_4 %79 = OpLoad %78 
                                      f32_4 %80 = OpFMul %76 %79 
                                                    OpStore %75 %80 
                               Private f32* %83 = OpAccessChain %75 %82 
                                        f32 %84 = OpLoad %83 
                                        f32 %85 = OpLoad %65 
                                        f32 %86 = OpFMul %84 %85 
                                        f32 %88 = OpFAdd %86 %87 
                                                    OpStore %81 %88 
                                        f32 %89 = OpLoad %65 
                               Private f32* %90 = OpAccessChain %75 %82 
                                        f32 %91 = OpLoad %90 
                                        f32 %92 = OpFMul %89 %91 
                                                    OpStore %65 %92 
                                      f32_4 %96 = OpLoad %75 
                                      f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                      f32_4 %98 = OpLoad %94 
                                      f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                    OpStore %94 %99 
                                       f32 %100 = OpLoad %65 
                               Output f32* %102 = OpAccessChain %94 %82 
                                                    OpStore %102 %100 
                                       f32 %106 = OpLoad %81 
                                      bool %108 = OpFOrdLessThan %106 %107 
                                                    OpStore %105 %108 
                                      bool %109 = OpLoad %105 
                                       i32 %111 = OpSelect %109 %110 %27 
                                       i32 %113 = OpIMul %111 %112 
                                      bool %114 = OpINotEqual %113 %27 
                                                    OpSelectionMerge %116 None 
                                                    OpBranchConditional %114 %115 %116 
                                           %115 = OpLabel 
                                                    OpKill
                                           %116 = OpLabel 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SATURATION_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_ON" }
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

uniform 	vec4 _Time;
uniform 	float _Saturation;
uniform  sampler2D _MainTex;
uniform  sampler2D _MaskTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat16_0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat10_1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * 15.0;
    u_xlat0.x = _Time.z * 2.5 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.0500000007 + vs_TEXCOORD0.x;
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat10_0 = texture(_MaskTex, u_xlat0.xy);
    u_xlat16_0 = u_xlat10_0.x * u_xlat10_0.w;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat2 = u_xlat10_1 * vs_COLOR0;
    u_xlat3 = u_xlat2.w * u_xlat16_0 + -0.100000001;
    u_xlat0.x = u_xlat16_0 * u_xlat2.w;
    u_xlat6 = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat6 = u_xlat6 * 0.75;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat3<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.xyw = u_xlat10_1.xyz * vs_COLOR0.xyz + (-vec3(u_xlat6));
    SV_Target0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyw + vec3(u_xlat6);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SATURATION_ON" }
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
; Bound: 156
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %80 %107 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 Location 12 
                                                    OpMemberDecorate %24 0 Offset 24 
                                                    OpMemberDecorate %24 1 Offset 24 
                                                    OpDecorate %24 Block 
                                                    OpDecorate %26 DescriptorSet 26 
                                                    OpDecorate %26 Binding 26 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %59 DescriptorSet 59 
                                                    OpDecorate %59 Binding 59 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %73 DescriptorSet 73 
                                                    OpDecorate %73 Binding 73 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %80 Location 80 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %82 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %107 Location 107 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %126 RelaxedPrecision 
                                                    OpDecorate %127 RelaxedPrecision 
                                                    OpDecorate %128 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %130 RelaxedPrecision 
                                                    OpDecorate %131 RelaxedPrecision 
                                                    OpDecorate %132 RelaxedPrecision 
                                                    OpDecorate %133 RelaxedPrecision 
                                                    OpDecorate %134 RelaxedPrecision 
                                                    OpDecorate %135 RelaxedPrecision 
                                                    OpDecorate %142 RelaxedPrecision 
                                                    OpDecorate %143 RelaxedPrecision 
                                                    OpDecorate %144 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %146 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %148 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %150 RelaxedPrecision 
                                                    OpDecorate %151 RelaxedPrecision 
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
                                        f32 %18 = OpConstant 3.67402E-40 
                                        u32 %20 = OpConstant 0 
                                            %21 = OpTypePointer Private %6 
                                            %23 = OpTypeVector %6 4 
                                            %24 = OpTypeStruct %23 %6 
                                            %25 = OpTypePointer Uniform %24 
              Uniform struct {f32_4; f32;}* %26 = OpVariable Uniform 
                                            %27 = OpTypeInt 32 1 
                                        i32 %28 = OpConstant 0 
                                        u32 %29 = OpConstant 2 
                                            %30 = OpTypePointer Uniform %6 
                                        f32 %33 = OpConstant 3.67402E-40 
                                        f32 %45 = OpConstant 3.67402E-40 
                                            %54 = OpTypePointer Private %23 
                             Private f32_4* %55 = OpVariable Private 
                                            %56 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %57 = OpTypeSampledImage %56 
                                            %58 = OpTypePointer UniformConstant %57 
UniformConstant read_only Texture2DSampled* %59 = OpVariable UniformConstant 
                               Private f32* %67 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %73 = OpVariable UniformConstant 
                             Private f32_4* %77 = OpVariable Private 
                                            %79 = OpTypePointer Input %23 
                               Input f32_4* %80 = OpVariable Input 
                               Private f32* %83 = OpVariable Private 
                                        u32 %84 = OpConstant 3 
                                        f32 %89 = OpConstant 3.67402E-40 
                               Private f32* %95 = OpVariable Private 
                                        f32 %98 = OpConstant 3.67402E-40 
                                        f32 %99 = OpConstant 3.67402E-40 
                                       f32 %100 = OpConstant 3.67402E-40 
                                     f32_3 %101 = OpConstantComposite %98 %99 %100 
                                       f32 %104 = OpConstant 3.67402E-40 
                                           %106 = OpTypePointer Output %23 
                             Output f32_4* %107 = OpVariable Output 
                                           %109 = OpTypePointer Output %6 
                                           %111 = OpTypeBool 
                                           %112 = OpTypePointer Private %111 
                             Private bool* %113 = OpVariable Private 
                                       f32 %115 = OpConstant 3.67402E-40 
                                       i32 %118 = OpConstant 1 
                                       i32 %120 = OpConstant -1 
                            Private f32_3* %126 = OpVariable Private 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %16 = OpAccessChain %12 %14 
                                        f32 %17 = OpLoad %16 
                                        f32 %19 = OpFMul %17 %18 
                               Private f32* %22 = OpAccessChain %9 %20 
                                                    OpStore %22 %19 
                               Uniform f32* %31 = OpAccessChain %26 %28 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %34 = OpFMul %32 %33 
                               Private f32* %35 = OpAccessChain %9 %20 
                                        f32 %36 = OpLoad %35 
                                        f32 %37 = OpFAdd %34 %36 
                               Private f32* %38 = OpAccessChain %9 %20 
                                                    OpStore %38 %37 
                               Private f32* %39 = OpAccessChain %9 %20 
                                        f32 %40 = OpLoad %39 
                                        f32 %41 = OpExtInst %1 13 %40 
                               Private f32* %42 = OpAccessChain %9 %20 
                                                    OpStore %42 %41 
                               Private f32* %43 = OpAccessChain %9 %20 
                                        f32 %44 = OpLoad %43 
                                        f32 %46 = OpFMul %44 %45 
                                 Input f32* %47 = OpAccessChain %12 %20 
                                        f32 %48 = OpLoad %47 
                                        f32 %49 = OpFAdd %46 %48 
                               Private f32* %50 = OpAccessChain %9 %20 
                                                    OpStore %50 %49 
                                 Input f32* %51 = OpAccessChain %12 %14 
                                        f32 %52 = OpLoad %51 
                               Private f32* %53 = OpAccessChain %9 %14 
                                                    OpStore %53 %52 
                 read_only Texture2DSampled %60 = OpLoad %59 
                                      f32_3 %61 = OpLoad %9 
                                      f32_2 %62 = OpVectorShuffle %61 %61 0 1 
                                      f32_4 %63 = OpImageSampleImplicitLod %60 %62 
                                      f32_2 %64 = OpVectorShuffle %63 %63 0 3 
                                      f32_4 %65 = OpLoad %55 
                                      f32_4 %66 = OpVectorShuffle %65 %64 4 5 2 3 
                                                    OpStore %55 %66 
                               Private f32* %68 = OpAccessChain %55 %20 
                                        f32 %69 = OpLoad %68 
                               Private f32* %70 = OpAccessChain %55 %14 
                                        f32 %71 = OpLoad %70 
                                        f32 %72 = OpFMul %69 %71 
                                                    OpStore %67 %72 
                 read_only Texture2DSampled %74 = OpLoad %73 
                                      f32_2 %75 = OpLoad %12 
                                      f32_4 %76 = OpImageSampleImplicitLod %74 %75 
                                                    OpStore %55 %76 
                                      f32_4 %78 = OpLoad %55 
                                      f32_4 %81 = OpLoad %80 
                                      f32_4 %82 = OpFMul %78 %81 
                                                    OpStore %77 %82 
                               Private f32* %85 = OpAccessChain %77 %84 
                                        f32 %86 = OpLoad %85 
                                        f32 %87 = OpLoad %67 
                                        f32 %88 = OpFMul %86 %87 
                                        f32 %90 = OpFAdd %88 %89 
                                                    OpStore %83 %90 
                                        f32 %91 = OpLoad %67 
                               Private f32* %92 = OpAccessChain %77 %84 
                                        f32 %93 = OpLoad %92 
                                        f32 %94 = OpFMul %91 %93 
                                                    OpStore %67 %94 
                                      f32_4 %96 = OpLoad %77 
                                      f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                       f32 %102 = OpDot %97 %101 
                                                    OpStore %95 %102 
                                       f32 %103 = OpLoad %95 
                                       f32 %105 = OpFMul %103 %104 
                                                    OpStore %95 %105 
                                       f32 %108 = OpLoad %67 
                               Output f32* %110 = OpAccessChain %107 %84 
                                                    OpStore %110 %108 
                                       f32 %114 = OpLoad %83 
                                      bool %116 = OpFOrdLessThan %114 %115 
                                                    OpStore %113 %116 
                                      bool %117 = OpLoad %113 
                                       i32 %119 = OpSelect %117 %118 %28 
                                       i32 %121 = OpIMul %119 %120 
                                      bool %122 = OpINotEqual %121 %28 
                                                    OpSelectionMerge %124 None 
                                                    OpBranchConditional %122 %123 %124 
                                           %123 = OpLabel 
                                                    OpKill
                                           %124 = OpLabel 
                                     f32_4 %127 = OpLoad %55 
                                     f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                     f32_4 %129 = OpLoad %80 
                                     f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                     f32_3 %131 = OpFMul %128 %130 
                                       f32 %132 = OpLoad %95 
                                     f32_3 %133 = OpCompositeConstruct %132 %132 %132 
                                     f32_3 %134 = OpFNegate %133 
                                     f32_3 %135 = OpFAdd %131 %134 
                                                    OpStore %126 %135 
                              Uniform f32* %136 = OpAccessChain %26 %118 
                                       f32 %137 = OpLoad %136 
                              Uniform f32* %138 = OpAccessChain %26 %118 
                                       f32 %139 = OpLoad %138 
                              Uniform f32* %140 = OpAccessChain %26 %118 
                                       f32 %141 = OpLoad %140 
                                     f32_3 %142 = OpCompositeConstruct %137 %139 %141 
                                       f32 %143 = OpCompositeExtract %142 0 
                                       f32 %144 = OpCompositeExtract %142 1 
                                       f32 %145 = OpCompositeExtract %142 2 
                                     f32_3 %146 = OpCompositeConstruct %143 %144 %145 
                                     f32_3 %147 = OpLoad %126 
                                     f32_3 %148 = OpFMul %146 %147 
                                       f32 %149 = OpLoad %95 
                                     f32_3 %150 = OpCompositeConstruct %149 %149 %149 
                                     f32_3 %151 = OpFAdd %148 %150 
                                                    OpStore %9 %151 
                                     f32_3 %152 = OpLoad %9 
                                     f32_4 %153 = OpLoad %107 
                                     f32_4 %154 = OpVectorShuffle %153 %152 4 5 6 3 
                                                    OpStore %107 %154 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "SATURATION_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "SATURATION_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "SATURATION_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SATURATION_ON" }
""
}
SubProgram "vulkan " {
Keywords { "SATURATION_ON" }
""
}
}
}
}
Fallback "VertexLit"
}