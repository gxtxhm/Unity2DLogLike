//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Shadow/Distance Intense" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 46835
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

uniform 	float _Resolution;
uniform 	float _LightRadius;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
float u_xlat1;
float u_xlat2;
vec2 u_xlat3;
vec2 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_6;
float u_xlat7;
float u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
vec2 u_xlat14;
float u_xlat15;
bool u_xlatb17;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
bool u_xlatb23;
void main()
{
    u_xlat0 = float(1.0) / _Resolution;
    u_xlat7 = vs_TEXCOORD0.x * 2.0 + -1.0;
    u_xlat7 = u_xlat7 * 3.1415 + 4.71225023;
    u_xlat1 = sin(u_xlat7);
    u_xlat2 = cos(u_xlat7);
    u_xlat3.y = 0.0;
    u_xlat7 = float(1.0);
    u_xlat14.x = float(1.0);
    u_xlat8 = float(1.0);
    u_xlat15 = float(0.0);
    while(true){
        u_xlatb22 = u_xlat15>=_Resolution;
        if(u_xlatb22){break;}
        u_xlat4.x = u_xlat0 * u_xlat15;
        u_xlat22 = u_xlat4.x + u_xlat4.x;
        u_xlat5.x = u_xlat1 * (-u_xlat22);
        u_xlat5.y = u_xlat2 * (-u_xlat22);
        u_xlat9.xy = u_xlat5.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
        u_xlat10_6 = textureLod(_MainTex, u_xlat9.xy, 0.0);
        u_xlat9.xy = u_xlat5.xy * vec2(vec2(_LightRadius, _LightRadius));
        u_xlat22 = (-u_xlat10_6.y) * 2.0 + u_xlat9.y;
        u_xlatb23 = u_xlat22<0.0;
        u_xlatb17 = -1.0<u_xlat22;
        u_xlat22 = abs(u_xlat22) * (-_LightRadius) + _LightRadius;
        u_xlatb22 = u_xlat22<abs(u_xlat9.x);
        u_xlat22 = (u_xlatb22) ? 1.0 : u_xlat10_6.z;
        u_xlat22 = (u_xlatb17) ? u_xlat22 : 1.0;
        u_xlat5.z = (u_xlatb23) ? u_xlat22 : u_xlat10_6.z;
        u_xlatb22 = u_xlat14.x<0.0500000007;
        u_xlatb9 = 0.0500000007<u_xlat5.z;
        u_xlatb9 = u_xlatb22 && u_xlatb9;
        u_xlat3.x = u_xlat15 * u_xlat0 + (-u_xlat0);
        u_xlat4.y = u_xlat10_6.x;
        u_xlat5.xy = (bool(u_xlatb9)) ? u_xlat3.xy : u_xlat4.xy;
        u_xlat9.x = u_xlat10_6.y + 0.00999999978;
        u_xlatb9 = u_xlat9.x<u_xlat7;
        u_xlatb23 = u_xlat5.z<0.0500000007;
        u_xlatb9 = u_xlatb23 && u_xlatb9;
        u_xlatb22 = u_xlatb22 && u_xlatb9;
        u_xlatb9 = 0.0<u_xlat9.y;
        u_xlatb22 = u_xlatb22 && u_xlatb9;
        u_xlat14.xy = (bool(u_xlatb22)) ? vec2(1.0, 0.0) : u_xlat5.zy;
        u_xlatb21 = u_xlat14.y<0.200000003;
        u_xlatb22 = 0.0500000007<u_xlat14.x;
        u_xlatb21 = u_xlatb21 && u_xlatb22;
        u_xlatb22 = 0.0500000007<u_xlat5.x;
        u_xlatb21 = u_xlatb21 && u_xlatb22;
        u_xlat22 = min(u_xlat8, u_xlat5.x);
        u_xlat8 = (u_xlatb21) ? u_xlat22 : u_xlat8;
        u_xlat15 = u_xlat15 + 1.0;
        u_xlat7 = u_xlat10_6.y;
    }
    SV_Target0.xyz = vec3(u_xlat8);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 124
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %102 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %102 Location 102 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
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
                                            %101 = OpTypePointer Output %92 
                              Output f32_2* %102 = OpVariable Output 
                                            %103 = OpTypePointer Function %6 
                                            %113 = OpTypePointer Output %6 
                                        u32 %115 = OpConstant 0 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %104 = OpVariable Function 
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
                                       bool %105 = OpLoad %84 
                                                     OpSelectionMerge %107 None 
                                                     OpBranchConditional %105 %106 %109 
                                            %106 = OpLabel 
                                        f32 %108 = OpLoad %91 
                                                     OpStore %104 %108 
                                                     OpBranch %107 
                                            %109 = OpLabel 
                                 Input f32* %110 = OpAccessChain %94 %68 
                                        f32 %111 = OpLoad %110 
                                                     OpStore %104 %111 
                                                     OpBranch %107 
                                            %107 = OpLabel 
                                        f32 %112 = OpLoad %104 
                                Output f32* %114 = OpAccessChain %102 %68 
                                                     OpStore %114 %112 
                                 Input f32* %116 = OpAccessChain %94 %115 
                                        f32 %117 = OpLoad %116 
                                Output f32* %118 = OpAccessChain %102 %115 
                                                     OpStore %118 %117 
                                Output f32* %119 = OpAccessChain %72 %22 %68 
                                        f32 %120 = OpLoad %119 
                                        f32 %121 = OpFNegate %120 
                                Output f32* %122 = OpAccessChain %72 %22 %68 
                                                     OpStore %122 %121 
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
                                                     OpEntryPoint Fragment %4 "main" %22 %277 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpMemberDecorate %10 0 Offset 10 
                                                     OpMemberDecorate %10 1 Offset 10 
                                                     OpDecorate %10 Block 
                                                     OpDecorate %12 DescriptorSet 12 
                                                     OpDecorate %12 Binding 12 
                                                     OpDecorate %22 Location 22 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %104 RelaxedPrecision 
                                                     OpDecorate %104 DescriptorSet 104 
                                                     OpDecorate %104 Binding 104 
                                                     OpDecorate %105 RelaxedPrecision 
                                                     OpDecorate %109 RelaxedPrecision 
                                                     OpDecorate %124 RelaxedPrecision 
                                                     OpDecorate %125 RelaxedPrecision 
                                                     OpDecorate %126 RelaxedPrecision 
                                                     OpDecorate %158 RelaxedPrecision 
                                                     OpDecorate %159 RelaxedPrecision 
                                                     OpDecorate %174 RelaxedPrecision 
                                                     OpDecorate %196 RelaxedPrecision 
                                                     OpDecorate %210 RelaxedPrecision 
                                                     OpDecorate %212 RelaxedPrecision 
                                                     OpDecorate %275 RelaxedPrecision 
                                                     OpDecorate %277 Location 277 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypePointer Private %6 
                                 Private f32* %8 = OpVariable Private 
                                          f32 %9 = OpConstant 3.67402E-40 
                                             %10 = OpTypeStruct %6 %6 
                                             %11 = OpTypePointer Uniform %10 
                 Uniform struct {f32; f32;}* %12 = OpVariable Uniform 
                                             %13 = OpTypeInt 32 1 
                                         i32 %14 = OpConstant 0 
                                             %15 = OpTypePointer Uniform %6 
                                Private f32* %19 = OpVariable Private 
                                             %20 = OpTypeVector %6 2 
                                             %21 = OpTypePointer Input %20 
                                Input f32_2* %22 = OpVariable Input 
                                             %23 = OpTypeInt 32 0 
                                         u32 %24 = OpConstant 0 
                                             %25 = OpTypePointer Input %6 
                                         f32 %28 = OpConstant 3.67402E-40 
                                         f32 %30 = OpConstant 3.67402E-40 
                                         f32 %33 = OpConstant 3.67402E-40 
                                         f32 %35 = OpConstant 3.67402E-40 
                                Private f32* %37 = OpVariable Private 
                                Private f32* %40 = OpVariable Private 
                                             %43 = OpTypePointer Private %20 
                              Private f32_2* %44 = OpVariable Private 
                                         f32 %45 = OpConstant 3.67402E-40 
                                         u32 %46 = OpConstant 1 
                              Private f32_2* %48 = OpVariable Private 
                                Private f32* %50 = OpVariable Private 
                                Private f32* %51 = OpVariable Private 
                                             %57 = OpTypeBool 
                                        bool %58 = OpConstantTrue 
                                             %59 = OpTypePointer Private %57 
                               Private bool* %60 = OpVariable Private 
                              Private f32_2* %69 = OpVariable Private 
                                Private f32* %74 = OpVariable Private 
                                             %80 = OpTypeVector %6 3 
                                             %81 = OpTypePointer Private %80 
                              Private f32_3* %82 = OpVariable Private 
                              Private f32_2* %93 = OpVariable Private 
                                         f32 %96 = OpConstant 3.67402E-40 
                                       f32_2 %97 = OpConstantComposite %96 %96 
                             Private f32_3* %100 = OpVariable Private 
                                            %101 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %102 = OpTypeSampledImage %101 
                                            %103 = OpTypePointer UniformConstant %102 
UniformConstant read_only Texture2DSampled* %104 = OpVariable UniformConstant 
                                            %107 = OpTypeVector %6 4 
                             Private f32_2* %110 = OpVariable Private 
                                        i32 %113 = OpConstant 1 
                              Private bool* %130 = OpVariable Private 
                              Private bool* %133 = OpVariable Private 
                                            %150 = OpTypePointer Function %6 
                                        u32 %156 = OpConstant 2 
                                        f32 %179 = OpConstant 3.67402E-40 
                              Private bool* %181 = OpVariable Private 
                                            %198 = OpTypePointer Function %20 
                                        f32 %211 = OpConstant 3.67402E-40 
                              Private bool* %214 = OpVariable Private 
                                      f32_2 %238 = OpConstantComposite %9 %45 
                              Private bool* %243 = OpVariable Private 
                                        f32 %246 = OpConstant 3.67402E-40 
                                            %276 = OpTypePointer Output %107 
                              Output f32_4* %277 = OpVariable Output 
                                        u32 %282 = OpConstant 3 
                                            %283 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %151 = OpVariable Function 
                              Function f32* %160 = OpVariable Function 
                              Function f32* %167 = OpVariable Function 
                            Function f32_2* %199 = OpVariable Function 
                            Function f32_2* %234 = OpVariable Function 
                              Function f32* %264 = OpVariable Function 
                                Uniform f32* %16 = OpAccessChain %12 %14 
                                         f32 %17 = OpLoad %16 
                                         f32 %18 = OpFDiv %9 %17 
                                                     OpStore %8 %18 
                                  Input f32* %26 = OpAccessChain %22 %24 
                                         f32 %27 = OpLoad %26 
                                         f32 %29 = OpFMul %27 %28 
                                         f32 %31 = OpFAdd %29 %30 
                                                     OpStore %19 %31 
                                         f32 %32 = OpLoad %19 
                                         f32 %34 = OpFMul %32 %33 
                                         f32 %36 = OpFAdd %34 %35 
                                                     OpStore %19 %36 
                                         f32 %38 = OpLoad %19 
                                         f32 %39 = OpExtInst %1 13 %38 
                                                     OpStore %37 %39 
                                         f32 %41 = OpLoad %19 
                                         f32 %42 = OpExtInst %1 14 %41 
                                                     OpStore %40 %42 
                                Private f32* %47 = OpAccessChain %44 %46 
                                                     OpStore %47 %45 
                                                     OpStore %19 %9 
                                Private f32* %49 = OpAccessChain %48 %24 
                                                     OpStore %49 %9 
                                                     OpStore %50 %9 
                                                     OpStore %51 %45 
                                                     OpBranch %52 
                                             %52 = OpLabel 
                                                     OpLoopMerge %54 %55 None 
                                                     OpBranch %56 
                                             %56 = OpLabel 
                                                     OpBranchConditional %58 %53 %54 
                                             %53 = OpLabel 
                                         f32 %61 = OpLoad %51 
                                Uniform f32* %62 = OpAccessChain %12 %14 
                                         f32 %63 = OpLoad %62 
                                        bool %64 = OpFOrdGreaterThanEqual %61 %63 
                                                     OpStore %60 %64 
                                        bool %65 = OpLoad %60 
                                                     OpSelectionMerge %67 None 
                                                     OpBranchConditional %65 %66 %67 
                                             %66 = OpLabel 
                                                     OpBranch %54 
                                             %67 = OpLabel 
                                         f32 %70 = OpLoad %8 
                                         f32 %71 = OpLoad %51 
                                         f32 %72 = OpFMul %70 %71 
                                Private f32* %73 = OpAccessChain %69 %24 
                                                     OpStore %73 %72 
                                Private f32* %75 = OpAccessChain %69 %24 
                                         f32 %76 = OpLoad %75 
                                Private f32* %77 = OpAccessChain %69 %24 
                                         f32 %78 = OpLoad %77 
                                         f32 %79 = OpFAdd %76 %78 
                                                     OpStore %74 %79 
                                         f32 %83 = OpLoad %37 
                                         f32 %84 = OpLoad %74 
                                         f32 %85 = OpFNegate %84 
                                         f32 %86 = OpFMul %83 %85 
                                Private f32* %87 = OpAccessChain %82 %24 
                                                     OpStore %87 %86 
                                         f32 %88 = OpLoad %40 
                                         f32 %89 = OpLoad %74 
                                         f32 %90 = OpFNegate %89 
                                         f32 %91 = OpFMul %88 %90 
                                Private f32* %92 = OpAccessChain %82 %46 
                                                     OpStore %92 %91 
                                       f32_3 %94 = OpLoad %82 
                                       f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                                       f32_2 %98 = OpFMul %95 %97 
                                       f32_2 %99 = OpFAdd %98 %97 
                                                     OpStore %93 %99 
                 read_only Texture2DSampled %105 = OpLoad %104 
                                      f32_2 %106 = OpLoad %93 
                                      f32_4 %108 = OpImageSampleExplicitLod %105 %106 Lod %107 
                                      f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                                     OpStore %100 %109 
                                      f32_3 %111 = OpLoad %82 
                                      f32_2 %112 = OpVectorShuffle %111 %111 0 1 
                               Uniform f32* %114 = OpAccessChain %12 %113 
                                        f32 %115 = OpLoad %114 
                               Uniform f32* %116 = OpAccessChain %12 %113 
                                        f32 %117 = OpLoad %116 
                                      f32_2 %118 = OpCompositeConstruct %115 %117 
                                        f32 %119 = OpCompositeExtract %118 0 
                                        f32 %120 = OpCompositeExtract %118 1 
                                      f32_2 %121 = OpCompositeConstruct %119 %120 
                                      f32_2 %122 = OpFMul %112 %121 
                                                     OpStore %110 %122 
                               Private f32* %123 = OpAccessChain %100 %46 
                                        f32 %124 = OpLoad %123 
                                        f32 %125 = OpFNegate %124 
                                        f32 %126 = OpFMul %125 %28 
                               Private f32* %127 = OpAccessChain %110 %46 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpFAdd %126 %128 
                                                     OpStore %74 %129 
                                        f32 %131 = OpLoad %74 
                                       bool %132 = OpFOrdLessThan %131 %45 
                                                     OpStore %130 %132 
                                        f32 %134 = OpLoad %74 
                                       bool %135 = OpFOrdLessThan %30 %134 
                                                     OpStore %133 %135 
                                        f32 %136 = OpLoad %74 
                                        f32 %137 = OpExtInst %1 4 %136 
                               Uniform f32* %138 = OpAccessChain %12 %113 
                                        f32 %139 = OpLoad %138 
                                        f32 %140 = OpFNegate %139 
                                        f32 %141 = OpFMul %137 %140 
                               Uniform f32* %142 = OpAccessChain %12 %113 
                                        f32 %143 = OpLoad %142 
                                        f32 %144 = OpFAdd %141 %143 
                                                     OpStore %74 %144 
                                        f32 %145 = OpLoad %74 
                               Private f32* %146 = OpAccessChain %110 %24 
                                        f32 %147 = OpLoad %146 
                                        f32 %148 = OpExtInst %1 4 %147 
                                       bool %149 = OpFOrdLessThan %145 %148 
                                                     OpStore %60 %149 
                                       bool %152 = OpLoad %60 
                                                     OpSelectionMerge %154 None 
                                                     OpBranchConditional %152 %153 %155 
                                            %153 = OpLabel 
                                                     OpStore %151 %9 
                                                     OpBranch %154 
                                            %155 = OpLabel 
                               Private f32* %157 = OpAccessChain %100 %156 
                                        f32 %158 = OpLoad %157 
                                                     OpStore %151 %158 
                                                     OpBranch %154 
                                            %154 = OpLabel 
                                        f32 %159 = OpLoad %151 
                                                     OpStore %74 %159 
                                       bool %161 = OpLoad %133 
                                                     OpSelectionMerge %163 None 
                                                     OpBranchConditional %161 %162 %165 
                                            %162 = OpLabel 
                                        f32 %164 = OpLoad %74 
                                                     OpStore %160 %164 
                                                     OpBranch %163 
                                            %165 = OpLabel 
                                                     OpStore %160 %9 
                                                     OpBranch %163 
                                            %163 = OpLabel 
                                        f32 %166 = OpLoad %160 
                                                     OpStore %74 %166 
                                       bool %168 = OpLoad %130 
                                                     OpSelectionMerge %170 None 
                                                     OpBranchConditional %168 %169 %172 
                                            %169 = OpLabel 
                                        f32 %171 = OpLoad %74 
                                                     OpStore %167 %171 
                                                     OpBranch %170 
                                            %172 = OpLabel 
                               Private f32* %173 = OpAccessChain %100 %156 
                                        f32 %174 = OpLoad %173 
                                                     OpStore %167 %174 
                                                     OpBranch %170 
                                            %170 = OpLabel 
                                        f32 %175 = OpLoad %167 
                               Private f32* %176 = OpAccessChain %82 %156 
                                                     OpStore %176 %175 
                               Private f32* %177 = OpAccessChain %48 %24 
                                        f32 %178 = OpLoad %177 
                                       bool %180 = OpFOrdLessThan %178 %179 
                                                     OpStore %60 %180 
                               Private f32* %182 = OpAccessChain %82 %156 
                                        f32 %183 = OpLoad %182 
                                       bool %184 = OpFOrdLessThan %179 %183 
                                                     OpStore %181 %184 
                                       bool %185 = OpLoad %60 
                                       bool %186 = OpLoad %181 
                                       bool %187 = OpLogicalAnd %185 %186 
                                                     OpStore %181 %187 
                                        f32 %188 = OpLoad %51 
                                        f32 %189 = OpLoad %8 
                                        f32 %190 = OpFMul %188 %189 
                                        f32 %191 = OpLoad %8 
                                        f32 %192 = OpFNegate %191 
                                        f32 %193 = OpFAdd %190 %192 
                               Private f32* %194 = OpAccessChain %44 %24 
                                                     OpStore %194 %193 
                               Private f32* %195 = OpAccessChain %100 %24 
                                        f32 %196 = OpLoad %195 
                               Private f32* %197 = OpAccessChain %69 %46 
                                                     OpStore %197 %196 
                                       bool %200 = OpLoad %181 
                                                     OpSelectionMerge %202 None 
                                                     OpBranchConditional %200 %201 %204 
                                            %201 = OpLabel 
                                      f32_2 %203 = OpLoad %44 
                                                     OpStore %199 %203 
                                                     OpBranch %202 
                                            %204 = OpLabel 
                                      f32_2 %205 = OpLoad %69 
                                                     OpStore %199 %205 
                                                     OpBranch %202 
                                            %202 = OpLabel 
                                      f32_2 %206 = OpLoad %199 
                                      f32_3 %207 = OpLoad %82 
                                      f32_3 %208 = OpVectorShuffle %207 %206 3 4 2 
                                                     OpStore %82 %208 
                               Private f32* %209 = OpAccessChain %100 %46 
                                        f32 %210 = OpLoad %209 
                                        f32 %212 = OpFAdd %210 %211 
                               Private f32* %213 = OpAccessChain %93 %24 
                                                     OpStore %213 %212 
                               Private f32* %215 = OpAccessChain %93 %24 
                                        f32 %216 = OpLoad %215 
                                        f32 %217 = OpLoad %19 
                                       bool %218 = OpFOrdLessThan %216 %217 
                                                     OpStore %214 %218 
                               Private f32* %219 = OpAccessChain %82 %156 
                                        f32 %220 = OpLoad %219 
                                       bool %221 = OpFOrdLessThan %220 %179 
                                                     OpStore %181 %221 
                                       bool %222 = OpLoad %181 
                                       bool %223 = OpLoad %214 
                                       bool %224 = OpLogicalAnd %222 %223 
                                                     OpStore %214 %224 
                                       bool %225 = OpLoad %60 
                                       bool %226 = OpLoad %214 
                                       bool %227 = OpLogicalAnd %225 %226 
                                                     OpStore %60 %227 
                               Private f32* %228 = OpAccessChain %110 %46 
                                        f32 %229 = OpLoad %228 
                                       bool %230 = OpFOrdLessThan %45 %229 
                                                     OpStore %214 %230 
                                       bool %231 = OpLoad %60 
                                       bool %232 = OpLoad %214 
                                       bool %233 = OpLogicalAnd %231 %232 
                                                     OpStore %60 %233 
                                       bool %235 = OpLoad %60 
                                                     OpSelectionMerge %237 None 
                                                     OpBranchConditional %235 %236 %239 
                                            %236 = OpLabel 
                                                     OpStore %234 %238 
                                                     OpBranch %237 
                                            %239 = OpLabel 
                                      f32_3 %240 = OpLoad %82 
                                      f32_2 %241 = OpVectorShuffle %240 %240 2 1 
                                                     OpStore %234 %241 
                                                     OpBranch %237 
                                            %237 = OpLabel 
                                      f32_2 %242 = OpLoad %234 
                                                     OpStore %48 %242 
                               Private f32* %244 = OpAccessChain %48 %46 
                                        f32 %245 = OpLoad %244 
                                       bool %247 = OpFOrdLessThan %245 %246 
                                                     OpStore %243 %247 
                               Private f32* %248 = OpAccessChain %48 %24 
                                        f32 %249 = OpLoad %248 
                                       bool %250 = OpFOrdLessThan %179 %249 
                                                     OpStore %60 %250 
                                       bool %251 = OpLoad %243 
                                       bool %252 = OpLoad %60 
                                       bool %253 = OpLogicalAnd %251 %252 
                                                     OpStore %243 %253 
                               Private f32* %254 = OpAccessChain %82 %24 
                                        f32 %255 = OpLoad %254 
                                       bool %256 = OpFOrdLessThan %179 %255 
                                                     OpStore %60 %256 
                                       bool %257 = OpLoad %243 
                                       bool %258 = OpLoad %60 
                                       bool %259 = OpLogicalAnd %257 %258 
                                                     OpStore %243 %259 
                                        f32 %260 = OpLoad %50 
                               Private f32* %261 = OpAccessChain %82 %24 
                                        f32 %262 = OpLoad %261 
                                        f32 %263 = OpExtInst %1 37 %260 %262 
                                                     OpStore %74 %263 
                                       bool %265 = OpLoad %243 
                                                     OpSelectionMerge %267 None 
                                                     OpBranchConditional %265 %266 %269 
                                            %266 = OpLabel 
                                        f32 %268 = OpLoad %74 
                                                     OpStore %264 %268 
                                                     OpBranch %267 
                                            %269 = OpLabel 
                                        f32 %270 = OpLoad %50 
                                                     OpStore %264 %270 
                                                     OpBranch %267 
                                            %267 = OpLabel 
                                        f32 %271 = OpLoad %264 
                                                     OpStore %50 %271 
                                        f32 %272 = OpLoad %51 
                                        f32 %273 = OpFAdd %272 %9 
                                                     OpStore %51 %273 
                               Private f32* %274 = OpAccessChain %100 %46 
                                        f32 %275 = OpLoad %274 
                                                     OpStore %19 %275 
                                                     OpBranch %55 
                                             %55 = OpLabel 
                                                     OpBranch %52 
                                             %54 = OpLabel 
                                        f32 %278 = OpLoad %50 
                                      f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                      f32_4 %280 = OpLoad %277 
                                      f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                     OpStore %277 %281 
                                Output f32* %284 = OpAccessChain %277 %282 
                                                     OpStore %284 %9 
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
  Fog {
   Mode Off
  }
  GpuProgramID 74001
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

uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat10_1;
float u_xlat2;
bool u_xlatb2;
bool u_xlatb3;
float u_xlat4;
float u_xlat6;
bool u_xlatb6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat4 = float(1.0) / u_xlat4;
    u_xlat6 = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat4 = u_xlat4 * u_xlat6;
    u_xlat6 = u_xlat4 * u_xlat4;
    u_xlat1.x = u_xlat6 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat6 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat6 * u_xlat1.x + -0.330299497;
    u_xlat6 = u_xlat6 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat6 * u_xlat4;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb3 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat1.x = u_xlatb3 ? u_xlat1.x : float(0.0);
    u_xlat4 = u_xlat4 * u_xlat6 + u_xlat1.x;
    u_xlatb6 = u_xlat0.x<(-u_xlat0.x);
    u_xlat6 = u_xlatb6 ? -3.14159274 : float(0.0);
    u_xlat4 = u_xlat6 + u_xlat4;
    u_xlat6 = min(u_xlat0.x, u_xlat0.y);
    u_xlatb6 = u_xlat6<(-u_xlat6);
    u_xlat1.x = max(u_xlat0.x, u_xlat0.y);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlatb2 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb2 = u_xlatb2 && u_xlatb6;
    u_xlat2 = (u_xlatb2) ? (-u_xlat4) : u_xlat4;
    u_xlat2 = u_xlat2 + 3.1400001;
    u_xlat1.x = u_xlat2 * 0.159235656;
    u_xlat1.y = 0.0;
    u_xlat10_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat2 = u_xlat10_1.x + u_xlat10_1.x;
    u_xlatb2 = u_xlat2>=u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat4 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat4;
    SV_Target0.w = u_xlat0.x * u_xlat2;
    SV_Target0.xyz = vec3(1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 124
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %102 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %102 Location 102 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
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
                                            %101 = OpTypePointer Output %92 
                              Output f32_2* %102 = OpVariable Output 
                                            %103 = OpTypePointer Function %6 
                                            %113 = OpTypePointer Output %6 
                                        u32 %115 = OpConstant 0 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %104 = OpVariable Function 
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
                                       bool %105 = OpLoad %84 
                                                     OpSelectionMerge %107 None 
                                                     OpBranchConditional %105 %106 %109 
                                            %106 = OpLabel 
                                        f32 %108 = OpLoad %91 
                                                     OpStore %104 %108 
                                                     OpBranch %107 
                                            %109 = OpLabel 
                                 Input f32* %110 = OpAccessChain %94 %68 
                                        f32 %111 = OpLoad %110 
                                                     OpStore %104 %111 
                                                     OpBranch %107 
                                            %107 = OpLabel 
                                        f32 %112 = OpLoad %104 
                                Output f32* %114 = OpAccessChain %102 %68 
                                                     OpStore %114 %112 
                                 Input f32* %116 = OpAccessChain %94 %115 
                                        f32 %117 = OpLoad %116 
                                Output f32* %118 = OpAccessChain %102 %115 
                                                     OpStore %118 %117 
                                Output f32* %119 = OpAccessChain %72 %22 %68 
                                        f32 %120 = OpLoad %119 
                                        f32 %121 = OpFNegate %120 
                                Output f32* %122 = OpAccessChain %72 %22 %68 
                                                     OpStore %122 %121 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 251
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %11 %240 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %190 RelaxedPrecision 
                                                     OpDecorate %194 RelaxedPrecision 
                                                     OpDecorate %194 DescriptorSet 194 
                                                     OpDecorate %194 Binding 194 
                                                     OpDecorate %195 RelaxedPrecision 
                                                     OpDecorate %199 RelaxedPrecision 
                                                     OpDecorate %200 RelaxedPrecision 
                                                     OpDecorate %201 RelaxedPrecision 
                                                     OpDecorate %202 RelaxedPrecision 
                                                     OpDecorate %240 RelaxedPrecision 
                                                     OpDecorate %240 Location 240 
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
                                         f32 %17 = OpConstant 3.67402E-40 
                                       f32_2 %18 = OpConstantComposite %17 %13 
                                         f32 %21 = OpConstant 3.67402E-40 
                                       f32_2 %22 = OpConstantComposite %21 %21 
                                       f32_2 %24 = OpConstantComposite %14 %14 
                                             %26 = OpTypePointer Private %6 
                                Private f32* %27 = OpVariable Private 
                                             %28 = OpTypeInt 32 0 
                                         u32 %29 = OpConstant 0 
                                         u32 %33 = OpConstant 1 
                                Private f32* %40 = OpVariable Private 
                              Private f32_2* %54 = OpVariable Private 
                                         f32 %56 = OpConstant 3.67402E-40 
                                         f32 %58 = OpConstant 3.67402E-40 
                                         f32 %65 = OpConstant 3.67402E-40 
                                         f32 %72 = OpConstant 3.67402E-40 
                                         f32 %79 = OpConstant 3.67402E-40 
                                         f32 %87 = OpConstant 3.67402E-40 
                                         f32 %89 = OpConstant 3.67402E-40 
                                             %92 = OpTypeBool 
                                             %93 = OpTypePointer Private %92 
                               Private bool* %94 = OpVariable Private 
                                            %102 = OpTypePointer Function %6 
                              Private bool* %118 = OpVariable Private 
                                        f32 %129 = OpConstant 3.67402E-40 
                              Private bool* %162 = OpVariable Private 
                               Private f32* %172 = OpVariable Private 
                                        f32 %183 = OpConstant 3.67402E-40 
                                        f32 %186 = OpConstant 3.67402E-40 
                               Private f32* %190 = OpVariable Private 
                                            %191 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %192 = OpTypeSampledImage %191 
                                            %193 = OpTypePointer UniformConstant %192 
UniformConstant read_only Texture2DSampled* %194 = OpVariable UniformConstant 
                                            %197 = OpTypeVector %6 4 
                                        f32 %226 = OpConstant 3.67402E-40 
                                            %239 = OpTypePointer Output %197 
                              Output f32_4* %240 = OpVariable Output 
                                        u32 %243 = OpConstant 3 
                                            %244 = OpTypePointer Output %6 
                                            %246 = OpTypeVector %6 3 
                                      f32_3 %247 = OpConstantComposite %13 %13 %13 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %103 = OpVariable Function 
                              Function f32* %125 = OpVariable Function 
                              Function f32* %173 = OpVariable Function 
                              Function f32* %211 = OpVariable Function 
                                       f32_2 %12 = OpLoad %11 
                                       f32_2 %16 = OpFMul %12 %15 
                                       f32_2 %19 = OpFAdd %16 %18 
                                                     OpStore %9 %19 
                                       f32_2 %20 = OpLoad %9 
                                       f32_2 %23 = OpFMul %20 %22 
                                       f32_2 %25 = OpFAdd %23 %24 
                                                     OpStore %9 %25 
                                Private f32* %30 = OpAccessChain %9 %29 
                                         f32 %31 = OpLoad %30 
                                         f32 %32 = OpExtInst %1 4 %31 
                                Private f32* %34 = OpAccessChain %9 %33 
                                         f32 %35 = OpLoad %34 
                                         f32 %36 = OpExtInst %1 4 %35 
                                         f32 %37 = OpExtInst %1 40 %32 %36 
                                                     OpStore %27 %37 
                                         f32 %38 = OpLoad %27 
                                         f32 %39 = OpFDiv %13 %38 
                                                     OpStore %27 %39 
                                Private f32* %41 = OpAccessChain %9 %29 
                                         f32 %42 = OpLoad %41 
                                         f32 %43 = OpExtInst %1 4 %42 
                                Private f32* %44 = OpAccessChain %9 %33 
                                         f32 %45 = OpLoad %44 
                                         f32 %46 = OpExtInst %1 4 %45 
                                         f32 %47 = OpExtInst %1 37 %43 %46 
                                                     OpStore %40 %47 
                                         f32 %48 = OpLoad %27 
                                         f32 %49 = OpLoad %40 
                                         f32 %50 = OpFMul %48 %49 
                                                     OpStore %27 %50 
                                         f32 %51 = OpLoad %27 
                                         f32 %52 = OpLoad %27 
                                         f32 %53 = OpFMul %51 %52 
                                                     OpStore %40 %53 
                                         f32 %55 = OpLoad %40 
                                         f32 %57 = OpFMul %55 %56 
                                         f32 %59 = OpFAdd %57 %58 
                                Private f32* %60 = OpAccessChain %54 %29 
                                                     OpStore %60 %59 
                                         f32 %61 = OpLoad %40 
                                Private f32* %62 = OpAccessChain %54 %29 
                                         f32 %63 = OpLoad %62 
                                         f32 %64 = OpFMul %61 %63 
                                         f32 %66 = OpFAdd %64 %65 
                                Private f32* %67 = OpAccessChain %54 %29 
                                                     OpStore %67 %66 
                                         f32 %68 = OpLoad %40 
                                Private f32* %69 = OpAccessChain %54 %29 
                                         f32 %70 = OpLoad %69 
                                         f32 %71 = OpFMul %68 %70 
                                         f32 %73 = OpFAdd %71 %72 
                                Private f32* %74 = OpAccessChain %54 %29 
                                                     OpStore %74 %73 
                                         f32 %75 = OpLoad %40 
                                Private f32* %76 = OpAccessChain %54 %29 
                                         f32 %77 = OpLoad %76 
                                         f32 %78 = OpFMul %75 %77 
                                         f32 %80 = OpFAdd %78 %79 
                                                     OpStore %40 %80 
                                         f32 %81 = OpLoad %40 
                                         f32 %82 = OpLoad %27 
                                         f32 %83 = OpFMul %81 %82 
                                Private f32* %84 = OpAccessChain %54 %29 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %54 %29 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                         f32 %90 = OpFAdd %88 %89 
                                Private f32* %91 = OpAccessChain %54 %29 
                                                     OpStore %91 %90 
                                Private f32* %95 = OpAccessChain %9 %29 
                                         f32 %96 = OpLoad %95 
                                         f32 %97 = OpExtInst %1 4 %96 
                                Private f32* %98 = OpAccessChain %9 %33 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpExtInst %1 4 %99 
                                       bool %101 = OpFOrdLessThan %97 %100 
                                                     OpStore %94 %101 
                                       bool %104 = OpLoad %94 
                                                     OpSelectionMerge %106 None 
                                                     OpBranchConditional %104 %105 %109 
                                            %105 = OpLabel 
                               Private f32* %107 = OpAccessChain %54 %29 
                                        f32 %108 = OpLoad %107 
                                                     OpStore %103 %108 
                                                     OpBranch %106 
                                            %109 = OpLabel 
                                                     OpStore %103 %17 
                                                     OpBranch %106 
                                            %106 = OpLabel 
                                        f32 %110 = OpLoad %103 
                               Private f32* %111 = OpAccessChain %54 %29 
                                                     OpStore %111 %110 
                                        f32 %112 = OpLoad %27 
                                        f32 %113 = OpLoad %40 
                                        f32 %114 = OpFMul %112 %113 
                               Private f32* %115 = OpAccessChain %54 %29 
                                        f32 %116 = OpLoad %115 
                                        f32 %117 = OpFAdd %114 %116 
                                                     OpStore %27 %117 
                               Private f32* %119 = OpAccessChain %9 %29 
                                        f32 %120 = OpLoad %119 
                               Private f32* %121 = OpAccessChain %9 %29 
                                        f32 %122 = OpLoad %121 
                                        f32 %123 = OpFNegate %122 
                                       bool %124 = OpFOrdLessThan %120 %123 
                                                     OpStore %118 %124 
                                       bool %126 = OpLoad %118 
                                                     OpSelectionMerge %128 None 
                                                     OpBranchConditional %126 %127 %130 
                                            %127 = OpLabel 
                                                     OpStore %125 %129 
                                                     OpBranch %128 
                                            %130 = OpLabel 
                                                     OpStore %125 %17 
                                                     OpBranch %128 
                                            %128 = OpLabel 
                                        f32 %131 = OpLoad %125 
                                                     OpStore %40 %131 
                                        f32 %132 = OpLoad %40 
                                        f32 %133 = OpLoad %27 
                                        f32 %134 = OpFAdd %132 %133 
                                                     OpStore %27 %134 
                               Private f32* %135 = OpAccessChain %9 %29 
                                        f32 %136 = OpLoad %135 
                               Private f32* %137 = OpAccessChain %9 %33 
                                        f32 %138 = OpLoad %137 
                                        f32 %139 = OpExtInst %1 37 %136 %138 
                                                     OpStore %40 %139 
                                        f32 %140 = OpLoad %40 
                                        f32 %141 = OpLoad %40 
                                        f32 %142 = OpFNegate %141 
                                       bool %143 = OpFOrdLessThan %140 %142 
                                                     OpStore %118 %143 
                               Private f32* %144 = OpAccessChain %9 %29 
                                        f32 %145 = OpLoad %144 
                               Private f32* %146 = OpAccessChain %9 %33 
                                        f32 %147 = OpLoad %146 
                                        f32 %148 = OpExtInst %1 40 %145 %147 
                               Private f32* %149 = OpAccessChain %54 %29 
                                                     OpStore %149 %148 
                                      f32_2 %150 = OpLoad %9 
                                      f32_2 %151 = OpLoad %9 
                                        f32 %152 = OpDot %150 %151 
                               Private f32* %153 = OpAccessChain %9 %29 
                                                     OpStore %153 %152 
                               Private f32* %154 = OpAccessChain %9 %29 
                                        f32 %155 = OpLoad %154 
                                        f32 %156 = OpExtInst %1 31 %155 
                               Private f32* %157 = OpAccessChain %9 %29 
                                                     OpStore %157 %156 
                               Private f32* %158 = OpAccessChain %9 %29 
                                        f32 %159 = OpLoad %158 
                                        f32 %160 = OpExtInst %1 37 %159 %13 
                               Private f32* %161 = OpAccessChain %9 %29 
                                                     OpStore %161 %160 
                               Private f32* %163 = OpAccessChain %54 %29 
                                        f32 %164 = OpLoad %163 
                               Private f32* %165 = OpAccessChain %54 %29 
                                        f32 %166 = OpLoad %165 
                                        f32 %167 = OpFNegate %166 
                                       bool %168 = OpFOrdGreaterThanEqual %164 %167 
                                                     OpStore %162 %168 
                                       bool %169 = OpLoad %162 
                                       bool %170 = OpLoad %118 
                                       bool %171 = OpLogicalAnd %169 %170 
                                                     OpStore %162 %171 
                                       bool %174 = OpLoad %162 
                                                     OpSelectionMerge %176 None 
                                                     OpBranchConditional %174 %175 %179 
                                            %175 = OpLabel 
                                        f32 %177 = OpLoad %27 
                                        f32 %178 = OpFNegate %177 
                                                     OpStore %173 %178 
                                                     OpBranch %176 
                                            %179 = OpLabel 
                                        f32 %180 = OpLoad %27 
                                                     OpStore %173 %180 
                                                     OpBranch %176 
                                            %176 = OpLabel 
                                        f32 %181 = OpLoad %173 
                                                     OpStore %172 %181 
                                        f32 %182 = OpLoad %172 
                                        f32 %184 = OpFAdd %182 %183 
                                                     OpStore %172 %184 
                                        f32 %185 = OpLoad %172 
                                        f32 %187 = OpFMul %185 %186 
                               Private f32* %188 = OpAccessChain %54 %29 
                                                     OpStore %188 %187 
                               Private f32* %189 = OpAccessChain %54 %33 
                                                     OpStore %189 %17 
                 read_only Texture2DSampled %195 = OpLoad %194 
                                      f32_2 %196 = OpLoad %54 
                                      f32_4 %198 = OpImageSampleImplicitLod %195 %196 
                                        f32 %199 = OpCompositeExtract %198 0 
                                                     OpStore %190 %199 
                                        f32 %200 = OpLoad %190 
                                        f32 %201 = OpLoad %190 
                                        f32 %202 = OpFAdd %200 %201 
                                                     OpStore %172 %202 
                                        f32 %203 = OpLoad %172 
                               Private f32* %204 = OpAccessChain %9 %29 
                                        f32 %205 = OpLoad %204 
                                       bool %206 = OpFOrdGreaterThanEqual %203 %205 
                                                     OpStore %162 %206 
                               Private f32* %207 = OpAccessChain %9 %29 
                                        f32 %208 = OpLoad %207 
                                        f32 %209 = OpFAdd %208 %14 
                               Private f32* %210 = OpAccessChain %9 %29 
                                                     OpStore %210 %209 
                                       bool %212 = OpLoad %162 
                                                     OpSelectionMerge %214 None 
                                                     OpBranchConditional %212 %213 %215 
                                            %213 = OpLabel 
                                                     OpStore %211 %13 
                                                     OpBranch %214 
                                            %215 = OpLabel 
                                                     OpStore %211 %17 
                                                     OpBranch %214 
                                            %214 = OpLabel 
                                        f32 %216 = OpLoad %211 
                                                     OpStore %172 %216 
                               Private f32* %217 = OpAccessChain %9 %29 
                                        f32 %218 = OpLoad %217 
                               Private f32* %219 = OpAccessChain %9 %29 
                                        f32 %220 = OpLoad %219 
                                        f32 %221 = OpFMul %218 %220 
                                                     OpStore %27 %221 
                               Private f32* %222 = OpAccessChain %9 %29 
                                        f32 %223 = OpLoad %222 
                                        f32 %224 = OpFNegate %223 
                                        f32 %225 = OpFMul %224 %87 
                                        f32 %227 = OpFAdd %225 %226 
                               Private f32* %228 = OpAccessChain %9 %29 
                                                     OpStore %228 %227 
                               Private f32* %229 = OpAccessChain %9 %29 
                                        f32 %230 = OpLoad %229 
                                        f32 %231 = OpLoad %27 
                                        f32 %232 = OpFMul %230 %231 
                               Private f32* %233 = OpAccessChain %9 %29 
                                                     OpStore %233 %232 
                               Private f32* %234 = OpAccessChain %9 %29 
                                        f32 %235 = OpLoad %234 
                                        f32 %236 = OpLoad %172 
                                        f32 %237 = OpFMul %235 %236 
                               Private f32* %238 = OpAccessChain %9 %29 
                                                     OpStore %238 %237 
                               Private f32* %241 = OpAccessChain %9 %29 
                                        f32 %242 = OpLoad %241 
                                Output f32* %245 = OpAccessChain %240 %243 
                                                     OpStore %245 %242 
                                      f32_4 %248 = OpLoad %240 
                                      f32_4 %249 = OpVectorShuffle %248 %247 4 5 6 3 
                                                     OpStore %240 %249 
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
  Fog {
   Mode Off
  }
  GpuProgramID 180266
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

uniform 	float _Resolution;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat10_1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec2 u_xlat3;
vec4 u_xlat10_3;
vec2 u_xlat4;
vec4 u_xlat10_4;
vec2 u_xlat5;
bvec2 u_xlatb5;
bool u_xlatb6;
vec2 u_xlat10;
bvec2 u_xlatb10;
vec2 u_xlat12;
vec2 u_xlat14;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat10.x = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat10.x = float(1.0) / u_xlat10.x;
    u_xlat15 = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat10.x = u_xlat10.x * u_xlat15;
    u_xlat15 = u_xlat10.x * u_xlat10.x;
    u_xlat1.x = u_xlat15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat15 * u_xlat1.x + -0.330299497;
    u_xlat15 = u_xlat15 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat15 * u_xlat10.x;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb6 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat1.x = u_xlatb6 ? u_xlat1.x : float(0.0);
    u_xlat10.x = u_xlat10.x * u_xlat15 + u_xlat1.x;
    u_xlatb15 = u_xlat0.x<(-u_xlat0.x);
    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat10.x = u_xlat15 + u_xlat10.x;
    u_xlat15 = min(u_xlat0.x, u_xlat0.y);
    u_xlatb15 = u_xlat15<(-u_xlat15);
    u_xlat1.x = max(u_xlat0.x, u_xlat0.y);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlatb5.x = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb5.x = u_xlatb5.x && u_xlatb15;
    u_xlat5.x = (u_xlatb5.x) ? (-u_xlat10.x) : u_xlat10.x;
    u_xlat5.x = u_xlat5.x + 3.1415;
    u_xlat10.x = float(1.0) / _Resolution;
    u_xlat15 = u_xlat0.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat0.x * u_xlat0.x;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat10.x = u_xlat15 * u_xlat10.x;
    u_xlat1.xy = u_xlat10.xx * vec2(3.0, 4.0);
    u_xlat2.xy = u_xlat5.xx * vec2(0.159159631, 0.159159631) + (-u_xlat1.yx);
    u_xlat1.xy = u_xlat5.xx * vec2(0.159159631, 0.159159631) + u_xlat1.xy;
    u_xlat2.z = 0.0;
    u_xlat10_3 = texture(_MainTex, u_xlat2.xz);
    u_xlat10_2 = texture(_MainTex, u_xlat2.yz);
    u_xlat15 = u_xlat10_2.x + u_xlat10_2.x;
    u_xlatb15 = u_xlat15>=u_xlat0.x;
    u_xlat15 = u_xlatb15 ? 0.0900000036 : float(0.0);
    u_xlat16 = u_xlat10_3.x + u_xlat10_3.x;
    u_xlatb16 = u_xlat16>=u_xlat0.x;
    u_xlat16 = u_xlatb16 ? 0.0500000007 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat16;
    u_xlat16 = u_xlat10.x + u_xlat10.x;
    u_xlat12.x = u_xlat5.x * 0.159159631 + (-u_xlat16);
    u_xlat3.x = u_xlat5.x * 0.159159631 + u_xlat16;
    u_xlat2.y = float(0.0);
    u_xlat12.y = float(0.0);
    u_xlat10_4 = texture(_MainTex, u_xlat12.xy);
    u_xlat16 = u_xlat10_4.x + u_xlat10_4.x;
    u_xlatb16 = u_xlat16>=u_xlat0.x;
    u_xlat16 = u_xlatb16 ? 0.119999997 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat16;
    u_xlat4.x = u_xlat5.x * 0.159159631 + (-u_xlat10.x);
    u_xlat14.x = u_xlat5.x * 0.159159631 + u_xlat10.x;
    u_xlat2.x = u_xlat5.x * 0.159159631;
    u_xlat10_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat5.x = u_xlat10_2.x + u_xlat10_2.x;
    u_xlatb5.x = u_xlat5.x>=u_xlat0.x;
    u_xlat4.y = float(0.0);
    u_xlat14.y = float(0.0);
    u_xlat10_2 = texture(_MainTex, u_xlat4.xy);
    u_xlat10_4 = texture(_MainTex, u_xlat14.xy);
    u_xlat10.x = u_xlat10_4.x + u_xlat10_4.x;
    u_xlatb5.y = u_xlat10.x>=u_xlat0.x;
    u_xlat5.xy = mix(vec2(0.0, 0.0), vec2(0.159999996, 0.150000006), vec2(u_xlatb5.xy));
    u_xlat16 = u_xlat10_2.x + u_xlat10_2.x;
    u_xlatb16 = u_xlat16>=u_xlat0.x;
    u_xlat16 = u_xlatb16 ? 0.150000006 : float(0.0);
    u_xlat15 = u_xlat15 + u_xlat16;
    u_xlat5.x = u_xlat5.x + u_xlat15;
    u_xlat5.x = u_xlat5.y + u_xlat5.x;
    u_xlat3.y = 0.0;
    u_xlat10_2 = texture(_MainTex, u_xlat3.xy);
    u_xlat10.x = u_xlat10_2.x + u_xlat10_2.x;
    u_xlatb10.x = u_xlat10.x>=u_xlat0.x;
    u_xlat10.x = u_xlatb10.x ? 0.119999997 : float(0.0);
    u_xlat5.x = u_xlat10.x + u_xlat5.x;
    u_xlat1.z = 0.0;
    u_xlat10_2 = texture(_MainTex, u_xlat1.xz);
    u_xlat10_1 = texture(_MainTex, u_xlat1.yz);
    u_xlat10.x = u_xlat10_1.x + u_xlat10_1.x;
    u_xlatb10.x = u_xlat10.x>=u_xlat0.x;
    u_xlat15 = u_xlat10_2.x + u_xlat10_2.x;
    u_xlatb10.y = u_xlat15>=u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat10.xy = mix(vec2(0.0, 0.0), vec2(0.0500000007, 0.0900000036), vec2(u_xlatb10.xy));
    u_xlat5.x = u_xlat10.y + u_xlat5.x;
    u_xlat5.x = u_xlat10.x + u_xlat5.x;
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    SV_Target0.w = u_xlat0.x * u_xlat5.x;
    SV_Target0.xyz = vec3(1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 124
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %94 %102 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %94 RelaxedPrecision 
                                                     OpDecorate %94 Location 94 
                                                     OpDecorate %97 RelaxedPrecision 
                                                     OpDecorate %98 RelaxedPrecision 
                                                     OpDecorate %100 RelaxedPrecision 
                                                     OpDecorate %102 Location 102 
                                                     OpDecorate %111 RelaxedPrecision 
                                                     OpDecorate %117 RelaxedPrecision 
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
                                            %101 = OpTypePointer Output %92 
                              Output f32_2* %102 = OpVariable Output 
                                            %103 = OpTypePointer Function %6 
                                            %113 = OpTypePointer Output %6 
                                        u32 %115 = OpConstant 0 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %104 = OpVariable Function 
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
                                       bool %105 = OpLoad %84 
                                                     OpSelectionMerge %107 None 
                                                     OpBranchConditional %105 %106 %109 
                                            %106 = OpLabel 
                                        f32 %108 = OpLoad %91 
                                                     OpStore %104 %108 
                                                     OpBranch %107 
                                            %109 = OpLabel 
                                 Input f32* %110 = OpAccessChain %94 %68 
                                        f32 %111 = OpLoad %110 
                                                     OpStore %104 %111 
                                                     OpBranch %107 
                                            %107 = OpLabel 
                                        f32 %112 = OpLoad %104 
                                Output f32* %114 = OpAccessChain %102 %68 
                                                     OpStore %114 %112 
                                 Input f32* %116 = OpAccessChain %94 %115 
                                        f32 %117 = OpLoad %116 
                                Output f32* %118 = OpAccessChain %102 %115 
                                                     OpStore %118 %117 
                                Output f32* %119 = OpAccessChain %72 %22 %68 
                                        f32 %120 = OpLoad %119 
                                        f32 %121 = OpFNegate %120 
                                Output f32* %122 = OpAccessChain %72 %22 %68 
                                                     OpStore %122 %121 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 551
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %11 %541 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 Location 11 
                                                     OpMemberDecorate %201 0 Offset 201 
                                                     OpDecorate %201 Block 
                                                     OpDecorate %203 DescriptorSet 203 
                                                     OpDecorate %203 Binding 203 
                                                     OpDecorate %260 RelaxedPrecision 
                                                     OpDecorate %264 RelaxedPrecision 
                                                     OpDecorate %264 DescriptorSet 264 
                                                     OpDecorate %264 Binding 264 
                                                     OpDecorate %265 RelaxedPrecision 
                                                     OpDecorate %270 RelaxedPrecision 
                                                     OpDecorate %271 RelaxedPrecision 
                                                     OpDecorate %272 RelaxedPrecision 
                                                     OpDecorate %276 RelaxedPrecision 
                                                     OpDecorate %278 RelaxedPrecision 
                                                     OpDecorate %279 RelaxedPrecision 
                                                     OpDecorate %280 RelaxedPrecision 
                                                     OpDecorate %293 RelaxedPrecision 
                                                     OpDecorate %294 RelaxedPrecision 
                                                     OpDecorate %295 RelaxedPrecision 
                                                     OpDecorate %330 RelaxedPrecision 
                                                     OpDecorate %333 RelaxedPrecision 
                                                     OpDecorate %334 RelaxedPrecision 
                                                     OpDecorate %335 RelaxedPrecision 
                                                     OpDecorate %336 RelaxedPrecision 
                                                     OpDecorate %369 RelaxedPrecision 
                                                     OpDecorate %370 RelaxedPrecision 
                                                     OpDecorate %374 RelaxedPrecision 
                                                     OpDecorate %375 RelaxedPrecision 
                                                     OpDecorate %376 RelaxedPrecision 
                                                     OpDecorate %377 RelaxedPrecision 
                                                     OpDecorate %391 RelaxedPrecision 
                                                     OpDecorate %392 RelaxedPrecision 
                                                     OpDecorate %395 RelaxedPrecision 
                                                     OpDecorate %396 RelaxedPrecision 
                                                     OpDecorate %399 RelaxedPrecision 
                                                     OpDecorate %400 RelaxedPrecision 
                                                     OpDecorate %401 RelaxedPrecision 
                                                     OpDecorate %402 RelaxedPrecision 
                                                     OpDecorate %414 RelaxedPrecision 
                                                     OpDecorate %415 RelaxedPrecision 
                                                     OpDecorate %416 RelaxedPrecision 
                                                     OpDecorate %449 RelaxedPrecision 
                                                     OpDecorate %452 RelaxedPrecision 
                                                     OpDecorate %453 RelaxedPrecision 
                                                     OpDecorate %454 RelaxedPrecision 
                                                     OpDecorate %455 RelaxedPrecision 
                                                     OpDecorate %477 RelaxedPrecision 
                                                     OpDecorate %481 RelaxedPrecision 
                                                     OpDecorate %483 RelaxedPrecision 
                                                     OpDecorate %487 RelaxedPrecision 
                                                     OpDecorate %541 RelaxedPrecision 
                                                     OpDecorate %541 Location 541 
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
                                         f32 %17 = OpConstant 3.67402E-40 
                                       f32_2 %18 = OpConstantComposite %17 %13 
                                         f32 %21 = OpConstant 3.67402E-40 
                                       f32_2 %22 = OpConstantComposite %21 %21 
                                       f32_2 %24 = OpConstantComposite %14 %14 
                              Private f32_2* %26 = OpVariable Private 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 0 
                                             %29 = OpTypePointer Private %6 
                                         u32 %33 = OpConstant 1 
                                Private f32* %43 = OpVariable Private 
                                             %61 = OpTypeVector %6 3 
                                             %62 = OpTypePointer Private %61 
                              Private f32_3* %63 = OpVariable Private 
                                         f32 %65 = OpConstant 3.67402E-40 
                                         f32 %67 = OpConstant 3.67402E-40 
                                         f32 %74 = OpConstant 3.67402E-40 
                                         f32 %81 = OpConstant 3.67402E-40 
                                         f32 %88 = OpConstant 3.67402E-40 
                                         f32 %97 = OpConstant 3.67402E-40 
                                         f32 %99 = OpConstant 3.67402E-40 
                                            %102 = OpTypeBool 
                                            %103 = OpTypePointer Private %102 
                              Private bool* %104 = OpVariable Private 
                                            %112 = OpTypePointer Function %6 
                              Private bool* %130 = OpVariable Private 
                                        f32 %141 = OpConstant 3.67402E-40 
                              Private bool* %176 = OpVariable Private 
                               Private f32* %186 = OpVariable Private 
                                        f32 %199 = OpConstant 3.67402E-40 
                                            %201 = OpTypeStruct %6 
                                            %202 = OpTypePointer Uniform %201 
                     Uniform struct {f32;}* %203 = OpVariable Uniform 
                                            %204 = OpTypeInt 32 1 
                                        i32 %205 = OpConstant 0 
                                            %206 = OpTypePointer Uniform %6 
                                        f32 %214 = OpConstant 3.67402E-40 
                                        f32 %233 = OpConstant 3.67402E-40 
                                      f32_2 %234 = OpConstantComposite %214 %233 
                             Private f32_3* %238 = OpVariable Private 
                                        f32 %241 = OpConstant 3.67402E-40 
                                      f32_2 %242 = OpConstantComposite %241 %241 
                                        u32 %258 = OpConstant 2 
                               Private f32* %260 = OpVariable Private 
                                            %261 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %262 = OpTypeSampledImage %261 
                                            %263 = OpTypePointer UniformConstant %262 
UniformConstant read_only Texture2DSampled* %264 = OpVariable UniformConstant 
                                            %268 = OpTypeVector %6 4 
                               Private f32* %271 = OpVariable Private 
                               Private f32* %277 = OpVariable Private 
                              Private bool* %281 = OpVariable Private 
                                        f32 %290 = OpConstant 3.67402E-40 
                                        f32 %304 = OpConstant 3.67402E-40 
                             Private f32_2* %315 = OpVariable Private 
                             Private f32_2* %322 = OpVariable Private 
                                        f32 %345 = OpConstant 3.67402E-40 
                             Private f32_2* %351 = OpVariable Private 
                             Private f32_2* %359 = OpVariable Private 
                               Private f32* %369 = OpVariable Private 
                                        f32 %386 = OpConstant 3.67402E-40 
                               Private f32* %391 = OpVariable Private 
                                        f32 %411 = OpConstant 3.67402E-40 
                                            %418 = OpTypeVector %102 2 
                                            %419 = OpTypePointer Private %418 
                            Private bool_2* %420 = OpVariable Private 
                                            %496 = OpTypeVector %102 4 
                                      f32_2 %503 = OpConstantComposite %17 %17 
                                      f32_2 %504 = OpConstantComposite %290 %304 
                                      f32_2 %506 = OpConstantComposite %13 %13 
                                            %540 = OpTypePointer Output %268 
                              Output f32_4* %541 = OpVariable Output 
                                        u32 %544 = OpConstant 3 
                                            %545 = OpTypePointer Output %6 
                                      f32_3 %547 = OpConstantComposite %13 %13 %13 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                              Function f32* %113 = OpVariable Function 
                              Function f32* %137 = OpVariable Function 
                              Function f32* %187 = OpVariable Function 
                              Function f32* %286 = OpVariable Function 
                              Function f32* %300 = OpVariable Function 
                              Function f32* %341 = OpVariable Function 
                              Function f32* %382 = OpVariable Function 
                              Function f32* %407 = OpVariable Function 
                              Function f32* %428 = OpVariable Function 
                              Function f32* %464 = OpVariable Function 
                                       f32_2 %12 = OpLoad %11 
                                       f32_2 %16 = OpFMul %12 %15 
                                       f32_2 %19 = OpFAdd %16 %18 
                                                     OpStore %9 %19 
                                       f32_2 %20 = OpLoad %9 
                                       f32_2 %23 = OpFMul %20 %22 
                                       f32_2 %25 = OpFAdd %23 %24 
                                                     OpStore %9 %25 
                                Private f32* %30 = OpAccessChain %9 %28 
                                         f32 %31 = OpLoad %30 
                                         f32 %32 = OpExtInst %1 4 %31 
                                Private f32* %34 = OpAccessChain %9 %33 
                                         f32 %35 = OpLoad %34 
                                         f32 %36 = OpExtInst %1 4 %35 
                                         f32 %37 = OpExtInst %1 40 %32 %36 
                                Private f32* %38 = OpAccessChain %26 %28 
                                                     OpStore %38 %37 
                                Private f32* %39 = OpAccessChain %26 %28 
                                         f32 %40 = OpLoad %39 
                                         f32 %41 = OpFDiv %13 %40 
                                Private f32* %42 = OpAccessChain %26 %28 
                                                     OpStore %42 %41 
                                Private f32* %44 = OpAccessChain %9 %28 
                                         f32 %45 = OpLoad %44 
                                         f32 %46 = OpExtInst %1 4 %45 
                                Private f32* %47 = OpAccessChain %9 %33 
                                         f32 %48 = OpLoad %47 
                                         f32 %49 = OpExtInst %1 4 %48 
                                         f32 %50 = OpExtInst %1 37 %46 %49 
                                                     OpStore %43 %50 
                                Private f32* %51 = OpAccessChain %26 %28 
                                         f32 %52 = OpLoad %51 
                                         f32 %53 = OpLoad %43 
                                         f32 %54 = OpFMul %52 %53 
                                Private f32* %55 = OpAccessChain %26 %28 
                                                     OpStore %55 %54 
                                Private f32* %56 = OpAccessChain %26 %28 
                                         f32 %57 = OpLoad %56 
                                Private f32* %58 = OpAccessChain %26 %28 
                                         f32 %59 = OpLoad %58 
                                         f32 %60 = OpFMul %57 %59 
                                                     OpStore %43 %60 
                                         f32 %64 = OpLoad %43 
                                         f32 %66 = OpFMul %64 %65 
                                         f32 %68 = OpFAdd %66 %67 
                                Private f32* %69 = OpAccessChain %63 %28 
                                                     OpStore %69 %68 
                                         f32 %70 = OpLoad %43 
                                Private f32* %71 = OpAccessChain %63 %28 
                                         f32 %72 = OpLoad %71 
                                         f32 %73 = OpFMul %70 %72 
                                         f32 %75 = OpFAdd %73 %74 
                                Private f32* %76 = OpAccessChain %63 %28 
                                                     OpStore %76 %75 
                                         f32 %77 = OpLoad %43 
                                Private f32* %78 = OpAccessChain %63 %28 
                                         f32 %79 = OpLoad %78 
                                         f32 %80 = OpFMul %77 %79 
                                         f32 %82 = OpFAdd %80 %81 
                                Private f32* %83 = OpAccessChain %63 %28 
                                                     OpStore %83 %82 
                                         f32 %84 = OpLoad %43 
                                Private f32* %85 = OpAccessChain %63 %28 
                                         f32 %86 = OpLoad %85 
                                         f32 %87 = OpFMul %84 %86 
                                         f32 %89 = OpFAdd %87 %88 
                                                     OpStore %43 %89 
                                         f32 %90 = OpLoad %43 
                                Private f32* %91 = OpAccessChain %26 %28 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFMul %90 %92 
                                Private f32* %94 = OpAccessChain %63 %28 
                                                     OpStore %94 %93 
                                Private f32* %95 = OpAccessChain %63 %28 
                                         f32 %96 = OpLoad %95 
                                         f32 %98 = OpFMul %96 %97 
                                        f32 %100 = OpFAdd %98 %99 
                               Private f32* %101 = OpAccessChain %63 %28 
                                                     OpStore %101 %100 
                               Private f32* %105 = OpAccessChain %9 %28 
                                        f32 %106 = OpLoad %105 
                                        f32 %107 = OpExtInst %1 4 %106 
                               Private f32* %108 = OpAccessChain %9 %33 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpExtInst %1 4 %109 
                                       bool %111 = OpFOrdLessThan %107 %110 
                                                     OpStore %104 %111 
                                       bool %114 = OpLoad %104 
                                                     OpSelectionMerge %116 None 
                                                     OpBranchConditional %114 %115 %119 
                                            %115 = OpLabel 
                               Private f32* %117 = OpAccessChain %63 %28 
                                        f32 %118 = OpLoad %117 
                                                     OpStore %113 %118 
                                                     OpBranch %116 
                                            %119 = OpLabel 
                                                     OpStore %113 %17 
                                                     OpBranch %116 
                                            %116 = OpLabel 
                                        f32 %120 = OpLoad %113 
                               Private f32* %121 = OpAccessChain %63 %28 
                                                     OpStore %121 %120 
                               Private f32* %122 = OpAccessChain %26 %28 
                                        f32 %123 = OpLoad %122 
                                        f32 %124 = OpLoad %43 
                                        f32 %125 = OpFMul %123 %124 
                               Private f32* %126 = OpAccessChain %63 %28 
                                        f32 %127 = OpLoad %126 
                                        f32 %128 = OpFAdd %125 %127 
                               Private f32* %129 = OpAccessChain %26 %28 
                                                     OpStore %129 %128 
                               Private f32* %131 = OpAccessChain %9 %28 
                                        f32 %132 = OpLoad %131 
                               Private f32* %133 = OpAccessChain %9 %28 
                                        f32 %134 = OpLoad %133 
                                        f32 %135 = OpFNegate %134 
                                       bool %136 = OpFOrdLessThan %132 %135 
                                                     OpStore %130 %136 
                                       bool %138 = OpLoad %130 
                                                     OpSelectionMerge %140 None 
                                                     OpBranchConditional %138 %139 %142 
                                            %139 = OpLabel 
                                                     OpStore %137 %141 
                                                     OpBranch %140 
                                            %142 = OpLabel 
                                                     OpStore %137 %17 
                                                     OpBranch %140 
                                            %140 = OpLabel 
                                        f32 %143 = OpLoad %137 
                                                     OpStore %43 %143 
                                        f32 %144 = OpLoad %43 
                               Private f32* %145 = OpAccessChain %26 %28 
                                        f32 %146 = OpLoad %145 
                                        f32 %147 = OpFAdd %144 %146 
                               Private f32* %148 = OpAccessChain %26 %28 
                                                     OpStore %148 %147 
                               Private f32* %149 = OpAccessChain %9 %28 
                                        f32 %150 = OpLoad %149 
                               Private f32* %151 = OpAccessChain %9 %33 
                                        f32 %152 = OpLoad %151 
                                        f32 %153 = OpExtInst %1 37 %150 %152 
                                                     OpStore %43 %153 
                                        f32 %154 = OpLoad %43 
                                        f32 %155 = OpLoad %43 
                                        f32 %156 = OpFNegate %155 
                                       bool %157 = OpFOrdLessThan %154 %156 
                                                     OpStore %130 %157 
                               Private f32* %158 = OpAccessChain %9 %28 
                                        f32 %159 = OpLoad %158 
                               Private f32* %160 = OpAccessChain %9 %33 
                                        f32 %161 = OpLoad %160 
                                        f32 %162 = OpExtInst %1 40 %159 %161 
                               Private f32* %163 = OpAccessChain %63 %28 
                                                     OpStore %163 %162 
                                      f32_2 %164 = OpLoad %9 
                                      f32_2 %165 = OpLoad %9 
                                        f32 %166 = OpDot %164 %165 
                               Private f32* %167 = OpAccessChain %9 %28 
                                                     OpStore %167 %166 
                               Private f32* %168 = OpAccessChain %9 %28 
                                        f32 %169 = OpLoad %168 
                                        f32 %170 = OpExtInst %1 31 %169 
                               Private f32* %171 = OpAccessChain %9 %28 
                                                     OpStore %171 %170 
                               Private f32* %172 = OpAccessChain %9 %28 
                                        f32 %173 = OpLoad %172 
                                        f32 %174 = OpExtInst %1 37 %173 %13 
                               Private f32* %175 = OpAccessChain %9 %28 
                                                     OpStore %175 %174 
                               Private f32* %177 = OpAccessChain %63 %28 
                                        f32 %178 = OpLoad %177 
                               Private f32* %179 = OpAccessChain %63 %28 
                                        f32 %180 = OpLoad %179 
                                        f32 %181 = OpFNegate %180 
                                       bool %182 = OpFOrdGreaterThanEqual %178 %181 
                                                     OpStore %176 %182 
                                       bool %183 = OpLoad %176 
                                       bool %184 = OpLoad %130 
                                       bool %185 = OpLogicalAnd %183 %184 
                                                     OpStore %176 %185 
                                       bool %188 = OpLoad %176 
                                                     OpSelectionMerge %190 None 
                                                     OpBranchConditional %188 %189 %194 
                                            %189 = OpLabel 
                               Private f32* %191 = OpAccessChain %26 %28 
                                        f32 %192 = OpLoad %191 
                                        f32 %193 = OpFNegate %192 
                                                     OpStore %187 %193 
                                                     OpBranch %190 
                                            %194 = OpLabel 
                               Private f32* %195 = OpAccessChain %26 %28 
                                        f32 %196 = OpLoad %195 
                                                     OpStore %187 %196 
                                                     OpBranch %190 
                                            %190 = OpLabel 
                                        f32 %197 = OpLoad %187 
                                                     OpStore %186 %197 
                                        f32 %198 = OpLoad %186 
                                        f32 %200 = OpFAdd %198 %199 
                                                     OpStore %186 %200 
                               Uniform f32* %207 = OpAccessChain %203 %205 
                                        f32 %208 = OpLoad %207 
                                        f32 %209 = OpFDiv %13 %208 
                               Private f32* %210 = OpAccessChain %26 %28 
                                                     OpStore %210 %209 
                               Private f32* %211 = OpAccessChain %9 %28 
                                        f32 %212 = OpLoad %211 
                                        f32 %213 = OpFMul %212 %97 
                                        f32 %215 = OpFAdd %213 %214 
                                                     OpStore %43 %215 
                               Private f32* %216 = OpAccessChain %9 %28 
                                        f32 %217 = OpLoad %216 
                               Private f32* %218 = OpAccessChain %9 %28 
                                        f32 %219 = OpLoad %218 
                                        f32 %220 = OpFMul %217 %219 
                               Private f32* %221 = OpAccessChain %63 %28 
                                                     OpStore %221 %220 
                                        f32 %222 = OpLoad %43 
                               Private f32* %223 = OpAccessChain %63 %28 
                                        f32 %224 = OpLoad %223 
                                        f32 %225 = OpFMul %222 %224 
                                                     OpStore %43 %225 
                                        f32 %226 = OpLoad %43 
                               Private f32* %227 = OpAccessChain %26 %28 
                                        f32 %228 = OpLoad %227 
                                        f32 %229 = OpFMul %226 %228 
                               Private f32* %230 = OpAccessChain %26 %28 
                                                     OpStore %230 %229 
                                      f32_2 %231 = OpLoad %26 
                                      f32_2 %232 = OpVectorShuffle %231 %231 0 0 
                                      f32_2 %235 = OpFMul %232 %234 
                                      f32_3 %236 = OpLoad %63 
                                      f32_3 %237 = OpVectorShuffle %236 %235 3 4 2 
                                                     OpStore %63 %237 
                                        f32 %239 = OpLoad %186 
                                      f32_2 %240 = OpCompositeConstruct %239 %239 
                                      f32_2 %243 = OpFMul %240 %242 
                                      f32_3 %244 = OpLoad %63 
                                      f32_2 %245 = OpVectorShuffle %244 %244 1 0 
                                      f32_2 %246 = OpFNegate %245 
                                      f32_2 %247 = OpFAdd %243 %246 
                                      f32_3 %248 = OpLoad %238 
                                      f32_3 %249 = OpVectorShuffle %248 %247 3 4 2 
                                                     OpStore %238 %249 
                                        f32 %250 = OpLoad %186 
                                      f32_2 %251 = OpCompositeConstruct %250 %250 
                                      f32_2 %252 = OpFMul %251 %242 
                                      f32_3 %253 = OpLoad %63 
                                      f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                                      f32_2 %255 = OpFAdd %252 %254 
                                      f32_3 %256 = OpLoad %63 
                                      f32_3 %257 = OpVectorShuffle %256 %255 3 4 2 
                                                     OpStore %63 %257 
                               Private f32* %259 = OpAccessChain %238 %258 
                                                     OpStore %259 %17 
                 read_only Texture2DSampled %265 = OpLoad %264 
                                      f32_3 %266 = OpLoad %238 
                                      f32_2 %267 = OpVectorShuffle %266 %266 0 2 
                                      f32_4 %269 = OpImageSampleImplicitLod %265 %267 
                                        f32 %270 = OpCompositeExtract %269 0 
                                                     OpStore %260 %270 
                 read_only Texture2DSampled %272 = OpLoad %264 
                                      f32_3 %273 = OpLoad %238 
                                      f32_2 %274 = OpVectorShuffle %273 %273 1 2 
                                      f32_4 %275 = OpImageSampleImplicitLod %272 %274 
                                        f32 %276 = OpCompositeExtract %275 0 
                                                     OpStore %271 %276 
                                        f32 %278 = OpLoad %271 
                                        f32 %279 = OpLoad %271 
                                        f32 %280 = OpFAdd %278 %279 
                                                     OpStore %277 %280 
                                        f32 %282 = OpLoad %277 
                               Private f32* %283 = OpAccessChain %9 %28 
                                        f32 %284 = OpLoad %283 
                                       bool %285 = OpFOrdGreaterThanEqual %282 %284 
                                                     OpStore %281 %285 
                                       bool %287 = OpLoad %281 
                                                     OpSelectionMerge %289 None 
                                                     OpBranchConditional %287 %288 %291 
                                            %288 = OpLabel 
                                                     OpStore %286 %290 
                                                     OpBranch %289 
                                            %291 = OpLabel 
                                                     OpStore %286 %17 
                                                     OpBranch %289 
                                            %289 = OpLabel 
                                        f32 %292 = OpLoad %286 
                                                     OpStore %277 %292 
                                        f32 %293 = OpLoad %260 
                                        f32 %294 = OpLoad %260 
                                        f32 %295 = OpFAdd %293 %294 
                                                     OpStore %43 %295 
                                        f32 %296 = OpLoad %43 
                               Private f32* %297 = OpAccessChain %9 %28 
                                        f32 %298 = OpLoad %297 
                                       bool %299 = OpFOrdGreaterThanEqual %296 %298 
                                                     OpStore %130 %299 
                                       bool %301 = OpLoad %130 
                                                     OpSelectionMerge %303 None 
                                                     OpBranchConditional %301 %302 %305 
                                            %302 = OpLabel 
                                                     OpStore %300 %304 
                                                     OpBranch %303 
                                            %305 = OpLabel 
                                                     OpStore %300 %17 
                                                     OpBranch %303 
                                            %303 = OpLabel 
                                        f32 %306 = OpLoad %300 
                                                     OpStore %43 %306 
                                        f32 %307 = OpLoad %277 
                                        f32 %308 = OpLoad %43 
                                        f32 %309 = OpFAdd %307 %308 
                                                     OpStore %43 %309 
                               Private f32* %310 = OpAccessChain %26 %28 
                                        f32 %311 = OpLoad %310 
                               Private f32* %312 = OpAccessChain %26 %28 
                                        f32 %313 = OpLoad %312 
                                        f32 %314 = OpFAdd %311 %313 
                                                     OpStore %277 %314 
                                        f32 %316 = OpLoad %186 
                                        f32 %317 = OpFMul %316 %241 
                                        f32 %318 = OpLoad %277 
                                        f32 %319 = OpFNegate %318 
                                        f32 %320 = OpFAdd %317 %319 
                               Private f32* %321 = OpAccessChain %315 %28 
                                                     OpStore %321 %320 
                                        f32 %323 = OpLoad %186 
                                        f32 %324 = OpFMul %323 %241 
                                        f32 %325 = OpLoad %277 
                                        f32 %326 = OpFAdd %324 %325 
                               Private f32* %327 = OpAccessChain %322 %28 
                                                     OpStore %327 %326 
                               Private f32* %328 = OpAccessChain %238 %33 
                                                     OpStore %328 %17 
                               Private f32* %329 = OpAccessChain %315 %33 
                                                     OpStore %329 %17 
                 read_only Texture2DSampled %330 = OpLoad %264 
                                      f32_2 %331 = OpLoad %315 
                                      f32_4 %332 = OpImageSampleImplicitLod %330 %331 
                                        f32 %333 = OpCompositeExtract %332 0 
                                                     OpStore %271 %333 
                                        f32 %334 = OpLoad %271 
                                        f32 %335 = OpLoad %271 
                                        f32 %336 = OpFAdd %334 %335 
                                                     OpStore %277 %336 
                                        f32 %337 = OpLoad %277 
                               Private f32* %338 = OpAccessChain %9 %28 
                                        f32 %339 = OpLoad %338 
                                       bool %340 = OpFOrdGreaterThanEqual %337 %339 
                                                     OpStore %281 %340 
                                       bool %342 = OpLoad %281 
                                                     OpSelectionMerge %344 None 
                                                     OpBranchConditional %342 %343 %346 
                                            %343 = OpLabel 
                                                     OpStore %341 %345 
                                                     OpBranch %344 
                                            %346 = OpLabel 
                                                     OpStore %341 %17 
                                                     OpBranch %344 
                                            %344 = OpLabel 
                                        f32 %347 = OpLoad %341 
                                                     OpStore %277 %347 
                                        f32 %348 = OpLoad %43 
                                        f32 %349 = OpLoad %277 
                                        f32 %350 = OpFAdd %348 %349 
                                                     OpStore %43 %350 
                                        f32 %352 = OpLoad %186 
                                        f32 %353 = OpFMul %352 %241 
                               Private f32* %354 = OpAccessChain %26 %28 
                                        f32 %355 = OpLoad %354 
                                        f32 %356 = OpFNegate %355 
                                        f32 %357 = OpFAdd %353 %356 
                               Private f32* %358 = OpAccessChain %351 %28 
                                                     OpStore %358 %357 
                                        f32 %360 = OpLoad %186 
                                        f32 %361 = OpFMul %360 %241 
                               Private f32* %362 = OpAccessChain %26 %28 
                                        f32 %363 = OpLoad %362 
                                        f32 %364 = OpFAdd %361 %363 
                               Private f32* %365 = OpAccessChain %359 %28 
                                                     OpStore %365 %364 
                                        f32 %366 = OpLoad %186 
                                        f32 %367 = OpFMul %366 %241 
                               Private f32* %368 = OpAccessChain %238 %28 
                                                     OpStore %368 %367 
                 read_only Texture2DSampled %370 = OpLoad %264 
                                      f32_3 %371 = OpLoad %238 
                                      f32_2 %372 = OpVectorShuffle %371 %371 0 1 
                                      f32_4 %373 = OpImageSampleImplicitLod %370 %372 
                                        f32 %374 = OpCompositeExtract %373 0 
                                                     OpStore %369 %374 
                                        f32 %375 = OpLoad %369 
                                        f32 %376 = OpLoad %369 
                                        f32 %377 = OpFAdd %375 %376 
                                                     OpStore %186 %377 
                                        f32 %378 = OpLoad %186 
                               Private f32* %379 = OpAccessChain %9 %28 
                                        f32 %380 = OpLoad %379 
                                       bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                     OpStore %176 %381 
                                       bool %383 = OpLoad %176 
                                                     OpSelectionMerge %385 None 
                                                     OpBranchConditional %383 %384 %387 
                                            %384 = OpLabel 
                                                     OpStore %382 %386 
                                                     OpBranch %385 
                                            %387 = OpLabel 
                                                     OpStore %382 %17 
                                                     OpBranch %385 
                                            %385 = OpLabel 
                                        f32 %388 = OpLoad %382 
                                                     OpStore %186 %388 
                               Private f32* %389 = OpAccessChain %351 %33 
                                                     OpStore %389 %17 
                               Private f32* %390 = OpAccessChain %359 %33 
                                                     OpStore %390 %17 
                 read_only Texture2DSampled %392 = OpLoad %264 
                                      f32_2 %393 = OpLoad %351 
                                      f32_4 %394 = OpImageSampleImplicitLod %392 %393 
                                        f32 %395 = OpCompositeExtract %394 0 
                                                     OpStore %391 %395 
                 read_only Texture2DSampled %396 = OpLoad %264 
                                      f32_2 %397 = OpLoad %359 
                                      f32_4 %398 = OpImageSampleImplicitLod %396 %397 
                                        f32 %399 = OpCompositeExtract %398 0 
                                                     OpStore %271 %399 
                                        f32 %400 = OpLoad %271 
                                        f32 %401 = OpLoad %271 
                                        f32 %402 = OpFAdd %400 %401 
                                                     OpStore %277 %402 
                                        f32 %403 = OpLoad %277 
                               Private f32* %404 = OpAccessChain %9 %28 
                                        f32 %405 = OpLoad %404 
                                       bool %406 = OpFOrdGreaterThanEqual %403 %405 
                                                     OpStore %281 %406 
                                       bool %408 = OpLoad %281 
                                                     OpSelectionMerge %410 None 
                                                     OpBranchConditional %408 %409 %412 
                                            %409 = OpLabel 
                                                     OpStore %407 %411 
                                                     OpBranch %410 
                                            %412 = OpLabel 
                                                     OpStore %407 %17 
                                                     OpBranch %410 
                                            %410 = OpLabel 
                                        f32 %413 = OpLoad %407 
                                                     OpStore %277 %413 
                                        f32 %414 = OpLoad %391 
                                        f32 %415 = OpLoad %391 
                                        f32 %416 = OpFAdd %414 %415 
                               Private f32* %417 = OpAccessChain %26 %28 
                                                     OpStore %417 %416 
                               Private f32* %421 = OpAccessChain %26 %28 
                                        f32 %422 = OpLoad %421 
                               Private f32* %423 = OpAccessChain %9 %28 
                                        f32 %424 = OpLoad %423 
                                       bool %425 = OpFOrdGreaterThanEqual %422 %424 
                                     bool_2 %426 = OpLoad %420 
                                     bool_2 %427 = OpCompositeInsert %425 %426 0 
                                                     OpStore %420 %427 
                                     bool_2 %429 = OpLoad %420 
                                       bool %430 = OpCompositeExtract %429 0 
                                                     OpSelectionMerge %432 None 
                                                     OpBranchConditional %430 %431 %433 
                                            %431 = OpLabel 
                                                     OpStore %428 %411 
                                                     OpBranch %432 
                                            %433 = OpLabel 
                                                     OpStore %428 %17 
                                                     OpBranch %432 
                                            %432 = OpLabel 
                                        f32 %434 = OpLoad %428 
                               Private f32* %435 = OpAccessChain %26 %28 
                                                     OpStore %435 %434 
                               Private f32* %436 = OpAccessChain %26 %28 
                                        f32 %437 = OpLoad %436 
                                        f32 %438 = OpLoad %43 
                                        f32 %439 = OpFAdd %437 %438 
                               Private f32* %440 = OpAccessChain %26 %28 
                                                     OpStore %440 %439 
                                        f32 %441 = OpLoad %186 
                               Private f32* %442 = OpAccessChain %26 %28 
                                        f32 %443 = OpLoad %442 
                                        f32 %444 = OpFAdd %441 %443 
                                                     OpStore %186 %444 
                                        f32 %445 = OpLoad %277 
                                        f32 %446 = OpLoad %186 
                                        f32 %447 = OpFAdd %445 %446 
                                                     OpStore %186 %447 
                               Private f32* %448 = OpAccessChain %322 %33 
                                                     OpStore %448 %17 
                 read_only Texture2DSampled %449 = OpLoad %264 
                                      f32_2 %450 = OpLoad %322 
                                      f32_4 %451 = OpImageSampleImplicitLod %449 %450 
                                        f32 %452 = OpCompositeExtract %451 0 
                                                     OpStore %391 %452 
                                        f32 %453 = OpLoad %391 
                                        f32 %454 = OpLoad %391 
                                        f32 %455 = OpFAdd %453 %454 
                               Private f32* %456 = OpAccessChain %26 %28 
                                                     OpStore %456 %455 
                               Private f32* %457 = OpAccessChain %26 %28 
                                        f32 %458 = OpLoad %457 
                               Private f32* %459 = OpAccessChain %9 %28 
                                        f32 %460 = OpLoad %459 
                                       bool %461 = OpFOrdGreaterThanEqual %458 %460 
                                     bool_2 %462 = OpLoad %420 
                                     bool_2 %463 = OpCompositeInsert %461 %462 0 
                                                     OpStore %420 %463 
                                     bool_2 %465 = OpLoad %420 
                                       bool %466 = OpCompositeExtract %465 0 
                                                     OpSelectionMerge %468 None 
                                                     OpBranchConditional %466 %467 %469 
                                            %467 = OpLabel 
                                                     OpStore %464 %345 
                                                     OpBranch %468 
                                            %469 = OpLabel 
                                                     OpStore %464 %17 
                                                     OpBranch %468 
                                            %468 = OpLabel 
                                        f32 %470 = OpLoad %464 
                               Private f32* %471 = OpAccessChain %26 %28 
                                                     OpStore %471 %470 
                               Private f32* %472 = OpAccessChain %26 %28 
                                        f32 %473 = OpLoad %472 
                                        f32 %474 = OpLoad %186 
                                        f32 %475 = OpFAdd %473 %474 
                                                     OpStore %186 %475 
                               Private f32* %476 = OpAccessChain %63 %258 
                                                     OpStore %476 %17 
                 read_only Texture2DSampled %477 = OpLoad %264 
                                      f32_3 %478 = OpLoad %63 
                                      f32_2 %479 = OpVectorShuffle %478 %478 0 2 
                                      f32_4 %480 = OpImageSampleImplicitLod %477 %479 
                                        f32 %481 = OpCompositeExtract %480 0 
                               Private f32* %482 = OpAccessChain %26 %28 
                                                     OpStore %482 %481 
                 read_only Texture2DSampled %483 = OpLoad %264 
                                      f32_3 %484 = OpLoad %63 
                                      f32_2 %485 = OpVectorShuffle %484 %484 1 2 
                                      f32_4 %486 = OpImageSampleImplicitLod %483 %485 
                                        f32 %487 = OpCompositeExtract %486 0 
                               Private f32* %488 = OpAccessChain %26 %33 
                                                     OpStore %488 %487 
                                      f32_2 %489 = OpLoad %26 
                                      f32_2 %490 = OpLoad %26 
                                      f32_2 %491 = OpFAdd %489 %490 
                                                     OpStore %26 %491 
                                      f32_2 %492 = OpLoad %26 
                                      f32_4 %493 = OpVectorShuffle %492 %492 0 1 0 1 
                                      f32_2 %494 = OpLoad %9 
                                      f32_4 %495 = OpVectorShuffle %494 %494 0 0 0 0 
                                     bool_4 %497 = OpFOrdGreaterThanEqual %493 %495 
                                     bool_2 %498 = OpVectorShuffle %497 %497 0 1 
                                                     OpStore %420 %498 
                               Private f32* %499 = OpAccessChain %9 %28 
                                        f32 %500 = OpLoad %499 
                                        f32 %501 = OpFAdd %500 %14 
                               Private f32* %502 = OpAccessChain %9 %28 
                                                     OpStore %502 %501 
                                     bool_2 %505 = OpLoad %420 
                                      f32_2 %507 = OpSelect %505 %506 %503 
                                      f32_2 %508 = OpExtInst %1 46 %503 %504 %507 
                                                     OpStore %26 %508 
                               Private f32* %509 = OpAccessChain %26 %28 
                                        f32 %510 = OpLoad %509 
                                        f32 %511 = OpLoad %186 
                                        f32 %512 = OpFAdd %510 %511 
                                                     OpStore %186 %512 
                               Private f32* %513 = OpAccessChain %26 %33 
                                        f32 %514 = OpLoad %513 
                                        f32 %515 = OpLoad %186 
                                        f32 %516 = OpFAdd %514 %515 
                                                     OpStore %186 %516 
                               Private f32* %517 = OpAccessChain %9 %28 
                                        f32 %518 = OpLoad %517 
                               Private f32* %519 = OpAccessChain %9 %28 
                                        f32 %520 = OpLoad %519 
                                        f32 %521 = OpFMul %518 %520 
                               Private f32* %522 = OpAccessChain %26 %28 
                                                     OpStore %522 %521 
                               Private f32* %523 = OpAccessChain %9 %28 
                                        f32 %524 = OpLoad %523 
                                        f32 %525 = OpFNegate %524 
                                        f32 %526 = OpFMul %525 %97 
                                        f32 %527 = OpFAdd %526 %214 
                               Private f32* %528 = OpAccessChain %9 %28 
                                                     OpStore %528 %527 
                               Private f32* %529 = OpAccessChain %9 %28 
                                        f32 %530 = OpLoad %529 
                               Private f32* %531 = OpAccessChain %26 %28 
                                        f32 %532 = OpLoad %531 
                                        f32 %533 = OpFMul %530 %532 
                               Private f32* %534 = OpAccessChain %9 %28 
                                                     OpStore %534 %533 
                               Private f32* %535 = OpAccessChain %9 %28 
                                        f32 %536 = OpLoad %535 
                                        f32 %537 = OpLoad %186 
                                        f32 %538 = OpFMul %536 %537 
                               Private f32* %539 = OpAccessChain %9 %28 
                                                     OpStore %539 %538 
                               Private f32* %542 = OpAccessChain %9 %28 
                                        f32 %543 = OpLoad %542 
                                Output f32* %546 = OpAccessChain %541 %544 
                                                     OpStore %546 %543 
                                      f32_4 %548 = OpLoad %541 
                                      f32_4 %549 = OpVectorShuffle %548 %547 4 5 6 3 
                                                     OpStore %541 %549 
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