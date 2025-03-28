//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/RainbowChestShader" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_Perpendicular ("Is Perpendicular Tilt", Float) = 1
_ValueMaximum ("Value Maximum", Float) = 1
_AllColorsToggle ("All Colors", Float) = 0
_HueTestValue ("Hue Test Value", Float) = 50
_HiddenRainbow ("Hidden Rainbow", Float) = 0
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
  GpuProgramID 37509
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
vec4 u_xlat2;
float u_xlat3;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.y = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xzw = in_POSITION0.xzw;
    vs_TEXCOORD1 = u_xlat0 * vec4(0.0166666675, 0.0166666675, 0.0166666675, 0.0166666675);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _OverrideColor;
uniform 	float _MapActive;
uniform 	float _HueTestValue;
uniform 	float _AllColorsToggle;
uniform 	float _HiddenRainbow;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat5;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.x = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb1 = u_xlat1.x<0.0;
    if((int(u_xlatb1) * int(0xffffffffu))!=0){discard;}
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat3.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = _OverrideColor.www * u_xlat3.xyz + u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    u_xlatb12 = u_xlat0.y>=u_xlat0.z;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xy = u_xlat0.zy;
    u_xlat2.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1 = vec4(u_xlat12) * u_xlat2.xywz + u_xlat1.xywz;
    u_xlat2.z = u_xlat1.w;
    u_xlatb12 = u_xlat0.x>=u_xlat1.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.w = u_xlat0.x;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat12 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat12 = u_xlat5 / u_xlat12;
    u_xlat12 = u_xlat12 + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + -0.100000001;
    u_xlat1.x = u_xlat1.x * 1000.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat12 = -abs(u_xlat12) * abs(_HueTestValue) + 1.0;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat5 = u_xlat1.x * u_xlat12;
    u_xlat12 = (-u_xlat12) * u_xlat1.x + 1.0;
    u_xlatb1 = _HueTestValue<0.0;
    u_xlat12 = (u_xlatb1) ? u_xlat12 : u_xlat5;
    u_xlat12 = _HiddenRainbow * (-u_xlat12) + u_xlat12;
    u_xlat1.xy = (-vs_TEXCOORD0.xy) + vs_TEXCOORD1.xy;
    u_xlat1.xy = vec2(vec2(_AllColorsToggle, _AllColorsToggle)) * u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat9.xy = vec2(_MapActive, _AllColorsToggle) * vec2(-0.300000012, -1.5) + vec2(0.5, 3.0);
    u_xlat1.xy = u_xlat1.xy / u_xlat9.yy;
    u_xlat1.x = _Time.x * 0.800000012 + u_xlat1.x;
    u_xlat1.xy = u_xlat9.xx * u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(150.0, 150.0);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat5 = cos(u_xlat1.y);
    u_xlat1.x = u_xlat5 + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + _Time.y;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat1.xyz * vec3(2.5, 2.5, 2.5) + (-u_xlat0.xyz);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat0.xyz;
    u_xlatb12 = 0.5<_AllColorsToggle;
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat2.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 137
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %41 %102 %112 %113 %117 %119 %126 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %41 Location 41 
                                                      OpMemberDecorate %100 0 BuiltIn 100 
                                                      OpMemberDecorate %100 1 BuiltIn 100 
                                                      OpMemberDecorate %100 2 BuiltIn 100 
                                                      OpDecorate %100 Block 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %112 Location 112 
                                                      OpDecorate %113 Location 113 
                                                      OpDecorate %117 Location 117 
                                                      OpDecorate %119 Location 119 
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
                                          i32 %22 = OpConstant 2 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                          f32 %31 = OpConstant 3.67402E-40 
                                 Private f32* %34 = OpVariable Private 
                                          f32 %38 = OpConstant 3.67402E-40 
                                              %40 = OpTypePointer Input %7 
                                 Input f32_4* %41 = OpVariable Input 
                                          u32 %42 = OpConstant 1 
                                              %43 = OpTypePointer Input %6 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                               Private f32_4* %79 = OpVariable Private 
                                              %99 = OpTypeArray %6 %42 
                                             %100 = OpTypeStruct %7 %6 %99 
                                             %101 = OpTypePointer Output %100 
        Output struct {f32_4; f32; f32[1];}* %102 = OpVariable Output 
                                             %110 = OpTypePointer Output %7 
                               Output f32_4* %112 = OpVariable Output 
                                Input f32_4* %113 = OpVariable Input 
                                             %115 = OpTypeVector %6 2 
                                             %116 = OpTypePointer Output %115 
                               Output f32_2* %117 = OpVariable Output 
                                             %118 = OpTypePointer Input %115 
                                Input f32_2* %119 = OpVariable Input 
                                             %121 = OpTypeVector %6 3 
                               Output f32_4* %126 = OpVariable Output 
                                         f32 %128 = OpConstant 3.67402E-40 
                                       f32_4 %129 = OpConstantComposite %128 %128 %128 %128 
                                             %131 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %20 = OpAccessChain %16 %18 
                                          f32 %21 = OpLoad %20 
                                 Uniform f32* %23 = OpAccessChain %16 %22 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFMul %21 %24 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                                      OpStore %28 %25 
                                 Private f32* %29 = OpAccessChain %9 %26 
                                          f32 %30 = OpLoad %29 
                                          f32 %32 = OpFMul %30 %31 
                                 Private f32* %33 = OpAccessChain %9 %26 
                                                      OpStore %33 %32 
                                 Uniform f32* %35 = OpAccessChain %16 %22 
                                          f32 %36 = OpLoad %35 
                                          f32 %37 = OpFNegate %36 
                                          f32 %39 = OpFAdd %37 %38 
                                                      OpStore %34 %39 
                                   Input f32* %44 = OpAccessChain %41 %42 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpLoad %34 
                                          f32 %47 = OpFMul %45 %46 
                                 Private f32* %48 = OpAccessChain %9 %26 
                                          f32 %49 = OpLoad %48 
                                          f32 %50 = OpFAdd %47 %49 
                                 Private f32* %51 = OpAccessChain %9 %42 
                                                      OpStore %51 %50 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 1 1 1 1 
                               Uniform f32_4* %58 = OpAccessChain %16 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %52 %60 
                               Uniform f32_4* %61 = OpAccessChain %16 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %41 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %52 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %52 %67 
                               Uniform f32_4* %68 = OpAccessChain %16 %55 %22 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %41 
                                        f32_4 %71 = OpVectorShuffle %70 %70 2 2 2 2 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %52 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %52 %74 
                                        f32_4 %75 = OpLoad %52 
                               Uniform f32_4* %76 = OpAccessChain %16 %55 %18 
                                        f32_4 %77 = OpLoad %76 
                                        f32_4 %78 = OpFAdd %75 %77 
                                                      OpStore %52 %78 
                                        f32_4 %80 = OpLoad %52 
                                        f32_4 %81 = OpVectorShuffle %80 %80 1 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %16 %56 %56 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpFMul %81 %83 
                                                      OpStore %79 %84 
                               Uniform f32_4* %85 = OpAccessChain %16 %56 %55 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %52 
                                        f32_4 %88 = OpVectorShuffle %87 %87 0 0 0 0 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %79 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %79 %91 
                               Uniform f32_4* %92 = OpAccessChain %16 %56 %22 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpLoad %52 
                                        f32_4 %95 = OpVectorShuffle %94 %94 2 2 2 2 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %79 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %79 %98 
                              Uniform f32_4* %103 = OpAccessChain %16 %56 %18 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpLoad %52 
                                       f32_4 %106 = OpVectorShuffle %105 %105 3 3 3 3 
                                       f32_4 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %79 
                                       f32_4 %109 = OpFAdd %107 %108 
                               Output f32_4* %111 = OpAccessChain %102 %55 
                                                      OpStore %111 %109 
                                       f32_4 %114 = OpLoad %113 
                                                      OpStore %112 %114 
                                       f32_2 %120 = OpLoad %119 
                                                      OpStore %117 %120 
                                       f32_4 %122 = OpLoad %41 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 2 3 
                                       f32_4 %124 = OpLoad %9 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 1 5 6 
                                                      OpStore %9 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %130 = OpFMul %127 %129 
                                                      OpStore %126 %130 
                                 Output f32* %132 = OpAccessChain %102 %55 %42 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFNegate %133 
                                 Output f32* %135 = OpAccessChain %102 %55 %42 
                                                      OpStore %135 %134 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 460
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %29 %83 %294 
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
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %57 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %59 RelaxedPrecision 
                                                      OpDecorate %60 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpMemberDecorate %62 0 Offset 62 
                                                      OpMemberDecorate %62 1 RelaxedPrecision 
                                                      OpMemberDecorate %62 1 Offset 62 
                                                      OpMemberDecorate %62 2 Offset 62 
                                                      OpMemberDecorate %62 3 Offset 62 
                                                      OpMemberDecorate %62 4 Offset 62 
                                                      OpMemberDecorate %62 5 Offset 62 
                                                      OpDecorate %62 Block 
                                                      OpDecorate %64 DescriptorSet 64 
                                                      OpDecorate %64 Binding 64 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %72 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %83 Location 83 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %118 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %294 Location 294 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %409 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %430 RelaxedPrecision 
                                                      OpDecorate %431 RelaxedPrecision 
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
                                              %62 = OpTypeStruct %7 %7 %6 %6 %6 %6 
                                              %63 = OpTypePointer Uniform %62 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32;}* %64 = OpVariable Uniform 
                                              %65 = OpTypePointer Uniform %7 
                               Private f32_4* %70 = OpVariable Private 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %83 = OpVariable Output 
                                              %86 = OpTypePointer Output %6 
                                          u32 %88 = OpConstant 1 
                                          u32 %91 = OpConstant 2 
                               Private f32_4* %95 = OpVariable Private 
                                              %96 = OpTypePointer Function %6 
                                         f32 %101 = OpConstant 3.67402E-40 
                                             %105 = OpTypePointer Private %15 
                              Private f32_2* %106 = OpVariable Private 
                              Private f32_4* %113 = OpVariable Private 
                              Private f32_3* %123 = OpVariable Private 
                                         f32 %125 = OpConstant 3.67402E-40 
                                         f32 %132 = OpConstant 3.67402E-40 
                                       f32_2 %133 = OpConstantComposite %125 %132 
                              Private f32_4* %146 = OpVariable Private 
                                Private f32* %202 = OpVariable Private 
                                         f32 %210 = OpConstant 3.67402E-40 
                                         f32 %212 = OpConstant 3.67402E-40 
                                         f32 %231 = OpConstant 3.67402E-40 
                                         i32 %242 = OpConstant 3 
                                             %243 = OpTypePointer Uniform %6 
                               Private bool* %267 = OpVariable Private 
                                         i32 %281 = OpConstant 5 
                                Input f32_4* %294 = OpVariable Input 
                                         i32 %300 = OpConstant 4 
                                         i32 %316 = OpConstant 2 
                                         f32 %322 = OpConstant 3.67402E-40 
                                         f32 %323 = OpConstant 3.67402E-40 
                                       f32_2 %324 = OpConstantComposite %322 %323 
                                         f32 %326 = OpConstant 3.67402E-40 
                                         f32 %327 = OpConstant 3.67402E-40 
                                       f32_2 %328 = OpConstantComposite %326 %327 
                                         f32 %341 = OpConstant 3.67402E-40 
                                         f32 %356 = OpConstant 3.67402E-40 
                                       f32_2 %357 = OpConstantComposite %356 %356 
                                         f32 %385 = OpConstant 3.67402E-40 
                                       f32_3 %386 = OpConstantComposite %101 %132 %385 
                                       f32_3 %391 = OpConstantComposite %210 %210 %210 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_3 %394 = OpConstantComposite %393 %393 %393 
                                       f32_3 %398 = OpConstantComposite %125 %125 %125 
                                         f32 %405 = OpConstant 3.67402E-40 
                                       f32_3 %406 = OpConstantComposite %405 %405 %405 
                                         f32 %423 = OpConstant 3.67402E-40 
                                         f32 %424 = OpConstant 3.67402E-40 
                                         f32 %425 = OpConstant 3.67402E-40 
                                       f32_3 %426 = OpConstantComposite %423 %424 %425 
                               Private bool* %442 = OpVariable Private 
                                             %446 = OpTypePointer Function %20 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function f32* %97 = OpVariable Function 
                               Function f32* %165 = OpVariable Function 
                               Function f32* %271 = OpVariable Function 
                             Function f32_3* %447 = OpVariable Function 
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
                                        f32_4 %56 = OpLoad %9 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_3 %58 = OpFNegate %57 
                                        f32_4 %59 = OpLoad %29 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                               Uniform f32_4* %66 = OpAccessChain %64 %48 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                        f32_3 %69 = OpFAdd %61 %68 
                                                      OpStore %22 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpLoad %29 
                                        f32_4 %73 = OpFMul %71 %72 
                                                      OpStore %70 %73 
                               Uniform f32_4* %74 = OpAccessChain %64 %48 
                                        f32_4 %75 = OpLoad %74 
                                        f32_3 %76 = OpVectorShuffle %75 %75 3 3 3 
                                        f32_3 %77 = OpLoad %22 
                                        f32_3 %78 = OpFMul %76 %77 
                                        f32_4 %79 = OpLoad %70 
                                        f32_3 %80 = OpVectorShuffle %79 %79 0 1 2 
                                        f32_3 %81 = OpFAdd %78 %80 
                                                      OpStore %22 %81 
                                 Private f32* %84 = OpAccessChain %70 %24 
                                          f32 %85 = OpLoad %84 
                                  Output f32* %87 = OpAccessChain %83 %24 
                                                      OpStore %87 %85 
                                 Private f32* %89 = OpAccessChain %22 %88 
                                          f32 %90 = OpLoad %89 
                                 Private f32* %92 = OpAccessChain %22 %91 
                                          f32 %93 = OpLoad %92 
                                         bool %94 = OpFOrdGreaterThanEqual %90 %93 
                                                      OpStore %40 %94 
                                         bool %98 = OpLoad %40 
                                                      OpSelectionMerge %100 None 
                                                      OpBranchConditional %98 %99 %102 
                                              %99 = OpLabel 
                                                      OpStore %97 %101 
                                                      OpBranch %100 
                                             %102 = OpLabel 
                                                      OpStore %97 %43 
                                                      OpBranch %100 
                                             %100 = OpLabel 
                                         f32 %103 = OpLoad %97 
                                Private f32* %104 = OpAccessChain %95 %36 
                                                      OpStore %104 %103 
                                       f32_3 %107 = OpLoad %22 
                                       f32_2 %108 = OpVectorShuffle %107 %107 2 1 
                                       f32_2 %109 = OpFNegate %108 
                                       f32_3 %110 = OpLoad %22 
                                       f32_2 %111 = OpVectorShuffle %110 %110 1 2 
                                       f32_2 %112 = OpFAdd %109 %111 
                                                      OpStore %106 %112 
                                       f32_4 %114 = OpLoad %95 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 0 
                                       f32_2 %116 = OpLoad %106 
                                       f32_2 %117 = OpFMul %115 %116 
                                       f32_3 %118 = OpLoad %22 
                                       f32_2 %119 = OpVectorShuffle %118 %118 2 1 
                                       f32_2 %120 = OpFAdd %117 %119 
                                       f32_4 %121 = OpLoad %113 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
                                                      OpStore %113 %122 
                                Private f32* %124 = OpAccessChain %123 %36 
                                                      OpStore %124 %101 
                                Private f32* %126 = OpAccessChain %123 %88 
                                                      OpStore %126 %125 
                                       f32_4 %127 = OpLoad %95 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 0 
                                       f32_3 %129 = OpLoad %123 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %128 %130 
                                       f32_2 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %113 
                                       f32_4 %136 = OpVectorShuffle %135 %134 0 1 4 5 
                                                      OpStore %113 %136 
                                       f32_4 %137 = OpLoad %113 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 3 
                                       f32_3 %139 = OpFNegate %138 
                                       f32_4 %140 = OpLoad %95 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %95 %141 
                                Private f32* %142 = OpAccessChain %22 %36 
                                         f32 %143 = OpLoad %142 
                                         f32 %144 = OpFNegate %143 
                                Private f32* %145 = OpAccessChain %95 %24 
                                                      OpStore %145 %144 
                                       f32_4 %147 = OpLoad %113 
                                       f32_3 %148 = OpVectorShuffle %147 %147 1 2 0 
                                       f32_4 %149 = OpLoad %95 
                                       f32_3 %150 = OpVectorShuffle %149 %149 1 2 3 
                                       f32_3 %151 = OpFAdd %148 %150 
                                       f32_4 %152 = OpLoad %146 
                                       f32_4 %153 = OpVectorShuffle %152 %151 0 4 5 6 
                                                      OpStore %146 %153 
                                Private f32* %154 = OpAccessChain %22 %36 
                                         f32 %155 = OpLoad %154 
                                Private f32* %156 = OpAccessChain %95 %36 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFAdd %155 %157 
                                Private f32* %159 = OpAccessChain %146 %36 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %22 %36 
                                         f32 %161 = OpLoad %160 
                                Private f32* %162 = OpAccessChain %113 %36 
                                         f32 %163 = OpLoad %162 
                                        bool %164 = OpFOrdGreaterThanEqual %161 %163 
                                                      OpStore %40 %164 
                                        bool %166 = OpLoad %40 
                                                      OpSelectionMerge %168 None 
                                                      OpBranchConditional %166 %167 %169 
                                             %167 = OpLabel 
                                                      OpStore %165 %101 
                                                      OpBranch %168 
                                             %169 = OpLabel 
                                                      OpStore %165 %43 
                                                      OpBranch %168 
                                             %168 = OpLabel 
                                         f32 %170 = OpLoad %165 
                                Private f32* %171 = OpAccessChain %95 %36 
                                                      OpStore %171 %170 
                                       f32_4 %172 = OpLoad %95 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_4 %174 = OpLoad %146 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %113 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 3 
                                       f32_3 %179 = OpFAdd %176 %178 
                                                      OpStore %123 %179 
                                Private f32* %180 = OpAccessChain %95 %36 
                                         f32 %181 = OpLoad %180 
                                Private f32* %182 = OpAccessChain %146 %24 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFMul %181 %183 
                                Private f32* %185 = OpAccessChain %22 %36 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %188 = OpAccessChain %95 %36 
                                                      OpStore %188 %187 
                                Private f32* %189 = OpAccessChain %123 %88 
                                         f32 %190 = OpLoad %189 
                                Private f32* %191 = OpAccessChain %95 %36 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpExtInst %1 37 %190 %192 
                                Private f32* %194 = OpAccessChain %146 %36 
                                                      OpStore %194 %193 
                                Private f32* %195 = OpAccessChain %123 %88 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFNegate %196 
                                Private f32* %198 = OpAccessChain %95 %36 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFAdd %197 %199 
                                Private f32* %201 = OpAccessChain %95 %36 
                                                      OpStore %201 %200 
                                Private f32* %203 = OpAccessChain %123 %36 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %146 %36 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFNegate %206 
                                         f32 %208 = OpFAdd %204 %207 
                                                      OpStore %202 %208 
                                         f32 %209 = OpLoad %202 
                                         f32 %211 = OpFMul %209 %210 
                                         f32 %213 = OpFAdd %211 %212 
                                                      OpStore %202 %213 
                                Private f32* %214 = OpAccessChain %95 %36 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpLoad %202 
                                         f32 %217 = OpFDiv %215 %216 
                                Private f32* %218 = OpAccessChain %95 %36 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %95 %36 
                                         f32 %220 = OpLoad %219 
                                Private f32* %221 = OpAccessChain %123 %91 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFAdd %220 %222 
                                Private f32* %224 = OpAccessChain %95 %36 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %123 %36 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFAdd %226 %34 
                                Private f32* %228 = OpAccessChain %123 %36 
                                                      OpStore %228 %227 
                                Private f32* %229 = OpAccessChain %123 %36 
                                         f32 %230 = OpLoad %229 
                                         f32 %232 = OpFMul %230 %231 
                                Private f32* %233 = OpAccessChain %123 %36 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %123 %36 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpExtInst %1 43 %235 %43 %101 
                                Private f32* %237 = OpAccessChain %123 %36 
                                                      OpStore %237 %236 
                                Private f32* %238 = OpAccessChain %95 %36 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpExtInst %1 4 %239 
                                         f32 %241 = OpFNegate %240 
                                Uniform f32* %244 = OpAccessChain %64 %242 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpExtInst %1 4 %245 
                                         f32 %247 = OpFMul %241 %246 
                                         f32 %248 = OpFAdd %247 %101 
                                Private f32* %249 = OpAccessChain %95 %36 
                                                      OpStore %249 %248 
                                Private f32* %250 = OpAccessChain %95 %36 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpExtInst %1 40 %251 %43 
                                Private f32* %253 = OpAccessChain %95 %36 
                                                      OpStore %253 %252 
                                Private f32* %254 = OpAccessChain %123 %36 
                                         f32 %255 = OpLoad %254 
                                Private f32* %256 = OpAccessChain %95 %36 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFMul %255 %257 
                                                      OpStore %202 %258 
                                Private f32* %259 = OpAccessChain %95 %36 
                                         f32 %260 = OpLoad %259 
                                         f32 %261 = OpFNegate %260 
                                Private f32* %262 = OpAccessChain %123 %36 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFMul %261 %263 
                                         f32 %265 = OpFAdd %264 %101 
                                Private f32* %266 = OpAccessChain %95 %36 
                                                      OpStore %266 %265 
                                Uniform f32* %268 = OpAccessChain %64 %242 
                                         f32 %269 = OpLoad %268 
                                        bool %270 = OpFOrdLessThan %269 %43 
                                                      OpStore %267 %270 
                                        bool %272 = OpLoad %267 
                                                      OpSelectionMerge %274 None 
                                                      OpBranchConditional %272 %273 %277 
                                             %273 = OpLabel 
                                Private f32* %275 = OpAccessChain %95 %36 
                                         f32 %276 = OpLoad %275 
                                                      OpStore %271 %276 
                                                      OpBranch %274 
                                             %277 = OpLabel 
                                         f32 %278 = OpLoad %202 
                                                      OpStore %271 %278 
                                                      OpBranch %274 
                                             %274 = OpLabel 
                                         f32 %279 = OpLoad %271 
                                Private f32* %280 = OpAccessChain %95 %36 
                                                      OpStore %280 %279 
                                Uniform f32* %282 = OpAccessChain %64 %281 
                                         f32 %283 = OpLoad %282 
                                Private f32* %284 = OpAccessChain %95 %36 
                                         f32 %285 = OpLoad %284 
                                         f32 %286 = OpFNegate %285 
                                         f32 %287 = OpFMul %283 %286 
                                Private f32* %288 = OpAccessChain %95 %36 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFAdd %287 %289 
                                Private f32* %291 = OpAccessChain %95 %36 
                                                      OpStore %291 %290 
                                       f32_2 %292 = OpLoad %17 
                                       f32_2 %293 = OpFNegate %292 
                                       f32_4 %295 = OpLoad %294 
                                       f32_2 %296 = OpVectorShuffle %295 %295 0 1 
                                       f32_2 %297 = OpFAdd %293 %296 
                                       f32_3 %298 = OpLoad %123 
                                       f32_3 %299 = OpVectorShuffle %298 %297 3 4 2 
                                                      OpStore %123 %299 
                                Uniform f32* %301 = OpAccessChain %64 %300 
                                         f32 %302 = OpLoad %301 
                                Uniform f32* %303 = OpAccessChain %64 %300 
                                         f32 %304 = OpLoad %303 
                                       f32_2 %305 = OpCompositeConstruct %302 %304 
                                         f32 %306 = OpCompositeExtract %305 0 
                                         f32 %307 = OpCompositeExtract %305 1 
                                       f32_2 %308 = OpCompositeConstruct %306 %307 
                                       f32_3 %309 = OpLoad %123 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                                       f32_2 %311 = OpFMul %308 %310 
                                       f32_2 %312 = OpLoad %17 
                                       f32_2 %313 = OpFAdd %311 %312 
                                       f32_3 %314 = OpLoad %123 
                                       f32_3 %315 = OpVectorShuffle %314 %313 3 4 2 
                                                      OpStore %123 %315 
                                Uniform f32* %317 = OpAccessChain %64 %316 
                                         f32 %318 = OpLoad %317 
                                Uniform f32* %319 = OpAccessChain %64 %300 
                                         f32 %320 = OpLoad %319 
                                       f32_2 %321 = OpCompositeConstruct %318 %320 
                                       f32_2 %325 = OpFMul %321 %324 
                                       f32_2 %329 = OpFAdd %325 %328 
                                       f32_4 %330 = OpLoad %146 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 2 3 
                                                      OpStore %146 %331 
                                       f32_3 %332 = OpLoad %123 
                                       f32_2 %333 = OpVectorShuffle %332 %332 0 1 
                                       f32_4 %334 = OpLoad %146 
                                       f32_2 %335 = OpVectorShuffle %334 %334 1 1 
                                       f32_2 %336 = OpFDiv %333 %335 
                                       f32_3 %337 = OpLoad %123 
                                       f32_3 %338 = OpVectorShuffle %337 %336 3 4 2 
                                                      OpStore %123 %338 
                                Uniform f32* %339 = OpAccessChain %64 %47 %36 
                                         f32 %340 = OpLoad %339 
                                         f32 %342 = OpFMul %340 %341 
                                Private f32* %343 = OpAccessChain %123 %36 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                Private f32* %346 = OpAccessChain %123 %36 
                                                      OpStore %346 %345 
                                       f32_4 %347 = OpLoad %146 
                                       f32_2 %348 = OpVectorShuffle %347 %347 0 0 
                                       f32_3 %349 = OpLoad %123 
                                       f32_2 %350 = OpVectorShuffle %349 %349 0 1 
                                       f32_2 %351 = OpFMul %348 %350 
                                       f32_3 %352 = OpLoad %123 
                                       f32_3 %353 = OpVectorShuffle %352 %351 3 4 2 
                                                      OpStore %123 %353 
                                       f32_3 %354 = OpLoad %123 
                                       f32_2 %355 = OpVectorShuffle %354 %354 0 1 
                                       f32_2 %358 = OpFMul %355 %357 
                                       f32_3 %359 = OpLoad %123 
                                       f32_3 %360 = OpVectorShuffle %359 %358 3 4 2 
                                                      OpStore %123 %360 
                                Private f32* %361 = OpAccessChain %123 %36 
                                         f32 %362 = OpLoad %361 
                                         f32 %363 = OpExtInst %1 13 %362 
                                Private f32* %364 = OpAccessChain %123 %36 
                                                      OpStore %364 %363 
                                Private f32* %365 = OpAccessChain %123 %88 
                                         f32 %366 = OpLoad %365 
                                         f32 %367 = OpExtInst %1 14 %366 
                                                      OpStore %202 %367 
                                         f32 %368 = OpLoad %202 
                                Private f32* %369 = OpAccessChain %123 %36 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFAdd %368 %370 
                                Private f32* %372 = OpAccessChain %123 %36 
                                                      OpStore %372 %371 
                                Private f32* %373 = OpAccessChain %123 %36 
                                         f32 %374 = OpLoad %373 
                                Uniform f32* %375 = OpAccessChain %64 %47 %88 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFAdd %374 %376 
                                Private f32* %378 = OpAccessChain %123 %36 
                                                      OpStore %378 %377 
                                Private f32* %379 = OpAccessChain %123 %36 
                                         f32 %380 = OpLoad %379 
                                         f32 %381 = OpExtInst %1 10 %380 
                                Private f32* %382 = OpAccessChain %123 %36 
                                                      OpStore %382 %381 
                                       f32_3 %383 = OpLoad %123 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 0 0 
                                       f32_3 %387 = OpFAdd %384 %386 
                                                      OpStore %123 %387 
                                       f32_3 %388 = OpLoad %123 
                                       f32_3 %389 = OpExtInst %1 10 %388 
                                                      OpStore %123 %389 
                                       f32_3 %390 = OpLoad %123 
                                       f32_3 %392 = OpFMul %390 %391 
                                       f32_3 %395 = OpFAdd %392 %394 
                                                      OpStore %123 %395 
                                       f32_3 %396 = OpLoad %123 
                                       f32_3 %397 = OpExtInst %1 4 %396 
                                       f32_3 %399 = OpFAdd %397 %398 
                                                      OpStore %123 %399 
                                       f32_3 %400 = OpLoad %123 
                                       f32_3 %401 = OpCompositeConstruct %43 %43 %43 
                                       f32_3 %402 = OpCompositeConstruct %101 %101 %101 
                                       f32_3 %403 = OpExtInst %1 43 %400 %401 %402 
                                                      OpStore %123 %403 
                                       f32_3 %404 = OpLoad %123 
                                       f32_3 %407 = OpFMul %404 %406 
                                       f32_3 %408 = OpLoad %22 
                                       f32_3 %409 = OpFNegate %408 
                                       f32_3 %410 = OpFAdd %407 %409 
                                       f32_4 %411 = OpLoad %146 
                                       f32_4 %412 = OpVectorShuffle %411 %410 4 5 6 3 
                                                      OpStore %146 %412 
                                       f32_4 %413 = OpLoad %95 
                                       f32_3 %414 = OpVectorShuffle %413 %413 0 0 0 
                                       f32_4 %415 = OpLoad %146 
                                       f32_3 %416 = OpVectorShuffle %415 %415 0 1 2 
                                       f32_3 %417 = OpFMul %414 %416 
                                       f32_3 %418 = OpLoad %22 
                                       f32_3 %419 = OpFAdd %417 %418 
                                       f32_4 %420 = OpLoad %146 
                                       f32_4 %421 = OpVectorShuffle %420 %419 4 5 6 3 
                                                      OpStore %146 %421 
                                       f32_3 %422 = OpLoad %22 
                                         f32 %427 = OpDot %422 %426 
                                Private f32* %428 = OpAccessChain %22 %36 
                                                      OpStore %428 %427 
                                       f32_3 %429 = OpLoad %123 
                                       f32_3 %430 = OpLoad %22 
                                       f32_3 %431 = OpVectorShuffle %430 %430 0 0 0 
                                       f32_3 %432 = OpFMul %429 %431 
                                       f32_4 %433 = OpLoad %95 
                                       f32_4 %434 = OpVectorShuffle %433 %432 4 5 6 3 
                                                      OpStore %95 %434 
                                       f32_4 %435 = OpLoad %95 
                                       f32_3 %436 = OpVectorShuffle %435 %435 0 1 2 
                                       f32_4 %437 = OpLoad %95 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 1 2 
                                       f32_3 %439 = OpFAdd %436 %438 
                                       f32_4 %440 = OpLoad %95 
                                       f32_4 %441 = OpVectorShuffle %440 %439 4 5 6 3 
                                                      OpStore %95 %441 
                                Uniform f32* %443 = OpAccessChain %64 %300 
                                         f32 %444 = OpLoad %443 
                                        bool %445 = OpFOrdLessThan %326 %444 
                                                      OpStore %442 %445 
                                        bool %448 = OpLoad %442 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %453 
                                             %449 = OpLabel 
                                       f32_4 %451 = OpLoad %95 
                                       f32_3 %452 = OpVectorShuffle %451 %451 0 1 2 
                                                      OpStore %447 %452 
                                                      OpBranch %450 
                                             %453 = OpLabel 
                                       f32_4 %454 = OpLoad %146 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                                      OpStore %447 %455 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                                       f32_3 %456 = OpLoad %447 
                                       f32_4 %457 = OpLoad %83 
                                       f32_4 %458 = OpVectorShuffle %457 %456 4 5 6 3 
                                                      OpStore %83 %458 
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