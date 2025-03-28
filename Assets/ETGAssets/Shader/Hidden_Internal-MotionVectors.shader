//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-MotionVectors" {
Properties {
}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "MOTIONVECTORS" }
  ZWrite Off
  GpuProgramID 59123
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
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousM[4];
uniform 	int _HasLastPositionData;
uniform 	float _MotionVectorDepthBias;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec4 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_NonJitteredVP[1];
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD0 = hlslcc_mtx4x4_NonJitteredVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_NORMAL0.xyz;
    u_xlat1.w = 1.0;
    u_xlat1 = (_HasLastPositionData != 0) ? u_xlat1 : in_POSITION0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousM[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4_PreviousM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousVP[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD1 = hlslcc_mtx4x4_PreviousVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position.z = _MotionVectorDepthBias * u_xlat0.w + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	int _ForceNoMotion;
in  vec4 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
    u_xlat1 = (_ForceNoMotion != 0) ? 1.0 : 0.0;
    u_xlat0.z = float(0.0);
    u_xlat0.w = float(1.0);
    SV_Target0 = vec4(u_xlat1) * (-u_xlat0) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 221
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %90 %158 %196 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate %80 Location 80 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate %158 Location 158 
                                                      OpMemberDecorate %194 0 BuiltIn 194 
                                                      OpMemberDecorate %194 1 BuiltIn 194 
                                                      OpMemberDecorate %194 2 BuiltIn 194 
                                                      OpDecorate %194 Block 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeStruct %16 %17 %18 %19 %20 %21 %6 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; i32; f32;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 0 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 2 
                               Private f32_4* %46 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %59 = OpVariable Private 
                                              %79 = OpTypePointer Output %7 
                                Output f32_4* %80 = OpVariable Output 
                                              %88 = OpTypeVector %6 3 
                                              %89 = OpTypePointer Input %88 
                                 Input f32_3* %90 = OpVariable Input 
                                          f32 %94 = OpConstant 3.67402E-40 
                                          u32 %95 = OpConstant 3 
                                              %96 = OpTypePointer Private %6 
                                              %98 = OpTypePointer Function %7 
                                         i32 %100 = OpConstant 5 
                                             %101 = OpTypePointer Uniform %21 
                                             %104 = OpTypeBool 
                                         i32 %114 = OpConstant 4 
                               Output f32_4* %158 = OpVariable Output 
                                         u32 %192 = OpConstant 1 
                                             %193 = OpTypeArray %6 %192 
                                             %194 = OpTypeStruct %7 %6 %193 
                                             %195 = OpTypePointer Output %194 
        Output struct {f32_4; f32; f32[1];}* %196 = OpVariable Output 
                                         i32 %197 = OpConstant 6 
                                             %198 = OpTypePointer Uniform %6 
                                         u32 %205 = OpConstant 2 
                                             %209 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_4* %99 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %24 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %31 = OpAccessChain %24 %25 %25 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %24 %25 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %48 = OpAccessChain %24 %25 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %11 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %46 %54 
                                        f32_4 %55 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %24 %25 %47 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %55 %57 
                                                      OpStore %9 %58 
                                        f32_4 %60 = OpLoad %46 
                                        f32_4 %61 = OpVectorShuffle %60 %60 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %24 %38 %26 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %61 %63 
                                                      OpStore %59 %64 
                               Uniform f32_4* %65 = OpAccessChain %24 %38 %25 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %59 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %59 %71 
                               Uniform f32_4* %72 = OpAccessChain %24 %38 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %59 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %81 = OpAccessChain %24 %38 %47 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %46 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %59 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %80 %87 
                                        f32_3 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %46 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %46 %93 
                                 Private f32* %97 = OpAccessChain %46 %95 
                                                      OpStore %97 %94 
                                Uniform i32* %102 = OpAccessChain %24 %100 
                                         i32 %103 = OpLoad %102 
                                        bool %105 = OpINotEqual %103 %25 
                                                      OpSelectionMerge %107 None 
                                                      OpBranchConditional %105 %106 %109 
                                             %106 = OpLabel 
                                       f32_4 %108 = OpLoad %46 
                                                      OpStore %99 %108 
                                                      OpBranch %107 
                                             %109 = OpLabel 
                                       f32_4 %110 = OpLoad %11 
                                                      OpStore %99 %110 
                                                      OpBranch %107 
                                             %107 = OpLabel 
                                       f32_4 %111 = OpLoad %99 
                                                      OpStore %46 %111 
                                       f32_4 %112 = OpLoad %46 
                                       f32_4 %113 = OpVectorShuffle %112 %112 1 1 1 1 
                              Uniform f32_4* %115 = OpAccessChain %24 %114 %26 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpFMul %113 %116 
                                                      OpStore %59 %117 
                              Uniform f32_4* %118 = OpAccessChain %24 %114 %25 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpLoad %46 
                                       f32_4 %121 = OpVectorShuffle %120 %120 0 0 0 0 
                                       f32_4 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %59 
                                       f32_4 %124 = OpFAdd %122 %123 
                                                      OpStore %59 %124 
                              Uniform f32_4* %125 = OpAccessChain %24 %114 %38 
                                       f32_4 %126 = OpLoad %125 
                                       f32_4 %127 = OpLoad %46 
                                       f32_4 %128 = OpVectorShuffle %127 %127 2 2 2 2 
                                       f32_4 %129 = OpFMul %126 %128 
                                       f32_4 %130 = OpLoad %59 
                                       f32_4 %131 = OpFAdd %129 %130 
                                                      OpStore %59 %131 
                              Uniform f32_4* %132 = OpAccessChain %24 %114 %47 
                                       f32_4 %133 = OpLoad %132 
                                       f32_4 %134 = OpLoad %46 
                                       f32_4 %135 = OpVectorShuffle %134 %134 3 3 3 3 
                                       f32_4 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %59 
                                       f32_4 %138 = OpFAdd %136 %137 
                                                      OpStore %46 %138 
                                       f32_4 %139 = OpLoad %46 
                                       f32_4 %140 = OpVectorShuffle %139 %139 1 1 1 1 
                              Uniform f32_4* %141 = OpAccessChain %24 %47 %26 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %140 %142 
                                                      OpStore %59 %143 
                              Uniform f32_4* %144 = OpAccessChain %24 %47 %25 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpLoad %46 
                                       f32_4 %147 = OpVectorShuffle %146 %146 0 0 0 0 
                                       f32_4 %148 = OpFMul %145 %147 
                                       f32_4 %149 = OpLoad %59 
                                       f32_4 %150 = OpFAdd %148 %149 
                                                      OpStore %59 %150 
                              Uniform f32_4* %151 = OpAccessChain %24 %47 %38 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpLoad %46 
                                       f32_4 %154 = OpVectorShuffle %153 %153 2 2 2 2 
                                       f32_4 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %59 
                                       f32_4 %157 = OpFAdd %155 %156 
                                                      OpStore %59 %157 
                              Uniform f32_4* %159 = OpAccessChain %24 %47 %47 
                                       f32_4 %160 = OpLoad %159 
                                       f32_4 %161 = OpLoad %46 
                                       f32_4 %162 = OpVectorShuffle %161 %161 3 3 3 3 
                                       f32_4 %163 = OpFMul %160 %162 
                                       f32_4 %164 = OpLoad %59 
                                       f32_4 %165 = OpFAdd %163 %164 
                                                      OpStore %158 %165 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 1 1 1 1 
                              Uniform f32_4* %168 = OpAccessChain %24 %26 %26 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpFMul %167 %169 
                                                      OpStore %46 %170 
                              Uniform f32_4* %171 = OpAccessChain %24 %26 %25 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 0 0 0 0 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %46 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %46 %177 
                              Uniform f32_4* %178 = OpAccessChain %24 %26 %38 
                                       f32_4 %179 = OpLoad %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_4 %181 = OpVectorShuffle %180 %180 2 2 2 2 
                                       f32_4 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %46 
                                       f32_4 %184 = OpFAdd %182 %183 
                                                      OpStore %46 %184 
                              Uniform f32_4* %185 = OpAccessChain %24 %26 %47 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %9 
                                       f32_4 %188 = OpVectorShuffle %187 %187 3 3 3 3 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %46 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %9 %191 
                                Uniform f32* %199 = OpAccessChain %24 %197 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFNegate %200 
                                Private f32* %202 = OpAccessChain %9 %95 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %206 = OpAccessChain %9 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFAdd %204 %207 
                                 Output f32* %210 = OpAccessChain %196 %25 %205 
                                                      OpStore %210 %208 
                                       f32_4 %211 = OpLoad %9 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 3 
                               Output f32_4* %213 = OpAccessChain %196 %25 
                                       f32_4 %214 = OpLoad %213 
                                       f32_4 %215 = OpVectorShuffle %214 %212 4 5 2 6 
                                                      OpStore %213 %215 
                                 Output f32* %216 = OpAccessChain %196 %25 %192 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFNegate %217 
                                 Output f32* %219 = OpAccessChain %196 %25 %192 
                                                      OpStore %219 %218 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 123
; Schema: 0
                               OpCapability Shader 
                        %1 = OpExtInstImport "GLSL.std.450" 
                               OpMemoryModel Logical GLSL450 
                               OpEntryPoint Fragment %4 "main" %12 %45 %96 
                               OpExecutionMode %4 OriginUpperLeft 
                               OpDecorate %12 Location 12 
                               OpDecorate %45 Location 45 
                               OpDecorate %77 RelaxedPrecision 
                               OpMemberDecorate %81 0 Offset 81 
                               OpDecorate %81 Block 
                               OpDecorate %83 DescriptorSet 83 
                               OpDecorate %83 Binding 83 
                               OpDecorate %94 RelaxedPrecision 
                               OpDecorate %96 RelaxedPrecision 
                               OpDecorate %96 Location 96 
                               OpDecorate %97 RelaxedPrecision 
                               OpDecorate %109 RelaxedPrecision 
                               OpDecorate %114 RelaxedPrecision 
                               OpDecorate %115 RelaxedPrecision 
                               OpDecorate %116 RelaxedPrecision 
                               OpDecorate %117 RelaxedPrecision 
                               OpDecorate %119 RelaxedPrecision 
                        %2 = OpTypeVoid 
                        %3 = OpTypeFunction %2 
                        %6 = OpTypeFloat 32 
                        %7 = OpTypeVector %6 3 
                        %8 = OpTypePointer Private %7 
         Private f32_3* %9 = OpVariable Private 
                       %10 = OpTypeVector %6 4 
                       %11 = OpTypePointer Input %10 
          Input f32_4* %12 = OpVariable Input 
                       %13 = OpTypeVector %6 2 
                   f32 %23 = OpConstant 3.67402E-40 
                 f32_2 %24 = OpConstantComposite %23 %23 
                       %28 = OpTypeInt 32 0 
                   u32 %29 = OpConstant 0 
                       %30 = OpTypePointer Private %6 
                   f32 %33 = OpConstant 3.67402E-40 
                   u32 %36 = OpConstant 1 
                   u32 %42 = OpConstant 2 
        Private f32_3* %44 = OpVariable Private 
          Input f32_4* %45 = OpVariable Input 
        Private f32_3* %58 = OpVariable Private 
          Private f32* %77 = OpVariable Private 
                       %78 = OpTypePointer Function %6 
                       %80 = OpTypeInt 32 1 
                       %81 = OpTypeStruct %80 
                       %82 = OpTypePointer Uniform %81 
Uniform struct {i32;}* %83 = OpVariable Uniform 
                   i32 %84 = OpConstant 0 
                       %85 = OpTypePointer Uniform %80 
                       %88 = OpTypeBool 
                   f32 %93 = OpConstant 3.67402E-40 
                       %95 = OpTypePointer Output %10 
         Output f32_4* %96 = OpVariable Output 
                      %108 = OpTypePointer Private %13 
       Private f32_2* %109 = OpVariable Private 
                  f32 %110 = OpConstant 3.67402E-40 
                  f32 %112 = OpConstant 3.67402E-40 
                f32_2 %118 = OpConstantComposite %93 %23 
                   void %4 = OpFunction None %3 
                        %5 = OpLabel 
         Function f32* %79 = OpVariable Function 
                 f32_4 %14 = OpLoad %12 
                 f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                 f32_4 %16 = OpLoad %12 
                 f32_2 %17 = OpVectorShuffle %16 %16 3 3 
                 f32_2 %18 = OpFDiv %15 %17 
                 f32_3 %19 = OpLoad %9 
                 f32_3 %20 = OpVectorShuffle %19 %18 3 4 2 
                               OpStore %9 %20 
                 f32_3 %21 = OpLoad %9 
                 f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                 f32_2 %25 = OpFAdd %22 %24 
                 f32_3 %26 = OpLoad %9 
                 f32_3 %27 = OpVectorShuffle %26 %25 3 4 2 
                               OpStore %9 %27 
          Private f32* %31 = OpAccessChain %9 %29 
                   f32 %32 = OpLoad %31 
                   f32 %34 = OpFMul %32 %33 
          Private f32* %35 = OpAccessChain %9 %29 
                               OpStore %35 %34 
          Private f32* %37 = OpAccessChain %9 %36 
                   f32 %38 = OpLoad %37 
                   f32 %39 = OpFNegate %38 
                   f32 %40 = OpFMul %39 %33 
                   f32 %41 = OpFAdd %40 %23 
          Private f32* %43 = OpAccessChain %9 %42 
                               OpStore %43 %41 
                 f32_4 %46 = OpLoad %45 
                 f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                 f32_4 %48 = OpLoad %45 
                 f32_2 %49 = OpVectorShuffle %48 %48 3 3 
                 f32_2 %50 = OpFDiv %47 %49 
                 f32_3 %51 = OpLoad %44 
                 f32_3 %52 = OpVectorShuffle %51 %50 3 1 4 
                               OpStore %44 %52 
                 f32_3 %53 = OpLoad %44 
                 f32_2 %54 = OpVectorShuffle %53 %53 0 2 
                 f32_2 %55 = OpFAdd %54 %24 
                 f32_3 %56 = OpLoad %44 
                 f32_3 %57 = OpVectorShuffle %56 %55 3 1 4 
                               OpStore %44 %57 
          Private f32* %59 = OpAccessChain %44 %29 
                   f32 %60 = OpLoad %59 
                   f32 %61 = OpFMul %60 %33 
          Private f32* %62 = OpAccessChain %58 %29 
                               OpStore %62 %61 
          Private f32* %63 = OpAccessChain %44 %42 
                   f32 %64 = OpLoad %63 
                   f32 %65 = OpFNegate %64 
                   f32 %66 = OpFMul %65 %33 
                   f32 %67 = OpFAdd %66 %23 
          Private f32* %68 = OpAccessChain %58 %42 
                               OpStore %68 %67 
                 f32_3 %69 = OpLoad %9 
                 f32_2 %70 = OpVectorShuffle %69 %69 0 2 
                 f32_3 %71 = OpLoad %58 
                 f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                 f32_2 %73 = OpFNegate %72 
                 f32_2 %74 = OpFAdd %70 %73 
                 f32_3 %75 = OpLoad %9 
                 f32_3 %76 = OpVectorShuffle %75 %74 3 4 2 
                               OpStore %9 %76 
          Uniform i32* %86 = OpAccessChain %83 %84 
                   i32 %87 = OpLoad %86 
                  bool %89 = OpINotEqual %87 %84 
                               OpSelectionMerge %91 None 
                               OpBranchConditional %89 %90 %92 
                       %90 = OpLabel 
                               OpStore %79 %23 
                               OpBranch %91 
                       %92 = OpLabel 
                               OpStore %79 %93 
                               OpBranch %91 
                       %91 = OpLabel 
                   f32 %94 = OpLoad %79 
                               OpStore %77 %94 
                   f32 %97 = OpLoad %77 
                 f32_2 %98 = OpCompositeConstruct %97 %97 
                 f32_3 %99 = OpLoad %9 
                f32_2 %100 = OpVectorShuffle %99 %99 0 1 
                f32_2 %101 = OpFNegate %100 
                f32_2 %102 = OpFMul %98 %101 
                f32_3 %103 = OpLoad %9 
                f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                f32_2 %105 = OpFAdd %102 %104 
                f32_4 %106 = OpLoad %96 
                f32_4 %107 = OpVectorShuffle %106 %105 4 5 2 3 
                               OpStore %96 %107 
         Private f32* %111 = OpAccessChain %109 %29 
                               OpStore %111 %110 
         Private f32* %113 = OpAccessChain %109 %36 
                               OpStore %113 %112 
                  f32 %114 = OpLoad %77 
                f32_2 %115 = OpCompositeConstruct %114 %114 
                f32_2 %116 = OpLoad %109 
                f32_2 %117 = OpFMul %115 %116 
                f32_2 %119 = OpFAdd %117 %118 
                f32_4 %120 = OpLoad %96 
                f32_4 %121 = OpVectorShuffle %120 %119 0 1 4 5 
                               OpStore %96 %121 
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 124246
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat0.x = _ZBufferParams.x * u_xlat10_0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    SV_Target0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.zw = vec2(0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate %105 Location 105 
                                                     OpDecorate %113 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.67402E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                              Output f32_2* %105 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                              Output f32_3* %113 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore %105 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore %113 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 244
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %58 %234 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %26 ArrayStride 26 
                                                      OpDecorate %27 ArrayStride 27 
                                                      OpDecorate %28 ArrayStride 28 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %234 Location 234 
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
                                              %20 = OpTypeInt 32 0 
                                          u32 %21 = OpConstant 0 
                                              %23 = OpTypePointer Private %6 
                                          u32 %25 = OpConstant 4 
                                              %26 = OpTypeArray %7 %25 
                                              %27 = OpTypeArray %7 %25 
                                              %28 = OpTypeArray %7 %25 
                                              %29 = OpTypeStruct %7 %7 %26 %27 %28 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %6 
                                          u32 %40 = OpConstant 1 
                                          f32 %45 = OpConstant 3.67402E-40 
                                              %50 = OpTypeVector %6 3 
                                              %51 = OpTypePointer Private %50 
                               Private f32_3* %52 = OpVariable Private 
                                          i32 %53 = OpConstant 0 
                                          u32 %54 = OpConstant 2 
                                              %57 = OpTypePointer Input %50 
                                 Input f32_3* %58 = OpVariable Input 
                                              %59 = OpTypePointer Input %6 
                               Private f32_4* %74 = OpVariable Private 
                                          i32 %77 = OpConstant 2 
                                              %78 = OpTypePointer Uniform %7 
                                          i32 %97 = OpConstant 3 
                                         i32 %103 = OpConstant 4 
                                       f32_2 %152 = OpConstantComposite %45 %45 
                                         f32 %158 = OpConstant 3.67402E-40 
                              Private f32_3* %167 = OpVariable Private 
                                             %233 = OpTypePointer Output %7 
                               Output f32_4* %234 = OpVariable Output 
                                         f32 %239 = OpConstant 3.67402E-40 
                                       f32_2 %240 = OpConstantComposite %239 %45 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                          f32 %22 = OpCompositeExtract %19 0 
                                 Private f32* %24 = OpAccessChain %9 %21 
                                                      OpStore %24 %22 
                                 Uniform f32* %35 = OpAccessChain %31 %33 %21 
                                          f32 %36 = OpLoad %35 
                                 Private f32* %37 = OpAccessChain %9 %21 
                                          f32 %38 = OpLoad %37 
                                          f32 %39 = OpFMul %36 %38 
                                 Uniform f32* %41 = OpAccessChain %31 %33 %40 
                                          f32 %42 = OpLoad %41 
                                          f32 %43 = OpFAdd %39 %42 
                                 Private f32* %44 = OpAccessChain %9 %21 
                                                      OpStore %44 %43 
                                 Private f32* %46 = OpAccessChain %9 %21 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFDiv %45 %47 
                                 Private f32* %49 = OpAccessChain %9 %21 
                                                      OpStore %49 %48 
                                 Uniform f32* %55 = OpAccessChain %31 %53 %54 
                                          f32 %56 = OpLoad %55 
                                   Input f32* %60 = OpAccessChain %58 %54 
                                          f32 %61 = OpLoad %60 
                                          f32 %62 = OpFDiv %56 %61 
                                 Private f32* %63 = OpAccessChain %52 %21 
                                                      OpStore %63 %62 
                                        f32_3 %64 = OpLoad %52 
                                        f32_3 %65 = OpVectorShuffle %64 %64 0 0 0 
                                        f32_3 %66 = OpLoad %58 
                                        f32_3 %67 = OpFMul %65 %66 
                                                      OpStore %52 %67 
                                        f32_4 %68 = OpLoad %9 
                                        f32_3 %69 = OpVectorShuffle %68 %68 0 0 0 
                                        f32_3 %70 = OpLoad %52 
                                        f32_3 %71 = OpFMul %69 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                                      OpStore %9 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
                               Uniform f32_4* %79 = OpAccessChain %31 %77 %33 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpFMul %76 %80 
                                                      OpStore %74 %81 
                               Uniform f32_4* %82 = OpAccessChain %31 %77 %53 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 0 0 0 0 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %74 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %74 %88 
                               Uniform f32_4* %89 = OpAccessChain %31 %77 %77 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 2 2 2 2 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %74 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %9 %95 
                                        f32_4 %96 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %31 %77 %97 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFAdd %96 %99 
                                                      OpStore %9 %100 
                                       f32_4 %101 = OpLoad %9 
                                       f32_3 %102 = OpVectorShuffle %101 %101 1 1 1 
                              Uniform f32_4* %104 = OpAccessChain %31 %103 %33 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 3 
                                       f32_3 %107 = OpFMul %102 %106 
                                       f32_4 %108 = OpLoad %74 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %74 %109 
                              Uniform f32_4* %110 = OpAccessChain %31 %103 %53 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 3 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 0 0 
                                       f32_3 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %74 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %74 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %74 %120 
                              Uniform f32_4* %121 = OpAccessChain %31 %103 %77 
                                       f32_4 %122 = OpLoad %121 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 3 
                                       f32_4 %124 = OpLoad %9 
                                       f32_3 %125 = OpVectorShuffle %124 %124 2 2 2 
                                       f32_3 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %74 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_3 %129 = OpFAdd %126 %128 
                                       f32_4 %130 = OpLoad %74 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %74 %131 
                              Uniform f32_4* %132 = OpAccessChain %31 %103 %97 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 3 
                                       f32_4 %135 = OpLoad %9 
                                       f32_3 %136 = OpVectorShuffle %135 %135 3 3 3 
                                       f32_3 %137 = OpFMul %134 %136 
                                       f32_4 %138 = OpLoad %74 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 2 
                                       f32_3 %140 = OpFAdd %137 %139 
                                       f32_4 %141 = OpLoad %74 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %74 %142 
                                       f32_4 %143 = OpLoad %74 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %74 
                                       f32_2 %146 = OpVectorShuffle %145 %145 2 2 
                                       f32_2 %147 = OpFDiv %144 %146 
                                       f32_4 %148 = OpLoad %74 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 2 3 
                                                      OpStore %74 %149 
                                       f32_4 %150 = OpLoad %74 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_2 %153 = OpFAdd %151 %152 
                                       f32_4 %154 = OpLoad %74 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 2 3 
                                                      OpStore %74 %155 
                                Private f32* %156 = OpAccessChain %74 %21 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                Private f32* %160 = OpAccessChain %74 %21 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %74 %40 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpFNegate %162 
                                         f32 %164 = OpFMul %163 %158 
                                         f32 %165 = OpFAdd %164 %45 
                                Private f32* %166 = OpAccessChain %74 %54 
                                                      OpStore %166 %165 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 1 1 1 
                              Uniform f32_4* %170 = OpAccessChain %31 %97 %33 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 3 
                                       f32_3 %173 = OpFMul %169 %172 
                                                      OpStore %167 %173 
                              Uniform f32_4* %174 = OpAccessChain %31 %97 %53 
                                       f32_4 %175 = OpLoad %174 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 3 
                                       f32_4 %177 = OpLoad %9 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 0 0 
                                       f32_3 %179 = OpFMul %176 %178 
                                       f32_3 %180 = OpLoad %167 
                                       f32_3 %181 = OpFAdd %179 %180 
                                                      OpStore %167 %181 
                              Uniform f32_4* %182 = OpAccessChain %31 %97 %77 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 3 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 2 2 2 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %167 
                                       f32_3 %189 = OpFAdd %187 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_4 %191 = OpVectorShuffle %190 %189 4 5 6 3 
                                                      OpStore %9 %191 
                              Uniform f32_4* %192 = OpAccessChain %31 %97 %97 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 3 
                                       f32_4 %195 = OpLoad %9 
                                       f32_3 %196 = OpVectorShuffle %195 %195 3 3 3 
                                       f32_3 %197 = OpFMul %194 %196 
                                       f32_4 %198 = OpLoad %9 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                                       f32_3 %200 = OpFAdd %197 %199 
                                       f32_4 %201 = OpLoad %9 
                                       f32_4 %202 = OpVectorShuffle %201 %200 4 5 6 3 
                                                      OpStore %9 %202 
                                       f32_4 %203 = OpLoad %9 
                                       f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                                       f32_4 %205 = OpLoad %9 
                                       f32_2 %206 = OpVectorShuffle %205 %205 2 2 
                                       f32_2 %207 = OpFDiv %204 %206 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpVectorShuffle %208 %207 4 5 2 3 
                                                      OpStore %9 %209 
                                       f32_4 %210 = OpLoad %9 
                                       f32_2 %211 = OpVectorShuffle %210 %210 0 1 
                                       f32_2 %212 = OpFAdd %211 %152 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %9 %214 
                                Private f32* %215 = OpAccessChain %9 %21 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFMul %216 %158 
                                Private f32* %218 = OpAccessChain %9 %21 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %9 %40 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFNegate %220 
                                         f32 %222 = OpFMul %221 %158 
                                         f32 %223 = OpFAdd %222 %45 
                                Private f32* %224 = OpAccessChain %9 %54 
                                                      OpStore %224 %223 
                                       f32_4 %225 = OpLoad %74 
                                       f32_2 %226 = OpVectorShuffle %225 %225 0 2 
                                       f32_2 %227 = OpFNegate %226 
                                       f32_4 %228 = OpLoad %9 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 2 
                                       f32_2 %230 = OpFAdd %227 %229 
                                       f32_4 %231 = OpLoad %9 
                                       f32_4 %232 = OpVectorShuffle %231 %230 4 5 2 3 
                                                      OpStore %9 %232 
                                       f32_4 %235 = OpLoad %9 
                                       f32_2 %236 = OpVectorShuffle %235 %235 0 1 
                                       f32_4 %237 = OpLoad %234 
                                       f32_4 %238 = OpVectorShuffle %237 %236 4 5 2 3 
                                                      OpStore %234 %238 
                                       f32_4 %241 = OpLoad %234 
                                       f32_4 %242 = OpVectorShuffle %241 %240 0 1 4 5 
                                                      OpStore %234 %242 
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
  ZTest Always
  Cull Off
  GpuProgramID 143618
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat10_1 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy);
    u_xlat9 = _ZBufferParams.x * u_xlat10_1.x + _ZBufferParams.y;
    gl_FragDepth = u_xlat10_1.x;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    SV_Target0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.zw = vec2(0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate %105 Location 105 
                                                     OpDecorate %113 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.67402E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                              Output f32_2* %105 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                              Output f32_3* %113 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore %105 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore %113 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 247
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %26 %48 %64 %237 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpExecutionMode %4 DepthReplacing 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %26 Location 26 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %48 Location 48 
                                                      OpDecorate %64 BuiltIn 64 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %237 Location 237 
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
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeStruct %7 %7 %12 %13 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 2 
                                              %21 = OpTypePointer Uniform %6 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypePointer Input %24 
                                 Input f32_3* %26 = OpVariable Input 
                                              %27 = OpTypePointer Input %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                 Private f32* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypeSampledImage %41 
                                              %43 = OpTypePointer UniformConstant %42 
  UniformConstant read_only Texture2DSampled* %44 = OpVariable UniformConstant 
                                              %46 = OpTypeVector %6 2 
                                              %47 = OpTypePointer Input %46 
                                 Input f32_2* %48 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %53 = OpConstant 1 
                                          u32 %58 = OpConstant 1 
                                              %63 = OpTypePointer Output %6 
                                  Output f32* %64 = OpVariable Output 
                                          f32 %66 = OpConstant 3.67402E-40 
                                          i32 %79 = OpConstant 2 
                                              %80 = OpTypePointer Uniform %7 
                                          i32 %99 = OpConstant 3 
                                         i32 %105 = OpConstant 4 
                                       f32_2 %154 = OpConstantComposite %66 %66 
                                         f32 %160 = OpConstant 3.67402E-40 
                                             %169 = OpTypePointer Private %24 
                              Private f32_3* %170 = OpVariable Private 
                                             %236 = OpTypePointer Output %7 
                               Output f32_4* %237 = OpVariable Output 
                                         f32 %242 = OpConstant 3.67402E-40 
                                       f32_2 %243 = OpConstantComposite %242 %66 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                   Input f32* %28 = OpAccessChain %26 %20 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFDiv %23 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 0 0 
                                        f32_3 %36 = OpLoad %26 
                                        f32_3 %37 = OpFMul %35 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                   read_only Texture2DSampled %45 = OpLoad %44 
                                        f32_2 %49 = OpLoad %48 
                                        f32_4 %50 = OpImageSampleImplicitLod %45 %49 
                                          f32 %51 = OpCompositeExtract %50 0 
                                                      OpStore %40 %51 
                                 Uniform f32* %54 = OpAccessChain %17 %53 %31 
                                          f32 %55 = OpLoad %54 
                                          f32 %56 = OpLoad %40 
                                          f32 %57 = OpFMul %55 %56 
                                 Uniform f32* %59 = OpAccessChain %17 %53 %58 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpFAdd %57 %60 
                                 Private f32* %62 = OpAccessChain %52 %31 
                                                      OpStore %62 %61 
                                          f32 %65 = OpLoad %40 
                                                      OpStore %64 %65 
                                 Private f32* %67 = OpAccessChain %52 %31 
                                          f32 %68 = OpLoad %67 
                                          f32 %69 = OpFDiv %66 %68 
                                                      OpStore %40 %69 
                                          f32 %70 = OpLoad %40 
                                        f32_3 %71 = OpCompositeConstruct %70 %70 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                        f32_3 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 1 1 1 1 
                               Uniform f32_4* %81 = OpAccessChain %17 %79 %53 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpFMul %78 %82 
                                                      OpStore %52 %83 
                               Uniform f32_4* %84 = OpAccessChain %17 %79 %19 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpVectorShuffle %86 %86 0 0 0 0 
                                        f32_4 %88 = OpFMul %85 %87 
                                        f32_4 %89 = OpLoad %52 
                                        f32_4 %90 = OpFAdd %88 %89 
                                                      OpStore %52 %90 
                               Uniform f32_4* %91 = OpAccessChain %17 %79 %79 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpLoad %9 
                                        f32_4 %94 = OpVectorShuffle %93 %93 2 2 2 2 
                                        f32_4 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %52 
                                        f32_4 %97 = OpFAdd %95 %96 
                                                      OpStore %9 %97 
                                        f32_4 %98 = OpLoad %9 
                              Uniform f32_4* %100 = OpAccessChain %17 %79 %99 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpFAdd %98 %101 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                                       f32_3 %104 = OpVectorShuffle %103 %103 1 1 1 
                              Uniform f32_4* %106 = OpAccessChain %17 %105 %53 
                                       f32_4 %107 = OpLoad %106 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 3 
                                       f32_3 %109 = OpFMul %104 %108 
                                       f32_4 %110 = OpLoad %52 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %52 %111 
                              Uniform f32_4* %112 = OpAccessChain %17 %105 %19 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 3 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 0 0 
                                       f32_3 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %52 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %52 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %52 %122 
                              Uniform f32_4* %123 = OpAccessChain %17 %105 %79 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 2 2 2 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %52 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %52 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %52 %133 
                              Uniform f32_4* %134 = OpAccessChain %17 %105 %99 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 3 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 3 3 3 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %52 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %52 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %52 %144 
                                       f32_4 %145 = OpLoad %52 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_4 %147 = OpLoad %52 
                                       f32_2 %148 = OpVectorShuffle %147 %147 2 2 
                                       f32_2 %149 = OpFDiv %146 %148 
                                       f32_4 %150 = OpLoad %52 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %52 %151 
                                       f32_4 %152 = OpLoad %52 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 1 
                                       f32_2 %155 = OpFAdd %153 %154 
                                       f32_4 %156 = OpLoad %52 
                                       f32_4 %157 = OpVectorShuffle %156 %155 4 5 2 3 
                                                      OpStore %52 %157 
                                Private f32* %158 = OpAccessChain %52 %31 
                                         f32 %159 = OpLoad %158 
                                         f32 %161 = OpFMul %159 %160 
                                Private f32* %162 = OpAccessChain %52 %31 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %52 %58 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpFNegate %164 
                                         f32 %166 = OpFMul %165 %160 
                                         f32 %167 = OpFAdd %166 %66 
                                Private f32* %168 = OpAccessChain %52 %20 
                                                      OpStore %168 %167 
                                       f32_4 %171 = OpLoad %9 
                                       f32_3 %172 = OpVectorShuffle %171 %171 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %17 %99 %53 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 3 
                                       f32_3 %176 = OpFMul %172 %175 
                                                      OpStore %170 %176 
                              Uniform f32_4* %177 = OpAccessChain %17 %99 %19 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 3 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 0 0 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_3 %183 = OpLoad %170 
                                       f32_3 %184 = OpFAdd %182 %183 
                                                      OpStore %170 %184 
                              Uniform f32_4* %185 = OpAccessChain %17 %99 %79 
                                       f32_4 %186 = OpLoad %185 
                                       f32_3 %187 = OpVectorShuffle %186 %186 0 1 3 
                                       f32_4 %188 = OpLoad %9 
                                       f32_3 %189 = OpVectorShuffle %188 %188 2 2 2 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_3 %191 = OpLoad %170 
                                       f32_3 %192 = OpFAdd %190 %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
                                                      OpStore %9 %194 
                              Uniform f32_4* %195 = OpAccessChain %17 %99 %99 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 3 
                                       f32_4 %198 = OpLoad %9 
                                       f32_3 %199 = OpVectorShuffle %198 %198 3 3 3 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %9 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 2 
                                       f32_3 %203 = OpFAdd %200 %202 
                                       f32_4 %204 = OpLoad %9 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
                                                      OpStore %9 %205 
                                       f32_4 %206 = OpLoad %9 
                                       f32_2 %207 = OpVectorShuffle %206 %206 0 1 
                                       f32_4 %208 = OpLoad %9 
                                       f32_2 %209 = OpVectorShuffle %208 %208 2 2 
                                       f32_2 %210 = OpFDiv %207 %209 
                                       f32_4 %211 = OpLoad %9 
                                       f32_4 %212 = OpVectorShuffle %211 %210 4 5 2 3 
                                                      OpStore %9 %212 
                                       f32_4 %213 = OpLoad %9 
                                       f32_2 %214 = OpVectorShuffle %213 %213 0 1 
                                       f32_2 %215 = OpFAdd %214 %154 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 2 3 
                                                      OpStore %9 %217 
                                Private f32* %218 = OpAccessChain %9 %31 
                                         f32 %219 = OpLoad %218 
                                         f32 %220 = OpFMul %219 %160 
                                Private f32* %221 = OpAccessChain %9 %31 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %9 %58 
                                         f32 %223 = OpLoad %222 
                                         f32 %224 = OpFNegate %223 
                                         f32 %225 = OpFMul %224 %160 
                                         f32 %226 = OpFAdd %225 %66 
                                Private f32* %227 = OpAccessChain %9 %20 
                                                      OpStore %227 %226 
                                       f32_4 %228 = OpLoad %52 
                                       f32_2 %229 = OpVectorShuffle %228 %228 0 2 
                                       f32_2 %230 = OpFNegate %229 
                                       f32_4 %231 = OpLoad %9 
                                       f32_2 %232 = OpVectorShuffle %231 %231 0 2 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %9 %235 
                                       f32_4 %238 = OpLoad %9 
                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
                                       f32_4 %240 = OpLoad %237 
                                       f32_4 %241 = OpVectorShuffle %240 %239 4 5 2 3 
                                                      OpStore %237 %241 
                                       f32_4 %244 = OpLoad %237 
                                       f32_4 %245 = OpVectorShuffle %244 %243 0 1 4 5 
                                                      OpStore %237 %245 
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