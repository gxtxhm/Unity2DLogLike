//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "tk2d/CutoutVertexColorTiltedGonner" {
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
  GpuProgramID 40710
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
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _MainTex_TexelSize;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x + vs_TEXCOORD1.x;
    u_xlat0.x = _Time.z * 5.0 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xy;
    u_xlat4.xy = _MainTex_TexelSize.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0) + (-u_xlat4.xy);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1 = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    u_xlatb0 = u_xlat1<0.0;
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
; Bound: 134
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %106 %116 %117 %121 %123 %125 %126 
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
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
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
                               Output f32_2* %125 = OpVariable Output 
                                Input f32_2* %126 = OpVariable Input 
                                             %128 = OpTypePointer Output %6 
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
                                       f32_2 %127 = OpLoad %126 
                                                      OpStore %125 %127 
                                 Output f32* %129 = OpAccessChain %106 %59 %47 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFNegate %130 
                                 Output f32* %132 = OpAccessChain %106 %59 %47 
                                                      OpStore %132 %131 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 121
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %76 %93 %104 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpMemberDecorate %23 0 Offset 23 
                                                    OpMemberDecorate %23 1 Offset 23 
                                                    OpDecorate %23 Block 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %76 Location 76 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %84 DescriptorSet 84 
                                                    OpDecorate %84 Binding 84 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %93 Location 93 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %100 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %104 Location 104 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %109 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 0 
                                            %14 = OpTypePointer Input %6 
                                            %20 = OpTypePointer Private %6 
                                            %22 = OpTypeVector %6 4 
                                            %23 = OpTypeStruct %22 %22 
                                            %24 = OpTypePointer Uniform %23 
            Uniform struct {f32_4; f32_4;}* %25 = OpVariable Uniform 
                                            %26 = OpTypeInt 32 1 
                                        i32 %27 = OpConstant 0 
                                        u32 %28 = OpConstant 2 
                                            %29 = OpTypePointer Uniform %6 
                                        f32 %32 = OpConstant 3.67402E-40 
                                        f32 %44 = OpConstant 3.67402E-40 
                                        f32 %49 = OpConstant 3.67402E-40 
                                        i32 %54 = OpConstant 1 
                                            %55 = OpTypePointer Uniform %22 
                             Private f32_2* %60 = OpVariable Private 
                                        f32 %69 = OpConstant 3.67402E-40 
                                      f32_2 %70 = OpConstantComposite %69 %69 
                               Input f32_2* %76 = OpVariable Input 
                                            %79 = OpTypePointer Private %22 
                             Private f32_4* %80 = OpVariable Private 
                                            %81 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %82 = OpTypeSampledImage %81 
                                            %83 = OpTypePointer UniformConstant %82 
UniformConstant read_only Texture2DSampled* %84 = OpVariable UniformConstant 
                               Private f32* %88 = OpVariable Private 
                                        u32 %89 = OpConstant 3 
                                            %92 = OpTypePointer Input %22 
                               Input f32_4* %93 = OpVariable Input 
                                        f32 %97 = OpConstant 3.67402E-40 
                             Private f32_4* %99 = OpVariable Private 
                                           %103 = OpTypePointer Output %22 
                             Output f32_4* %104 = OpVariable Output 
                                           %106 = OpTypeBool 
                                           %107 = OpTypePointer Private %106 
                             Private bool* %108 = OpVariable Private 
                                       f32 %110 = OpConstant 3.67402E-40 
                                       i32 %114 = OpConstant -1 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                                 Input f32* %17 = OpAccessChain %11 %13 
                                        f32 %18 = OpLoad %17 
                                        f32 %19 = OpFAdd %16 %18 
                               Private f32* %21 = OpAccessChain %9 %13 
                                                    OpStore %21 %19 
                               Uniform f32* %30 = OpAccessChain %25 %27 %28 
                                        f32 %31 = OpLoad %30 
                                        f32 %33 = OpFMul %31 %32 
                               Private f32* %34 = OpAccessChain %9 %13 
                                        f32 %35 = OpLoad %34 
                                        f32 %36 = OpFAdd %33 %35 
                               Private f32* %37 = OpAccessChain %9 %13 
                                                    OpStore %37 %36 
                               Private f32* %38 = OpAccessChain %9 %13 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpExtInst %1 13 %39 
                               Private f32* %41 = OpAccessChain %9 %13 
                                                    OpStore %41 %40 
                               Private f32* %42 = OpAccessChain %9 %13 
                                        f32 %43 = OpLoad %42 
                                        f32 %45 = OpFAdd %43 %44 
                               Private f32* %46 = OpAccessChain %9 %13 
                                                    OpStore %46 %45 
                               Private f32* %47 = OpAccessChain %9 %13 
                                        f32 %48 = OpLoad %47 
                                        f32 %50 = OpFMul %48 %49 
                               Private f32* %51 = OpAccessChain %9 %13 
                                                    OpStore %51 %50 
                                      f32_2 %52 = OpLoad %9 
                                      f32_2 %53 = OpVectorShuffle %52 %52 0 0 
                             Uniform f32_4* %56 = OpAccessChain %25 %54 
                                      f32_4 %57 = OpLoad %56 
                                      f32_2 %58 = OpVectorShuffle %57 %57 0 1 
                                      f32_2 %59 = OpFMul %53 %58 
                                                    OpStore %9 %59 
                             Uniform f32_4* %61 = OpAccessChain %25 %54 
                                      f32_4 %62 = OpLoad %61 
                                      f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                             Uniform f32_4* %64 = OpAccessChain %25 %54 
                                      f32_4 %65 = OpLoad %64 
                                      f32_2 %66 = OpVectorShuffle %65 %65 0 1 
                                      f32_2 %67 = OpFAdd %63 %66 
                                                    OpStore %60 %67 
                                      f32_2 %68 = OpLoad %9 
                                      f32_2 %71 = OpFMul %68 %70 
                                      f32_2 %72 = OpLoad %60 
                                      f32_2 %73 = OpFNegate %72 
                                      f32_2 %74 = OpFAdd %71 %73 
                                                    OpStore %9 %74 
                                      f32_2 %75 = OpLoad %9 
                                      f32_2 %77 = OpLoad %76 
                                      f32_2 %78 = OpFAdd %75 %77 
                                                    OpStore %9 %78 
                 read_only Texture2DSampled %85 = OpLoad %84 
                                      f32_2 %86 = OpLoad %9 
                                      f32_4 %87 = OpImageSampleImplicitLod %85 %86 
                                                    OpStore %80 %87 
                               Private f32* %90 = OpAccessChain %80 %89 
                                        f32 %91 = OpLoad %90 
                                 Input f32* %94 = OpAccessChain %93 %89 
                                        f32 %95 = OpLoad %94 
                                        f32 %96 = OpFMul %91 %95 
                                        f32 %98 = OpFAdd %96 %97 
                                                    OpStore %88 %98 
                                     f32_4 %100 = OpLoad %80 
                                     f32_4 %101 = OpLoad %93 
                                     f32_4 %102 = OpFMul %100 %101 
                                                    OpStore %99 %102 
                                     f32_4 %105 = OpLoad %99 
                                                    OpStore %104 %105 
                                       f32 %109 = OpLoad %88 
                                      bool %111 = OpFOrdLessThan %109 %110 
                                                    OpStore %108 %111 
                                      bool %112 = OpLoad %108 
                                       i32 %113 = OpSelect %112 %54 %27 
                                       i32 %115 = OpIMul %113 %114 
                                      bool %116 = OpINotEqual %115 %27 
                                                    OpSelectionMerge %118 None 
                                                    OpBranchConditional %116 %117 %118 
                                           %117 = OpLabel 
                                                    OpKill
                                           %118 = OpLabel 
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
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Saturation;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec2 u_xlat4;
float u_xlat6;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x + vs_TEXCOORD1.x;
    u_xlat0.x = _Time.z * 5.0 + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.xy = u_xlat0.xx * _MainTex_TexelSize.xy;
    u_xlat4.xy = _MainTex_TexelSize.xy + _MainTex_TexelSize.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(4.0, 4.0) + (-u_xlat4.xy);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat6 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    SV_Target0.w = u_xlat1.w;
    u_xlat6 = u_xlat6 * 0.75;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-vec3(u_xlat6));
    SV_Target0.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat0.xyz + vec3(u_xlat6);
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
; Bound: 134
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %106 %116 %117 %121 %123 %125 %126 
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
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
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
                               Output f32_2* %125 = OpVariable Output 
                                Input f32_2* %126 = OpVariable Input 
                                             %128 = OpTypePointer Output %6 
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
                                       f32_2 %127 = OpLoad %126 
                                                      OpStore %125 %127 
                                 Output f32* %129 = OpAccessChain %106 %59 %47 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFNegate %130 
                                 Output f32* %132 = OpAccessChain %106 %59 %47 
                                                      OpStore %132 %131 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 163
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %11 %76 %93 %160 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %11 Location 11 
                                                    OpMemberDecorate %23 0 Offset 23 
                                                    OpMemberDecorate %23 1 Offset 23 
                                                    OpMemberDecorate %23 2 Offset 23 
                                                    OpDecorate %23 Block 
                                                    OpDecorate %25 DescriptorSet 25 
                                                    OpDecorate %25 Binding 25 
                                                    OpDecorate %76 Location 76 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %84 DescriptorSet 84 
                                                    OpDecorate %84 Binding 84 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %93 Location 93 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %114 RelaxedPrecision 
                                                    OpDecorate %115 RelaxedPrecision 
                                                    OpDecorate %116 RelaxedPrecision 
                                                    OpDecorate %117 RelaxedPrecision 
                                                    OpDecorate %126 RelaxedPrecision 
                                                    OpDecorate %128 RelaxedPrecision 
                                                    OpDecorate %130 RelaxedPrecision 
                                                    OpDecorate %131 RelaxedPrecision 
                                                    OpDecorate %132 RelaxedPrecision 
                                                    OpDecorate %133 RelaxedPrecision 
                                                    OpDecorate %134 RelaxedPrecision 
                                                    OpDecorate %135 RelaxedPrecision 
                                                    OpDecorate %136 RelaxedPrecision 
                                                    OpDecorate %137 RelaxedPrecision 
                                                    OpDecorate %138 RelaxedPrecision 
                                                    OpDecorate %139 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %148 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %150 RelaxedPrecision 
                                                    OpDecorate %151 RelaxedPrecision 
                                                    OpDecorate %152 RelaxedPrecision 
                                                    OpDecorate %153 RelaxedPrecision 
                                                    OpDecorate %154 RelaxedPrecision 
                                                    OpDecorate %155 RelaxedPrecision 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %160 RelaxedPrecision 
                                                    OpDecorate %160 Location 160 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 2 
                                             %8 = OpTypePointer Private %7 
                              Private f32_2* %9 = OpVariable Private 
                                            %10 = OpTypePointer Input %7 
                               Input f32_2* %11 = OpVariable Input 
                                            %12 = OpTypeInt 32 0 
                                        u32 %13 = OpConstant 0 
                                            %14 = OpTypePointer Input %6 
                                            %20 = OpTypePointer Private %6 
                                            %22 = OpTypeVector %6 4 
                                            %23 = OpTypeStruct %22 %22 %6 
                                            %24 = OpTypePointer Uniform %23 
       Uniform struct {f32_4; f32_4; f32;}* %25 = OpVariable Uniform 
                                            %26 = OpTypeInt 32 1 
                                        i32 %27 = OpConstant 0 
                                        u32 %28 = OpConstant 2 
                                            %29 = OpTypePointer Uniform %6 
                                        f32 %32 = OpConstant 3.67402E-40 
                                        f32 %44 = OpConstant 3.67402E-40 
                                        f32 %49 = OpConstant 3.67402E-40 
                                        i32 %54 = OpConstant 1 
                                            %55 = OpTypePointer Uniform %22 
                             Private f32_2* %60 = OpVariable Private 
                                        f32 %69 = OpConstant 3.67402E-40 
                                      f32_2 %70 = OpConstantComposite %69 %69 
                               Input f32_2* %76 = OpVariable Input 
                                            %79 = OpTypePointer Private %22 
                             Private f32_4* %80 = OpVariable Private 
                                            %81 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %82 = OpTypeSampledImage %81 
                                            %83 = OpTypePointer UniformConstant %82 
UniformConstant read_only Texture2DSampled* %84 = OpVariable UniformConstant 
                               Private f32* %88 = OpVariable Private 
                                        u32 %89 = OpConstant 3 
                                            %92 = OpTypePointer Input %22 
                               Input f32_4* %93 = OpVariable Input 
                                        f32 %97 = OpConstant 3.67402E-40 
                                            %99 = OpTypeBool 
                                           %100 = OpTypePointer Private %99 
                             Private bool* %101 = OpVariable Private 
                                       f32 %103 = OpConstant 3.67402E-40 
                                       i32 %107 = OpConstant -1 
                            Private f32_4* %113 = OpVariable Private 
                              Private f32* %117 = OpVariable Private 
                                           %118 = OpTypeVector %6 3 
                                       f32 %121 = OpConstant 3.67402E-40 
                                       f32 %122 = OpConstant 3.67402E-40 
                                       f32 %123 = OpConstant 3.67402E-40 
                                     f32_3 %124 = OpConstantComposite %121 %122 %123 
                                       f32 %127 = OpConstant 3.67402E-40 
                                           %129 = OpTypePointer Private %118 
                            Private f32_3* %130 = OpVariable Private 
                                       i32 %140 = OpConstant 2 
                                           %159 = OpTypePointer Output %22 
                             Output f32_4* %160 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                                 Input f32* %15 = OpAccessChain %11 %13 
                                        f32 %16 = OpLoad %15 
                                 Input f32* %17 = OpAccessChain %11 %13 
                                        f32 %18 = OpLoad %17 
                                        f32 %19 = OpFAdd %16 %18 
                               Private f32* %21 = OpAccessChain %9 %13 
                                                    OpStore %21 %19 
                               Uniform f32* %30 = OpAccessChain %25 %27 %28 
                                        f32 %31 = OpLoad %30 
                                        f32 %33 = OpFMul %31 %32 
                               Private f32* %34 = OpAccessChain %9 %13 
                                        f32 %35 = OpLoad %34 
                                        f32 %36 = OpFAdd %33 %35 
                               Private f32* %37 = OpAccessChain %9 %13 
                                                    OpStore %37 %36 
                               Private f32* %38 = OpAccessChain %9 %13 
                                        f32 %39 = OpLoad %38 
                                        f32 %40 = OpExtInst %1 13 %39 
                               Private f32* %41 = OpAccessChain %9 %13 
                                                    OpStore %41 %40 
                               Private f32* %42 = OpAccessChain %9 %13 
                                        f32 %43 = OpLoad %42 
                                        f32 %45 = OpFAdd %43 %44 
                               Private f32* %46 = OpAccessChain %9 %13 
                                                    OpStore %46 %45 
                               Private f32* %47 = OpAccessChain %9 %13 
                                        f32 %48 = OpLoad %47 
                                        f32 %50 = OpFMul %48 %49 
                               Private f32* %51 = OpAccessChain %9 %13 
                                                    OpStore %51 %50 
                                      f32_2 %52 = OpLoad %9 
                                      f32_2 %53 = OpVectorShuffle %52 %52 0 0 
                             Uniform f32_4* %56 = OpAccessChain %25 %54 
                                      f32_4 %57 = OpLoad %56 
                                      f32_2 %58 = OpVectorShuffle %57 %57 0 1 
                                      f32_2 %59 = OpFMul %53 %58 
                                                    OpStore %9 %59 
                             Uniform f32_4* %61 = OpAccessChain %25 %54 
                                      f32_4 %62 = OpLoad %61 
                                      f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                             Uniform f32_4* %64 = OpAccessChain %25 %54 
                                      f32_4 %65 = OpLoad %64 
                                      f32_2 %66 = OpVectorShuffle %65 %65 0 1 
                                      f32_2 %67 = OpFAdd %63 %66 
                                                    OpStore %60 %67 
                                      f32_2 %68 = OpLoad %9 
                                      f32_2 %71 = OpFMul %68 %70 
                                      f32_2 %72 = OpLoad %60 
                                      f32_2 %73 = OpFNegate %72 
                                      f32_2 %74 = OpFAdd %71 %73 
                                                    OpStore %9 %74 
                                      f32_2 %75 = OpLoad %9 
                                      f32_2 %77 = OpLoad %76 
                                      f32_2 %78 = OpFAdd %75 %77 
                                                    OpStore %9 %78 
                 read_only Texture2DSampled %85 = OpLoad %84 
                                      f32_2 %86 = OpLoad %9 
                                      f32_4 %87 = OpImageSampleImplicitLod %85 %86 
                                                    OpStore %80 %87 
                               Private f32* %90 = OpAccessChain %80 %89 
                                        f32 %91 = OpLoad %90 
                                 Input f32* %94 = OpAccessChain %93 %89 
                                        f32 %95 = OpLoad %94 
                                        f32 %96 = OpFMul %91 %95 
                                        f32 %98 = OpFAdd %96 %97 
                                                    OpStore %88 %98 
                                       f32 %102 = OpLoad %88 
                                      bool %104 = OpFOrdLessThan %102 %103 
                                                    OpStore %101 %104 
                                      bool %105 = OpLoad %101 
                                       i32 %106 = OpSelect %105 %54 %27 
                                       i32 %108 = OpIMul %106 %107 
                                      bool %109 = OpINotEqual %108 %27 
                                                    OpSelectionMerge %111 None 
                                                    OpBranchConditional %109 %110 %111 
                                           %110 = OpLabel 
                                                    OpKill
                                           %111 = OpLabel 
                                     f32_4 %114 = OpLoad %80 
                                     f32_4 %115 = OpLoad %93 
                                     f32_4 %116 = OpFMul %114 %115 
                                                    OpStore %113 %116 
                                     f32_4 %119 = OpLoad %113 
                                     f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32 %125 = OpDot %120 %124 
                                                    OpStore %117 %125 
                                       f32 %126 = OpLoad %117 
                                       f32 %128 = OpFMul %126 %127 
                                                    OpStore %117 %128 
                                     f32_4 %131 = OpLoad %80 
                                     f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                     f32_4 %133 = OpLoad %93 
                                     f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                     f32_3 %135 = OpFMul %132 %134 
                                       f32 %136 = OpLoad %117 
                                     f32_3 %137 = OpCompositeConstruct %136 %136 %136 
                                     f32_3 %138 = OpFNegate %137 
                                     f32_3 %139 = OpFAdd %135 %138 
                                                    OpStore %130 %139 
                              Uniform f32* %141 = OpAccessChain %25 %140 
                                       f32 %142 = OpLoad %141 
                              Uniform f32* %143 = OpAccessChain %25 %140 
                                       f32 %144 = OpLoad %143 
                              Uniform f32* %145 = OpAccessChain %25 %140 
                                       f32 %146 = OpLoad %145 
                                     f32_3 %147 = OpCompositeConstruct %142 %144 %146 
                                       f32 %148 = OpCompositeExtract %147 0 
                                       f32 %149 = OpCompositeExtract %147 1 
                                       f32 %150 = OpCompositeExtract %147 2 
                                     f32_3 %151 = OpCompositeConstruct %148 %149 %150 
                                     f32_3 %152 = OpLoad %130 
                                     f32_3 %153 = OpFMul %151 %152 
                                       f32 %154 = OpLoad %117 
                                     f32_3 %155 = OpCompositeConstruct %154 %154 %154 
                                     f32_3 %156 = OpFAdd %153 %155 
                                     f32_4 %157 = OpLoad %113 
                                     f32_4 %158 = OpVectorShuffle %157 %156 4 5 6 3 
                                                    OpStore %113 %158 
                                     f32_4 %161 = OpLoad %113 
                                                    OpStore %160 %161 
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