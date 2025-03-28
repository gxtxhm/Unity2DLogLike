//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/PlayerShader" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_FlatColor ("Flat Color", Color) = (0.2,0.3,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_SpecialFlags ("Special Flags", Vector) = (0,0,0,0)
_StencilVal ("Stancil", Float) = 146
}
SubShader {
 LOD 110
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "UnlitTilted" = "UnlitTilted" }
  Cull Off
  Stencil {
   Comp NotEqual
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 43059
Program "vp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
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
out vec4 vs_TEXCOORD1;
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
    u_xlat1 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    vs_TEXCOORD1.y = u_xlat0.x;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xzw = in_POSITION0.xzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _OverrideColor;
uniform 	vec4 _FlatColor;
uniform 	vec4 _SpecialFlags;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat5;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.x = sin(_Time.z);
    u_xlat1.x = u_xlat1.x * 0.25 + 1.75;
    u_xlat1.xyz = u_xlat1.xxx * _FlatColor.xyz;
    u_xlat2.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = _OverrideColor.www * u_xlat2.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * 0.669999957 + 0.330000013;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat12) + (-u_xlat0.xyz);
    u_xlat0.xyz = _FlatColor.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1.x = max(u_xlat12, 0.300000012);
    u_xlat12 = u_xlat12 + (-u_xlat1.x);
    u_xlat5.x = dot(_FlatColor.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat12 = u_xlat5.x * u_xlat12 + u_xlat1.x;
    u_xlat12 = u_xlat12 * 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(3.0, 3.0, 3.0);
    u_xlat12 = min(vs_TEXCOORD1.y, 0.800000012);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _SpecialFlags.xyzx).xyz;
    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * 0.699999988;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat0.xyz = (u_xlatb2.y) ? vec3(u_xlat12) : u_xlat0.xyz;
    u_xlatb12 = u_xlat0.y>=u_xlat0.z;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = vec4(u_xlat12) * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb12 = u_xlat0.x>=u_xlat1.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat12) * u_xlat3 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat2.x = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat5.x = u_xlat5.x / u_xlat2.x;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat5.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat2.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat2.x;
    u_xlat12 = u_xlat12 * 0.5;
    u_xlat5.xyz = vec3(u_xlat12) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat5.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976) + vec3(0.0, 0.0, 0.300000012);
    SV_Target0.xyz = (u_xlatb2.z) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 140
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %67 %112 %121 %122 %126 %128 
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
                                                      OpDecorate %67 Location 67 
                                                      OpMemberDecorate %110 0 BuiltIn 110 
                                                      OpMemberDecorate %110 1 BuiltIn 110 
                                                      OpMemberDecorate %110 2 BuiltIn 110 
                                                      OpDecorate %110 Block 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate %128 Location 128 
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
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                              %66 = OpTypePointer Output %7 
                                Output f32_4* %67 = OpVariable Output 
                                              %70 = OpTypePointer Output %6 
                                             %109 = OpTypeArray %6 %47 
                                             %110 = OpTypeStruct %7 %6 %109 
                                             %111 = OpTypePointer Output %110 
        Output struct {f32_4; f32; f32[1];}* %112 = OpVariable Output 
                               Output f32_4* %121 = OpVariable Output 
                                Input f32_4* %122 = OpVariable Input 
                                             %124 = OpTypeVector %6 2 
                                             %125 = OpTypePointer Output %124 
                               Output f32_2* %126 = OpVariable Output 
                                             %127 = OpTypePointer Input %124 
                                Input f32_2* %128 = OpVariable Input 
                                             %130 = OpTypeVector %6 3 
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
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %16 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %57 %65 
                                 Private f32* %68 = OpAccessChain %9 %24 
                                          f32 %69 = OpLoad %68 
                                  Output f32* %71 = OpAccessChain %67 %47 
                                                      OpStore %71 %69 
                               Uniform f32_4* %72 = OpAccessChain %16 %60 %60 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %57 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                               Uniform f32_4* %79 = OpAccessChain %16 %60 %29 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %46 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %16 %60 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %86 %88 
                                                      OpStore %9 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %16 %61 %61 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %91 %93 
                                                      OpStore %57 %94 
                               Uniform f32_4* %95 = OpAccessChain %16 %61 %60 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %57 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %57 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %61 %29 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %9 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %57 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %57 %108 
                              Uniform f32_4* %113 = OpAccessChain %16 %61 %18 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 3 3 3 3 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %57 
                                       f32_4 %119 = OpFAdd %117 %118 
                               Output f32_4* %120 = OpAccessChain %112 %60 
                                                      OpStore %120 %119 
                                       f32_4 %123 = OpLoad %122 
                                                      OpStore %121 %123 
                                       f32_2 %129 = OpLoad %128 
                                                      OpStore %126 %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                                       f32_4 %133 = OpLoad %67 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 1 5 6 
                                                      OpStore %67 %134 
                                 Output f32* %135 = OpAccessChain %112 %60 %47 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFNegate %136 
                                 Output f32* %138 = OpAccessChain %112 %60 %47 
                                                      OpStore %138 %137 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 476
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %29 %106 %196 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %22 RelaxedPrecision 
                                                      OpDecorate %27 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 Location 29 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpMemberDecorate %57 0 Offset 57 
                                                      OpMemberDecorate %57 1 RelaxedPrecision 
                                                      OpMemberDecorate %57 1 Offset 57 
                                                      OpMemberDecorate %57 2 RelaxedPrecision 
                                                      OpMemberDecorate %57 2 Offset 57 
                                                      OpMemberDecorate %57 3 Offset 57 
                                                      OpDecorate %57 Block 
                                                      OpDecorate %59 DescriptorSet 59 
                                                      OpDecorate %59 Binding 59 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %94 RelaxedPrecision 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %98 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %100 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %106 Location 106 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %117 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %120 RelaxedPrecision 
                                                      OpDecorate %122 RelaxedPrecision 
                                                      OpDecorate %125 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate %135 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %196 Location 196 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
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
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Private %20 
                               Private f32_3* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                              %28 = OpTypePointer Input %7 
                                 Input f32_4* %29 = OpVariable Input 
                                              %30 = OpTypePointer Input %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                          u32 %36 = OpConstant 0 
                                              %38 = OpTypeBool 
                                              %39 = OpTypePointer Private %38 
                                Private bool* %40 = OpVariable Private 
                                          f32 %43 = OpConstant 3.67402E-40 
                                              %46 = OpTypeInt 32 1 
                                          i32 %47 = OpConstant 0 
                                          i32 %48 = OpConstant 1 
                                          i32 %50 = OpConstant -1 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeStruct %7 %7 %7 %7 
                                              %58 = OpTypePointer Uniform %57 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %59 = OpVariable Uniform 
                                          u32 %60 = OpConstant 2 
                                              %61 = OpTypePointer Uniform %6 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %70 = OpConstant 3.67402E-40 
                                          i32 %75 = OpConstant 2 
                                              %76 = OpTypePointer Uniform %7 
                               Private f32_4* %93 = OpVariable Private 
                                             %105 = OpTypePointer Output %7 
                               Output f32_4* %106 = OpVariable Output 
                                             %109 = OpTypePointer Output %6 
                                Private f32* %111 = OpVariable Private 
                                         f32 %113 = OpConstant 3.67402E-40 
                                         f32 %114 = OpConstant 3.67402E-40 
                                         f32 %115 = OpConstant 3.67402E-40 
                                       f32_3 %116 = OpConstantComposite %113 %114 %115 
                                         f32 %119 = OpConstant 3.67402E-40 
                                         f32 %121 = OpConstant 3.67402E-40 
                                Private f32* %147 = OpVariable Private 
                                         f32 %150 = OpConstant 3.67402E-40 
                                Private f32* %152 = OpVariable Private 
                                         f32 %176 = OpConstant 3.67402E-40 
                              Private f32_4* %181 = OpVariable Private 
                                       f32_3 %191 = OpConstantComposite %176 %176 %176 
                                Private f32* %195 = OpVariable Private 
                                Input f32_4* %196 = OpVariable Input 
                                         u32 %197 = OpConstant 1 
                                         f32 %200 = OpConstant 3.67402E-40 
                                             %211 = OpTypeVector %38 3 
                                             %212 = OpTypePointer Private %211 
                             Private bool_3* %213 = OpVariable Private 
                                         f32 %214 = OpConstant 3.67402E-40 
                                       f32_4 %215 = OpConstantComposite %214 %214 %214 %43 
                                         i32 %216 = OpConstant 3 
                                             %220 = OpTypeVector %38 4 
                                             %223 = OpTypePointer Function %20 
                                         f32 %238 = OpConstant 3.67402E-40 
                              Private f32_4* %253 = OpVariable Private 
                                             %258 = OpTypePointer Private %15 
                              Private f32_2* %259 = OpVariable Private 
                               Private bool* %266 = OpVariable Private 
                                Private f32* %272 = OpVariable Private 
                                             %273 = OpTypePointer Function %6 
                                         f32 %278 = OpConstant 3.67402E-40 
                                         f32 %291 = OpConstant 3.67402E-40 
                                         f32 %298 = OpConstant 3.67402E-40 
                                       f32_2 %299 = OpConstantComposite %291 %298 
                               Private bool* %321 = OpVariable Private 
                                Private f32* %327 = OpVariable Private 
                              Private f32_3* %356 = OpVariable Private 
                                         f32 %370 = OpConstant 3.67402E-40 
                                         f32 %372 = OpConstant 3.67402E-40 
                                         f32 %390 = OpConstant 3.67402E-40 
                                       f32_3 %391 = OpConstantComposite %278 %298 %390 
                                       f32_3 %402 = OpConstantComposite %370 %370 %370 
                                         f32 %404 = OpConstant 3.67402E-40 
                                       f32_3 %405 = OpConstantComposite %404 %404 %404 
                                       f32_3 %412 = OpConstantComposite %291 %291 %291 
                                       f32_3 %446 = OpConstantComposite %278 %278 %278 
                                         f32 %456 = OpConstant 3.67402E-40 
                                       f32_3 %457 = OpConstantComposite %456 %456 %456 
                                       f32_3 %459 = OpConstantComposite %43 %43 %150 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %224 = OpVariable Function 
                             Function f32_3* %243 = OpVariable Function 
                               Function f32* %274 = OpVariable Function 
                               Function f32* %328 = OpVariable Function 
                             Function f32_3* %463 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                   Input f32* %31 = OpAccessChain %29 %24 
                                          f32 %32 = OpLoad %31 
                                          f32 %33 = OpFMul %27 %32 
                                          f32 %35 = OpFAdd %33 %34 
                                 Private f32* %37 = OpAccessChain %22 %36 
                                                      OpStore %37 %35 
                                 Private f32* %41 = OpAccessChain %22 %36 
                                          f32 %42 = OpLoad %41 
                                         bool %44 = OpFOrdLessThan %42 %43 
                                                      OpStore %40 %44 
                                         bool %45 = OpLoad %40 
                                          i32 %49 = OpSelect %45 %48 %47 
                                          i32 %51 = OpIMul %49 %50 
                                         bool %52 = OpINotEqual %51 %47 
                                                      OpSelectionMerge %54 None 
                                                      OpBranchConditional %52 %53 %54 
                                              %53 = OpLabel 
                                                      OpKill
                                              %54 = OpLabel 
                                 Uniform f32* %62 = OpAccessChain %59 %47 %60 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpExtInst %1 13 %63 
                                 Private f32* %65 = OpAccessChain %56 %36 
                                                      OpStore %65 %64 
                                 Private f32* %66 = OpAccessChain %56 %36 
                                          f32 %67 = OpLoad %66 
                                          f32 %69 = OpFMul %67 %68 
                                          f32 %71 = OpFAdd %69 %70 
                                 Private f32* %72 = OpAccessChain %56 %36 
                                                      OpStore %72 %71 
                                        f32_4 %73 = OpLoad %56 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 0 0 
                               Uniform f32_4* %77 = OpAccessChain %59 %75 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                        f32_3 %80 = OpFMul %74 %79 
                                        f32_4 %81 = OpLoad %56 
                                        f32_4 %82 = OpVectorShuffle %81 %80 4 5 6 3 
                                                      OpStore %56 %82 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFNegate %84 
                                        f32_4 %86 = OpLoad %29 
                                        f32_3 %87 = OpVectorShuffle %86 %86 0 1 2 
                                        f32_3 %88 = OpFMul %85 %87 
                               Uniform f32_4* %89 = OpAccessChain %59 %48 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                        f32_3 %92 = OpFAdd %88 %91 
                                                      OpStore %22 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpLoad %29 
                                        f32_4 %96 = OpFMul %94 %95 
                                                      OpStore %93 %96 
                               Uniform f32_4* %97 = OpAccessChain %59 %48 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpLoad %22 
                                       f32_3 %101 = OpFMul %99 %100 
                                       f32_4 %102 = OpLoad %93 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %101 %103 
                                                      OpStore %22 %104 
                                Private f32* %107 = OpAccessChain %93 %24 
                                         f32 %108 = OpLoad %107 
                                 Output f32* %110 = OpAccessChain %106 %24 
                                                      OpStore %110 %108 
                                       f32_3 %112 = OpLoad %22 
                                         f32 %117 = OpDot %112 %116 
                                                      OpStore %111 %117 
                                         f32 %118 = OpLoad %111 
                                         f32 %120 = OpFMul %118 %119 
                                         f32 %122 = OpFAdd %120 %121 
                                                      OpStore %111 %122 
                                       f32_4 %123 = OpLoad %56 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpLoad %111 
                                       f32_3 %126 = OpCompositeConstruct %125 %125 %125 
                                       f32_3 %127 = OpFMul %124 %126 
                                       f32_3 %128 = OpLoad %22 
                                       f32_3 %129 = OpFNegate %128 
                                       f32_3 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %56 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 6 3 
                                                      OpStore %56 %132 
                              Uniform f32_4* %133 = OpAccessChain %59 %75 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 3 3 3 
                                       f32_4 %136 = OpLoad %56 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                                       f32_3 %138 = OpFMul %135 %137 
                                       f32_3 %139 = OpLoad %22 
                                       f32_3 %140 = OpFAdd %138 %139 
                                       f32_4 %141 = OpLoad %56 
                                       f32_4 %142 = OpVectorShuffle %141 %140 4 5 6 3 
                                                      OpStore %56 %142 
                                       f32_4 %143 = OpLoad %56 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %145 = OpDot %144 %116 
                                Private f32* %146 = OpAccessChain %22 %36 
                                                      OpStore %146 %145 
                                Private f32* %148 = OpAccessChain %22 %36 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpExtInst %1 40 %149 %150 
                                                      OpStore %147 %151 
                                Private f32* %153 = OpAccessChain %22 %36 
                                         f32 %154 = OpLoad %153 
                                         f32 %155 = OpLoad %147 
                                         f32 %156 = OpFNegate %155 
                                         f32 %157 = OpFAdd %154 %156 
                                                      OpStore %152 %157 
                              Uniform f32_4* %158 = OpAccessChain %59 %75 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %160 %116 
                                Private f32* %162 = OpAccessChain %22 %36 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %22 %36 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %22 %36 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFAdd %164 %166 
                                Private f32* %168 = OpAccessChain %22 %36 
                                                      OpStore %168 %167 
                                Private f32* %169 = OpAccessChain %22 %36 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpLoad %152 
                                         f32 %172 = OpFMul %170 %171 
                                         f32 %173 = OpLoad %147 
                                         f32 %174 = OpFAdd %172 %173 
                                                      OpStore %147 %174 
                                         f32 %175 = OpLoad %147 
                                         f32 %177 = OpFMul %175 %176 
                                                      OpStore %147 %177 
                                         f32 %178 = OpLoad %147 
                                         f32 %179 = OpLoad %147 
                                         f32 %180 = OpFMul %178 %179 
                                                      OpStore %147 %180 
                                         f32 %182 = OpLoad %147 
                                       f32_3 %183 = OpCompositeConstruct %182 %182 %182 
                                       f32_4 %184 = OpLoad %56 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                       f32_3 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %181 
                                       f32_4 %188 = OpVectorShuffle %187 %186 4 5 6 3 
                                                      OpStore %181 %188 
                                       f32_4 %189 = OpLoad %181 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %192 = OpFMul %190 %191 
                                       f32_4 %193 = OpLoad %181 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 6 3 
                                                      OpStore %181 %194 
                                  Input f32* %198 = OpAccessChain %196 %197 
                                         f32 %199 = OpLoad %198 
                                         f32 %201 = OpExtInst %1 37 %199 %200 
                                                      OpStore %195 %201 
                                         f32 %202 = OpLoad %195 
                                         f32 %203 = OpExtInst %1 40 %202 %43 
                                                      OpStore %195 %203 
                                         f32 %204 = OpLoad %195 
                                       f32_3 %205 = OpCompositeConstruct %204 %204 %204 
                                       f32_4 %206 = OpLoad %181 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %181 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %181 %210 
                              Uniform f32_4* %217 = OpAccessChain %59 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpVectorShuffle %218 %218 0 1 2 0 
                                      bool_4 %221 = OpFOrdLessThan %215 %219 
                                      bool_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                                      OpStore %213 %222 
                                      bool_3 %225 = OpLoad %213 
                                        bool %226 = OpCompositeExtract %225 0 
                                                      OpSelectionMerge %228 None 
                                                      OpBranchConditional %226 %227 %231 
                                             %227 = OpLabel 
                                       f32_4 %229 = OpLoad %181 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                                      OpStore %224 %230 
                                                      OpBranch %228 
                                             %231 = OpLabel 
                                       f32_4 %232 = OpLoad %56 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                                      OpStore %224 %233 
                                                      OpBranch %228 
                                             %228 = OpLabel 
                                       f32_3 %234 = OpLoad %224 
                                                      OpStore %22 %234 
                                       f32_3 %235 = OpLoad %22 
                                         f32 %236 = OpDot %235 %116 
                                                      OpStore %111 %236 
                                         f32 %237 = OpLoad %111 
                                         f32 %239 = OpFMul %237 %238 
                                                      OpStore %111 %239 
                                         f32 %240 = OpLoad %111 
                                         f32 %241 = OpLoad %111 
                                         f32 %242 = OpFMul %240 %241 
                                                      OpStore %111 %242 
                                      bool_3 %244 = OpLoad %213 
                                        bool %245 = OpCompositeExtract %244 1 
                                                      OpSelectionMerge %247 None 
                                                      OpBranchConditional %245 %246 %250 
                                             %246 = OpLabel 
                                         f32 %248 = OpLoad %111 
                                       f32_3 %249 = OpCompositeConstruct %248 %248 %248 
                                                      OpStore %243 %249 
                                                      OpBranch %247 
                                             %250 = OpLabel 
                                       f32_3 %251 = OpLoad %22 
                                                      OpStore %243 %251 
                                                      OpBranch %247 
                                             %247 = OpLabel 
                                       f32_3 %252 = OpLoad %243 
                                                      OpStore %22 %252 
                                Private f32* %254 = OpAccessChain %22 %36 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFNegate %255 
                                Private f32* %257 = OpAccessChain %253 %24 
                                                      OpStore %257 %256 
                                       f32_3 %260 = OpLoad %22 
                                       f32_2 %261 = OpVectorShuffle %260 %260 2 1 
                                       f32_2 %262 = OpFNegate %261 
                                       f32_3 %263 = OpLoad %22 
                                       f32_2 %264 = OpVectorShuffle %263 %263 1 2 
                                       f32_2 %265 = OpFAdd %262 %264 
                                                      OpStore %259 %265 
                                Private f32* %267 = OpAccessChain %22 %197 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %22 %60 
                                         f32 %270 = OpLoad %269 
                                        bool %271 = OpFOrdGreaterThanEqual %268 %270 
                                                      OpStore %266 %271 
                                        bool %275 = OpLoad %266 
                                                      OpSelectionMerge %277 None 
                                                      OpBranchConditional %275 %276 %279 
                                             %276 = OpLabel 
                                                      OpStore %274 %278 
                                                      OpBranch %277 
                                             %279 = OpLabel 
                                                      OpStore %274 %43 
                                                      OpBranch %277 
                                             %277 = OpLabel 
                                         f32 %280 = OpLoad %274 
                                                      OpStore %272 %280 
                                         f32 %281 = OpLoad %272 
                                       f32_2 %282 = OpCompositeConstruct %281 %281 
                                       f32_2 %283 = OpLoad %259 
                                       f32_2 %284 = OpFMul %282 %283 
                                       f32_3 %285 = OpLoad %22 
                                       f32_2 %286 = OpVectorShuffle %285 %285 2 1 
                                       f32_2 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %181 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 2 3 
                                                      OpStore %181 %289 
                                Private f32* %290 = OpAccessChain %56 %36 
                                                      OpStore %290 %278 
                                Private f32* %292 = OpAccessChain %56 %197 
                                                      OpStore %292 %291 
                                         f32 %293 = OpLoad %272 
                                       f32_2 %294 = OpCompositeConstruct %293 %293 
                                       f32_4 %295 = OpLoad %56 
                                       f32_2 %296 = OpVectorShuffle %295 %295 0 1 
                                       f32_2 %297 = OpFMul %294 %296 
                                       f32_2 %300 = OpFAdd %297 %299 
                                       f32_4 %301 = OpLoad %181 
                                       f32_4 %302 = OpVectorShuffle %301 %300 0 1 4 5 
                                                      OpStore %181 %302 
                                       f32_4 %303 = OpLoad %181 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 1 3 
                                       f32_3 %305 = OpFNegate %304 
                                       f32_4 %306 = OpLoad %253 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 6 3 
                                                      OpStore %253 %307 
                                       f32_4 %308 = OpLoad %253 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 2 3 
                                       f32_4 %310 = OpLoad %181 
                                       f32_3 %311 = OpVectorShuffle %310 %310 1 2 0 
                                       f32_3 %312 = OpFAdd %309 %311 
                                       f32_4 %313 = OpLoad %56 
                                       f32_4 %314 = OpVectorShuffle %313 %312 0 4 5 6 
                                                      OpStore %56 %314 
                                Private f32* %315 = OpAccessChain %253 %36 
                                         f32 %316 = OpLoad %315 
                                Private f32* %317 = OpAccessChain %22 %36 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpFAdd %316 %318 
                                Private f32* %320 = OpAccessChain %56 %36 
                                                      OpStore %320 %319 
                                Private f32* %322 = OpAccessChain %22 %36 
                                         f32 %323 = OpLoad %322 
                                Private f32* %324 = OpAccessChain %181 %36 
                                         f32 %325 = OpLoad %324 
                                        bool %326 = OpFOrdGreaterThanEqual %323 %325 
                                                      OpStore %321 %326 
                                        bool %329 = OpLoad %321 
                                                      OpSelectionMerge %331 None 
                                                      OpBranchConditional %329 %330 %332 
                                             %330 = OpLabel 
                                                      OpStore %328 %278 
                                                      OpBranch %331 
                                             %332 = OpLabel 
                                                      OpStore %328 %43 
                                                      OpBranch %331 
                                             %331 = OpLabel 
                                         f32 %333 = OpLoad %328 
                                                      OpStore %327 %333 
                                         f32 %334 = OpLoad %327 
                                Private f32* %335 = OpAccessChain %56 %24 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFMul %334 %336 
                                Private f32* %338 = OpAccessChain %22 %36 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %195 %340 
                                         f32 %341 = OpLoad %327 
                                       f32_3 %342 = OpCompositeConstruct %341 %341 %341 
                                       f32_4 %343 = OpLoad %56 
                                       f32_3 %344 = OpVectorShuffle %343 %343 0 1 2 
                                       f32_3 %345 = OpFMul %342 %344 
                                       f32_4 %346 = OpLoad %181 
                                       f32_3 %347 = OpVectorShuffle %346 %346 0 1 3 
                                       f32_3 %348 = OpFAdd %345 %347 
                                       f32_4 %349 = OpLoad %56 
                                       f32_4 %350 = OpVectorShuffle %349 %348 4 5 6 3 
                                                      OpStore %56 %350 
                                Private f32* %351 = OpAccessChain %56 %197 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpLoad %195 
                                         f32 %354 = OpExtInst %1 37 %352 %353 
                                Private f32* %355 = OpAccessChain %181 %36 
                                                      OpStore %355 %354 
                                Private f32* %357 = OpAccessChain %56 %197 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFNegate %358 
                                         f32 %360 = OpLoad %195 
                                         f32 %361 = OpFAdd %359 %360 
                                Private f32* %362 = OpAccessChain %356 %36 
                                                      OpStore %362 %361 
                                Private f32* %363 = OpAccessChain %56 %36 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %181 %36 
                                         f32 %366 = OpLoad %365 
                                         f32 %367 = OpFNegate %366 
                                         f32 %368 = OpFAdd %364 %367 
                                                      OpStore %195 %368 
                                         f32 %369 = OpLoad %195 
                                         f32 %371 = OpFMul %369 %370 
                                         f32 %373 = OpFAdd %371 %372 
                                Private f32* %374 = OpAccessChain %181 %36 
                                                      OpStore %374 %373 
                                Private f32* %375 = OpAccessChain %356 %36 
                                         f32 %376 = OpLoad %375 
                                Private f32* %377 = OpAccessChain %181 %36 
                                         f32 %378 = OpLoad %377 
                                         f32 %379 = OpFDiv %376 %378 
                                Private f32* %380 = OpAccessChain %356 %36 
                                                      OpStore %380 %379 
                                Private f32* %381 = OpAccessChain %356 %36 
                                         f32 %382 = OpLoad %381 
                                Private f32* %383 = OpAccessChain %56 %60 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFAdd %382 %384 
                                Private f32* %386 = OpAccessChain %356 %36 
                                                      OpStore %386 %385 
                                       f32_3 %387 = OpLoad %356 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 0 0 
                                       f32_3 %389 = OpExtInst %1 4 %388 
                                       f32_3 %392 = OpFAdd %389 %391 
                                       f32_4 %393 = OpLoad %181 
                                       f32_4 %394 = OpVectorShuffle %393 %392 4 5 6 3 
                                                      OpStore %181 %394 
                                       f32_4 %395 = OpLoad %181 
                                       f32_3 %396 = OpVectorShuffle %395 %395 0 1 2 
                                       f32_3 %397 = OpExtInst %1 10 %396 
                                       f32_4 %398 = OpLoad %181 
                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                      OpStore %181 %399 
                                       f32_4 %400 = OpLoad %181 
                                       f32_3 %401 = OpVectorShuffle %400 %400 0 1 2 
                                       f32_3 %403 = OpFMul %401 %402 
                                       f32_3 %406 = OpFAdd %403 %405 
                                       f32_4 %407 = OpLoad %181 
                                       f32_4 %408 = OpVectorShuffle %407 %406 4 5 6 3 
                                                      OpStore %181 %408 
                                       f32_4 %409 = OpLoad %181 
                                       f32_3 %410 = OpVectorShuffle %409 %409 0 1 2 
                                       f32_3 %411 = OpExtInst %1 4 %410 
                                       f32_3 %413 = OpFAdd %411 %412 
                                       f32_4 %414 = OpLoad %181 
                                       f32_4 %415 = OpVectorShuffle %414 %413 4 5 6 3 
                                                      OpStore %181 %415 
                                       f32_4 %416 = OpLoad %181 
                                       f32_3 %417 = OpVectorShuffle %416 %416 0 1 2 
                                       f32_3 %418 = OpCompositeConstruct %43 %43 %43 
                                       f32_3 %419 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %420 = OpExtInst %1 43 %417 %418 %419 
                                       f32_4 %421 = OpLoad %181 
                                       f32_4 %422 = OpVectorShuffle %421 %420 4 5 6 3 
                                                      OpStore %181 %422 
                                       f32_4 %423 = OpLoad %181 
                                       f32_3 %424 = OpVectorShuffle %423 %423 0 1 2 
                                       f32_3 %425 = OpFAdd %424 %412 
                                       f32_4 %426 = OpLoad %181 
                                       f32_4 %427 = OpVectorShuffle %426 %425 4 5 6 3 
                                                      OpStore %181 %427 
                                Private f32* %428 = OpAccessChain %56 %36 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %429 %372 
                                Private f32* %431 = OpAccessChain %356 %36 
                                                      OpStore %431 %430 
                                         f32 %432 = OpLoad %195 
                                Private f32* %433 = OpAccessChain %356 %36 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFDiv %432 %434 
                                Private f32* %436 = OpAccessChain %356 %36 
                                                      OpStore %436 %435 
                                Private f32* %437 = OpAccessChain %356 %36 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFMul %438 %214 
                                Private f32* %440 = OpAccessChain %356 %36 
                                                      OpStore %440 %439 
                                       f32_3 %441 = OpLoad %356 
                                       f32_3 %442 = OpVectorShuffle %441 %441 0 0 0 
                                       f32_4 %443 = OpLoad %181 
                                       f32_3 %444 = OpVectorShuffle %443 %443 0 1 2 
                                       f32_3 %445 = OpFMul %442 %444 
                                       f32_3 %447 = OpFAdd %445 %446 
                                                      OpStore %356 %447 
                                       f32_3 %448 = OpLoad %356 
                                       f32_4 %449 = OpLoad %56 
                                       f32_3 %450 = OpVectorShuffle %449 %449 0 0 0 
                                       f32_3 %451 = OpFMul %448 %450 
                                       f32_4 %452 = OpLoad %56 
                                       f32_4 %453 = OpVectorShuffle %452 %451 4 5 6 3 
                                                      OpStore %56 %453 
                                       f32_4 %454 = OpLoad %56 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_3 %458 = OpFMul %455 %457 
                                       f32_3 %460 = OpFAdd %458 %459 
                                       f32_4 %461 = OpLoad %56 
                                       f32_4 %462 = OpVectorShuffle %461 %460 4 5 6 3 
                                                      OpStore %56 %462 
                                      bool_3 %464 = OpLoad %213 
                                        bool %465 = OpCompositeExtract %464 2 
                                                      OpSelectionMerge %467 None 
                                                      OpBranchConditional %465 %466 %470 
                                             %466 = OpLabel 
                                       f32_4 %468 = OpLoad %56 
                                       f32_3 %469 = OpVectorShuffle %468 %468 0 1 2 
                                                      OpStore %463 %469 
                                                      OpBranch %467 
                                             %470 = OpLabel 
                                       f32_3 %471 = OpLoad %22 
                                                      OpStore %463 %471 
                                                      OpBranch %467 
                                             %467 = OpLabel 
                                       f32_3 %472 = OpLoad %463 
                                       f32_4 %473 = OpLoad %106 
                                       f32_4 %474 = OpVectorShuffle %473 %472 4 5 6 3 
                                                      OpStore %106 %474 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
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
out vec4 vs_TEXCOORD1;
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
    u_xlat1 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    vs_TEXCOORD1.y = u_xlat0.x;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xzw = in_POSITION0.xzw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _OverrideColor;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat6;
vec2 u_xlat16_6;
float u_xlat11;
bool u_xlatb11;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlatb1 = u_xlat10_0.y>=u_xlat10_0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat16_6.xy = (-u_xlat10_0.zy) + u_xlat10_0.yz;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_6.xy + u_xlat10_0.zy;
    u_xlatb16 = u_xlat10_0.x>=u_xlat1.x;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat1.z = u_xlat10_0.x;
    u_xlat2.xyz = (-u_xlat1.xyz) + u_xlat1.zyx;
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat6 = min(u_xlat1.y, u_xlat1.z);
    u_xlat6 = (-u_xlat6) + u_xlat1.x;
    u_xlat11 = u_xlat1.x + 1.00000001e-010;
    u_xlat6 = u_xlat6 / u_xlat11;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat4.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat4.xyw = _OverrideColor.www * u_xlat4.yzx + u_xlat0.yzx;
    SV_Target0.w = u_xlat0.w;
    u_xlatb0 = u_xlat4.x>=u_xlat4.y;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat4.yx;
    u_xlat3.xy = (-u_xlat2.xy) + u_xlat4.xy;
    u_xlat0 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlatb11 = u_xlat4.w>=u_xlat0.x;
    u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat4.wyx;
    u_xlat0 = (-u_xlat4) + u_xlat0;
    u_xlat0 = vec4(u_xlat11) * u_xlat0 + u_xlat4;
    u_xlat11 = min(u_xlat0.y, u_xlat0.w);
    u_xlat0.x = u_xlat0.x + (-u_xlat11);
    u_xlat0.x = u_xlat0.x * 6.0 + 1.00000001e-010;
    u_xlat5 = (-u_xlat0.y) + u_xlat0.w;
    u_xlat0.x = u_xlat5 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + u_xlat0.z;
    u_xlat0.xyz = abs(u_xlat0.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat0.xyz = abs(u_xlat0.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 140
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %46 %67 %112 %121 %122 %126 %128 
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
                                                      OpDecorate %67 Location 67 
                                                      OpMemberDecorate %110 0 BuiltIn 110 
                                                      OpMemberDecorate %110 1 BuiltIn 110 
                                                      OpMemberDecorate %110 2 BuiltIn 110 
                                                      OpDecorate %110 Block 
                                                      OpDecorate %121 RelaxedPrecision 
                                                      OpDecorate %121 Location 121 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate %128 Location 128 
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
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %60 = OpConstant 0 
                                          i32 %61 = OpConstant 1 
                                              %62 = OpTypePointer Uniform %7 
                                              %66 = OpTypePointer Output %7 
                                Output f32_4* %67 = OpVariable Output 
                                              %70 = OpTypePointer Output %6 
                                             %109 = OpTypeArray %6 %47 
                                             %110 = OpTypeStruct %7 %6 %109 
                                             %111 = OpTypePointer Output %110 
        Output struct {f32_4; f32; f32[1];}* %112 = OpVariable Output 
                               Output f32_4* %121 = OpVariable Output 
                                Input f32_4* %122 = OpVariable Input 
                                             %124 = OpTypeVector %6 2 
                                             %125 = OpTypePointer Output %124 
                               Output f32_2* %126 = OpVariable Output 
                                             %127 = OpTypePointer Input %124 
                                Input f32_2* %128 = OpVariable Input 
                                             %130 = OpTypeVector %6 3 
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
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                               Uniform f32_4* %63 = OpAccessChain %16 %60 %61 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpFMul %59 %64 
                                                      OpStore %57 %65 
                                 Private f32* %68 = OpAccessChain %9 %24 
                                          f32 %69 = OpLoad %68 
                                  Output f32* %71 = OpAccessChain %67 %47 
                                                      OpStore %71 %69 
                               Uniform f32_4* %72 = OpAccessChain %16 %60 %60 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %57 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                               Uniform f32_4* %79 = OpAccessChain %16 %60 %29 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %46 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                               Uniform f32_4* %87 = OpAccessChain %16 %60 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFAdd %86 %88 
                                                      OpStore %9 %89 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %16 %61 %61 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %91 %93 
                                                      OpStore %57 %94 
                               Uniform f32_4* %95 = OpAccessChain %16 %61 %60 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %57 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %57 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %61 %29 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %9 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %57 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %57 %108 
                              Uniform f32_4* %113 = OpAccessChain %16 %61 %18 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 3 3 3 3 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %57 
                                       f32_4 %119 = OpFAdd %117 %118 
                               Output f32_4* %120 = OpAccessChain %112 %60 
                                                      OpStore %120 %119 
                                       f32_4 %123 = OpLoad %122 
                                                      OpStore %121 %123 
                                       f32_2 %129 = OpLoad %128 
                                                      OpStore %126 %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                                       f32_4 %133 = OpLoad %67 
                                       f32_4 %134 = OpVectorShuffle %133 %132 4 1 5 6 
                                                      OpStore %67 %134 
                                 Output f32* %135 = OpAccessChain %112 %60 %47 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFNegate %136 
                                 Output f32* %138 = OpAccessChain %112 %60 %47 
                                                      OpStore %138 %137 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 351
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %29 %172 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %27 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %29 Location 29 
                                                    OpDecorate %32 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %42 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %74 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %76 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %79 RelaxedPrecision 
                                                    OpDecorate %80 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %85 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %146 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %148 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %150 RelaxedPrecision 
                                                    OpMemberDecorate %151 0 RelaxedPrecision 
                                                    OpMemberDecorate %151 0 Offset 151 
                                                    OpDecorate %151 Block 
                                                    OpDecorate %153 DescriptorSet 153 
                                                    OpDecorate %153 Binding 153 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %158 RelaxedPrecision 
                                                    OpDecorate %159 RelaxedPrecision 
                                                    OpDecorate %160 RelaxedPrecision 
                                                    OpDecorate %161 RelaxedPrecision 
                                                    OpDecorate %162 RelaxedPrecision 
                                                    OpDecorate %164 RelaxedPrecision 
                                                    OpDecorate %165 RelaxedPrecision 
                                                    OpDecorate %166 RelaxedPrecision 
                                                    OpDecorate %167 RelaxedPrecision 
                                                    OpDecorate %168 RelaxedPrecision 
                                                    OpDecorate %169 RelaxedPrecision 
                                                    OpDecorate %170 RelaxedPrecision 
                                                    OpDecorate %172 RelaxedPrecision 
                                                    OpDecorate %172 Location 172 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %179 RelaxedPrecision 
                                                    OpDecorate %181 RelaxedPrecision 
                                                    OpDecorate %189 RelaxedPrecision 
                                                    OpDecorate %190 RelaxedPrecision 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %192 RelaxedPrecision 
                                                    OpDecorate %193 RelaxedPrecision 
                                                    OpDecorate %194 RelaxedPrecision 
                                                    OpDecorate %195 RelaxedPrecision 
                                                    OpDecorate %198 RelaxedPrecision 
                                                    OpDecorate %199 RelaxedPrecision 
                                                    OpDecorate %200 RelaxedPrecision 
                                                    OpDecorate %201 RelaxedPrecision 
                                                    OpDecorate %202 RelaxedPrecision 
                                                    OpDecorate %203 RelaxedPrecision 
                                                    OpDecorate %225 RelaxedPrecision 
                                                    OpDecorate %226 RelaxedPrecision 
                                                    OpDecorate %237 RelaxedPrecision 
                                                    OpDecorate %243 RelaxedPrecision 
                                                    OpDecorate %268 RelaxedPrecision 
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
                                            %20 = OpTypeVector %6 3 
                                            %21 = OpTypePointer Private %20 
                             Private f32_3* %22 = OpVariable Private 
                                            %23 = OpTypeInt 32 0 
                                        u32 %24 = OpConstant 3 
                                            %25 = OpTypePointer Private %6 
                                            %28 = OpTypePointer Input %7 
                               Input f32_4* %29 = OpVariable Input 
                                            %30 = OpTypePointer Input %6 
                                        f32 %34 = OpConstant 3.67402E-40 
                                        u32 %36 = OpConstant 0 
                                            %38 = OpTypeBool 
                                            %39 = OpTypePointer Private %38 
                              Private bool* %40 = OpVariable Private 
                                        f32 %43 = OpConstant 3.67402E-40 
                                            %46 = OpTypeInt 32 1 
                                        i32 %47 = OpConstant 0 
                                        i32 %48 = OpConstant 1 
                                        i32 %50 = OpConstant -1 
                                        u32 %56 = OpConstant 1 
                                        u32 %59 = OpConstant 2 
                             Private f32_3* %63 = OpVariable Private 
                                            %64 = OpTypePointer Function %6 
                                        f32 %69 = OpConstant 3.67402E-40 
                                            %73 = OpTypePointer Private %15 
                             Private f32_2* %74 = OpVariable Private 
                              Private bool* %90 = OpVariable Private 
                               Private f32* %96 = OpVariable Private 
                            Private f32_4* %106 = OpVariable Private 
                            Private f32_3* %121 = OpVariable Private 
                              Private f32* %135 = OpVariable Private 
                                       f32 %138 = OpConstant 3.67402E-40 
                                           %151 = OpTypeStruct %7 
                                           %152 = OpTypePointer Uniform %151 
                  Uniform struct {f32_4;}* %153 = OpVariable Uniform 
                                           %154 = OpTypePointer Uniform %7 
                            Private f32_4* %159 = OpVariable Private 
                                           %171 = OpTypePointer Output %7 
                             Output f32_4* %172 = OpVariable Output 
                                           %175 = OpTypePointer Output %6 
                             Private bool* %177 = OpVariable Private 
                            Private f32_2* %189 = OpVariable Private 
                            Private f32_4* %196 = OpVariable Private 
                                       f32 %207 = OpConstant 3.67402E-40 
                                       f32 %214 = OpConstant 3.67402E-40 
                                     f32_2 %215 = OpConstantComposite %207 %214 
                            Private f32_4* %228 = OpVariable Private 
                                       f32 %285 = OpConstant 3.67402E-40 
                                       f32 %298 = OpConstant 3.67402E-40 
                                     f32_3 %299 = OpConstantComposite %69 %214 %298 
                                     f32_3 %310 = OpConstantComposite %285 %285 %285 
                                       f32 %312 = OpConstant 3.67402E-40 
                                     f32_3 %313 = OpConstantComposite %312 %312 %312 
                                     f32_3 %320 = OpConstantComposite %207 %207 %207 
                                     f32_3 %341 = OpConstantComposite %69 %69 %69 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %65 = OpVariable Function 
                              Function f32* %97 = OpVariable Function 
                             Function f32* %183 = OpVariable Function 
                             Function f32* %247 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                               Private f32* %26 = OpAccessChain %9 %24 
                                        f32 %27 = OpLoad %26 
                                 Input f32* %31 = OpAccessChain %29 %24 
                                        f32 %32 = OpLoad %31 
                                        f32 %33 = OpFMul %27 %32 
                                        f32 %35 = OpFAdd %33 %34 
                               Private f32* %37 = OpAccessChain %22 %36 
                                                    OpStore %37 %35 
                               Private f32* %41 = OpAccessChain %22 %36 
                                        f32 %42 = OpLoad %41 
                                       bool %44 = OpFOrdLessThan %42 %43 
                                                    OpStore %40 %44 
                                       bool %45 = OpLoad %40 
                                        i32 %49 = OpSelect %45 %48 %47 
                                        i32 %51 = OpIMul %49 %50 
                                       bool %52 = OpINotEqual %51 %47 
                                                    OpSelectionMerge %54 None 
                                                    OpBranchConditional %52 %53 %54 
                                            %53 = OpLabel 
                                                    OpKill
                                            %54 = OpLabel 
                               Private f32* %57 = OpAccessChain %9 %56 
                                        f32 %58 = OpLoad %57 
                               Private f32* %60 = OpAccessChain %9 %59 
                                        f32 %61 = OpLoad %60 
                                       bool %62 = OpFOrdGreaterThanEqual %58 %61 
                                                    OpStore %40 %62 
                                       bool %66 = OpLoad %40 
                                                    OpSelectionMerge %68 None 
                                                    OpBranchConditional %66 %67 %70 
                                            %67 = OpLabel 
                                                    OpStore %65 %69 
                                                    OpBranch %68 
                                            %70 = OpLabel 
                                                    OpStore %65 %43 
                                                    OpBranch %68 
                                            %68 = OpLabel 
                                        f32 %71 = OpLoad %65 
                               Private f32* %72 = OpAccessChain %63 %36 
                                                    OpStore %72 %71 
                                      f32_4 %75 = OpLoad %9 
                                      f32_2 %76 = OpVectorShuffle %75 %75 2 1 
                                      f32_2 %77 = OpFNegate %76 
                                      f32_4 %78 = OpLoad %9 
                                      f32_2 %79 = OpVectorShuffle %78 %78 1 2 
                                      f32_2 %80 = OpFAdd %77 %79 
                                                    OpStore %74 %80 
                                      f32_3 %81 = OpLoad %63 
                                      f32_2 %82 = OpVectorShuffle %81 %81 0 0 
                                      f32_2 %83 = OpLoad %74 
                                      f32_2 %84 = OpFMul %82 %83 
                                      f32_4 %85 = OpLoad %9 
                                      f32_2 %86 = OpVectorShuffle %85 %85 2 1 
                                      f32_2 %87 = OpFAdd %84 %86 
                                      f32_3 %88 = OpLoad %63 
                                      f32_3 %89 = OpVectorShuffle %88 %87 3 4 2 
                                                    OpStore %63 %89 
                               Private f32* %91 = OpAccessChain %9 %36 
                                        f32 %92 = OpLoad %91 
                               Private f32* %93 = OpAccessChain %63 %36 
                                        f32 %94 = OpLoad %93 
                                       bool %95 = OpFOrdGreaterThanEqual %92 %94 
                                                    OpStore %90 %95 
                                       bool %98 = OpLoad %90 
                                                    OpSelectionMerge %100 None 
                                                    OpBranchConditional %98 %99 %101 
                                            %99 = OpLabel 
                                                    OpStore %97 %69 
                                                    OpBranch %100 
                                           %101 = OpLabel 
                                                    OpStore %97 %43 
                                                    OpBranch %100 
                                           %100 = OpLabel 
                                       f32 %102 = OpLoad %97 
                                                    OpStore %96 %102 
                              Private f32* %103 = OpAccessChain %9 %36 
                                       f32 %104 = OpLoad %103 
                              Private f32* %105 = OpAccessChain %63 %59 
                                                    OpStore %105 %104 
                                     f32_3 %107 = OpLoad %63 
                                     f32_3 %108 = OpFNegate %107 
                                     f32_3 %109 = OpLoad %63 
                                     f32_3 %110 = OpVectorShuffle %109 %109 2 1 0 
                                     f32_3 %111 = OpFAdd %108 %110 
                                     f32_4 %112 = OpLoad %106 
                                     f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                    OpStore %106 %113 
                                       f32 %114 = OpLoad %96 
                                     f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                     f32_4 %116 = OpLoad %106 
                                     f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                     f32_3 %118 = OpFMul %115 %117 
                                     f32_3 %119 = OpLoad %63 
                                     f32_3 %120 = OpFAdd %118 %119 
                                                    OpStore %63 %120 
                              Private f32* %122 = OpAccessChain %63 %56 
                                       f32 %123 = OpLoad %122 
                              Private f32* %124 = OpAccessChain %63 %59 
                                       f32 %125 = OpLoad %124 
                                       f32 %126 = OpExtInst %1 37 %123 %125 
                              Private f32* %127 = OpAccessChain %121 %36 
                                                    OpStore %127 %126 
                              Private f32* %128 = OpAccessChain %121 %36 
                                       f32 %129 = OpLoad %128 
                                       f32 %130 = OpFNegate %129 
                              Private f32* %131 = OpAccessChain %63 %36 
                                       f32 %132 = OpLoad %131 
                                       f32 %133 = OpFAdd %130 %132 
                              Private f32* %134 = OpAccessChain %121 %36 
                                                    OpStore %134 %133 
                              Private f32* %136 = OpAccessChain %63 %36 
                                       f32 %137 = OpLoad %136 
                                       f32 %139 = OpFAdd %137 %138 
                                                    OpStore %135 %139 
                              Private f32* %140 = OpAccessChain %121 %36 
                                       f32 %141 = OpLoad %140 
                                       f32 %142 = OpLoad %135 
                                       f32 %143 = OpFDiv %141 %142 
                              Private f32* %144 = OpAccessChain %121 %36 
                                                    OpStore %144 %143 
                                     f32_4 %145 = OpLoad %9 
                                     f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                     f32_3 %147 = OpFNegate %146 
                                     f32_4 %148 = OpLoad %29 
                                     f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                     f32_3 %150 = OpFMul %147 %149 
                            Uniform f32_4* %155 = OpAccessChain %153 %47 
                                     f32_4 %156 = OpLoad %155 
                                     f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                     f32_3 %158 = OpFAdd %150 %157 
                                                    OpStore %22 %158 
                                     f32_4 %160 = OpLoad %9 
                                     f32_4 %161 = OpLoad %29 
                                     f32_4 %162 = OpFMul %160 %161 
                                                    OpStore %159 %162 
                            Uniform f32_4* %163 = OpAccessChain %153 %47 
                                     f32_4 %164 = OpLoad %163 
                                     f32_3 %165 = OpVectorShuffle %164 %164 3 3 3 
                                     f32_3 %166 = OpLoad %22 
                                     f32_3 %167 = OpFMul %165 %166 
                                     f32_4 %168 = OpLoad %159 
                                     f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                     f32_3 %170 = OpFAdd %167 %169 
                                                    OpStore %22 %170 
                              Private f32* %173 = OpAccessChain %159 %24 
                                       f32 %174 = OpLoad %173 
                               Output f32* %176 = OpAccessChain %172 %24 
                                                    OpStore %176 %174 
                              Private f32* %178 = OpAccessChain %22 %56 
                                       f32 %179 = OpLoad %178 
                              Private f32* %180 = OpAccessChain %22 %59 
                                       f32 %181 = OpLoad %180 
                                      bool %182 = OpFOrdGreaterThanEqual %179 %181 
                                                    OpStore %177 %182 
                                      bool %184 = OpLoad %177 
                                                    OpSelectionMerge %186 None 
                                                    OpBranchConditional %184 %185 %187 
                                           %185 = OpLabel 
                                                    OpStore %183 %69 
                                                    OpBranch %186 
                                           %187 = OpLabel 
                                                    OpStore %183 %43 
                                                    OpBranch %186 
                                           %186 = OpLabel 
                                       f32 %188 = OpLoad %183 
                                                    OpStore %135 %188 
                                     f32_3 %190 = OpLoad %22 
                                     f32_2 %191 = OpVectorShuffle %190 %190 2 1 
                                     f32_2 %192 = OpFNegate %191 
                                     f32_3 %193 = OpLoad %22 
                                     f32_2 %194 = OpVectorShuffle %193 %193 1 2 
                                     f32_2 %195 = OpFAdd %192 %194 
                                                    OpStore %189 %195 
                                       f32 %197 = OpLoad %135 
                                     f32_2 %198 = OpCompositeConstruct %197 %197 
                                     f32_2 %199 = OpLoad %189 
                                     f32_2 %200 = OpFMul %198 %199 
                                     f32_3 %201 = OpLoad %22 
                                     f32_2 %202 = OpVectorShuffle %201 %201 2 1 
                                     f32_2 %203 = OpFAdd %200 %202 
                                     f32_4 %204 = OpLoad %196 
                                     f32_4 %205 = OpVectorShuffle %204 %203 4 5 2 3 
                                                    OpStore %196 %205 
                              Private f32* %206 = OpAccessChain %106 %36 
                                                    OpStore %206 %69 
                              Private f32* %208 = OpAccessChain %106 %56 
                                                    OpStore %208 %207 
                                       f32 %209 = OpLoad %135 
                                     f32_2 %210 = OpCompositeConstruct %209 %209 
                                     f32_4 %211 = OpLoad %106 
                                     f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                     f32_2 %213 = OpFMul %210 %212 
                                     f32_2 %216 = OpFAdd %213 %215 
                                     f32_4 %217 = OpLoad %196 
                                     f32_4 %218 = OpVectorShuffle %217 %216 0 1 4 5 
                                                    OpStore %196 %218 
                                     f32_4 %219 = OpLoad %196 
                                     f32_3 %220 = OpVectorShuffle %219 %219 0 1 3 
                                     f32_3 %221 = OpFNegate %220 
                                     f32_4 %222 = OpLoad %106 
                                     f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                    OpStore %106 %223 
                              Private f32* %224 = OpAccessChain %22 %36 
                                       f32 %225 = OpLoad %224 
                                       f32 %226 = OpFNegate %225 
                              Private f32* %227 = OpAccessChain %106 %24 
                                                    OpStore %227 %226 
                                     f32_4 %229 = OpLoad %196 
                                     f32_3 %230 = OpVectorShuffle %229 %229 1 2 0 
                                     f32_4 %231 = OpLoad %106 
                                     f32_3 %232 = OpVectorShuffle %231 %231 1 2 3 
                                     f32_3 %233 = OpFAdd %230 %232 
                                     f32_4 %234 = OpLoad %228 
                                     f32_4 %235 = OpVectorShuffle %234 %233 0 4 5 6 
                                                    OpStore %228 %235 
                              Private f32* %236 = OpAccessChain %22 %36 
                                       f32 %237 = OpLoad %236 
                              Private f32* %238 = OpAccessChain %106 %36 
                                       f32 %239 = OpLoad %238 
                                       f32 %240 = OpFAdd %237 %239 
                              Private f32* %241 = OpAccessChain %228 %36 
                                                    OpStore %241 %240 
                              Private f32* %242 = OpAccessChain %22 %36 
                                       f32 %243 = OpLoad %242 
                              Private f32* %244 = OpAccessChain %196 %36 
                                       f32 %245 = OpLoad %244 
                                      bool %246 = OpFOrdGreaterThanEqual %243 %245 
                                                    OpStore %177 %246 
                                      bool %248 = OpLoad %177 
                                                    OpSelectionMerge %250 None 
                                                    OpBranchConditional %248 %249 %251 
                                           %249 = OpLabel 
                                                    OpStore %247 %69 
                                                    OpBranch %250 
                                           %251 = OpLabel 
                                                    OpStore %247 %43 
                                                    OpBranch %250 
                                           %250 = OpLabel 
                                       f32 %252 = OpLoad %247 
                                                    OpStore %135 %252 
                                       f32 %253 = OpLoad %135 
                                     f32_3 %254 = OpCompositeConstruct %253 %253 %253 
                                     f32_4 %255 = OpLoad %228 
                                     f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                     f32_3 %257 = OpFMul %254 %256 
                                     f32_4 %258 = OpLoad %196 
                                     f32_3 %259 = OpVectorShuffle %258 %258 0 1 3 
                                     f32_3 %260 = OpFAdd %257 %259 
                                     f32_4 %261 = OpLoad %106 
                                     f32_4 %262 = OpVectorShuffle %261 %260 4 5 6 3 
                                                    OpStore %106 %262 
                                       f32 %263 = OpLoad %135 
                              Private f32* %264 = OpAccessChain %228 %24 
                                       f32 %265 = OpLoad %264 
                                       f32 %266 = OpFMul %263 %265 
                              Private f32* %267 = OpAccessChain %22 %36 
                                       f32 %268 = OpLoad %267 
                                       f32 %269 = OpFAdd %266 %268 
                                                    OpStore %135 %269 
                              Private f32* %270 = OpAccessChain %106 %56 
                                       f32 %271 = OpLoad %270 
                                       f32 %272 = OpLoad %135 
                                       f32 %273 = OpExtInst %1 37 %271 %272 
                                                    OpStore %96 %273 
                              Private f32* %274 = OpAccessChain %106 %56 
                                       f32 %275 = OpLoad %274 
                                       f32 %276 = OpFNegate %275 
                                       f32 %277 = OpLoad %135 
                                       f32 %278 = OpFAdd %276 %277 
                                                    OpStore %135 %278 
                                       f32 %279 = OpLoad %96 
                                       f32 %280 = OpFNegate %279 
                              Private f32* %281 = OpAccessChain %106 %36 
                                       f32 %282 = OpLoad %281 
                                       f32 %283 = OpFAdd %280 %282 
                                                    OpStore %96 %283 
                                       f32 %284 = OpLoad %96 
                                       f32 %286 = OpFMul %284 %285 
                                       f32 %287 = OpFAdd %286 %138 
                                                    OpStore %96 %287 
                                       f32 %288 = OpLoad %135 
                                       f32 %289 = OpLoad %96 
                                       f32 %290 = OpFDiv %288 %289 
                                                    OpStore %135 %290 
                                       f32 %291 = OpLoad %135 
                              Private f32* %292 = OpAccessChain %106 %59 
                                       f32 %293 = OpLoad %292 
                                       f32 %294 = OpFAdd %291 %293 
                                                    OpStore %135 %294 
                                       f32 %295 = OpLoad %135 
                                     f32_3 %296 = OpCompositeConstruct %295 %295 %295 
                                     f32_3 %297 = OpExtInst %1 4 %296 
                                     f32_3 %300 = OpFAdd %297 %299 
                                     f32_4 %301 = OpLoad %106 
                                     f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                                    OpStore %106 %302 
                                     f32_4 %303 = OpLoad %106 
                                     f32_3 %304 = OpVectorShuffle %303 %303 0 1 2 
                                     f32_3 %305 = OpExtInst %1 10 %304 
                                     f32_4 %306 = OpLoad %106 
                                     f32_4 %307 = OpVectorShuffle %306 %305 4 5 6 3 
                                                    OpStore %106 %307 
                                     f32_4 %308 = OpLoad %106 
                                     f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                                     f32_3 %311 = OpFMul %309 %310 
                                     f32_3 %314 = OpFAdd %311 %313 
                                     f32_4 %315 = OpLoad %106 
                                     f32_4 %316 = OpVectorShuffle %315 %314 4 5 6 3 
                                                    OpStore %106 %316 
                                     f32_4 %317 = OpLoad %106 
                                     f32_3 %318 = OpVectorShuffle %317 %317 0 1 2 
                                     f32_3 %319 = OpExtInst %1 4 %318 
                                     f32_3 %321 = OpFAdd %319 %320 
                                     f32_4 %322 = OpLoad %106 
                                     f32_4 %323 = OpVectorShuffle %322 %321 4 5 6 3 
                                                    OpStore %106 %323 
                                     f32_4 %324 = OpLoad %106 
                                     f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                     f32_3 %326 = OpCompositeConstruct %43 %43 %43 
                                     f32_3 %327 = OpCompositeConstruct %69 %69 %69 
                                     f32_3 %328 = OpExtInst %1 43 %325 %326 %327 
                                     f32_4 %329 = OpLoad %106 
                                     f32_4 %330 = OpVectorShuffle %329 %328 4 5 6 3 
                                                    OpStore %106 %330 
                                     f32_4 %331 = OpLoad %106 
                                     f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                     f32_3 %333 = OpFAdd %332 %320 
                                     f32_4 %334 = OpLoad %106 
                                     f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                    OpStore %106 %335 
                                     f32_3 %336 = OpLoad %121 
                                     f32_3 %337 = OpVectorShuffle %336 %336 0 0 0 
                                     f32_4 %338 = OpLoad %106 
                                     f32_3 %339 = OpVectorShuffle %338 %338 0 1 2 
                                     f32_3 %340 = OpFMul %337 %339 
                                     f32_3 %342 = OpFAdd %340 %341 
                                                    OpStore %121 %342 
                                     f32_3 %343 = OpLoad %121 
                                     f32_3 %344 = OpLoad %63 
                                     f32_3 %345 = OpVectorShuffle %344 %344 0 0 0 
                                     f32_3 %346 = OpFMul %343 %345 
                                                    OpStore %63 %346 
                                     f32_3 %347 = OpLoad %63 
                                     f32_4 %348 = OpLoad %172 
                                     f32_4 %349 = OpVectorShuffle %348 %347 4 5 6 3 
                                                    OpStore %172 %349 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
SubProgram "vulkan " {
Keywords { "BRIGHTNESS_CLAMP_ON" }
""
}
}
}
}
}