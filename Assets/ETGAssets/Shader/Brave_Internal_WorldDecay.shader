//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/WorldDecay" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
_WaveCenter ("Wave Center", Vector) = (0,0,0,0)
}
SubShader {
 Pass {
  Stencil {
   Ref 2
   Comp Always
   Pass Replace
   Fail Keep
   ZFail DecrWrap
  }
  GpuProgramID 21243
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _WaveCenter;
uniform  sampler2D _NoiseTex;
uniform  sampler2D _PreBackgroundTex;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat10_1;
vec4 u_xlat10_2;
vec2 u_xlat3;
vec3 u_xlat16_3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-_WaveCenter.xy);
    u_xlat0.zw = u_xlat0.xx * vec2(1.77777779, 1.77777779);
    u_xlat0.x = dot(u_xlat0.yz, u_xlat0.yw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat3.xy = _WaveCenter.xy + vec2(-0.5, -0.5);
    u_xlat3.xy = (-u_xlat3.xy) + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture(_NoiseTex, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x + (-u_xlat10_1.x);
    u_xlat0.x = (-u_xlat0.x) + _WaveCenter.z;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat1.y = u_xlat0.x * -0.200000003;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.x = 0.0;
    u_xlat3.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat3.xy = clamp(u_xlat3.xy, 0.0, 1.0);
    u_xlat10_1 = texture(_MainTex, u_xlat3.xy);
    u_xlat10_2 = texture(_PreBackgroundTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat0.xxx * u_xlat16_3.xyz + u_xlat10_1.xyz;
    SV_Target0.w = (-u_xlat0.x) + 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
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
                                              OpDecorate %84 RelaxedPrecision 
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
                        Output f32_2* %84 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_2 %87 = OpLoad %86 
                                              OpStore %84 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
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
                                                     OpEntryPoint Fragment %4 "main" %12 %139 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %12 Location 12 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %57 RelaxedPrecision 
                                                     OpDecorate %61 RelaxedPrecision 
                                                     OpDecorate %65 RelaxedPrecision 
                                                     OpDecorate %65 DescriptorSet 65 
                                                     OpDecorate %65 Binding 65 
                                                     OpDecorate %66 RelaxedPrecision 
                                                     OpDecorate %69 RelaxedPrecision 
                                                     OpDecorate %72 RelaxedPrecision 
                                                     OpDecorate %73 RelaxedPrecision 
                                                     OpDecorate %116 RelaxedPrecision 
                                                     OpDecorate %122 RelaxedPrecision 
                                                     OpDecorate %122 DescriptorSet 122 
                                                     OpDecorate %122 Binding 122 
                                                     OpDecorate %123 RelaxedPrecision 
                                                     OpDecorate %126 RelaxedPrecision 
                                                     OpDecorate %127 RelaxedPrecision 
                                                     OpDecorate %128 RelaxedPrecision 
                                                     OpDecorate %128 DescriptorSet 128 
                                                     OpDecorate %128 Binding 128 
                                                     OpDecorate %129 RelaxedPrecision 
                                                     OpDecorate %130 RelaxedPrecision 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %133 RelaxedPrecision 
                                                     OpDecorate %134 RelaxedPrecision 
                                                     OpDecorate %135 RelaxedPrecision 
                                                     OpDecorate %136 RelaxedPrecision 
                                                     OpDecorate %137 RelaxedPrecision 
                                                     OpDecorate %139 Location 139 
                                                     OpDecorate %142 RelaxedPrecision 
                                                     OpDecorate %144 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                                Input f32_2* %12 = OpVariable Input 
                                             %14 = OpTypeStruct %7 
                                             %15 = OpTypePointer Uniform %14 
                    Uniform struct {f32_4;}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 0 
                                             %19 = OpTypePointer Uniform %7 
                                         f32 %29 = OpConstant 3.67402E-40 
                                       f32_2 %30 = OpConstantComposite %29 %29 
                                             %39 = OpTypeInt 32 0 
                                         u32 %40 = OpConstant 0 
                                             %41 = OpTypePointer Private %6 
                                             %47 = OpTypePointer Private %10 
                              Private f32_2* %48 = OpVariable Private 
                                         f32 %52 = OpConstant 3.67402E-40 
                                       f32_2 %53 = OpConstantComposite %52 %52 
                                             %59 = OpTypeVector %6 3 
                                             %60 = OpTypePointer Private %59 
                              Private f32_3* %61 = OpVariable Private 
                                             %62 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %63 = OpTypeSampledImage %62 
                                             %64 = OpTypePointer UniformConstant %63 
 UniformConstant read_only Texture2DSampled* %65 = OpVariable UniformConstant 
                                         u32 %81 = OpConstant 2 
                                             %82 = OpTypePointer Uniform %6 
                                         f32 %89 = OpConstant 3.67402E-40 
                                         f32 %94 = OpConstant 3.67402E-40 
                              Private f32_2* %97 = OpVariable Private 
                                        f32 %100 = OpConstant 3.67402E-40 
                                        u32 %102 = OpConstant 1 
                                        f32 %106 = OpConstant 3.67402E-40 
                                        f32 %111 = OpConstant 3.67402E-40 
UniformConstant read_only Texture2DSampled* %122 = OpVariable UniformConstant 
                             Private f32_3* %127 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %128 = OpVariable UniformConstant 
                             Private f32_3* %133 = OpVariable Private 
                                            %138 = OpTypePointer Output %7 
                              Output f32_4* %139 = OpVariable Output 
                                        u32 %152 = OpConstant 3 
                                            %153 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %13 = OpLoad %12 
                              Uniform f32_4* %20 = OpAccessChain %16 %18 
                                       f32_4 %21 = OpLoad %20 
                                       f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                                       f32_2 %23 = OpFNegate %22 
                                       f32_2 %24 = OpFAdd %13 %23 
                                       f32_4 %25 = OpLoad %9 
                                       f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                                     OpStore %9 %26 
                                       f32_4 %27 = OpLoad %9 
                                       f32_2 %28 = OpVectorShuffle %27 %27 0 0 
                                       f32_2 %31 = OpFMul %28 %30 
                                       f32_4 %32 = OpLoad %9 
                                       f32_4 %33 = OpVectorShuffle %32 %31 0 1 4 5 
                                                     OpStore %9 %33 
                                       f32_4 %34 = OpLoad %9 
                                       f32_2 %35 = OpVectorShuffle %34 %34 1 2 
                                       f32_4 %36 = OpLoad %9 
                                       f32_2 %37 = OpVectorShuffle %36 %36 1 3 
                                         f32 %38 = OpDot %35 %37 
                                Private f32* %42 = OpAccessChain %9 %40 
                                                     OpStore %42 %38 
                                Private f32* %43 = OpAccessChain %9 %40 
                                         f32 %44 = OpLoad %43 
                                         f32 %45 = OpExtInst %1 31 %44 
                                Private f32* %46 = OpAccessChain %9 %40 
                                                     OpStore %46 %45 
                              Uniform f32_4* %49 = OpAccessChain %16 %18 
                                       f32_4 %50 = OpLoad %49 
                                       f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                       f32_2 %54 = OpFAdd %51 %53 
                                                     OpStore %48 %54 
                                       f32_2 %55 = OpLoad %48 
                                       f32_2 %56 = OpFNegate %55 
                                       f32_2 %57 = OpLoad %12 
                                       f32_2 %58 = OpFAdd %56 %57 
                                                     OpStore %48 %58 
                  read_only Texture2DSampled %66 = OpLoad %65 
                                       f32_2 %67 = OpLoad %48 
                                       f32_4 %68 = OpImageSampleImplicitLod %66 %67 
                                         f32 %69 = OpCompositeExtract %68 0 
                                Private f32* %70 = OpAccessChain %61 %40 
                                                     OpStore %70 %69 
                                Private f32* %71 = OpAccessChain %61 %40 
                                         f32 %72 = OpLoad %71 
                                         f32 %73 = OpFNegate %72 
                                Private f32* %74 = OpAccessChain %9 %40 
                                         f32 %75 = OpLoad %74 
                                         f32 %76 = OpFAdd %73 %75 
                                Private f32* %77 = OpAccessChain %9 %40 
                                                     OpStore %77 %76 
                                Private f32* %78 = OpAccessChain %9 %40 
                                         f32 %79 = OpLoad %78 
                                         f32 %80 = OpFNegate %79 
                                Uniform f32* %83 = OpAccessChain %16 %18 %81 
                                         f32 %84 = OpLoad %83 
                                         f32 %85 = OpFAdd %80 %84 
                                Private f32* %86 = OpAccessChain %9 %40 
                                                     OpStore %86 %85 
                                Private f32* %87 = OpAccessChain %9 %40 
                                         f32 %88 = OpLoad %87 
                                         f32 %90 = OpFMul %88 %89 
                                Private f32* %91 = OpAccessChain %9 %40 
                                                     OpStore %91 %90 
                                Private f32* %92 = OpAccessChain %9 %40 
                                         f32 %93 = OpLoad %92 
                                         f32 %95 = OpExtInst %1 40 %93 %94 
                                Private f32* %96 = OpAccessChain %9 %40 
                                                     OpStore %96 %95 
                                Private f32* %98 = OpAccessChain %9 %40 
                                         f32 %99 = OpLoad %98 
                                        f32 %101 = OpFMul %99 %100 
                               Private f32* %103 = OpAccessChain %97 %102 
                                                     OpStore %103 %101 
                               Private f32* %104 = OpAccessChain %9 %40 
                                        f32 %105 = OpLoad %104 
                                        f32 %107 = OpFAdd %105 %106 
                               Private f32* %108 = OpAccessChain %9 %40 
                                                     OpStore %108 %107 
                               Private f32* %109 = OpAccessChain %9 %40 
                                        f32 %110 = OpLoad %109 
                                        f32 %112 = OpExtInst %1 43 %110 %94 %111 
                               Private f32* %113 = OpAccessChain %9 %40 
                                                     OpStore %113 %112 
                               Private f32* %114 = OpAccessChain %97 %40 
                                                     OpStore %114 %94 
                                      f32_2 %115 = OpLoad %97 
                                      f32_2 %116 = OpLoad %12 
                                      f32_2 %117 = OpFAdd %115 %116 
                                                     OpStore %48 %117 
                                      f32_2 %118 = OpLoad %48 
                                      f32_2 %119 = OpCompositeConstruct %94 %94 
                                      f32_2 %120 = OpCompositeConstruct %111 %111 
                                      f32_2 %121 = OpExtInst %1 43 %118 %119 %120 
                                                     OpStore %48 %121 
                 read_only Texture2DSampled %123 = OpLoad %122 
                                      f32_2 %124 = OpLoad %48 
                                      f32_4 %125 = OpImageSampleImplicitLod %123 %124 
                                      f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                                                     OpStore %61 %126 
                 read_only Texture2DSampled %129 = OpLoad %128 
                                      f32_2 %130 = OpLoad %12 
                                      f32_4 %131 = OpImageSampleImplicitLod %129 %130 
                                      f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                                     OpStore %127 %132 
                                      f32_3 %134 = OpLoad %61 
                                      f32_3 %135 = OpFNegate %134 
                                      f32_3 %136 = OpLoad %127 
                                      f32_3 %137 = OpFAdd %135 %136 
                                                     OpStore %133 %137 
                                      f32_4 %140 = OpLoad %9 
                                      f32_3 %141 = OpVectorShuffle %140 %140 0 0 0 
                                      f32_3 %142 = OpLoad %133 
                                      f32_3 %143 = OpFMul %141 %142 
                                      f32_3 %144 = OpLoad %61 
                                      f32_3 %145 = OpFAdd %143 %144 
                                      f32_4 %146 = OpLoad %139 
                                      f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                     OpStore %139 %147 
                               Private f32* %148 = OpAccessChain %9 %40 
                                        f32 %149 = OpLoad %148 
                                        f32 %150 = OpFNegate %149 
                                        f32 %151 = OpFAdd %150 %111 
                                Output f32* %154 = OpAccessChain %139 %152 
                                                     OpStore %154 %151 
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