//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/DistortionLine" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
_WavePoint1 ("Wave Point 1", Vector) = (0,0,0,0)
_WavePoint2 ("Wave Point 2", Vector) = (1,1,0,0)
_DistortProgress ("Distort Progress", Range(0, 1)) = 0
}
SubShader {
 Pass {
  GpuProgramID 15527
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

uniform 	vec4 _WavePoint1;
uniform 	vec4 _WavePoint2;
uniform 	float _DistortProgress;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
vec2 u_xlat7;
float u_xlat9;
void main()
{
    u_xlat0.xy = (-_WavePoint1.xy) + _WavePoint2.xy;
    u_xlat6 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat9 = sqrt(u_xlat6);
    u_xlat1.xy = u_xlat0.xy / vec2(u_xlat9);
    u_xlat7.xy = vs_TEXCOORD0.xy + (-_WavePoint1.xy);
    u_xlat0.x = dot(u_xlat7.xy, u_xlat0.xy);
    u_xlat0.x = u_xlat0.x / u_xlat6;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2 = (-_WavePoint1) + _WavePoint2;
    u_xlat0 = u_xlat0.xxxx * u_xlat2 + _WavePoint1;
    u_xlat2.xy = (-u_xlat0.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat2.xy * vec2(1.77777779, 1.0);
    u_xlat7.x = dot(u_xlat0.xy, u_xlat1.xy);
    u_xlat0.xy = (-u_xlat7.xx) * u_xlat1.xy + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww * u_xlat0.xy;
    u_xlat2.zw = u_xlat2.xx * vec2(1.77777779, 1.77777779);
    u_xlat9 = dot(u_xlat2.yz, u_xlat2.yw);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = _DistortProgress * 2.0 + (-u_xlat9);
    u_xlat6 = abs(u_xlat9) / u_xlat0.z;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat6 = (-u_xlat6) + 1.0;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat9 * u_xlat6;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    SV_Target0 = texture(_MainTex, u_xlat0.xy);
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
; Bound: 181
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %47 %171 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %10 0 Offset 10 
                                                     OpMemberDecorate %10 1 Offset 10 
                                                     OpMemberDecorate %10 2 Offset 10 
                                                     OpDecorate %10 Block 
                                                     OpDecorate %12 DescriptorSet 12 
                                                     OpDecorate %12 Binding 12 
                                                     OpDecorate %47 RelaxedPrecision 
                                                     OpDecorate %47 Location 47 
                                                     OpDecorate %48 RelaxedPrecision 
                                                     OpDecorate %89 RelaxedPrecision 
                                                     OpDecorate %166 RelaxedPrecision 
                                                     OpDecorate %171 Location 171 
                                                     OpDecorate %175 RelaxedPrecision 
                                                     OpDecorate %175 DescriptorSet 175 
                                                     OpDecorate %175 Binding 175 
                                                     OpDecorate %176 RelaxedPrecision 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeStruct %7 %7 %6 
                                             %11 = OpTypePointer Uniform %10 
        Uniform struct {f32_4; f32_4; f32;}* %12 = OpVariable Uniform 
                                             %13 = OpTypeInt 32 1 
                                         i32 %14 = OpConstant 0 
                                             %15 = OpTypeVector %6 2 
                                             %16 = OpTypePointer Uniform %7 
                                         i32 %21 = OpConstant 1 
                                             %28 = OpTypePointer Private %6 
                                Private f32* %29 = OpVariable Private 
                                Private f32* %35 = OpVariable Private 
                                             %38 = OpTypePointer Private %15 
                              Private f32_2* %39 = OpVariable Private 
                              Private f32_2* %45 = OpVariable Private 
                                             %46 = OpTypePointer Input %15 
                                Input f32_2* %47 = OpVariable Input 
                                             %58 = OpTypeInt 32 0 
                                         u32 %59 = OpConstant 0 
                                         f32 %68 = OpConstant 3.67402E-40 
                                         f32 %69 = OpConstant 3.67402E-40 
                              Private f32_4* %72 = OpVariable Private 
                                         f32 %95 = OpConstant 3.67402E-40 
                                       f32_2 %96 = OpConstantComposite %95 %69 
                                      f32_2 %124 = OpConstantComposite %95 %95 
                                        i32 %135 = OpConstant 2 
                                            %136 = OpTypePointer Uniform %6 
                                        f32 %139 = OpConstant 3.67402E-40 
                                        u32 %146 = OpConstant 2 
                                            %170 = OpTypePointer Output %7 
                              Output f32_4* %171 = OpVariable Output 
                                            %172 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %173 = OpTypeSampledImage %172 
                                            %174 = OpTypePointer UniformConstant %173 
UniformConstant read_only Texture2DSampled* %175 = OpVariable UniformConstant 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Uniform f32_4* %17 = OpAccessChain %12 %14 
                                       f32_4 %18 = OpLoad %17 
                                       f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                                       f32_2 %20 = OpFNegate %19 
                              Uniform f32_4* %22 = OpAccessChain %12 %21 
                                       f32_4 %23 = OpLoad %22 
                                       f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                                       f32_2 %25 = OpFAdd %20 %24 
                                       f32_4 %26 = OpLoad %9 
                                       f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
                                                     OpStore %9 %27 
                                       f32_4 %30 = OpLoad %9 
                                       f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                       f32_4 %32 = OpLoad %9 
                                       f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                         f32 %34 = OpDot %31 %33 
                                                     OpStore %29 %34 
                                         f32 %36 = OpLoad %29 
                                         f32 %37 = OpExtInst %1 31 %36 
                                                     OpStore %35 %37 
                                       f32_4 %40 = OpLoad %9 
                                       f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                         f32 %42 = OpLoad %35 
                                       f32_2 %43 = OpCompositeConstruct %42 %42 
                                       f32_2 %44 = OpFDiv %41 %43 
                                                     OpStore %39 %44 
                                       f32_2 %48 = OpLoad %47 
                              Uniform f32_4* %49 = OpAccessChain %12 %14 
                                       f32_4 %50 = OpLoad %49 
                                       f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                       f32_2 %52 = OpFNegate %51 
                                       f32_2 %53 = OpFAdd %48 %52 
                                                     OpStore %45 %53 
                                       f32_2 %54 = OpLoad %45 
                                       f32_4 %55 = OpLoad %9 
                                       f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                         f32 %57 = OpDot %54 %56 
                                Private f32* %60 = OpAccessChain %9 %59 
                                                     OpStore %60 %57 
                                Private f32* %61 = OpAccessChain %9 %59 
                                         f32 %62 = OpLoad %61 
                                         f32 %63 = OpLoad %29 
                                         f32 %64 = OpFDiv %62 %63 
                                Private f32* %65 = OpAccessChain %9 %59 
                                                     OpStore %65 %64 
                                Private f32* %66 = OpAccessChain %9 %59 
                                         f32 %67 = OpLoad %66 
                                         f32 %70 = OpExtInst %1 43 %67 %68 %69 
                                Private f32* %71 = OpAccessChain %9 %59 
                                                     OpStore %71 %70 
                              Uniform f32_4* %73 = OpAccessChain %12 %14 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpFNegate %74 
                              Uniform f32_4* %76 = OpAccessChain %12 %21 
                                       f32_4 %77 = OpLoad %76 
                                       f32_4 %78 = OpFAdd %75 %77 
                                                     OpStore %72 %78 
                                       f32_4 %79 = OpLoad %9 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpLoad %72 
                                       f32_4 %82 = OpFMul %80 %81 
                              Uniform f32_4* %83 = OpAccessChain %12 %14 
                                       f32_4 %84 = OpLoad %83 
                                       f32_4 %85 = OpFAdd %82 %84 
                                                     OpStore %9 %85 
                                       f32_4 %86 = OpLoad %9 
                                       f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                       f32_2 %88 = OpFNegate %87 
                                       f32_2 %89 = OpLoad %47 
                                       f32_2 %90 = OpFAdd %88 %89 
                                       f32_4 %91 = OpLoad %72 
                                       f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                                     OpStore %72 %92 
                                       f32_4 %93 = OpLoad %72 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                     OpStore %9 %99 
                                      f32_4 %100 = OpLoad %9 
                                      f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                      f32_2 %102 = OpLoad %39 
                                        f32 %103 = OpDot %101 %102 
                               Private f32* %104 = OpAccessChain %45 %59 
                                                     OpStore %104 %103 
                                      f32_2 %105 = OpLoad %45 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 0 
                                      f32_2 %107 = OpFNegate %106 
                                      f32_2 %108 = OpLoad %39 
                                      f32_2 %109 = OpFMul %107 %108 
                                      f32_4 %110 = OpLoad %9 
                                      f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                      f32_2 %112 = OpFAdd %109 %111 
                                      f32_4 %113 = OpLoad %9 
                                      f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                     OpStore %9 %114 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                                      f32_4 %120 = OpLoad %9 
                                      f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                     OpStore %9 %121 
                                      f32_4 %122 = OpLoad %72 
                                      f32_2 %123 = OpVectorShuffle %122 %122 0 0 
                                      f32_2 %125 = OpFMul %123 %124 
                                      f32_4 %126 = OpLoad %72 
                                      f32_4 %127 = OpVectorShuffle %126 %125 0 1 4 5 
                                                     OpStore %72 %127 
                                      f32_4 %128 = OpLoad %72 
                                      f32_2 %129 = OpVectorShuffle %128 %128 1 2 
                                      f32_4 %130 = OpLoad %72 
                                      f32_2 %131 = OpVectorShuffle %130 %130 1 3 
                                        f32 %132 = OpDot %129 %131 
                                                     OpStore %35 %132 
                                        f32 %133 = OpLoad %35 
                                        f32 %134 = OpExtInst %1 31 %133 
                                                     OpStore %35 %134 
                               Uniform f32* %137 = OpAccessChain %12 %135 
                                        f32 %138 = OpLoad %137 
                                        f32 %140 = OpFMul %138 %139 
                                        f32 %141 = OpLoad %35 
                                        f32 %142 = OpFNegate %141 
                                        f32 %143 = OpFAdd %140 %142 
                                                     OpStore %35 %143 
                                        f32 %144 = OpLoad %35 
                                        f32 %145 = OpExtInst %1 4 %144 
                               Private f32* %147 = OpAccessChain %9 %146 
                                        f32 %148 = OpLoad %147 
                                        f32 %149 = OpFDiv %145 %148 
                                                     OpStore %29 %149 
                                        f32 %150 = OpLoad %29 
                                        f32 %151 = OpExtInst %1 43 %150 %68 %69 
                                                     OpStore %29 %151 
                                        f32 %152 = OpLoad %29 
                                        f32 %153 = OpFNegate %152 
                                        f32 %154 = OpFAdd %153 %69 
                                                     OpStore %29 %154 
                                        f32 %155 = OpLoad %29 
                                        f32 %156 = OpLoad %29 
                                        f32 %157 = OpFMul %155 %156 
                                                     OpStore %35 %157 
                                        f32 %158 = OpLoad %35 
                                        f32 %159 = OpLoad %29 
                                        f32 %160 = OpFMul %158 %159 
                                                     OpStore %29 %160 
                                      f32_4 %161 = OpLoad %9 
                                      f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                        f32 %163 = OpLoad %29 
                                      f32_2 %164 = OpCompositeConstruct %163 %163 
                                      f32_2 %165 = OpFMul %162 %164 
                                      f32_2 %166 = OpLoad %47 
                                      f32_2 %167 = OpFAdd %165 %166 
                                      f32_4 %168 = OpLoad %9 
                                      f32_4 %169 = OpVectorShuffle %168 %167 4 5 2 3 
                                                     OpStore %9 %169 
                 read_only Texture2DSampled %176 = OpLoad %175 
                                      f32_4 %177 = OpLoad %9 
                                      f32_2 %178 = OpVectorShuffle %177 %177 0 1 
                                      f32_4 %179 = OpImageSampleImplicitLod %176 %178 
                                                     OpStore %171 %179 
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