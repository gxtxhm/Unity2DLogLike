//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SENaturalBloomAndDirtyLens" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_Bloom0 ("Bloom0 (RGB)", 2D) = "black" { }
_Bloom1 ("Bloom1 (RGB)", 2D) = "black" { }
_Bloom2 ("Bloom2 (RGB)", 2D) = "black" { }
_Bloom3 ("Bloom3 (RGB)", 2D) = "black" { }
_Bloom4 ("Bloom4 (RGB)", 2D) = "black" { }
_Bloom5 ("Bloom5 (RGB)", 2D) = "black" { }
_LensDirt ("Lens Dirt", 2D) = "black" { }
}
SubShader {
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 35916
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
out vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = vec2(1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _BloomIntensity;
uniform 	float _LensDirtIntensity;
uniform  sampler2D _MainTex;
uniform  sampler2D _LensDirt;
uniform  sampler2D _Bloom0;
uniform  sampler2D _Bloom1;
uniform  sampler2D _Bloom2;
uniform  sampler2D _Bloom3;
uniform  sampler2D _Bloom4;
uniform  sampler2D _Bloom5;
in  vec4 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat16_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
void main()
{
    u_xlat10_0 = texture(_Bloom1, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
    u_xlat10_2 = texture(_Bloom0, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_0.xyz * vec3(0.800000012, 0.800000012, 0.800000012) + u_xlat10_2.xyz;
    u_xlat10_2 = texture(_Bloom2, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.600000024, 0.600000024, 0.600000024) + u_xlat16_0.xyz;
    u_xlat10_2 = texture(_Bloom3, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + u_xlat16_0.xyz;
    u_xlat10_2 = texture(_Bloom4, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + u_xlat16_0.xyz;
    u_xlat10_2 = texture(_Bloom5, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.230000004, 0.230000004, 0.230000004) + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz * vec3(0.230000004, 0.230000004, 0.230000004) + u_xlat16_0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.454545438, 0.454545438, 0.454545438) + (-u_xlat10_2.xyz);
    u_xlat1.xyz = vec3(vec3(_BloomIntensity, _BloomIntensity, _BloomIntensity)) * u_xlat16_1.xyz + u_xlat10_2.xyz;
    SV_Target0.w = u_xlat10_2.w;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(0.3125, 0.3125, 0.3125) + (-u_xlat1.xyz);
    u_xlat10_2 = texture(_LensDirt, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(vec3(_LensDirtIntensity, _LensDirtIntensity, _LensDirtIntensity));
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 132
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %101 %121 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %91 RelaxedPrecision 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %101 RelaxedPrecision 
                                                     OpDecorate %101 Location 101 
                                                     OpDecorate %107 RelaxedPrecision 
                                                     OpDecorate %110 RelaxedPrecision 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %116 RelaxedPrecision 
                                                     OpDecorate %121 RelaxedPrecision 
                                                     OpDecorate %121 Location 121 
                                                     OpDecorate %122 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                                             %82 = OpTypeBool 
                                             %83 = OpTypePointer Private %82 
                               Private bool* %84 = OpVariable Private 
                                             %85 = OpTypePointer Uniform %6 
                                         f32 %88 = OpConstant 3.67402E-40 
                                             %90 = OpTypePointer Private %6 
                                Private f32* %91 = OpVariable Private 
                                             %92 = OpTypeVector %6 2 
                                             %93 = OpTypePointer Input %92 
                                Input f32_2* %94 = OpVariable Input 
                                             %95 = OpTypePointer Input %6 
                                         f32 %99 = OpConstant 3.67402E-40 
                              Output f32_4* %101 = OpVariable Output 
                                            %102 = OpTypePointer Function %6 
                                            %112 = OpTypePointer Output %6 
                                        u32 %114 = OpConstant 0 
                                      f32_2 %118 = OpConstantComposite %99 %99 
                              Output f32_4* %121 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %103 = OpVariable Function 
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
                                Uniform f32* %86 = OpAccessChain %20 %35 %68 
                                         f32 %87 = OpLoad %86 
                                        bool %89 = OpFOrdLessThan %87 %88 
                                                     OpStore %84 %89 
                                  Input f32* %96 = OpAccessChain %94 %68 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFNegate %97 
                                        f32 %100 = OpFAdd %98 %99 
                                                     OpStore %91 %100 
                                       bool %104 = OpLoad %84 
                                                     OpSelectionMerge %106 None 
                                                     OpBranchConditional %104 %105 %108 
                                            %105 = OpLabel 
                                        f32 %107 = OpLoad %91 
                                                     OpStore %103 %107 
                                                     OpBranch %106 
                                            %108 = OpLabel 
                                 Input f32* %109 = OpAccessChain %94 %68 
                                        f32 %110 = OpLoad %109 
                                                     OpStore %103 %110 
                                                     OpBranch %106 
                                            %106 = OpLabel 
                                        f32 %111 = OpLoad %103 
                                Output f32* %113 = OpAccessChain %101 %68 
                                                     OpStore %113 %111 
                                 Input f32* %115 = OpAccessChain %94 %114 
                                        f32 %116 = OpLoad %115 
                                Output f32* %117 = OpAccessChain %101 %114 
                                                     OpStore %117 %116 
                                      f32_4 %119 = OpLoad %101 
                                      f32_4 %120 = OpVectorShuffle %119 %118 0 1 4 5 
                                                     OpStore %101 %120 
                                      f32_2 %122 = OpLoad %94 
                                      f32_4 %123 = OpLoad %121 
                                      f32_4 %124 = OpVectorShuffle %123 %122 4 5 2 3 
                                                     OpStore %121 %124 
                                      f32_4 %125 = OpLoad %121 
                                      f32_4 %126 = OpVectorShuffle %125 %118 0 1 4 5 
                                                     OpStore %121 %126 
                                Output f32* %127 = OpAccessChain %72 %22 %68 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpFNegate %128 
                                Output f32* %130 = OpAccessChain %72 %22 %68 
                                                     OpStore %130 %129 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 224
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %17 %133 %169 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %9 RelaxedPrecision 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %13 DescriptorSet 13 
                                                     OpDecorate %13 Binding 13 
                                                     OpDecorate %14 RelaxedPrecision 
                                                     OpDecorate %17 RelaxedPrecision 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %19 RelaxedPrecision 
                                                     OpDecorate %20 RelaxedPrecision 
                                                     OpDecorate %22 RelaxedPrecision 
                                                     OpDecorate %23 RelaxedPrecision 
                                                     OpDecorate %24 RelaxedPrecision 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %29 RelaxedPrecision 
                                                     OpDecorate %30 RelaxedPrecision 
                                                     OpDecorate %30 DescriptorSet 30 
                                                     OpDecorate %30 Binding 30 
                                                     OpDecorate %31 RelaxedPrecision 
                                                     OpDecorate %32 RelaxedPrecision 
                                                     OpDecorate %33 RelaxedPrecision 
                                                     OpDecorate %35 RelaxedPrecision 
                                                     OpDecorate %38 RelaxedPrecision 
                                                     OpDecorate %39 RelaxedPrecision 
                                                     OpDecorate %42 RelaxedPrecision 
                                                     OpDecorate %43 RelaxedPrecision 
                                                     OpDecorate %44 RelaxedPrecision 
                                                     OpDecorate %45 RelaxedPrecision 
                                                     OpDecorate %46 RelaxedPrecision 
                                                     OpDecorate %49 RelaxedPrecision 
                                                     OpDecorate %50 RelaxedPrecision 
                                                     OpDecorate %51 RelaxedPrecision 
                                                     OpDecorate %52 RelaxedPrecision 
                                                     OpDecorate %53 RelaxedPrecision 
                                                     OpDecorate %53 DescriptorSet 53 
                                                     OpDecorate %53 Binding 53 
                                                     OpDecorate %54 RelaxedPrecision 
                                                     OpDecorate %55 RelaxedPrecision 
                                                     OpDecorate %56 RelaxedPrecision 
                                                     OpDecorate %58 RelaxedPrecision 
                                                     OpDecorate %61 RelaxedPrecision 
                                                     OpDecorate %62 RelaxedPrecision 
                                                     OpDecorate %63 RelaxedPrecision 
                                                     OpDecorate %64 RelaxedPrecision 
                                                     OpDecorate %65 RelaxedPrecision 
                                                     OpDecorate %66 RelaxedPrecision 
                                                     OpDecorate %67 RelaxedPrecision 
                                                     OpDecorate %68 RelaxedPrecision 
                                                     OpDecorate %69 RelaxedPrecision 
                                                     OpDecorate %70 RelaxedPrecision 
                                                     OpDecorate %71 RelaxedPrecision 
                                                     OpDecorate %71 DescriptorSet 71 
                                                     OpDecorate %71 Binding 71 
                                                     OpDecorate %72 RelaxedPrecision 
                                                     OpDecorate %73 RelaxedPrecision 
                                                     OpDecorate %74 RelaxedPrecision 
                                                     OpDecorate %76 RelaxedPrecision 
                                                     OpDecorate %79 RelaxedPrecision 
                                                     OpDecorate %80 RelaxedPrecision 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %86 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %88 RelaxedPrecision 
                                                     OpDecorate %89 RelaxedPrecision 
                                                     OpDecorate %90 RelaxedPrecision 
                                                     OpDecorate %91 RelaxedPrecision 
                                                     OpDecorate %91 DescriptorSet 91 
                                                     OpDecorate %91 Binding 91 
                                                     OpDecorate %92 RelaxedPrecision 
                                                     OpDecorate %93 RelaxedPrecision 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %96 RelaxedPrecision 
                                                     OpDecorate %99 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %103 RelaxedPrecision 
                                                     OpDecorate %104 RelaxedPrecision 
                                                     OpDecorate %105 RelaxedPrecision 
                                                     OpDecorate %106 RelaxedPrecision 
                                                     OpDecorate %107 RelaxedPrecision 
                                                     OpDecorate %108 RelaxedPrecision 
                                                     OpDecorate %109 RelaxedPrecision 
                                                     OpDecorate %110 RelaxedPrecision 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %111 DescriptorSet 111 
                                                     OpDecorate %111 Binding 111 
                                                     OpDecorate %112 RelaxedPrecision 
                                                     OpDecorate %113 RelaxedPrecision 
                                                     OpDecorate %114 RelaxedPrecision 
                                                     OpDecorate %116 RelaxedPrecision 
                                                     OpDecorate %119 RelaxedPrecision 
                                                     OpDecorate %120 RelaxedPrecision 
                                                     OpDecorate %123 RelaxedPrecision 
                                                     OpDecorate %124 RelaxedPrecision 
                                                     OpDecorate %125 RelaxedPrecision 
                                                     OpDecorate %126 RelaxedPrecision 
                                                     OpDecorate %127 RelaxedPrecision 
                                                     OpDecorate %128 RelaxedPrecision 
                                                     OpDecorate %129 RelaxedPrecision 
                                                     OpDecorate %130 RelaxedPrecision 
                                                     OpDecorate %131 RelaxedPrecision 
                                                     OpDecorate %131 DescriptorSet 131 
                                                     OpDecorate %131 Binding 131 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %133 RelaxedPrecision 
                                                     OpDecorate %133 Location 133 
                                                     OpDecorate %134 RelaxedPrecision 
                                                     OpDecorate %135 RelaxedPrecision 
                                                     OpDecorate %137 RelaxedPrecision 
                                                     OpDecorate %138 RelaxedPrecision 
                                                     OpDecorate %141 RelaxedPrecision 
                                                     OpDecorate %142 RelaxedPrecision 
                                                     OpDecorate %143 RelaxedPrecision 
                                                     OpDecorate %144 RelaxedPrecision 
                                                     OpDecorate %145 RelaxedPrecision 
                                                     OpMemberDecorate %146 0 Offset 146 
                                                     OpMemberDecorate %146 1 Offset 146 
                                                     OpDecorate %146 Block 
                                                     OpDecorate %148 DescriptorSet 148 
                                                     OpDecorate %148 Binding 148 
                                                     OpDecorate %158 RelaxedPrecision 
                                                     OpDecorate %159 RelaxedPrecision 
                                                     OpDecorate %160 RelaxedPrecision 
                                                     OpDecorate %161 RelaxedPrecision 
                                                     OpDecorate %162 RelaxedPrecision 
                                                     OpDecorate %163 RelaxedPrecision 
                                                     OpDecorate %164 RelaxedPrecision 
                                                     OpDecorate %165 RelaxedPrecision 
                                                     OpDecorate %166 RelaxedPrecision 
                                                     OpDecorate %167 RelaxedPrecision 
                                                     OpDecorate %169 RelaxedPrecision 
                                                     OpDecorate %169 Location 169 
                                                     OpDecorate %174 RelaxedPrecision 
                                                     OpDecorate %177 RelaxedPrecision 
                                                     OpDecorate %180 RelaxedPrecision 
                                                     OpDecorate %181 RelaxedPrecision 
                                                     OpDecorate %182 RelaxedPrecision 
                                                     OpDecorate %183 RelaxedPrecision 
                                                     OpDecorate %184 RelaxedPrecision 
                                                     OpDecorate %185 RelaxedPrecision 
                                                     OpDecorate %185 DescriptorSet 185 
                                                     OpDecorate %185 Binding 185 
                                                     OpDecorate %186 RelaxedPrecision 
                                                     OpDecorate %187 RelaxedPrecision 
                                                     OpDecorate %188 RelaxedPrecision 
                                                     OpDecorate %190 RelaxedPrecision 
                                                     OpDecorate %192 RelaxedPrecision 
                                                     OpDecorate %200 RelaxedPrecision 
                                                     OpDecorate %201 RelaxedPrecision 
                                                     OpDecorate %202 RelaxedPrecision 
                                                     OpDecorate %203 RelaxedPrecision 
                                                     OpDecorate %204 RelaxedPrecision 
                                                     OpDecorate %205 RelaxedPrecision 
                                                     OpDecorate %214 RelaxedPrecision 
                                                     OpDecorate %216 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 3 
                                              %8 = OpTypePointer Private %7 
                               Private f32_3* %9 = OpVariable Private 
                                             %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %11 = OpTypeSampledImage %10 
                                             %12 = OpTypePointer UniformConstant %11 
 UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                             %15 = OpTypeVector %6 4 
                                             %16 = OpTypePointer Input %15 
                                Input f32_4* %17 = OpVariable Input 
                                             %18 = OpTypeVector %6 2 
                              Private f32_3* %23 = OpVariable Private 
                                         f32 %25 = OpConstant 3.67402E-40 
                                       f32_3 %26 = OpConstantComposite %25 %25 %25 
                                             %28 = OpTypePointer Private %15 
                              Private f32_4* %29 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %30 = OpVariable UniformConstant 
                                         f32 %40 = OpConstant 3.67402E-40 
                                       f32_3 %41 = OpConstantComposite %40 %40 %40 
                              Private f32_3* %45 = OpVariable Private 
                                         f32 %47 = OpConstant 3.67402E-40 
                                       f32_3 %48 = OpConstantComposite %47 %47 %47 
 UniformConstant read_only Texture2DSampled* %53 = OpVariable UniformConstant 
 UniformConstant read_only Texture2DSampled* %71 = OpVariable UniformConstant 
                                         f32 %81 = OpConstant 3.67402E-40 
                                       f32_3 %82 = OpConstantComposite %81 %81 %81 
 UniformConstant read_only Texture2DSampled* %91 = OpVariable UniformConstant 
                                        f32 %101 = OpConstant 3.67402E-40 
                                      f32_3 %102 = OpConstantComposite %101 %101 %101 
UniformConstant read_only Texture2DSampled* %111 = OpVariable UniformConstant 
                                        f32 %121 = OpConstant 3.67402E-40 
                                      f32_3 %122 = OpConstantComposite %121 %121 %121 
UniformConstant read_only Texture2DSampled* %131 = OpVariable UniformConstant 
                               Input f32_4* %133 = OpVariable Input 
                             Private f32_3* %137 = OpVariable Private 
                                        f32 %139 = OpConstant 3.67402E-40 
                                      f32_3 %140 = OpConstantComposite %139 %139 %139 
                                            %146 = OpTypeStruct %6 %6 
                                            %147 = OpTypePointer Uniform %146 
                Uniform struct {f32; f32;}* %148 = OpVariable Uniform 
                                            %149 = OpTypeInt 32 1 
                                        i32 %150 = OpConstant 0 
                                            %151 = OpTypePointer Uniform %6 
                                            %168 = OpTypePointer Output %15 
                              Output f32_4* %169 = OpVariable Output 
                                            %170 = OpTypeInt 32 0 
                                        u32 %171 = OpConstant 3 
                                            %172 = OpTypePointer Private %6 
                                            %175 = OpTypePointer Output %6 
                                        f32 %178 = OpConstant 3.67402E-40 
                                      f32_3 %179 = OpConstantComposite %178 %178 %178 
                             Private f32_3* %184 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %185 = OpVariable UniformConstant 
                             Private f32_3* %191 = OpVariable Private 
                                        i32 %193 = OpConstant 1 
                                        f32 %207 = OpConstant 3.67402E-40 
                                        f32 %208 = OpConstant 3.67402E-40 
                             Private f32_3* %212 = OpVariable Private 
                                      f32_3 %219 = OpConstantComposite %207 %207 %207 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                  read_only Texture2DSampled %14 = OpLoad %13 
                                       f32_4 %19 = OpLoad %17 
                                       f32_2 %20 = OpVectorShuffle %19 %19 0 1 
                                       f32_4 %21 = OpImageSampleImplicitLod %14 %20 
                                       f32_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                                                     OpStore %9 %22 
                                       f32_3 %24 = OpLoad %9 
                                       f32_3 %27 = OpFMul %24 %26 
                                                     OpStore %23 %27 
                  read_only Texture2DSampled %31 = OpLoad %30 
                                       f32_4 %32 = OpLoad %17 
                                       f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                       f32_4 %34 = OpImageSampleImplicitLod %31 %33 
                                       f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                       f32_4 %36 = OpLoad %29 
                                       f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                     OpStore %29 %37 
                                       f32_4 %38 = OpLoad %29 
                                       f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                       f32_3 %42 = OpFMul %39 %41 
                                       f32_3 %43 = OpLoad %23 
                                       f32_3 %44 = OpFAdd %42 %43 
                                                     OpStore %23 %44 
                                       f32_3 %46 = OpLoad %9 
                                       f32_3 %49 = OpFMul %46 %48 
                                       f32_4 %50 = OpLoad %29 
                                       f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                       f32_3 %52 = OpFAdd %49 %51 
                                                     OpStore %45 %52 
                  read_only Texture2DSampled %54 = OpLoad %53 
                                       f32_4 %55 = OpLoad %17 
                                       f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                       f32_4 %57 = OpImageSampleImplicitLod %54 %56 
                                       f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                       f32_4 %59 = OpLoad %29 
                                       f32_4 %60 = OpVectorShuffle %59 %58 4 5 6 3 
                                                     OpStore %29 %60 
                                       f32_4 %61 = OpLoad %29 
                                       f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                       f32_3 %63 = OpFMul %62 %26 
                                       f32_3 %64 = OpLoad %23 
                                       f32_3 %65 = OpFAdd %63 %64 
                                                     OpStore %23 %65 
                                       f32_4 %66 = OpLoad %29 
                                       f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                       f32_3 %68 = OpFMul %67 %26 
                                       f32_3 %69 = OpLoad %45 
                                       f32_3 %70 = OpFAdd %68 %69 
                                                     OpStore %45 %70 
                  read_only Texture2DSampled %72 = OpLoad %71 
                                       f32_4 %73 = OpLoad %17 
                                       f32_2 %74 = OpVectorShuffle %73 %73 0 1 
                                       f32_4 %75 = OpImageSampleImplicitLod %72 %74 
                                       f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                       f32_4 %77 = OpLoad %29 
                                       f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                     OpStore %29 %78 
                                       f32_4 %79 = OpLoad %29 
                                       f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                       f32_3 %83 = OpFMul %80 %82 
                                       f32_3 %84 = OpLoad %23 
                                       f32_3 %85 = OpFAdd %83 %84 
                                                     OpStore %23 %85 
                                       f32_4 %86 = OpLoad %29 
                                       f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                       f32_3 %88 = OpFMul %87 %82 
                                       f32_3 %89 = OpLoad %45 
                                       f32_3 %90 = OpFAdd %88 %89 
                                                     OpStore %45 %90 
                  read_only Texture2DSampled %92 = OpLoad %91 
                                       f32_4 %93 = OpLoad %17 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_4 %95 = OpImageSampleImplicitLod %92 %94 
                                       f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                       f32_4 %97 = OpLoad %29 
                                       f32_4 %98 = OpVectorShuffle %97 %96 4 5 6 3 
                                                     OpStore %29 %98 
                                       f32_4 %99 = OpLoad %29 
                                      f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                                      f32_3 %103 = OpFMul %100 %102 
                                      f32_3 %104 = OpLoad %23 
                                      f32_3 %105 = OpFAdd %103 %104 
                                                     OpStore %23 %105 
                                      f32_4 %106 = OpLoad %29 
                                      f32_3 %107 = OpVectorShuffle %106 %106 0 1 2 
                                      f32_3 %108 = OpFMul %107 %102 
                                      f32_3 %109 = OpLoad %45 
                                      f32_3 %110 = OpFAdd %108 %109 
                                                     OpStore %45 %110 
                 read_only Texture2DSampled %112 = OpLoad %111 
                                      f32_4 %113 = OpLoad %17 
                                      f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                      f32_4 %115 = OpImageSampleImplicitLod %112 %114 
                                      f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                      f32_4 %117 = OpLoad %29 
                                      f32_4 %118 = OpVectorShuffle %117 %116 4 5 6 3 
                                                     OpStore %29 %118 
                                      f32_4 %119 = OpLoad %29 
                                      f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                      f32_3 %123 = OpFMul %120 %122 
                                      f32_3 %124 = OpLoad %23 
                                      f32_3 %125 = OpFAdd %123 %124 
                                                     OpStore %23 %125 
                                      f32_4 %126 = OpLoad %29 
                                      f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                      f32_3 %128 = OpFMul %127 %122 
                                      f32_3 %129 = OpLoad %45 
                                      f32_3 %130 = OpFAdd %128 %129 
                                                     OpStore %45 %130 
                 read_only Texture2DSampled %132 = OpLoad %131 
                                      f32_4 %134 = OpLoad %133 
                                      f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                      f32_4 %136 = OpImageSampleImplicitLod %132 %135 
                                                     OpStore %29 %136 
                                      f32_3 %138 = OpLoad %23 
                                      f32_3 %141 = OpFMul %138 %140 
                                      f32_4 %142 = OpLoad %29 
                                      f32_3 %143 = OpVectorShuffle %142 %142 0 1 2 
                                      f32_3 %144 = OpFNegate %143 
                                      f32_3 %145 = OpFAdd %141 %144 
                                                     OpStore %137 %145 
                               Uniform f32* %152 = OpAccessChain %148 %150 
                                        f32 %153 = OpLoad %152 
                               Uniform f32* %154 = OpAccessChain %148 %150 
                                        f32 %155 = OpLoad %154 
                               Uniform f32* %156 = OpAccessChain %148 %150 
                                        f32 %157 = OpLoad %156 
                                      f32_3 %158 = OpCompositeConstruct %153 %155 %157 
                                        f32 %159 = OpCompositeExtract %158 0 
                                        f32 %160 = OpCompositeExtract %158 1 
                                        f32 %161 = OpCompositeExtract %158 2 
                                      f32_3 %162 = OpCompositeConstruct %159 %160 %161 
                                      f32_3 %163 = OpLoad %137 
                                      f32_3 %164 = OpFMul %162 %163 
                                      f32_4 %165 = OpLoad %29 
                                      f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                      f32_3 %167 = OpFAdd %164 %166 
                                                     OpStore %137 %167 
                               Private f32* %173 = OpAccessChain %29 %171 
                                        f32 %174 = OpLoad %173 
                                Output f32* %176 = OpAccessChain %169 %171 
                                                     OpStore %176 %174 
                                      f32_3 %177 = OpLoad %45 
                                      f32_3 %180 = OpFMul %177 %179 
                                      f32_3 %181 = OpLoad %137 
                                      f32_3 %182 = OpFNegate %181 
                                      f32_3 %183 = OpFAdd %180 %182 
                                                     OpStore %45 %183 
                 read_only Texture2DSampled %186 = OpLoad %185 
                                      f32_4 %187 = OpLoad %133 
                                      f32_2 %188 = OpVectorShuffle %187 %187 0 1 
                                      f32_4 %189 = OpImageSampleImplicitLod %186 %188 
                                      f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                     OpStore %184 %190 
                                      f32_3 %192 = OpLoad %184 
                               Uniform f32* %194 = OpAccessChain %148 %193 
                                        f32 %195 = OpLoad %194 
                               Uniform f32* %196 = OpAccessChain %148 %193 
                                        f32 %197 = OpLoad %196 
                               Uniform f32* %198 = OpAccessChain %148 %193 
                                        f32 %199 = OpLoad %198 
                                      f32_3 %200 = OpCompositeConstruct %195 %197 %199 
                                        f32 %201 = OpCompositeExtract %200 0 
                                        f32 %202 = OpCompositeExtract %200 1 
                                        f32 %203 = OpCompositeExtract %200 2 
                                      f32_3 %204 = OpCompositeConstruct %201 %202 %203 
                                      f32_3 %205 = OpFMul %192 %204 
                                                     OpStore %191 %205 
                                      f32_3 %206 = OpLoad %191 
                                      f32_3 %209 = OpCompositeConstruct %207 %207 %207 
                                      f32_3 %210 = OpCompositeConstruct %208 %208 %208 
                                      f32_3 %211 = OpExtInst %1 43 %206 %209 %210 
                                                     OpStore %191 %211 
                                      f32_3 %213 = OpLoad %191 
                                      f32_3 %214 = OpLoad %45 
                                      f32_3 %215 = OpFMul %213 %214 
                                      f32_3 %216 = OpLoad %137 
                                      f32_3 %217 = OpFAdd %215 %216 
                                                     OpStore %212 %217 
                                      f32_3 %218 = OpLoad %212 
                                      f32_3 %220 = OpExtInst %1 40 %218 %219 
                                      f32_4 %221 = OpLoad %169 
                                      f32_4 %222 = OpVectorShuffle %221 %220 4 5 6 3 
                                                     OpStore %169 %222 
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
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 89725
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
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _MainTex_TexelSize.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD1.xy = u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.zw;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat16_0 + u_xlat10_1;
    SV_Target0 = u_xlat16_0 * vec4(0.25, 0.25, 0.25, 0.25);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %85 %97 %115 %122 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %85 Location 85 
                                                     OpDecorate %86 RelaxedPrecision 
                                                     OpDecorate %88 RelaxedPrecision 
                                                     OpDecorate %89 RelaxedPrecision 
                                                     OpDecorate %90 RelaxedPrecision 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %97 Location 97 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %102 RelaxedPrecision 
                                                     OpDecorate %103 RelaxedPrecision 
                                                     OpDecorate %107 RelaxedPrecision 
                                                     OpDecorate %108 RelaxedPrecision 
                                                     OpDecorate %109 RelaxedPrecision 
                                                     OpDecorate %110 RelaxedPrecision 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %112 RelaxedPrecision 
                                                     OpDecorate %115 RelaxedPrecision 
                                                     OpDecorate %115 Location 115 
                                                     OpDecorate %116 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
                                                     OpDecorate %122 RelaxedPrecision 
                                                     OpDecorate %122 Location 122 
                                                     OpDecorate %124 RelaxedPrecision 
                                                     OpDecorate %125 RelaxedPrecision 
                                                     OpDecorate %127 RelaxedPrecision 
                                                     OpDecorate %128 RelaxedPrecision 
                                                     OpDecorate %129 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                                             %83 = OpTypeVector %6 2 
                                             %84 = OpTypePointer Input %83 
                                Input f32_2* %85 = OpVariable Input 
                                         f32 %93 = OpConstant 3.67402E-40 
                                       f32_2 %94 = OpConstantComposite %93 %93 
                               Output f32_4* %97 = OpVariable Output 
                             Private f32_4* %100 = OpVariable Private 
                                        f32 %104 = OpConstant 3.67402E-40 
                                        f32 %105 = OpConstant 3.67402E-40 
                                      f32_4 %106 = OpConstantComposite %104 %104 %105 %104 
                              Output f32_4* %115 = OpVariable Output 
                              Output f32_4* %122 = OpVariable Output 
                                      f32_2 %126 = OpConstantComposite %104 %105 
                                            %134 = OpTypePointer Output %6 
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
                                       f32_2 %86 = OpLoad %85 
                              Uniform f32_4* %87 = OpAccessChain %20 %35 
                                       f32_4 %88 = OpLoad %87 
                                       f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                       f32_2 %90 = OpFAdd %86 %89 
                                       f32_4 %91 = OpLoad %82 
                                       f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                                     OpStore %82 %92 
                                       f32_4 %95 = OpLoad %82 
                                       f32_4 %96 = OpVectorShuffle %95 %94 0 1 4 5 
                                                     OpStore %82 %96 
                                       f32_4 %98 = OpLoad %97 
                                       f32_4 %99 = OpVectorShuffle %98 %94 0 1 4 5 
                                                     OpStore %97 %99 
                             Uniform f32_4* %101 = OpAccessChain %20 %35 
                                      f32_4 %102 = OpLoad %101 
                                      f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                                      f32_4 %107 = OpFMul %103 %106 
                                      f32_2 %108 = OpLoad %85 
                                      f32_4 %109 = OpVectorShuffle %108 %108 0 1 0 1 
                                      f32_4 %110 = OpFAdd %107 %109 
                                                     OpStore %100 %110 
                                      f32_4 %111 = OpLoad %100 
                                      f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                                      f32_4 %113 = OpLoad %97 
                                      f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                     OpStore %97 %114 
                                      f32_4 %116 = OpLoad %100 
                                      f32_2 %117 = OpVectorShuffle %116 %116 2 3 
                                      f32_4 %118 = OpLoad %115 
                                      f32_4 %119 = OpVectorShuffle %118 %117 4 5 2 3 
                                                     OpStore %115 %119 
                                      f32_4 %120 = OpLoad %115 
                                      f32_4 %121 = OpVectorShuffle %120 %94 0 1 4 5 
                                                     OpStore %115 %121 
                             Uniform f32_4* %123 = OpAccessChain %20 %35 
                                      f32_4 %124 = OpLoad %123 
                                      f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                      f32_2 %127 = OpFMul %125 %126 
                                      f32_2 %128 = OpLoad %85 
                                      f32_2 %129 = OpFAdd %127 %128 
                                      f32_4 %130 = OpLoad %122 
                                      f32_4 %131 = OpVectorShuffle %130 %129 4 5 2 3 
                                                     OpStore %122 %131 
                                      f32_4 %132 = OpLoad %122 
                                      f32_4 %133 = OpVectorShuffle %132 %94 0 1 4 5 
                                                     OpStore %122 %133 
                                Output f32* %135 = OpAccessChain %72 %22 %68 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %72 %22 %68 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 54
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %23 %32 %40 %48 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %16 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %18 RelaxedPrecision 
                                                    OpDecorate %19 RelaxedPrecision 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %23 Location 23 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %25 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %28 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %32 Location 32 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %36 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %40 Location 40 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %48 Location 48 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
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
                                            %15 = OpTypePointer Input %7 
                               Input f32_4* %16 = OpVariable Input 
                                            %17 = OpTypeVector %6 2 
                             Private f32_4* %21 = OpVariable Private 
                               Input f32_4* %23 = OpVariable Input 
                             Private f32_4* %27 = OpVariable Private 
                               Input f32_4* %32 = OpVariable Input 
                               Input f32_4* %40 = OpVariable Input 
                                            %47 = OpTypePointer Output %7 
                              Output f32_4* %48 = OpVariable Output 
                                        f32 %50 = OpConstant 3.67402E-40 
                                      f32_4 %51 = OpConstantComposite %50 %50 %50 %50 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_4 %18 = OpLoad %16 
                                      f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                                      f32_4 %20 = OpImageSampleImplicitLod %14 %19 
                                                    OpStore %9 %20 
                 read_only Texture2DSampled %22 = OpLoad %13 
                                      f32_4 %24 = OpLoad %23 
                                      f32_2 %25 = OpVectorShuffle %24 %24 0 1 
                                      f32_4 %26 = OpImageSampleImplicitLod %22 %25 
                                                    OpStore %21 %26 
                                      f32_4 %28 = OpLoad %9 
                                      f32_4 %29 = OpLoad %21 
                                      f32_4 %30 = OpFAdd %28 %29 
                                                    OpStore %27 %30 
                 read_only Texture2DSampled %31 = OpLoad %13 
                                      f32_4 %33 = OpLoad %32 
                                      f32_2 %34 = OpVectorShuffle %33 %33 0 1 
                                      f32_4 %35 = OpImageSampleImplicitLod %31 %34 
                                                    OpStore %21 %35 
                                      f32_4 %36 = OpLoad %27 
                                      f32_4 %37 = OpLoad %21 
                                      f32_4 %38 = OpFAdd %36 %37 
                                                    OpStore %27 %38 
                 read_only Texture2DSampled %39 = OpLoad %13 
                                      f32_4 %41 = OpLoad %40 
                                      f32_2 %42 = OpVectorShuffle %41 %41 0 1 
                                      f32_4 %43 = OpImageSampleImplicitLod %39 %42 
                                                    OpStore %21 %43 
                                      f32_4 %44 = OpLoad %27 
                                      f32_4 %45 = OpLoad %21 
                                      f32_4 %46 = OpFAdd %44 %45 
                                                    OpStore %27 %46 
                                      f32_4 %49 = OpLoad %27 
                                      f32_4 %52 = OpFMul %49 %51 
                                                    OpStore %48 %52 
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
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 159160
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
uniform 	float _BlurSize;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(1.0, 1.0);
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_BlurSize);
    vs_TEXCOORD1.zw = vec2(1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

vec4 ImmCB_0_0_0[7];
uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati2;
vec4 u_xlat10_3;
bool u_xlatb6;
vec2 u_xlat8;
void main()
{
	ImmCB_0_0_0[0] = vec4(0.0205000006, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[1] = vec4(0.0855000019, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[2] = vec4(0.231999993, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[3] = vec4(0.324000001, 0.0, 0.0, 1.0);
	ImmCB_0_0_0[4] = vec4(0.231999993, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[5] = vec4(0.0855000019, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[6] = vec4(0.0205000006, 0.0, 0.0, 0.0);
    u_xlat0.xy = (-vs_TEXCOORD1.xy) * vec2(3.0, 3.0) + vs_TEXCOORD0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat8.xy = u_xlat0.xy;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<7 ; u_xlati_loop_1++)
    {
        u_xlat10_3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat10_3 * ImmCB_0_0_0[u_xlati_loop_1].xxxw + u_xlat1;
        u_xlat8.xy = u_xlat8.xy + vs_TEXCOORD1.xy;
    }
    u_xlat0 = max(u_xlat1, vec4(-250.0, -250.0, -250.0, -250.0));
    SV_Target0 = min(u_xlat0, vec4(250.0, 250.0, 250.0, 250.0));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 122
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %85 %109 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 RelaxedPrecision 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %109 Location 109 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
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
                                              %83 = OpTypeVector %6 2 
                                              %84 = OpTypePointer Input %83 
                                 Input f32_2* %85 = OpVariable Input 
                                          f32 %89 = OpConstant 3.67402E-40 
                                        f32_2 %90 = OpConstantComposite %89 %89 
                                              %93 = OpTypePointer Private %83 
                               Private f32_2* %94 = OpVariable Private 
                                          f32 %98 = OpConstant 3.67402E-40 
                                        f32_2 %99 = OpConstantComposite %98 %89 
                                             %102 = OpTypePointer Uniform %6 
                               Output f32_4* %109 = OpVariable Output 
                                             %116 = OpTypePointer Output %6 
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
                                        f32_2 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %82 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                                      OpStore %82 %88 
                                        f32_4 %91 = OpLoad %82 
                                        f32_4 %92 = OpVectorShuffle %91 %90 0 1 4 5 
                                                      OpStore %82 %92 
                               Uniform f32_4* %95 = OpAccessChain %20 %35 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                       f32_2 %100 = OpFMul %97 %99 
                                                      OpStore %94 %100 
                                       f32_2 %101 = OpLoad %94 
                                Uniform f32* %103 = OpAccessChain %20 %44 
                                         f32 %104 = OpLoad %103 
                                       f32_2 %105 = OpCompositeConstruct %104 %104 
                                       f32_2 %106 = OpFMul %101 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_4 %112 = OpLoad %109 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 2 3 
                                                      OpStore %109 %113 
                                       f32_4 %114 = OpLoad %109 
                                       f32_4 %115 = OpVectorShuffle %114 %90 0 1 4 5 
                                                      OpStore %109 %115 
                                 Output f32* %117 = OpAccessChain %72 %22 %68 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                 Output f32* %120 = OpAccessChain %72 %22 %68 
                                                      OpStore %120 %119 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 117
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %41 %49 %107 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %49 Location 49 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %84 DescriptorSet 84 
                                                    OpDecorate %84 Binding 84 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %107 Location 107 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypeInt 32 0 
                                         u32 %9 = OpConstant 7 
                                            %10 = OpTypeArray %7 %9 
                                            %11 = OpTypePointer Private %10 
                          Private f32_4[7]* %12 = OpVariable Private 
                                            %13 = OpTypeInt 32 1 
                                        i32 %14 = OpConstant 0 
                                        f32 %15 = OpConstant 3.67402E-40 
                                        f32 %16 = OpConstant 3.67402E-40 
                                      f32_4 %17 = OpConstantComposite %15 %16 %16 %16 
                                            %18 = OpTypePointer Private %7 
                                        i32 %20 = OpConstant 1 
                                        f32 %21 = OpConstant 3.67402E-40 
                                      f32_4 %22 = OpConstantComposite %21 %16 %16 %16 
                                        i32 %24 = OpConstant 2 
                                        f32 %25 = OpConstant 3.67402E-40 
                                      f32_4 %26 = OpConstantComposite %25 %16 %16 %16 
                                        i32 %28 = OpConstant 3 
                                        f32 %29 = OpConstant 3.67402E-40 
                                        f32 %30 = OpConstant 3.67402E-40 
                                      f32_4 %31 = OpConstantComposite %29 %16 %16 %30 
                                        i32 %33 = OpConstant 4 
                                        i32 %35 = OpConstant 5 
                                        i32 %37 = OpConstant 6 
                             Private f32_4* %39 = OpVariable Private 
                                            %40 = OpTypePointer Input %7 
                               Input f32_4* %41 = OpVariable Input 
                                            %42 = OpTypeVector %6 2 
                                        f32 %46 = OpConstant 3.67402E-40 
                                      f32_2 %47 = OpConstantComposite %46 %46 
                               Input f32_4* %49 = OpVariable Input 
                             Private f32_4* %55 = OpVariable Private 
                                        u32 %56 = OpConstant 0 
                                            %57 = OpTypePointer Private %6 
                                        u32 %59 = OpConstant 1 
                                        u32 %61 = OpConstant 2 
                                        u32 %63 = OpConstant 3 
                                            %65 = OpTypePointer Private %42 
                             Private f32_2* %66 = OpVariable Private 
                                            %69 = OpTypePointer Function %13 
                                        i32 %77 = OpConstant 7 
                                            %78 = OpTypeBool 
                             Private f32_4* %80 = OpVariable Private 
                                            %81 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %82 = OpTypeSampledImage %81 
                                            %83 = OpTypePointer UniformConstant %82 
UniformConstant read_only Texture2DSampled* %84 = OpVariable UniformConstant 
                                       f32 %103 = OpConstant 3.67402E-40 
                                     f32_4 %104 = OpConstantComposite %103 %103 %103 %103 
                                           %106 = OpTypePointer Output %7 
                             Output f32_4* %107 = OpVariable Output 
                                       f32 %109 = OpConstant 3.67402E-40 
                                     f32_4 %110 = OpConstantComposite %109 %109 %109 %109 
                                           %113 = OpTypePointer Private %13 
                              Private i32* %114 = OpVariable Private 
                                           %115 = OpTypePointer Private %78 
                             Private bool* %116 = OpVariable Private 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function i32* %70 = OpVariable Function 
                             Private f32_4* %19 = OpAccessChain %12 %14 
                                                    OpStore %19 %17 
                             Private f32_4* %23 = OpAccessChain %12 %20 
                                                    OpStore %23 %22 
                             Private f32_4* %27 = OpAccessChain %12 %24 
                                                    OpStore %27 %26 
                             Private f32_4* %32 = OpAccessChain %12 %28 
                                                    OpStore %32 %31 
                             Private f32_4* %34 = OpAccessChain %12 %33 
                                                    OpStore %34 %26 
                             Private f32_4* %36 = OpAccessChain %12 %35 
                                                    OpStore %36 %22 
                             Private f32_4* %38 = OpAccessChain %12 %37 
                                                    OpStore %38 %17 
                                      f32_4 %43 = OpLoad %41 
                                      f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                      f32_2 %45 = OpFNegate %44 
                                      f32_2 %48 = OpFMul %45 %47 
                                      f32_4 %50 = OpLoad %49 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_2 %52 = OpFAdd %48 %51 
                                      f32_4 %53 = OpLoad %39 
                                      f32_4 %54 = OpVectorShuffle %53 %52 4 5 2 3 
                                                    OpStore %39 %54 
                               Private f32* %58 = OpAccessChain %55 %56 
                                                    OpStore %58 %16 
                               Private f32* %60 = OpAccessChain %55 %59 
                                                    OpStore %60 %16 
                               Private f32* %62 = OpAccessChain %55 %61 
                                                    OpStore %62 %16 
                               Private f32* %64 = OpAccessChain %55 %63 
                                                    OpStore %64 %16 
                                      f32_4 %67 = OpLoad %39 
                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                                    OpStore %66 %68 
                                                    OpStore %70 %14 
                                                    OpBranch %71 
                                            %71 = OpLabel 
                                                    OpLoopMerge %73 %74 None 
                                                    OpBranch %75 
                                            %75 = OpLabel 
                                        i32 %76 = OpLoad %70 
                                       bool %79 = OpSLessThan %76 %77 
                                                    OpBranchConditional %79 %72 %73 
                                            %72 = OpLabel 
                 read_only Texture2DSampled %85 = OpLoad %84 
                                      f32_2 %86 = OpLoad %66 
                                      f32_4 %87 = OpImageSampleImplicitLod %85 %86 
                                                    OpStore %80 %87 
                                      f32_4 %88 = OpLoad %80 
                                        i32 %89 = OpLoad %70 
                             Private f32_4* %90 = OpAccessChain %12 %89 
                                      f32_4 %91 = OpLoad %90 
                                      f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 3 
                                      f32_4 %93 = OpFMul %88 %92 
                                      f32_4 %94 = OpLoad %55 
                                      f32_4 %95 = OpFAdd %93 %94 
                                                    OpStore %55 %95 
                                      f32_2 %96 = OpLoad %66 
                                      f32_4 %97 = OpLoad %41 
                                      f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                      f32_2 %99 = OpFAdd %96 %98 
                                                    OpStore %66 %99 
                                                    OpBranch %74 
                                            %74 = OpLabel 
                                       i32 %100 = OpLoad %70 
                                       i32 %101 = OpIAdd %100 %20 
                                                    OpStore %70 %101 
                                                    OpBranch %71 
                                            %73 = OpLabel 
                                     f32_4 %102 = OpLoad %55 
                                     f32_4 %105 = OpExtInst %1 40 %102 %104 
                                                    OpStore %39 %105 
                                     f32_4 %108 = OpLoad %39 
                                     f32_4 %111 = OpExtInst %1 37 %108 %110 
                                                    OpStore %107 %111 
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
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 221638
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
uniform 	float _BlurSize;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(1.0, 1.0);
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(1.0, 0.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_BlurSize);
    vs_TEXCOORD1.zw = vec2(1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

vec4 ImmCB_0_0_0[7];
uniform  sampler2D _MainTex;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
int u_xlati2;
vec4 u_xlat10_3;
bool u_xlatb6;
vec2 u_xlat8;
void main()
{
	ImmCB_0_0_0[0] = vec4(0.0205000006, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[1] = vec4(0.0855000019, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[2] = vec4(0.231999993, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[3] = vec4(0.324000001, 0.0, 0.0, 1.0);
	ImmCB_0_0_0[4] = vec4(0.231999993, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[5] = vec4(0.0855000019, 0.0, 0.0, 0.0);
	ImmCB_0_0_0[6] = vec4(0.0205000006, 0.0, 0.0, 0.0);
    u_xlat0.xy = (-vs_TEXCOORD1.xy) * vec2(3.0, 3.0) + vs_TEXCOORD0.xy;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlat1.w = float(0.0);
    u_xlat8.xy = u_xlat0.xy;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<7 ; u_xlati_loop_1++)
    {
        u_xlat10_3 = texture(_MainTex, u_xlat8.xy);
        u_xlat1 = u_xlat10_3 * ImmCB_0_0_0[u_xlati_loop_1].xxxw + u_xlat1;
        u_xlat8.xy = u_xlat8.xy + vs_TEXCOORD1.xy;
    }
    u_xlat0 = max(u_xlat1, vec4(-250.0, -250.0, -250.0, -250.0));
    SV_Target0 = min(u_xlat0, vec4(250.0, 250.0, 250.0, 250.0));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 122
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %82 %85 %109 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 RelaxedPrecision 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %82 Location 82 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %97 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %109 Location 109 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
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
                                              %83 = OpTypeVector %6 2 
                                              %84 = OpTypePointer Input %83 
                                 Input f32_2* %85 = OpVariable Input 
                                          f32 %89 = OpConstant 3.67402E-40 
                                        f32_2 %90 = OpConstantComposite %89 %89 
                                              %93 = OpTypePointer Private %83 
                               Private f32_2* %94 = OpVariable Private 
                                          f32 %98 = OpConstant 3.67402E-40 
                                        f32_2 %99 = OpConstantComposite %89 %98 
                                             %102 = OpTypePointer Uniform %6 
                               Output f32_4* %109 = OpVariable Output 
                                             %116 = OpTypePointer Output %6 
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
                                        f32_2 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %82 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                                      OpStore %82 %88 
                                        f32_4 %91 = OpLoad %82 
                                        f32_4 %92 = OpVectorShuffle %91 %90 0 1 4 5 
                                                      OpStore %82 %92 
                               Uniform f32_4* %95 = OpAccessChain %20 %35 
                                        f32_4 %96 = OpLoad %95 
                                        f32_2 %97 = OpVectorShuffle %96 %96 0 1 
                                       f32_2 %100 = OpFMul %97 %99 
                                                      OpStore %94 %100 
                                       f32_2 %101 = OpLoad %94 
                                Uniform f32* %103 = OpAccessChain %20 %44 
                                         f32 %104 = OpLoad %103 
                                       f32_2 %105 = OpCompositeConstruct %104 %104 
                                       f32_2 %106 = OpFMul %101 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_4 %112 = OpLoad %109 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 2 3 
                                                      OpStore %109 %113 
                                       f32_4 %114 = OpLoad %109 
                                       f32_4 %115 = OpVectorShuffle %114 %90 0 1 4 5 
                                                      OpStore %109 %115 
                                 Output f32* %117 = OpAccessChain %72 %22 %68 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFNegate %118 
                                 Output f32* %120 = OpAccessChain %72 %22 %68 
                                                      OpStore %120 %119 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 117
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %41 %49 %107 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %44 RelaxedPrecision 
                                                    OpDecorate %45 RelaxedPrecision 
                                                    OpDecorate %48 RelaxedPrecision 
                                                    OpDecorate %49 RelaxedPrecision 
                                                    OpDecorate %49 Location 49 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %51 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %66 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %68 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %84 DescriptorSet 84 
                                                    OpDecorate %84 Binding 84 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %88 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %102 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %107 Location 107 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %111 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypeInt 32 0 
                                         u32 %9 = OpConstant 7 
                                            %10 = OpTypeArray %7 %9 
                                            %11 = OpTypePointer Private %10 
                          Private f32_4[7]* %12 = OpVariable Private 
                                            %13 = OpTypeInt 32 1 
                                        i32 %14 = OpConstant 0 
                                        f32 %15 = OpConstant 3.67402E-40 
                                        f32 %16 = OpConstant 3.67402E-40 
                                      f32_4 %17 = OpConstantComposite %15 %16 %16 %16 
                                            %18 = OpTypePointer Private %7 
                                        i32 %20 = OpConstant 1 
                                        f32 %21 = OpConstant 3.67402E-40 
                                      f32_4 %22 = OpConstantComposite %21 %16 %16 %16 
                                        i32 %24 = OpConstant 2 
                                        f32 %25 = OpConstant 3.67402E-40 
                                      f32_4 %26 = OpConstantComposite %25 %16 %16 %16 
                                        i32 %28 = OpConstant 3 
                                        f32 %29 = OpConstant 3.67402E-40 
                                        f32 %30 = OpConstant 3.67402E-40 
                                      f32_4 %31 = OpConstantComposite %29 %16 %16 %30 
                                        i32 %33 = OpConstant 4 
                                        i32 %35 = OpConstant 5 
                                        i32 %37 = OpConstant 6 
                             Private f32_4* %39 = OpVariable Private 
                                            %40 = OpTypePointer Input %7 
                               Input f32_4* %41 = OpVariable Input 
                                            %42 = OpTypeVector %6 2 
                                        f32 %46 = OpConstant 3.67402E-40 
                                      f32_2 %47 = OpConstantComposite %46 %46 
                               Input f32_4* %49 = OpVariable Input 
                             Private f32_4* %55 = OpVariable Private 
                                        u32 %56 = OpConstant 0 
                                            %57 = OpTypePointer Private %6 
                                        u32 %59 = OpConstant 1 
                                        u32 %61 = OpConstant 2 
                                        u32 %63 = OpConstant 3 
                                            %65 = OpTypePointer Private %42 
                             Private f32_2* %66 = OpVariable Private 
                                            %69 = OpTypePointer Function %13 
                                        i32 %77 = OpConstant 7 
                                            %78 = OpTypeBool 
                             Private f32_4* %80 = OpVariable Private 
                                            %81 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %82 = OpTypeSampledImage %81 
                                            %83 = OpTypePointer UniformConstant %82 
UniformConstant read_only Texture2DSampled* %84 = OpVariable UniformConstant 
                                       f32 %103 = OpConstant 3.67402E-40 
                                     f32_4 %104 = OpConstantComposite %103 %103 %103 %103 
                                           %106 = OpTypePointer Output %7 
                             Output f32_4* %107 = OpVariable Output 
                                       f32 %109 = OpConstant 3.67402E-40 
                                     f32_4 %110 = OpConstantComposite %109 %109 %109 %109 
                                           %113 = OpTypePointer Private %13 
                              Private i32* %114 = OpVariable Private 
                                           %115 = OpTypePointer Private %78 
                             Private bool* %116 = OpVariable Private 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function i32* %70 = OpVariable Function 
                             Private f32_4* %19 = OpAccessChain %12 %14 
                                                    OpStore %19 %17 
                             Private f32_4* %23 = OpAccessChain %12 %20 
                                                    OpStore %23 %22 
                             Private f32_4* %27 = OpAccessChain %12 %24 
                                                    OpStore %27 %26 
                             Private f32_4* %32 = OpAccessChain %12 %28 
                                                    OpStore %32 %31 
                             Private f32_4* %34 = OpAccessChain %12 %33 
                                                    OpStore %34 %26 
                             Private f32_4* %36 = OpAccessChain %12 %35 
                                                    OpStore %36 %22 
                             Private f32_4* %38 = OpAccessChain %12 %37 
                                                    OpStore %38 %17 
                                      f32_4 %43 = OpLoad %41 
                                      f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                      f32_2 %45 = OpFNegate %44 
                                      f32_2 %48 = OpFMul %45 %47 
                                      f32_4 %50 = OpLoad %49 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_2 %52 = OpFAdd %48 %51 
                                      f32_4 %53 = OpLoad %39 
                                      f32_4 %54 = OpVectorShuffle %53 %52 4 5 2 3 
                                                    OpStore %39 %54 
                               Private f32* %58 = OpAccessChain %55 %56 
                                                    OpStore %58 %16 
                               Private f32* %60 = OpAccessChain %55 %59 
                                                    OpStore %60 %16 
                               Private f32* %62 = OpAccessChain %55 %61 
                                                    OpStore %62 %16 
                               Private f32* %64 = OpAccessChain %55 %63 
                                                    OpStore %64 %16 
                                      f32_4 %67 = OpLoad %39 
                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                                    OpStore %66 %68 
                                                    OpStore %70 %14 
                                                    OpBranch %71 
                                            %71 = OpLabel 
                                                    OpLoopMerge %73 %74 None 
                                                    OpBranch %75 
                                            %75 = OpLabel 
                                        i32 %76 = OpLoad %70 
                                       bool %79 = OpSLessThan %76 %77 
                                                    OpBranchConditional %79 %72 %73 
                                            %72 = OpLabel 
                 read_only Texture2DSampled %85 = OpLoad %84 
                                      f32_2 %86 = OpLoad %66 
                                      f32_4 %87 = OpImageSampleImplicitLod %85 %86 
                                                    OpStore %80 %87 
                                      f32_4 %88 = OpLoad %80 
                                        i32 %89 = OpLoad %70 
                             Private f32_4* %90 = OpAccessChain %12 %89 
                                      f32_4 %91 = OpLoad %90 
                                      f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 3 
                                      f32_4 %93 = OpFMul %88 %92 
                                      f32_4 %94 = OpLoad %55 
                                      f32_4 %95 = OpFAdd %93 %94 
                                                    OpStore %55 %95 
                                      f32_2 %96 = OpLoad %66 
                                      f32_4 %97 = OpLoad %41 
                                      f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                      f32_2 %99 = OpFAdd %96 %98 
                                                    OpStore %66 %99 
                                                    OpBranch %74 
                                            %74 = OpLabel 
                                       i32 %100 = OpLoad %70 
                                       i32 %101 = OpIAdd %100 %20 
                                                    OpStore %70 %101 
                                                    OpBranch %71 
                                            %73 = OpLabel 
                                     f32_4 %102 = OpLoad %55 
                                     f32_4 %105 = OpExtInst %1 40 %102 %104 
                                                    OpStore %39 %105 
                                     f32_4 %108 = OpLoad %39 
                                     f32_4 %111 = OpExtInst %1 37 %108 %110 
                                                    OpStore %107 %111 
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