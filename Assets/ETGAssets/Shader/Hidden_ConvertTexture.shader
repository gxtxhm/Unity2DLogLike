//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ConvertTexture" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 55655
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

vec3 ImmCB_0_0_0[4];
vec2 ImmCB_0_4_2[6];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
	ImmCB_0_0_0[0] = vec3(0.0, 0.0, -1.0);
	ImmCB_0_0_0[1] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[2] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[3] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_4_2[0] = vec2(0.0, -1.0);
	ImmCB_0_4_2[1] = vec2(0.0, -1.0);
	ImmCB_0_4_2[2] = vec2(1.0, 0.0);
	ImmCB_0_4_2[3] = vec2(-1.0, 0.0);
	ImmCB_0_4_2[4] = vec2(0.0, -1.0);
	ImmCB_0_4_2[5] = vec2(0.0, -1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_0_0_0[u_xlati4].zx * ImmCB_0_4_2[u_xlati4].yx;
    u_xlat2.xz = ImmCB_0_4_2[u_xlati4].xy;
    u_xlat2.y = ImmCB_0_0_0[u_xlati4].z;
    u_xlat0.z = ImmCB_0_0_0[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_0_0_0[u_xlati4].xz;
    u_xlat3.yz = ImmCB_0_4_2[u_xlati4].yx;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform  samplerCube _MainTex;
in  vec3 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = texture(_MainTex, vs_TEXCOORD0.xyz);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 222
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %50 %104 %162 %208 
                                                      OpDecorate %50 Location 50 
                                                      OpDecorate %53 ArrayStride 53 
                                                      OpDecorate %54 ArrayStride 54 
                                                      OpMemberDecorate %55 0 Offset 55 
                                                      OpMemberDecorate %55 1 Offset 55 
                                                      OpMemberDecorate %55 2 Offset 55 
                                                      OpMemberDecorate %55 3 Offset 55 
                                                      OpDecorate %55 Block 
                                                      OpDecorate %57 DescriptorSet 57 
                                                      OpDecorate %57 Binding 57 
                                                      OpMemberDecorate %102 0 BuiltIn 102 
                                                      OpMemberDecorate %102 1 BuiltIn 102 
                                                      OpMemberDecorate %102 2 BuiltIn 102 
                                                      OpDecorate %102 Block 
                                                      OpDecorate %162 Location 162 
                                                      OpDecorate %208 Location 208 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypeInt 32 0 
                                           u32 %9 = OpConstant 4 
                                              %10 = OpTypeArray %7 %9 
                                              %11 = OpTypePointer Private %10 
                            Private f32_3[4]* %12 = OpVariable Private 
                                              %13 = OpTypeInt 32 1 
                                          i32 %14 = OpConstant 0 
                                          f32 %15 = OpConstant 3.67402E-40 
                                          f32 %16 = OpConstant 3.67402E-40 
                                        f32_3 %17 = OpConstantComposite %15 %15 %16 
                                              %18 = OpTypePointer Private %7 
                                          i32 %20 = OpConstant 1 
                                          f32 %21 = OpConstant 3.67402E-40 
                                        f32_3 %22 = OpConstantComposite %15 %15 %21 
                                          i32 %24 = OpConstant 2 
                                        f32_3 %25 = OpConstantComposite %21 %15 %15 
                                          i32 %27 = OpConstant 3 
                                              %29 = OpTypeVector %6 2 
                                          u32 %30 = OpConstant 6 
                                              %31 = OpTypeArray %29 %30 
                                              %32 = OpTypePointer Private %31 
                            Private f32_2[6]* %33 = OpVariable Private 
                                        f32_2 %34 = OpConstantComposite %15 %16 
                                              %35 = OpTypePointer Private %29 
                                        f32_2 %38 = OpConstantComposite %21 %15 
                                        f32_2 %40 = OpConstantComposite %16 %15 
                                          i32 %42 = OpConstant 4 
                                          i32 %44 = OpConstant 5 
                                              %46 = OpTypeVector %6 4 
                                              %47 = OpTypePointer Private %46 
                               Private f32_4* %48 = OpVariable Private 
                                              %49 = OpTypePointer Input %46 
                                 Input f32_4* %50 = OpVariable Input 
                                              %53 = OpTypeArray %46 %9 
                                              %54 = OpTypeArray %46 %9 
                                              %55 = OpTypeStruct %53 %54 %46 %6 
                                              %56 = OpTypePointer Uniform %55 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %57 = OpVariable Uniform 
                                              %58 = OpTypePointer Uniform %46 
                               Private f32_4* %80 = OpVariable Private 
                                         u32 %100 = OpConstant 1 
                                             %101 = OpTypeArray %6 %100 
                                             %102 = OpTypeStruct %46 %6 %101 
                                             %103 = OpTypePointer Output %102 
        Output struct {f32_4; f32; f32[1];}* %104 = OpVariable Output 
                                             %112 = OpTypePointer Output %46 
                                         u32 %114 = OpConstant 0 
                                             %115 = OpTypePointer Private %6 
                                         u32 %117 = OpConstant 2 
                                             %119 = OpTypePointer Private %13 
                                Private i32* %120 = OpVariable Private 
                                             %121 = OpTypePointer Uniform %6 
                              Private f32_3* %136 = OpVariable Private 
                                             %161 = OpTypePointer Input %29 
                                Input f32_2* %162 = OpVariable Input 
                                         f32 %176 = OpConstant 3.67402E-40 
                                       f32_2 %177 = OpConstantComposite %176 %176 
                                       f32_2 %179 = OpConstantComposite %16 %16 
                              Private f32_3* %189 = OpVariable Private 
                                             %207 = OpTypePointer Output %7 
                               Output f32_3* %208 = OpVariable Output 
                                             %216 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Private f32_3* %19 = OpAccessChain %12 %14 
                                                      OpStore %19 %17 
                               Private f32_3* %23 = OpAccessChain %12 %20 
                                                      OpStore %23 %22 
                               Private f32_3* %26 = OpAccessChain %12 %24 
                                                      OpStore %26 %25 
                               Private f32_3* %28 = OpAccessChain %12 %27 
                                                      OpStore %28 %25 
                               Private f32_2* %36 = OpAccessChain %33 %14 
                                                      OpStore %36 %34 
                               Private f32_2* %37 = OpAccessChain %33 %20 
                                                      OpStore %37 %34 
                               Private f32_2* %39 = OpAccessChain %33 %24 
                                                      OpStore %39 %38 
                               Private f32_2* %41 = OpAccessChain %33 %27 
                                                      OpStore %41 %40 
                               Private f32_2* %43 = OpAccessChain %33 %42 
                                                      OpStore %43 %34 
                               Private f32_2* %45 = OpAccessChain %33 %44 
                                                      OpStore %45 %34 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %59 = OpAccessChain %57 %14 %20 
                                        f32_4 %60 = OpLoad %59 
                                        f32_4 %61 = OpFMul %52 %60 
                                                      OpStore %48 %61 
                               Uniform f32_4* %62 = OpAccessChain %57 %14 %14 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %50 
                                        f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %48 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %48 %68 
                               Uniform f32_4* %69 = OpAccessChain %57 %14 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %50 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %48 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %48 %75 
                                        f32_4 %76 = OpLoad %48 
                               Uniform f32_4* %77 = OpAccessChain %57 %14 %27 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpFAdd %76 %78 
                                                      OpStore %48 %79 
                                        f32_4 %81 = OpLoad %48 
                                        f32_4 %82 = OpVectorShuffle %81 %81 1 1 1 1 
                               Uniform f32_4* %83 = OpAccessChain %57 %20 %20 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFMul %82 %84 
                                                      OpStore %80 %85 
                               Uniform f32_4* %86 = OpAccessChain %57 %20 %14 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %48 
                                        f32_4 %89 = OpVectorShuffle %88 %88 0 0 0 0 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %80 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %80 %92 
                               Uniform f32_4* %93 = OpAccessChain %57 %20 %24 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %48 
                                        f32_4 %96 = OpVectorShuffle %95 %95 2 2 2 2 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %80 
                                        f32_4 %99 = OpFAdd %97 %98 
                                                      OpStore %80 %99 
                              Uniform f32_4* %105 = OpAccessChain %57 %20 %27 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpLoad %48 
                                       f32_4 %108 = OpVectorShuffle %107 %107 3 3 3 3 
                                       f32_4 %109 = OpFMul %106 %108 
                                       f32_4 %110 = OpLoad %80 
                                       f32_4 %111 = OpFAdd %109 %110 
                               Output f32_4* %113 = OpAccessChain %104 %14 
                                                      OpStore %113 %111 
                                Private f32* %116 = OpAccessChain %48 %114 
                                                      OpStore %116 %15 
                                Private f32* %118 = OpAccessChain %80 %117 
                                                      OpStore %118 %15 
                                Uniform f32* %122 = OpAccessChain %57 %27 
                                         f32 %123 = OpLoad %122 
                                         i32 %124 = OpConvertFToS %123 
                                                      OpStore %120 %124 
                                         i32 %125 = OpLoad %120 
                              Private f32_3* %126 = OpAccessChain %12 %125 
                                       f32_3 %127 = OpLoad %126 
                                       f32_2 %128 = OpVectorShuffle %127 %127 2 0 
                                         i32 %129 = OpLoad %120 
                              Private f32_2* %130 = OpAccessChain %33 %129 
                                       f32_2 %131 = OpLoad %130 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 0 
                                       f32_2 %133 = OpFMul %128 %132 
                                       f32_4 %134 = OpLoad %80 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 2 3 
                                                      OpStore %80 %135 
                                         i32 %137 = OpLoad %120 
                              Private f32_2* %138 = OpAccessChain %33 %137 
                                       f32_2 %139 = OpLoad %138 
                                       f32_3 %140 = OpLoad %136 
                                       f32_3 %141 = OpVectorShuffle %140 %139 3 1 4 
                                                      OpStore %136 %141 
                                         i32 %142 = OpLoad %120 
                                Private f32* %143 = OpAccessChain %12 %142 %117 
                                         f32 %144 = OpLoad %143 
                                Private f32* %145 = OpAccessChain %136 %100 
                                                      OpStore %145 %144 
                                         i32 %146 = OpLoad %120 
                                Private f32* %147 = OpAccessChain %12 %146 %114 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %48 %117 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %136 
                                       f32_3 %151 = OpFNegate %150 
                                       f32_4 %152 = OpLoad %48 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 0 2 
                                       f32_3 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %80 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                       f32_3 %157 = OpFAdd %154 %156 
                                       f32_4 %158 = OpLoad %48 
                                       f32_4 %159 = OpVectorShuffle %158 %157 4 1 5 6 
                                                      OpStore %48 %159 
                                Private f32* %160 = OpAccessChain %80 %100 
                                                      OpStore %160 %15 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %57 %24 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %57 %24 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                       f32_3 %172 = OpLoad %136 
                                       f32_3 %173 = OpVectorShuffle %172 %171 3 4 2 
                                                      OpStore %136 %173 
                                       f32_3 %174 = OpLoad %136 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
                                       f32_2 %178 = OpFMul %175 %177 
                                       f32_2 %180 = OpFAdd %178 %179 
                                       f32_3 %181 = OpLoad %136 
                                       f32_3 %182 = OpVectorShuffle %181 %180 3 4 2 
                                                      OpStore %136 %182 
                                         i32 %183 = OpLoad %120 
                              Private f32_3* %184 = OpAccessChain %12 %183 
                                       f32_3 %185 = OpLoad %184 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 2 
                                       f32_4 %187 = OpLoad %80 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 1 5 3 
                                                      OpStore %80 %188 
                                         i32 %190 = OpLoad %120 
                              Private f32_2* %191 = OpAccessChain %33 %190 
                                       f32_2 %192 = OpLoad %191 
                                       f32_2 %193 = OpVectorShuffle %192 %192 1 0 
                                       f32_3 %194 = OpLoad %189 
                                       f32_3 %195 = OpVectorShuffle %194 %193 0 3 4 
                                                      OpStore %189 %195 
                                       f32_3 %196 = OpLoad %136 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
                                       f32_4 %198 = OpLoad %80 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %48 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 2 3 
                                       f32_3 %203 = OpFAdd %200 %202 
                                       f32_4 %204 = OpLoad %48 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 6 3 
                                                      OpStore %48 %205 
                                Private f32* %206 = OpAccessChain %189 %114 
                                                      OpStore %206 %15 
                                       f32_3 %209 = OpLoad %136 
                                       f32_3 %210 = OpVectorShuffle %209 %209 1 1 1 
                                       f32_3 %211 = OpLoad %189 
                                       f32_3 %212 = OpFMul %210 %211 
                                       f32_4 %213 = OpLoad %48 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                       f32_3 %215 = OpFAdd %212 %214 
                                                      OpStore %208 %215 
                                 Output f32* %217 = OpAccessChain %104 %14 %100 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFNegate %218 
                                 Output f32* %220 = OpAccessChain %104 %14 %100 
                                                      OpStore %220 %219 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 24
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %21 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %21 Location 21 
                                                      OpDecorate %22 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                              %11 = OpTypeSampledImage %10 
                                              %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only TextureCubeSampled* %13 = OpVariable UniformConstant 
                                              %15 = OpTypeVector %6 3 
                                              %16 = OpTypePointer Input %15 
                                 Input f32_3* %17 = OpVariable Input 
                                              %20 = OpTypePointer Output %7 
                                Output f32_4* %21 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                 read_only TextureCubeSampled %14 = OpLoad %13 
                                        f32_3 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %22 = OpLoad %9 
                                                      OpStore %21 %22 
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