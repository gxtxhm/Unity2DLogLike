//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Effects/SimplicityDerivativeShader" {
Properties {
_MainTex ("Main Tex", 2D) = "white" { }
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
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
  GpuProgramID 50460
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

uniform 	vec4 _Time;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec2 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
int u_xlati5;
vec3 u_xlat6;
vec3 u_xlat9;
vec3 u_xlat11;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
vec2 u_xlat16;
float u_xlat17;
float u_xlat19;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
float u_xlat24;
float u_xlat25;
float u_xlat26;
bool u_xlatb26;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = vs_TEXCOORD0.xxy * vec3(37.0, 50.0, 34.0) + _Time.zzz;
    u_xlat1.xyz = sin(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.yzw = u_xlat1.yzz * vec3(0.166666672, 0.239808142, 0.239808142) + vec3(0.100000001, 0.100000001, -0.200000018);
    u_xlat21 = u_xlat10_0.w + -0.100000001;
    u_xlatb21 = u_xlat21<0.0;
    if((int(u_xlatb21) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(25.7999992, 25.7999992);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = (-u_xlat2.xy) + vec2(0.5, 0.5);
    u_xlat16.xy = abs(u_xlat2.xy) + abs(u_xlat2.xy);
    u_xlat3.xy = abs(u_xlat2.xy) * vec2(0.5, 0.5) + vec2(1.0, -1.29999995);
    u_xlat3.z = 0.0;
    u_xlat4 = _Time.yyyy * vec4(0.0625, 0.0833333358, 0.0078125, 0.800000012);
    u_xlat4 = sin(u_xlat4);
    u_xlat21 = u_xlat4.w * 4373.10986;
    u_xlat3.xyz = u_xlat4.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat3.xyz;
    u_xlat24 = sin(_Time.y);
    u_xlat24 = u_xlat24 * 4373.10986;
    u_xlat24 = fract(u_xlat24);
    u_xlat24 = u_xlat24 + 9.99999997e-007;
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * 0.0207944158 + 7.0;
    u_xlat4.x = u_xlat1.y * 0.25;
    u_xlat11.xyz = u_xlat3.xyz;
    u_xlat5.x = u_xlat4.x;
    u_xlat5.y = float(0.0);
    u_xlat5.z = float(0.0);
    while(true){
        u_xlatb26 = floatBitsToInt(u_xlat5).z>=26;
        if(u_xlatb26){break;}
        u_xlat5.w = dot(u_xlat11.xyz, u_xlat11.xyz);
        u_xlat6.xyz = abs(u_xlat11.xyz) / u_xlat5.www;
        u_xlat11.xyz = u_xlat6.xyz + vec3(-0.5, -0.400000006, -1.5);
        u_xlat6.x = float(floatBitsToInt(u_xlat5).z);
        u_xlat6.x = u_xlat6.x * -0.206099302;
        u_xlat6.x = exp2(u_xlat6.x);
        u_xlat13 = (-u_xlat5.y) + u_xlat5.w;
        u_xlat13 = log2(abs(u_xlat13));
        u_xlat13 = u_xlat13 * 2.70000005;
        u_xlat13 = exp2(u_xlat13);
        u_xlat13 = (-u_xlat24) * u_xlat13;
        u_xlat13 = u_xlat13 * 1.44269502;
        u_xlat13 = exp2(u_xlat13);
        u_xlat5.x = u_xlat6.x * u_xlat13 + u_xlat5.x;
        u_xlat5.z = intBitsToFloat(floatBitsToInt(u_xlat5).z + 1);
        u_xlat5.xyz = u_xlat5.xwz;
    }
    u_xlat17 = u_xlat5.x * 0.68223846 + -0.699999988;
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat2.xy = abs(u_xlat2.xy) * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = u_xlat2.xy * vec2(8.65616989, 8.65616989);
    u_xlat2.xy = exp2(u_xlat2.xy);
    u_xlat2.xy = (-u_xlat2.xy) + vec2(1.0, 1.0);
    u_xlat2.x = u_xlat2.y * u_xlat2.x;
    u_xlat4 = _Time.yyyy * vec4(0.0879999995, 0.120000005, 0.0500000007, 0.0666666701);
    u_xlat4 = sin(u_xlat4.zwxy);
    u_xlat9.x = u_xlat4.z * 0.200000003 + 4.19999981;
    u_xlat9.x = u_xlat4.w * 0.300000012 + u_xlat9.x;
    u_xlat9.x = u_xlat9.x + 0.400000006;
    u_xlat9.xy = u_xlat16.xy / u_xlat9.xx;
    u_xlat5.xy = u_xlat9.xy + vec2(2.0, -1.29999995);
    u_xlat5.z = 0.5;
    u_xlat9.x = _Time.y * 0.00625000009;
    u_xlat4.z = sin(u_xlat9.x);
    u_xlat9.xyz = u_xlat4.xyz * vec3(0.25, 0.25, 0.25) + u_xlat5.xyz;
    u_xlat21 = fract(u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999997e-007;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 0.0207944158 + 7.0;
    u_xlat4.xyz = u_xlat9.xyz;
    u_xlat24 = 0.75;
    u_xlat25 = 0.0;
    u_xlati5 = 0;
    while(true){
        u_xlatb12 = u_xlati5>=18;
        if(u_xlatb12){break;}
        u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat6.xyz = abs(u_xlat4.xyz) / vec3(u_xlat12);
        u_xlat4.xyz = u_xlat6.xyz + vec3(-0.5, -0.400000006, -1.5);
        u_xlat19 = float(u_xlati5);
        u_xlat19 = u_xlat19 * -0.206099302;
        u_xlat19 = exp2(u_xlat19);
        u_xlat26 = (-u_xlat25) + u_xlat12;
        u_xlat26 = log2(abs(u_xlat26));
        u_xlat26 = u_xlat26 * 1.70000005;
        u_xlat26 = exp2(u_xlat26);
        u_xlat26 = (-u_xlat21) * u_xlat26;
        u_xlat26 = u_xlat26 * 1.44269502;
        u_xlat26 = exp2(u_xlat26);
        u_xlat24 = u_xlat19 * u_xlat26 + u_xlat24;
        u_xlati5 = u_xlati5 + 1;
        u_xlat25 = u_xlat12;
    }
    u_xlat21 = u_xlat24 * 0.720690131 + -0.699999988;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat9.x = u_xlat2.x * 0.600000024 + 0.400000006;
    u_xlat16.x = u_xlat21 * u_xlat21;
    u_xlat16.y = u_xlat21 * u_xlat16.x;
    u_xlat4.xy = u_xlat9.xx * u_xlat16.yx;
    u_xlat4.z = u_xlat21 * u_xlat9.x;
    u_xlat9.xyz = u_xlat4.xyz * vec3(1.29999995, 1.79999995, 0.200000003);
    u_xlat9.xyz = log2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.5, 1.5, 1.5);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(2.0, 0.25, 1.5);
    u_xlat3.xy = u_xlat3.xy * vec2(224.0, 400.0);
    u_xlat3.xy = floor(u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xx * vec2(0.00829999987, 0.000300000014) + u_xlat3.yy;
    u_xlat21 = cos(u_xlat3.x);
    u_xlat21 = u_xlat21 * 470000.0;
    u_xlat21 = fract(u_xlat21);
    u_xlat3.x = sin(u_xlat3.y);
    u_xlat3.x = u_xlat3.x * 100000.0;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat3.x = (-u_xlat21) + u_xlat3.x;
    u_xlat21 = u_xlat3.x * 0.5 + u_xlat21;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 50.0;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 + -0.0250000004;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = ceil(u_xlat21);
    u_xlat3.x = (-u_xlat1.w) + 1.0;
    u_xlat22 = u_xlat2.x * u_xlat3.x + u_xlat1.w;
    u_xlat2.x = u_xlat17 * u_xlat17;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xx;
    u_xlat1.y = u_xlat17 * u_xlat1.y;
    u_xlat4.xy = vec2(u_xlat22) * u_xlat1.yx;
    u_xlat1.x = u_xlat1.z * u_xlat17;
    u_xlat4.z = u_xlat22 * u_xlat1.x;
    u_xlat1.xyz = u_xlat4.xyz * vec3(1.70000005, 0.130861506, 1.29999995) + u_xlat9.xyz;
    u_xlat1.xyz = vec3(u_xlat21) * vec3(100.0, 100.0, 100.0) + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.25, 3.25, 3.25);
    u_xlat1.w = 3.25;
    u_xlat16_0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat16_0 * 0.660000026 + 0.340000004;
    SV_Target0 = vec4(u_xlat16_0) * u_xlat1;
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
                                              OpDecorate %84 Location 84 
                                              OpDecorate %86 Location 86 
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
; Bound: 654
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %648 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpMemberDecorate %29 0 Offset 29 
                                                    OpDecorate %29 Block 
                                                    OpDecorate %31 DescriptorSet 31 
                                                    OpDecorate %31 Binding 31 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %625 RelaxedPrecision 
                                                    OpDecorate %634 RelaxedPrecision 
                                                    OpDecorate %635 RelaxedPrecision 
                                                    OpDecorate %636 RelaxedPrecision 
                                                    OpDecorate %641 RelaxedPrecision 
                                                    OpDecorate %642 RelaxedPrecision 
                                                    OpDecorate %644 RelaxedPrecision 
                                                    OpDecorate %646 RelaxedPrecision 
                                                    OpDecorate %648 RelaxedPrecision 
                                                    OpDecorate %648 Location 648 
                                                    OpDecorate %649 RelaxedPrecision 
                                                    OpDecorate %650 RelaxedPrecision 
                                                    OpDecorate %651 RelaxedPrecision 
                                                    OpDecorate %652 RelaxedPrecision 
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
                             Private f32_4* %20 = OpVariable Private 
                                            %21 = OpTypeVector %6 3 
                                        f32 %24 = OpConstant 3.67402E-40 
                                        f32 %25 = OpConstant 3.67402E-40 
                                        f32 %26 = OpConstant 3.67402E-40 
                                      f32_3 %27 = OpConstantComposite %24 %25 %26 
                                            %29 = OpTypeStruct %7 
                                            %30 = OpTypePointer Uniform %29 
                   Uniform struct {f32_4;}* %31 = OpVariable Uniform 
                                            %32 = OpTypeInt 32 1 
                                        i32 %33 = OpConstant 0 
                                            %34 = OpTypePointer Uniform %7 
                                        f32 %48 = OpConstant 3.67402E-40 
                                      f32_3 %49 = OpConstantComposite %48 %48 %48 
                                        f32 %55 = OpConstant 3.67402E-40 
                                        f32 %56 = OpConstant 3.67402E-40 
                                      f32_3 %57 = OpConstantComposite %55 %56 %56 
                                        f32 %59 = OpConstant 3.67402E-40 
                                        f32 %60 = OpConstant 3.67402E-40 
                                      f32_3 %61 = OpConstantComposite %59 %59 %60 
                                            %65 = OpTypePointer Private %6 
                               Private f32* %66 = OpVariable Private 
                                            %67 = OpTypeInt 32 0 
                                        u32 %68 = OpConstant 3 
                                        f32 %71 = OpConstant 3.67402E-40 
                                            %73 = OpTypeBool 
                                            %74 = OpTypePointer Private %73 
                              Private bool* %75 = OpVariable Private 
                                        f32 %77 = OpConstant 3.67402E-40 
                                        i32 %80 = OpConstant 1 
                                        i32 %82 = OpConstant -1 
                                            %88 = OpTypePointer Private %15 
                             Private f32_2* %89 = OpVariable Private 
                                        f32 %91 = OpConstant 3.67402E-40 
                                      f32_2 %92 = OpConstantComposite %91 %91 
                                        f32 %98 = OpConstant 3.67402E-40 
                                      f32_2 %99 = OpConstantComposite %98 %98 
                            Private f32_2* %101 = OpVariable Private 
                                           %107 = OpTypePointer Private %21 
                            Private f32_3* %108 = OpVariable Private 
                                       f32 %112 = OpConstant 3.67402E-40 
                                     f32_2 %113 = OpConstantComposite %48 %112 
                                       u32 %117 = OpConstant 2 
                            Private f32_4* %119 = OpVariable Private 
                                       f32 %123 = OpConstant 3.67402E-40 
                                       f32 %124 = OpConstant 3.67402E-40 
                                       f32 %125 = OpConstant 3.67402E-40 
                                       f32 %126 = OpConstant 3.67402E-40 
                                     f32_4 %127 = OpConstantComposite %123 %124 %125 %126 
                                       f32 %133 = OpConstant 3.67402E-40 
                                       f32 %137 = OpConstant 3.67402E-40 
                                     f32_3 %138 = OpConstantComposite %137 %137 %137 
                              Private f32* %142 = OpVariable Private 
                                       u32 %143 = OpConstant 1 
                                           %144 = OpTypePointer Uniform %6 
                                       f32 %153 = OpConstant 3.67402E-40 
                                       f32 %158 = OpConstant 3.67402E-40 
                                       f32 %160 = OpConstant 3.67402E-40 
                                       f32 %164 = OpConstant 3.67402E-40 
                                       u32 %166 = OpConstant 0 
                            Private f32_3* %168 = OpVariable Private 
                            Private f32_4* %170 = OpVariable Private 
                                      bool %181 = OpConstantTrue 
                             Private bool* %182 = OpVariable Private 
                                           %184 = OpTypeVector %32 4 
                                       i32 %187 = OpConstant 26 
                            Private f32_3* %197 = OpVariable Private 
                                       f32 %204 = OpConstant 3.67402E-40 
                                       f32 %205 = OpConstant 3.67402E-40 
                                       f32 %206 = OpConstant 3.67402E-40 
                                     f32_3 %207 = OpConstantComposite %204 %205 %206 
                                       f32 %216 = OpConstant 3.67402E-40 
                              Private f32* %223 = OpVariable Private 
                                       f32 %234 = OpConstant 3.67402E-40 
                                       f32 %243 = OpConstant 3.67402E-40 
                              Private f32* %265 = OpVariable Private 
                                       f32 %268 = OpConstant 3.67402E-40 
                                       f32 %270 = OpConstant 3.67402E-40 
                                       f32 %276 = OpConstant 3.67402E-40 
                                     f32_2 %277 = OpConstantComposite %276 %276 
                                       f32 %279 = OpConstant 3.67402E-40 
                                     f32_2 %280 = OpConstantComposite %279 %279 
                                       f32 %283 = OpConstant 3.67402E-40 
                                     f32_2 %284 = OpConstantComposite %283 %283 
                                     f32_2 %290 = OpConstantComposite %48 %48 
                                       f32 %301 = OpConstant 3.67402E-40 
                                       f32 %302 = OpConstant 3.67402E-40 
                                       f32 %303 = OpConstant 3.67402E-40 
                                       f32 %304 = OpConstant 3.67402E-40 
                                     f32_4 %305 = OpConstantComposite %301 %302 %303 %304 
                            Private f32_3* %310 = OpVariable Private 
                                       f32 %314 = OpConstant 3.67402E-40 
                                       f32 %319 = OpConstant 3.67402E-40 
                                       f32 %327 = OpConstant 3.67402E-40 
                                     f32_2 %338 = OpConstantComposite %276 %112 
                                       f32 %345 = OpConstant 3.67402E-40 
                                     f32_3 %354 = OpConstantComposite %164 %164 %164 
                                       f32 %371 = OpConstant 3.67402E-40 
                              Private f32* %372 = OpVariable Private 
                                           %373 = OpTypePointer Private %32 
                              Private i32* %374 = OpVariable Private 
                             Private bool* %380 = OpVariable Private 
                                       i32 %382 = OpConstant 18 
                              Private f32* %388 = OpVariable Private 
                              Private f32* %404 = OpVariable Private 
                              Private f32* %411 = OpVariable Private 
                                       f32 %420 = OpConstant 3.67402E-40 
                                       f32 %441 = OpConstant 3.67402E-40 
                                       f32 %448 = OpConstant 3.67402E-40 
                                       f32 %475 = OpConstant 3.67402E-40 
                                       f32 %476 = OpConstant 3.67402E-40 
                                     f32_3 %477 = OpConstantComposite %475 %476 %137 
                                       f32 %482 = OpConstant 3.67402E-40 
                                     f32_3 %483 = OpConstantComposite %482 %482 %482 
                                     f32_3 %488 = OpConstantComposite %276 %164 %482 
                                       f32 %492 = OpConstant 3.67402E-40 
                                       f32 %493 = OpConstant 3.67402E-40 
                                     f32_2 %494 = OpConstantComposite %492 %493 
                                       f32 %505 = OpConstant 3.67402E-40 
                                       f32 %506 = OpConstant 3.67402E-40 
                                     f32_2 %507 = OpConstantComposite %505 %506 
                                       f32 %518 = OpConstant 3.67402E-40 
                                       f32 %528 = OpConstant 3.67402E-40 
                                       f32 %553 = OpConstant 3.67402E-40 
                              Private f32* %564 = OpVariable Private 
                                       f32 %608 = OpConstant 3.67402E-40 
                                     f32_3 %609 = OpConstantComposite %420 %608 %475 
                                       f32 %617 = OpConstant 3.67402E-40 
                                     f32_3 %618 = OpConstantComposite %617 %617 %617 
                            Private f32_4* %625 = OpVariable Private 
                                       f32 %628 = OpConstant 3.67402E-40 
                                     f32_3 %629 = OpConstantComposite %628 %628 %628 
                              Private f32* %634 = OpVariable Private 
                                       f32 %637 = OpConstant 3.67402E-40 
                                       f32 %638 = OpConstant 3.67402E-40 
                                       f32 %639 = OpConstant 3.67402E-40 
                                     f32_3 %640 = OpConstantComposite %637 %638 %639 
                                       f32 %643 = OpConstant 3.67402E-40 
                                       f32 %645 = OpConstant 3.67402E-40 
                                           %647 = OpTypePointer Output %7 
                             Output f32_4* %648 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_2 %22 = OpLoad %17 
                                      f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                      f32_3 %28 = OpFMul %23 %27 
                             Uniform f32_4* %35 = OpAccessChain %31 %33 
                                      f32_4 %36 = OpLoad %35 
                                      f32_3 %37 = OpVectorShuffle %36 %36 2 2 2 
                                      f32_3 %38 = OpFAdd %28 %37 
                                      f32_4 %39 = OpLoad %20 
                                      f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                    OpStore %20 %40 
                                      f32_4 %41 = OpLoad %20 
                                      f32_3 %42 = OpVectorShuffle %41 %41 0 1 2 
                                      f32_3 %43 = OpExtInst %1 13 %42 
                                      f32_4 %44 = OpLoad %20 
                                      f32_4 %45 = OpVectorShuffle %44 %43 4 5 6 3 
                                                    OpStore %20 %45 
                                      f32_4 %46 = OpLoad %20 
                                      f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                      f32_3 %50 = OpFAdd %47 %49 
                                      f32_4 %51 = OpLoad %20 
                                      f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                    OpStore %20 %52 
                                      f32_4 %53 = OpLoad %20 
                                      f32_3 %54 = OpVectorShuffle %53 %53 1 2 2 
                                      f32_3 %58 = OpFMul %54 %57 
                                      f32_3 %62 = OpFAdd %58 %61 
                                      f32_4 %63 = OpLoad %20 
                                      f32_4 %64 = OpVectorShuffle %63 %62 0 4 5 6 
                                                    OpStore %20 %64 
                               Private f32* %69 = OpAccessChain %9 %68 
                                        f32 %70 = OpLoad %69 
                                        f32 %72 = OpFAdd %70 %71 
                                                    OpStore %66 %72 
                                        f32 %76 = OpLoad %66 
                                       bool %78 = OpFOrdLessThan %76 %77 
                                                    OpStore %75 %78 
                                       bool %79 = OpLoad %75 
                                        i32 %81 = OpSelect %79 %80 %33 
                                        i32 %83 = OpIMul %81 %82 
                                       bool %84 = OpINotEqual %83 %33 
                                                    OpSelectionMerge %86 None 
                                                    OpBranchConditional %84 %85 %86 
                                            %85 = OpLabel 
                                                    OpKill
                                            %86 = OpLabel 
                                      f32_2 %90 = OpLoad %17 
                                      f32_2 %93 = OpFMul %90 %92 
                                                    OpStore %89 %93 
                                      f32_2 %94 = OpLoad %89 
                                      f32_2 %95 = OpExtInst %1 10 %94 
                                                    OpStore %89 %95 
                                      f32_2 %96 = OpLoad %89 
                                      f32_2 %97 = OpFNegate %96 
                                     f32_2 %100 = OpFAdd %97 %99 
                                                    OpStore %89 %100 
                                     f32_2 %102 = OpLoad %89 
                                     f32_2 %103 = OpExtInst %1 4 %102 
                                     f32_2 %104 = OpLoad %89 
                                     f32_2 %105 = OpExtInst %1 4 %104 
                                     f32_2 %106 = OpFAdd %103 %105 
                                                    OpStore %101 %106 
                                     f32_2 %109 = OpLoad %89 
                                     f32_2 %110 = OpExtInst %1 4 %109 
                                     f32_2 %111 = OpFMul %110 %99 
                                     f32_2 %114 = OpFAdd %111 %113 
                                     f32_3 %115 = OpLoad %108 
                                     f32_3 %116 = OpVectorShuffle %115 %114 3 4 2 
                                                    OpStore %108 %116 
                              Private f32* %118 = OpAccessChain %108 %117 
                                                    OpStore %118 %77 
                            Uniform f32_4* %120 = OpAccessChain %31 %33 
                                     f32_4 %121 = OpLoad %120 
                                     f32_4 %122 = OpVectorShuffle %121 %121 1 1 1 1 
                                     f32_4 %128 = OpFMul %122 %127 
                                                    OpStore %119 %128 
                                     f32_4 %129 = OpLoad %119 
                                     f32_4 %130 = OpExtInst %1 13 %129 
                                                    OpStore %119 %130 
                              Private f32* %131 = OpAccessChain %119 %68 
                                       f32 %132 = OpLoad %131 
                                       f32 %134 = OpFMul %132 %133 
                                                    OpStore %66 %134 
                                     f32_4 %135 = OpLoad %119 
                                     f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                     f32_3 %139 = OpFMul %136 %138 
                                     f32_3 %140 = OpLoad %108 
                                     f32_3 %141 = OpFAdd %139 %140 
                                                    OpStore %108 %141 
                              Uniform f32* %145 = OpAccessChain %31 %33 %143 
                                       f32 %146 = OpLoad %145 
                                       f32 %147 = OpExtInst %1 13 %146 
                                                    OpStore %142 %147 
                                       f32 %148 = OpLoad %142 
                                       f32 %149 = OpFMul %148 %133 
                                                    OpStore %142 %149 
                                       f32 %150 = OpLoad %142 
                                       f32 %151 = OpExtInst %1 10 %150 
                                                    OpStore %142 %151 
                                       f32 %152 = OpLoad %142 
                                       f32 %154 = OpFAdd %152 %153 
                                                    OpStore %142 %154 
                                       f32 %155 = OpLoad %142 
                                       f32 %156 = OpExtInst %1 30 %155 
                                                    OpStore %142 %156 
                                       f32 %157 = OpLoad %142 
                                       f32 %159 = OpFMul %157 %158 
                                       f32 %161 = OpFAdd %159 %160 
                                                    OpStore %142 %161 
                              Private f32* %162 = OpAccessChain %20 %143 
                                       f32 %163 = OpLoad %162 
                                       f32 %165 = OpFMul %163 %164 
                              Private f32* %167 = OpAccessChain %119 %166 
                                                    OpStore %167 %165 
                                     f32_3 %169 = OpLoad %108 
                                                    OpStore %168 %169 
                              Private f32* %171 = OpAccessChain %119 %166 
                                       f32 %172 = OpLoad %171 
                              Private f32* %173 = OpAccessChain %170 %166 
                                                    OpStore %173 %172 
                              Private f32* %174 = OpAccessChain %170 %143 
                                                    OpStore %174 %77 
                              Private f32* %175 = OpAccessChain %170 %117 
                                                    OpStore %175 %77 
                                                    OpBranch %176 
                                           %176 = OpLabel 
                                                    OpLoopMerge %178 %179 None 
                                                    OpBranch %180 
                                           %180 = OpLabel 
                                                    OpBranchConditional %181 %177 %178 
                                           %177 = OpLabel 
                                     f32_4 %183 = OpLoad %170 
                                     i32_4 %185 = OpBitcast %183 
                                       i32 %186 = OpCompositeExtract %185 2 
                                      bool %188 = OpSGreaterThanEqual %186 %187 
                                                    OpStore %182 %188 
                                      bool %189 = OpLoad %182 
                                                    OpSelectionMerge %191 None 
                                                    OpBranchConditional %189 %190 %191 
                                           %190 = OpLabel 
                                                    OpBranch %178 
                                           %191 = OpLabel 
                                     f32_3 %193 = OpLoad %168 
                                     f32_3 %194 = OpLoad %168 
                                       f32 %195 = OpDot %193 %194 
                              Private f32* %196 = OpAccessChain %170 %68 
                                                    OpStore %196 %195 
                                     f32_3 %198 = OpLoad %168 
                                     f32_3 %199 = OpExtInst %1 4 %198 
                                     f32_4 %200 = OpLoad %170 
                                     f32_3 %201 = OpVectorShuffle %200 %200 3 3 3 
                                     f32_3 %202 = OpFDiv %199 %201 
                                                    OpStore %197 %202 
                                     f32_3 %203 = OpLoad %197 
                                     f32_3 %208 = OpFAdd %203 %207 
                                                    OpStore %168 %208 
                                     f32_4 %209 = OpLoad %170 
                                     i32_4 %210 = OpBitcast %209 
                                       i32 %211 = OpCompositeExtract %210 2 
                                       f32 %212 = OpConvertSToF %211 
                              Private f32* %213 = OpAccessChain %197 %166 
                                                    OpStore %213 %212 
                              Private f32* %214 = OpAccessChain %197 %166 
                                       f32 %215 = OpLoad %214 
                                       f32 %217 = OpFMul %215 %216 
                              Private f32* %218 = OpAccessChain %197 %166 
                                                    OpStore %218 %217 
                              Private f32* %219 = OpAccessChain %197 %166 
                                       f32 %220 = OpLoad %219 
                                       f32 %221 = OpExtInst %1 29 %220 
                              Private f32* %222 = OpAccessChain %197 %166 
                                                    OpStore %222 %221 
                              Private f32* %224 = OpAccessChain %170 %143 
                                       f32 %225 = OpLoad %224 
                                       f32 %226 = OpFNegate %225 
                              Private f32* %227 = OpAccessChain %170 %68 
                                       f32 %228 = OpLoad %227 
                                       f32 %229 = OpFAdd %226 %228 
                                                    OpStore %223 %229 
                                       f32 %230 = OpLoad %223 
                                       f32 %231 = OpExtInst %1 4 %230 
                                       f32 %232 = OpExtInst %1 30 %231 
                                                    OpStore %223 %232 
                                       f32 %233 = OpLoad %223 
                                       f32 %235 = OpFMul %233 %234 
                                                    OpStore %223 %235 
                                       f32 %236 = OpLoad %223 
                                       f32 %237 = OpExtInst %1 29 %236 
                                                    OpStore %223 %237 
                                       f32 %238 = OpLoad %142 
                                       f32 %239 = OpFNegate %238 
                                       f32 %240 = OpLoad %223 
                                       f32 %241 = OpFMul %239 %240 
                                                    OpStore %223 %241 
                                       f32 %242 = OpLoad %223 
                                       f32 %244 = OpFMul %242 %243 
                                                    OpStore %223 %244 
                                       f32 %245 = OpLoad %223 
                                       f32 %246 = OpExtInst %1 29 %245 
                                                    OpStore %223 %246 
                              Private f32* %247 = OpAccessChain %197 %166 
                                       f32 %248 = OpLoad %247 
                                       f32 %249 = OpLoad %223 
                                       f32 %250 = OpFMul %248 %249 
                              Private f32* %251 = OpAccessChain %170 %166 
                                       f32 %252 = OpLoad %251 
                                       f32 %253 = OpFAdd %250 %252 
                              Private f32* %254 = OpAccessChain %170 %166 
                                                    OpStore %254 %253 
                                     f32_4 %255 = OpLoad %170 
                                     i32_4 %256 = OpBitcast %255 
                                       i32 %257 = OpCompositeExtract %256 2 
                                       i32 %258 = OpIAdd %257 %80 
                                       f32 %259 = OpBitcast %258 
                              Private f32* %260 = OpAccessChain %170 %117 
                                                    OpStore %260 %259 
                                     f32_4 %261 = OpLoad %170 
                                     f32_3 %262 = OpVectorShuffle %261 %261 0 3 2 
                                     f32_4 %263 = OpLoad %170 
                                     f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                    OpStore %170 %264 
                                                    OpBranch %179 
                                           %179 = OpLabel 
                                                    OpBranch %176 
                                           %178 = OpLabel 
                              Private f32* %266 = OpAccessChain %170 %166 
                                       f32 %267 = OpLoad %266 
                                       f32 %269 = OpFMul %267 %268 
                                       f32 %271 = OpFAdd %269 %270 
                                                    OpStore %265 %271 
                                       f32 %272 = OpLoad %265 
                                       f32 %273 = OpExtInst %1 40 %272 %77 
                                                    OpStore %265 %273 
                                     f32_2 %274 = OpLoad %89 
                                     f32_2 %275 = OpExtInst %1 4 %274 
                                     f32_2 %278 = OpFMul %275 %277 
                                     f32_2 %281 = OpFAdd %278 %280 
                                                    OpStore %89 %281 
                                     f32_2 %282 = OpLoad %89 
                                     f32_2 %285 = OpFMul %282 %284 
                                                    OpStore %89 %285 
                                     f32_2 %286 = OpLoad %89 
                                     f32_2 %287 = OpExtInst %1 29 %286 
                                                    OpStore %89 %287 
                                     f32_2 %288 = OpLoad %89 
                                     f32_2 %289 = OpFNegate %288 
                                     f32_2 %291 = OpFAdd %289 %290 
                                                    OpStore %89 %291 
                              Private f32* %292 = OpAccessChain %89 %143 
                                       f32 %293 = OpLoad %292 
                              Private f32* %294 = OpAccessChain %89 %166 
                                       f32 %295 = OpLoad %294 
                                       f32 %296 = OpFMul %293 %295 
                              Private f32* %297 = OpAccessChain %89 %166 
                                                    OpStore %297 %296 
                            Uniform f32_4* %298 = OpAccessChain %31 %33 
                                     f32_4 %299 = OpLoad %298 
                                     f32_4 %300 = OpVectorShuffle %299 %299 1 1 1 1 
                                     f32_4 %306 = OpFMul %300 %305 
                                                    OpStore %119 %306 
                                     f32_4 %307 = OpLoad %119 
                                     f32_4 %308 = OpVectorShuffle %307 %307 2 3 0 1 
                                     f32_4 %309 = OpExtInst %1 13 %308 
                                                    OpStore %119 %309 
                              Private f32* %311 = OpAccessChain %119 %117 
                                       f32 %312 = OpLoad %311 
                                       f32 %313 = OpFMul %312 %137 
                                       f32 %315 = OpFAdd %313 %314 
                              Private f32* %316 = OpAccessChain %310 %166 
                                                    OpStore %316 %315 
                              Private f32* %317 = OpAccessChain %119 %68 
                                       f32 %318 = OpLoad %317 
                                       f32 %320 = OpFMul %318 %319 
                              Private f32* %321 = OpAccessChain %310 %166 
                                       f32 %322 = OpLoad %321 
                                       f32 %323 = OpFAdd %320 %322 
                              Private f32* %324 = OpAccessChain %310 %166 
                                                    OpStore %324 %323 
                              Private f32* %325 = OpAccessChain %310 %166 
                                       f32 %326 = OpLoad %325 
                                       f32 %328 = OpFAdd %326 %327 
                              Private f32* %329 = OpAccessChain %310 %166 
                                                    OpStore %329 %328 
                                     f32_2 %330 = OpLoad %101 
                                     f32_3 %331 = OpLoad %310 
                                     f32_2 %332 = OpVectorShuffle %331 %331 0 0 
                                     f32_2 %333 = OpFDiv %330 %332 
                                     f32_3 %334 = OpLoad %310 
                                     f32_3 %335 = OpVectorShuffle %334 %333 3 4 2 
                                                    OpStore %310 %335 
                                     f32_3 %336 = OpLoad %310 
                                     f32_2 %337 = OpVectorShuffle %336 %336 0 1 
                                     f32_2 %339 = OpFAdd %337 %338 
                                     f32_4 %340 = OpLoad %170 
                                     f32_4 %341 = OpVectorShuffle %340 %339 4 5 2 3 
                                                    OpStore %170 %341 
                              Private f32* %342 = OpAccessChain %170 %117 
                                                    OpStore %342 %98 
                              Uniform f32* %343 = OpAccessChain %31 %33 %143 
                                       f32 %344 = OpLoad %343 
                                       f32 %346 = OpFMul %344 %345 
                              Private f32* %347 = OpAccessChain %310 %166 
                                                    OpStore %347 %346 
                              Private f32* %348 = OpAccessChain %310 %166 
                                       f32 %349 = OpLoad %348 
                                       f32 %350 = OpExtInst %1 13 %349 
                              Private f32* %351 = OpAccessChain %119 %117 
                                                    OpStore %351 %350 
                                     f32_4 %352 = OpLoad %119 
                                     f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                                     f32_3 %355 = OpFMul %353 %354 
                                     f32_4 %356 = OpLoad %170 
                                     f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                     f32_3 %358 = OpFAdd %355 %357 
                                                    OpStore %310 %358 
                                       f32 %359 = OpLoad %66 
                                       f32 %360 = OpExtInst %1 10 %359 
                                                    OpStore %66 %360 
                                       f32 %361 = OpLoad %66 
                                       f32 %362 = OpFAdd %361 %153 
                                                    OpStore %66 %362 
                                       f32 %363 = OpLoad %66 
                                       f32 %364 = OpExtInst %1 30 %363 
                                                    OpStore %66 %364 
                                       f32 %365 = OpLoad %66 
                                       f32 %366 = OpFMul %365 %158 
                                       f32 %367 = OpFAdd %366 %160 
                                                    OpStore %66 %367 
                                     f32_3 %368 = OpLoad %310 
                                     f32_4 %369 = OpLoad %119 
                                     f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                    OpStore %119 %370 
                                                    OpStore %142 %371 
                                                    OpStore %372 %77 
                                                    OpStore %374 %33 
                                                    OpBranch %375 
                                           %375 = OpLabel 
                                                    OpLoopMerge %377 %378 None 
                                                    OpBranch %379 
                                           %379 = OpLabel 
                                                    OpBranchConditional %181 %376 %377 
                                           %376 = OpLabel 
                                       i32 %381 = OpLoad %374 
                                      bool %383 = OpSGreaterThanEqual %381 %382 
                                                    OpStore %380 %383 
                                      bool %384 = OpLoad %380 
                                                    OpSelectionMerge %386 None 
                                                    OpBranchConditional %384 %385 %386 
                                           %385 = OpLabel 
                                                    OpBranch %377 
                                           %386 = OpLabel 
                                     f32_4 %389 = OpLoad %119 
                                     f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                     f32_4 %391 = OpLoad %119 
                                     f32_3 %392 = OpVectorShuffle %391 %391 0 1 2 
                                       f32 %393 = OpDot %390 %392 
                                                    OpStore %388 %393 
                                     f32_4 %394 = OpLoad %119 
                                     f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                                     f32_3 %396 = OpExtInst %1 4 %395 
                                       f32 %397 = OpLoad %388 
                                     f32_3 %398 = OpCompositeConstruct %397 %397 %397 
                                     f32_3 %399 = OpFDiv %396 %398 
                                                    OpStore %197 %399 
                                     f32_3 %400 = OpLoad %197 
                                     f32_3 %401 = OpFAdd %400 %207 
                                     f32_4 %402 = OpLoad %119 
                                     f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
                                                    OpStore %119 %403 
                                       i32 %405 = OpLoad %374 
                                       f32 %406 = OpConvertSToF %405 
                                                    OpStore %404 %406 
                                       f32 %407 = OpLoad %404 
                                       f32 %408 = OpFMul %407 %216 
                                                    OpStore %404 %408 
                                       f32 %409 = OpLoad %404 
                                       f32 %410 = OpExtInst %1 29 %409 
                                                    OpStore %404 %410 
                                       f32 %412 = OpLoad %372 
                                       f32 %413 = OpFNegate %412 
                                       f32 %414 = OpLoad %388 
                                       f32 %415 = OpFAdd %413 %414 
                                                    OpStore %411 %415 
                                       f32 %416 = OpLoad %411 
                                       f32 %417 = OpExtInst %1 4 %416 
                                       f32 %418 = OpExtInst %1 30 %417 
                                                    OpStore %411 %418 
                                       f32 %419 = OpLoad %411 
                                       f32 %421 = OpFMul %419 %420 
                                                    OpStore %411 %421 
                                       f32 %422 = OpLoad %411 
                                       f32 %423 = OpExtInst %1 29 %422 
                                                    OpStore %411 %423 
                                       f32 %424 = OpLoad %66 
                                       f32 %425 = OpFNegate %424 
                                       f32 %426 = OpLoad %411 
                                       f32 %427 = OpFMul %425 %426 
                                                    OpStore %411 %427 
                                       f32 %428 = OpLoad %411 
                                       f32 %429 = OpFMul %428 %243 
                                                    OpStore %411 %429 
                                       f32 %430 = OpLoad %411 
                                       f32 %431 = OpExtInst %1 29 %430 
                                                    OpStore %411 %431 
                                       f32 %432 = OpLoad %404 
                                       f32 %433 = OpLoad %411 
                                       f32 %434 = OpFMul %432 %433 
                                       f32 %435 = OpLoad %142 
                                       f32 %436 = OpFAdd %434 %435 
                                                    OpStore %142 %436 
                                       i32 %437 = OpLoad %374 
                                       i32 %438 = OpIAdd %437 %80 
                                                    OpStore %374 %438 
                                       f32 %439 = OpLoad %388 
                                                    OpStore %372 %439 
                                                    OpBranch %378 
                                           %378 = OpLabel 
                                                    OpBranch %375 
                                           %377 = OpLabel 
                                       f32 %440 = OpLoad %142 
                                       f32 %442 = OpFMul %440 %441 
                                       f32 %443 = OpFAdd %442 %270 
                                                    OpStore %66 %443 
                                       f32 %444 = OpLoad %66 
                                       f32 %445 = OpExtInst %1 40 %444 %77 
                                                    OpStore %66 %445 
                              Private f32* %446 = OpAccessChain %89 %166 
                                       f32 %447 = OpLoad %446 
                                       f32 %449 = OpFMul %447 %448 
                                       f32 %450 = OpFAdd %449 %327 
                              Private f32* %451 = OpAccessChain %310 %166 
                                                    OpStore %451 %450 
                                       f32 %452 = OpLoad %66 
                                       f32 %453 = OpLoad %66 
                                       f32 %454 = OpFMul %452 %453 
                              Private f32* %455 = OpAccessChain %101 %166 
                                                    OpStore %455 %454 
                                       f32 %456 = OpLoad %66 
                              Private f32* %457 = OpAccessChain %101 %166 
                                       f32 %458 = OpLoad %457 
                                       f32 %459 = OpFMul %456 %458 
                              Private f32* %460 = OpAccessChain %101 %143 
                                                    OpStore %460 %459 
                                     f32_3 %461 = OpLoad %310 
                                     f32_2 %462 = OpVectorShuffle %461 %461 0 0 
                                     f32_2 %463 = OpLoad %101 
                                     f32_2 %464 = OpVectorShuffle %463 %463 1 0 
                                     f32_2 %465 = OpFMul %462 %464 
                                     f32_4 %466 = OpLoad %119 
                                     f32_4 %467 = OpVectorShuffle %466 %465 4 5 2 3 
                                                    OpStore %119 %467 
                                       f32 %468 = OpLoad %66 
                              Private f32* %469 = OpAccessChain %310 %166 
                                       f32 %470 = OpLoad %469 
                                       f32 %471 = OpFMul %468 %470 
                              Private f32* %472 = OpAccessChain %119 %117 
                                                    OpStore %472 %471 
                                     f32_4 %473 = OpLoad %119 
                                     f32_3 %474 = OpVectorShuffle %473 %473 0 1 2 
                                     f32_3 %478 = OpFMul %474 %477 
                                                    OpStore %310 %478 
                                     f32_3 %479 = OpLoad %310 
                                     f32_3 %480 = OpExtInst %1 30 %479 
                                                    OpStore %310 %480 
                                     f32_3 %481 = OpLoad %310 
                                     f32_3 %484 = OpFMul %481 %483 
                                                    OpStore %310 %484 
                                     f32_3 %485 = OpLoad %310 
                                     f32_3 %486 = OpExtInst %1 29 %485 
                                                    OpStore %310 %486 
                                     f32_3 %487 = OpLoad %310 
                                     f32_3 %489 = OpFMul %487 %488 
                                                    OpStore %310 %489 
                                     f32_3 %490 = OpLoad %108 
                                     f32_2 %491 = OpVectorShuffle %490 %490 0 1 
                                     f32_2 %495 = OpFMul %491 %494 
                                     f32_3 %496 = OpLoad %108 
                                     f32_3 %497 = OpVectorShuffle %496 %495 3 4 2 
                                                    OpStore %108 %497 
                                     f32_3 %498 = OpLoad %108 
                                     f32_2 %499 = OpVectorShuffle %498 %498 0 1 
                                     f32_2 %500 = OpExtInst %1 8 %499 
                                     f32_3 %501 = OpLoad %108 
                                     f32_3 %502 = OpVectorShuffle %501 %500 3 4 2 
                                                    OpStore %108 %502 
                                     f32_3 %503 = OpLoad %108 
                                     f32_2 %504 = OpVectorShuffle %503 %503 0 0 
                                     f32_2 %508 = OpFMul %504 %507 
                                     f32_3 %509 = OpLoad %108 
                                     f32_2 %510 = OpVectorShuffle %509 %509 1 1 
                                     f32_2 %511 = OpFAdd %508 %510 
                                     f32_3 %512 = OpLoad %108 
                                     f32_3 %513 = OpVectorShuffle %512 %511 3 4 2 
                                                    OpStore %108 %513 
                              Private f32* %514 = OpAccessChain %108 %166 
                                       f32 %515 = OpLoad %514 
                                       f32 %516 = OpExtInst %1 14 %515 
                                                    OpStore %66 %516 
                                       f32 %517 = OpLoad %66 
                                       f32 %519 = OpFMul %517 %518 
                                                    OpStore %66 %519 
                                       f32 %520 = OpLoad %66 
                                       f32 %521 = OpExtInst %1 10 %520 
                                                    OpStore %66 %521 
                              Private f32* %522 = OpAccessChain %108 %143 
                                       f32 %523 = OpLoad %522 
                                       f32 %524 = OpExtInst %1 13 %523 
                              Private f32* %525 = OpAccessChain %108 %166 
                                                    OpStore %525 %524 
                              Private f32* %526 = OpAccessChain %108 %166 
                                       f32 %527 = OpLoad %526 
                                       f32 %529 = OpFMul %527 %528 
                              Private f32* %530 = OpAccessChain %108 %166 
                                                    OpStore %530 %529 
                              Private f32* %531 = OpAccessChain %108 %166 
                                       f32 %532 = OpLoad %531 
                                       f32 %533 = OpExtInst %1 10 %532 
                              Private f32* %534 = OpAccessChain %108 %166 
                                                    OpStore %534 %533 
                                       f32 %535 = OpLoad %66 
                                       f32 %536 = OpFNegate %535 
                              Private f32* %537 = OpAccessChain %108 %166 
                                       f32 %538 = OpLoad %537 
                                       f32 %539 = OpFAdd %536 %538 
                              Private f32* %540 = OpAccessChain %108 %166 
                                                    OpStore %540 %539 
                              Private f32* %541 = OpAccessChain %108 %166 
                                       f32 %542 = OpLoad %541 
                                       f32 %543 = OpFMul %542 %98 
                                       f32 %544 = OpLoad %66 
                                       f32 %545 = OpFAdd %543 %544 
                                                    OpStore %66 %545 
                                       f32 %546 = OpLoad %66 
                                       f32 %547 = OpExtInst %1 30 %546 
                                                    OpStore %66 %547 
                                       f32 %548 = OpLoad %66 
                                       f32 %549 = OpFMul %548 %25 
                                                    OpStore %66 %549 
                                       f32 %550 = OpLoad %66 
                                       f32 %551 = OpExtInst %1 29 %550 
                                                    OpStore %66 %551 
                                       f32 %552 = OpLoad %66 
                                       f32 %554 = OpFAdd %552 %553 
                                                    OpStore %66 %554 
                                       f32 %555 = OpLoad %66 
                                       f32 %556 = OpExtInst %1 43 %555 %77 %48 
                                                    OpStore %66 %556 
                                       f32 %557 = OpLoad %66 
                                       f32 %558 = OpExtInst %1 9 %557 
                                                    OpStore %66 %558 
                              Private f32* %559 = OpAccessChain %20 %68 
                                       f32 %560 = OpLoad %559 
                                       f32 %561 = OpFNegate %560 
                                       f32 %562 = OpFAdd %561 %48 
                              Private f32* %563 = OpAccessChain %108 %166 
                                                    OpStore %563 %562 
                              Private f32* %565 = OpAccessChain %89 %166 
                                       f32 %566 = OpLoad %565 
                              Private f32* %567 = OpAccessChain %108 %166 
                                       f32 %568 = OpLoad %567 
                                       f32 %569 = OpFMul %566 %568 
                              Private f32* %570 = OpAccessChain %20 %68 
                                       f32 %571 = OpLoad %570 
                                       f32 %572 = OpFAdd %569 %571 
                                                    OpStore %564 %572 
                                       f32 %573 = OpLoad %265 
                                       f32 %574 = OpLoad %265 
                                       f32 %575 = OpFMul %573 %574 
                              Private f32* %576 = OpAccessChain %89 %166 
                                                    OpStore %576 %575 
                                     f32_4 %577 = OpLoad %20 
                                     f32_2 %578 = OpVectorShuffle %577 %577 0 1 
                                     f32_2 %579 = OpLoad %89 
                                     f32_2 %580 = OpVectorShuffle %579 %579 0 0 
                                     f32_2 %581 = OpFMul %578 %580 
                                     f32_4 %582 = OpLoad %20 
                                     f32_4 %583 = OpVectorShuffle %582 %581 4 5 2 3 
                                                    OpStore %20 %583 
                                       f32 %584 = OpLoad %265 
                              Private f32* %585 = OpAccessChain %20 %143 
                                       f32 %586 = OpLoad %585 
                                       f32 %587 = OpFMul %584 %586 
                              Private f32* %588 = OpAccessChain %20 %143 
                                                    OpStore %588 %587 
                                       f32 %589 = OpLoad %564 
                                     f32_2 %590 = OpCompositeConstruct %589 %589 
                                     f32_4 %591 = OpLoad %20 
                                     f32_2 %592 = OpVectorShuffle %591 %591 1 0 
                                     f32_2 %593 = OpFMul %590 %592 
                                     f32_4 %594 = OpLoad %119 
                                     f32_4 %595 = OpVectorShuffle %594 %593 4 5 2 3 
                                                    OpStore %119 %595 
                              Private f32* %596 = OpAccessChain %20 %117 
                                       f32 %597 = OpLoad %596 
                                       f32 %598 = OpLoad %265 
                                       f32 %599 = OpFMul %597 %598 
                              Private f32* %600 = OpAccessChain %20 %166 
                                                    OpStore %600 %599 
                                       f32 %601 = OpLoad %564 
                              Private f32* %602 = OpAccessChain %20 %166 
                                       f32 %603 = OpLoad %602 
                                       f32 %604 = OpFMul %601 %603 
                              Private f32* %605 = OpAccessChain %119 %117 
                                                    OpStore %605 %604 
                                     f32_4 %606 = OpLoad %119 
                                     f32_3 %607 = OpVectorShuffle %606 %606 0 1 2 
                                     f32_3 %610 = OpFMul %607 %609 
                                     f32_3 %611 = OpLoad %310 
                                     f32_3 %612 = OpFAdd %610 %611 
                                     f32_4 %613 = OpLoad %20 
                                     f32_4 %614 = OpVectorShuffle %613 %612 4 5 6 3 
                                                    OpStore %20 %614 
                                       f32 %615 = OpLoad %66 
                                     f32_3 %616 = OpCompositeConstruct %615 %615 %615 
                                     f32_3 %619 = OpFMul %616 %618 
                                     f32_4 %620 = OpLoad %20 
                                     f32_3 %621 = OpVectorShuffle %620 %620 0 1 2 
                                     f32_3 %622 = OpFAdd %619 %621 
                                     f32_4 %623 = OpLoad %20 
                                     f32_4 %624 = OpVectorShuffle %623 %622 4 5 6 3 
                                                    OpStore %20 %624 
                                     f32_4 %626 = OpLoad %20 
                                     f32_3 %627 = OpVectorShuffle %626 %626 0 1 2 
                                     f32_3 %630 = OpFMul %627 %629 
                                     f32_4 %631 = OpLoad %625 
                                     f32_4 %632 = OpVectorShuffle %631 %630 4 5 6 3 
                                                    OpStore %625 %632 
                              Private f32* %633 = OpAccessChain %625 %68 
                                                    OpStore %633 %628 
                                     f32_4 %635 = OpLoad %9 
                                     f32_3 %636 = OpVectorShuffle %635 %635 0 1 2 
                                       f32 %641 = OpDot %636 %640 
                                                    OpStore %634 %641 
                                       f32 %642 = OpLoad %634 
                                       f32 %644 = OpFMul %642 %643 
                                       f32 %646 = OpFAdd %644 %645 
                                                    OpStore %634 %646 
                                     f32_4 %649 = OpLoad %625 
                                       f32 %650 = OpLoad %634 
                                     f32_4 %651 = OpCompositeConstruct %650 %650 %650 %650 
                                     f32_4 %652 = OpFMul %649 %651 
                                                    OpStore %648 %652 
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