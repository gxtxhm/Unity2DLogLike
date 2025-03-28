//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "tk2d/CutoutVertexColorTiltedDistorting" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
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
  GpuProgramID 63550
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
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xy, vec2(212.0, 117.0));
    u_xlat0.x = u_xlat0.x + _Time.z;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(0.00066666666, 0.00066666666) + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat2 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat2;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.xyz = vs_COLOR0.xyz;
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
; Bound: 105
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %67 %80 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpMemberDecorate %24 0 Offset 24 
                                                    OpDecorate %24 Block 
                                                    OpDecorate %26 DescriptorSet 26 
                                                    OpDecorate %26 Binding 26 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %58 DescriptorSet 58 
                                                    OpDecorate %58 Binding 58 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %64 RelaxedPrecision 
                                                    OpDecorate %65 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %67 Location 67 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %73 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %80 Location 80 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                        f32 %13 = OpConstant 3.67402E-40 
                                        f32 %14 = OpConstant 3.67402E-40 
                                      f32_2 %15 = OpConstantComposite %13 %14 
                                            %17 = OpTypeInt 32 0 
                                        u32 %18 = OpConstant 0 
                                            %19 = OpTypePointer Private %6 
                                            %23 = OpTypeVector %6 4 
                                            %24 = OpTypeStruct %23 
                                            %25 = OpTypePointer Uniform %24 
                   Uniform struct {f32_4;}* %26 = OpVariable Uniform 
                                            %27 = OpTypeInt 32 1 
                                        i32 %28 = OpConstant 0 
                                        u32 %29 = OpConstant 2 
                                            %30 = OpTypePointer Uniform %6 
                             Private f32_2* %35 = OpVariable Private 
                                        u32 %46 = OpConstant 1 
                                        f32 %49 = OpConstant 3.67402E-40 
                                      f32_2 %50 = OpConstantComposite %49 %49 
                               Private f32* %54 = OpVariable Private 
                                            %55 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %56 = OpTypeSampledImage %55 
                                            %57 = OpTypePointer UniformConstant %56 
UniformConstant read_only Texture2DSampled* %58 = OpVariable UniformConstant 
                                        u32 %62 = OpConstant 3 
                               Private f32* %64 = OpVariable Private 
                                            %66 = OpTypePointer Input %23 
                               Input f32_4* %67 = OpVariable Input 
                                            %68 = OpTypePointer Input %6 
                                        f32 %72 = OpConstant 3.67402E-40 
                               Private f32* %74 = OpVariable Private 
                                            %79 = OpTypePointer Output %23 
                              Output f32_4* %80 = OpVariable Output 
                                            %82 = OpTypePointer Output %6 
                                            %84 = OpTypeBool 
                                            %85 = OpTypePointer Private %84 
                              Private bool* %86 = OpVariable Private 
                                        f32 %88 = OpConstant 3.67402E-40 
                                        i32 %91 = OpConstant 1 
                                        i32 %93 = OpConstant -1 
                                            %99 = OpTypeVector %6 3 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %12 = OpLoad %11 
                                        f32 %16 = OpDot %12 %15 
                               Private f32* %20 = OpAccessChain %9 %18 
                                                    OpStore %20 %16 
                               Private f32* %21 = OpAccessChain %9 %18 
                                        f32 %22 = OpLoad %21 
                               Uniform f32* %31 = OpAccessChain %26 %28 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFAdd %22 %32 
                               Private f32* %34 = OpAccessChain %9 %18 
                                                    OpStore %34 %33 
                               Private f32* %36 = OpAccessChain %9 %18 
                                        f32 %37 = OpLoad %36 
                                        f32 %38 = OpExtInst %1 14 %37 
                               Private f32* %39 = OpAccessChain %35 %18 
                                                    OpStore %39 %38 
                               Private f32* %40 = OpAccessChain %9 %18 
                                        f32 %41 = OpLoad %40 
                                        f32 %42 = OpExtInst %1 13 %41 
                               Private f32* %43 = OpAccessChain %9 %18 
                                                    OpStore %43 %42 
                               Private f32* %44 = OpAccessChain %9 %18 
                                        f32 %45 = OpLoad %44 
                               Private f32* %47 = OpAccessChain %35 %46 
                                                    OpStore %47 %45 
                                      f32_2 %48 = OpLoad %35 
                                      f32_2 %51 = OpFMul %48 %50 
                                      f32_2 %52 = OpLoad %11 
                                      f32_2 %53 = OpFAdd %51 %52 
                                                    OpStore %9 %53 
                 read_only Texture2DSampled %59 = OpLoad %58 
                                      f32_2 %60 = OpLoad %9 
                                      f32_4 %61 = OpImageSampleImplicitLod %59 %60 
                                        f32 %63 = OpCompositeExtract %61 3 
                                                    OpStore %54 %63 
                                        f32 %65 = OpLoad %54 
                                 Input f32* %69 = OpAccessChain %67 %62 
                                        f32 %70 = OpLoad %69 
                                        f32 %71 = OpFMul %65 %70 
                                        f32 %73 = OpFAdd %71 %72 
                                                    OpStore %64 %73 
                                        f32 %75 = OpLoad %54 
                                 Input f32* %76 = OpAccessChain %67 %62 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpFMul %75 %77 
                                                    OpStore %74 %78 
                                        f32 %81 = OpLoad %74 
                                Output f32* %83 = OpAccessChain %80 %62 
                                                    OpStore %83 %81 
                                        f32 %87 = OpLoad %64 
                                       bool %89 = OpFOrdLessThan %87 %88 
                                                    OpStore %86 %89 
                                       bool %90 = OpLoad %86 
                                        i32 %92 = OpSelect %90 %91 %28 
                                        i32 %94 = OpIMul %92 %93 
                                       bool %95 = OpINotEqual %94 %28 
                                                    OpSelectionMerge %97 None 
                                                    OpBranchConditional %95 %96 %97 
                                            %96 = OpLabel 
                                                    OpKill
                                            %97 = OpLabel 
                                     f32_4 %100 = OpLoad %67 
                                     f32_3 %101 = OpVectorShuffle %100 %100 0 1 2 
                                     f32_4 %102 = OpLoad %80 
                                     f32_4 %103 = OpVectorShuffle %102 %101 4 5 6 3 
                                                    OpStore %80 %103 
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
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xy, vec2(212.0, 117.0));
    u_xlat0.x = u_xlat0.x + _Time.z;
    u_xlat1.x = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat1.y = u_xlat0.x;
    u_xlat0.xy = u_xlat1.xy * vec2(0.00066666666, 0.00066666666) + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat2 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat2;
    u_xlatb0 = u_xlat0.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_COLOR0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat2 = u_xlat0.x * 0.75;
    u_xlat0.xzw = (-u_xlat0.xxx) * vec3(0.75, 0.75, 0.75) + vs_COLOR0.xyz;
    SV_Target0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xzw + vec3(u_xlat2);
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
; Bound: 142
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %12 %71 %139 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 Location 12 
                                                    OpMemberDecorate %24 0 Offset 24 
                                                    OpMemberDecorate %24 1 Offset 24 
                                                    OpDecorate %24 Block 
                                                    OpDecorate %26 DescriptorSet 26 
                                                    OpDecorate %26 Binding 26 
                                                    OpDecorate %57 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %61 DescriptorSet 61 
                                                    OpDecorate %61 Binding 61 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %69 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %71 Location 71 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %109 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                                    OpDecorate %112 RelaxedPrecision 
                                                    OpDecorate %113 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %118 RelaxedPrecision 
                                                    OpDecorate %119 RelaxedPrecision 
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
                                                    OpDecorate %139 RelaxedPrecision 
                                                    OpDecorate %139 Location 139 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypePointer Input %10 
                               Input f32_2* %12 = OpVariable Input 
                                        f32 %14 = OpConstant 3.67402E-40 
                                        f32 %15 = OpConstant 3.67402E-40 
                                      f32_2 %16 = OpConstantComposite %14 %15 
                                            %18 = OpTypeInt 32 0 
                                        u32 %19 = OpConstant 0 
                                            %20 = OpTypePointer Private %6 
                                            %24 = OpTypeStruct %7 %6 
                                            %25 = OpTypePointer Uniform %24 
              Uniform struct {f32_4; f32;}* %26 = OpVariable Uniform 
                                            %27 = OpTypeInt 32 1 
                                        i32 %28 = OpConstant 0 
                                        u32 %29 = OpConstant 2 
                                            %30 = OpTypePointer Uniform %6 
                                            %35 = OpTypePointer Private %10 
                             Private f32_2* %36 = OpVariable Private 
                                        u32 %47 = OpConstant 1 
                                        f32 %50 = OpConstant 3.67402E-40 
                                      f32_2 %51 = OpConstantComposite %50 %50 
                               Private f32* %57 = OpVariable Private 
                                            %58 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %59 = OpTypeSampledImage %58 
                                            %60 = OpTypePointer UniformConstant %59 
UniformConstant read_only Texture2DSampled* %61 = OpVariable UniformConstant 
                                        u32 %66 = OpConstant 3 
                               Private f32* %68 = OpVariable Private 
                                            %70 = OpTypePointer Input %7 
                               Input f32_4* %71 = OpVariable Input 
                                            %72 = OpTypePointer Input %6 
                                        f32 %76 = OpConstant 3.67402E-40 
                                            %83 = OpTypeBool 
                                            %84 = OpTypePointer Private %83 
                              Private bool* %85 = OpVariable Private 
                                        f32 %87 = OpConstant 3.67402E-40 
                                        i32 %90 = OpConstant 1 
                                        i32 %92 = OpConstant -1 
                                            %98 = OpTypeVector %6 3 
                                       f32 %101 = OpConstant 3.67402E-40 
                                       f32 %102 = OpConstant 3.67402E-40 
                                       f32 %103 = OpConstant 3.67402E-40 
                                     f32_3 %104 = OpConstantComposite %101 %102 %103 
                              Private f32* %106 = OpVariable Private 
                                       f32 %108 = OpConstant 3.67402E-40 
                                           %110 = OpTypePointer Private %98 
                            Private f32_3* %111 = OpVariable Private 
                                     f32_3 %115 = OpConstantComposite %108 %108 %108 
                                           %138 = OpTypePointer Output %7 
                             Output f32_4* %139 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                      f32_2 %13 = OpLoad %12 
                                        f32 %17 = OpDot %13 %16 
                               Private f32* %21 = OpAccessChain %9 %19 
                                                    OpStore %21 %17 
                               Private f32* %22 = OpAccessChain %9 %19 
                                        f32 %23 = OpLoad %22 
                               Uniform f32* %31 = OpAccessChain %26 %28 %29 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFAdd %23 %32 
                               Private f32* %34 = OpAccessChain %9 %19 
                                                    OpStore %34 %33 
                               Private f32* %37 = OpAccessChain %9 %19 
                                        f32 %38 = OpLoad %37 
                                        f32 %39 = OpExtInst %1 14 %38 
                               Private f32* %40 = OpAccessChain %36 %19 
                                                    OpStore %40 %39 
                               Private f32* %41 = OpAccessChain %9 %19 
                                        f32 %42 = OpLoad %41 
                                        f32 %43 = OpExtInst %1 13 %42 
                               Private f32* %44 = OpAccessChain %9 %19 
                                                    OpStore %44 %43 
                               Private f32* %45 = OpAccessChain %9 %19 
                                        f32 %46 = OpLoad %45 
                               Private f32* %48 = OpAccessChain %36 %47 
                                                    OpStore %48 %46 
                                      f32_2 %49 = OpLoad %36 
                                      f32_2 %52 = OpFMul %49 %51 
                                      f32_2 %53 = OpLoad %12 
                                      f32_2 %54 = OpFAdd %52 %53 
                                      f32_4 %55 = OpLoad %9 
                                      f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
                                                    OpStore %9 %56 
                 read_only Texture2DSampled %62 = OpLoad %61 
                                      f32_4 %63 = OpLoad %9 
                                      f32_2 %64 = OpVectorShuffle %63 %63 0 1 
                                      f32_4 %65 = OpImageSampleImplicitLod %62 %64 
                                        f32 %67 = OpCompositeExtract %65 3 
                                                    OpStore %57 %67 
                                        f32 %69 = OpLoad %57 
                                 Input f32* %73 = OpAccessChain %71 %66 
                                        f32 %74 = OpLoad %73 
                                        f32 %75 = OpFMul %69 %74 
                                        f32 %77 = OpFAdd %75 %76 
                                                    OpStore %68 %77 
                                        f32 %78 = OpLoad %57 
                                 Input f32* %79 = OpAccessChain %71 %66 
                                        f32 %80 = OpLoad %79 
                                        f32 %81 = OpFMul %78 %80 
                               Private f32* %82 = OpAccessChain %9 %66 
                                                    OpStore %82 %81 
                                        f32 %86 = OpLoad %68 
                                       bool %88 = OpFOrdLessThan %86 %87 
                                                    OpStore %85 %88 
                                       bool %89 = OpLoad %85 
                                        i32 %91 = OpSelect %89 %90 %28 
                                        i32 %93 = OpIMul %91 %92 
                                       bool %94 = OpINotEqual %93 %28 
                                                    OpSelectionMerge %96 None 
                                                    OpBranchConditional %94 %95 %96 
                                            %95 = OpLabel 
                                                    OpKill
                                            %96 = OpLabel 
                                      f32_4 %99 = OpLoad %71 
                                     f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                       f32 %105 = OpDot %100 %104 
                                                    OpStore %68 %105 
                                       f32 %107 = OpLoad %68 
                                       f32 %109 = OpFMul %107 %108 
                                                    OpStore %106 %109 
                                       f32 %112 = OpLoad %68 
                                     f32_3 %113 = OpCompositeConstruct %112 %112 %112 
                                     f32_3 %114 = OpFNegate %113 
                                     f32_3 %116 = OpFMul %114 %115 
                                     f32_4 %117 = OpLoad %71 
                                     f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                     f32_3 %119 = OpFAdd %116 %118 
                                                    OpStore %111 %119 
                              Uniform f32* %120 = OpAccessChain %26 %90 
                                       f32 %121 = OpLoad %120 
                              Uniform f32* %122 = OpAccessChain %26 %90 
                                       f32 %123 = OpLoad %122 
                              Uniform f32* %124 = OpAccessChain %26 %90 
                                       f32 %125 = OpLoad %124 
                                     f32_3 %126 = OpCompositeConstruct %121 %123 %125 
                                       f32 %127 = OpCompositeExtract %126 0 
                                       f32 %128 = OpCompositeExtract %126 1 
                                       f32 %129 = OpCompositeExtract %126 2 
                                     f32_3 %130 = OpCompositeConstruct %127 %128 %129 
                                     f32_3 %131 = OpLoad %111 
                                     f32_3 %132 = OpFMul %130 %131 
                                       f32 %133 = OpLoad %106 
                                     f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                     f32_3 %135 = OpFAdd %132 %134 
                                     f32_4 %136 = OpLoad %9 
                                     f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                    OpStore %9 %137 
                                     f32_4 %140 = OpLoad %9 
                                                    OpStore %139 %140 
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