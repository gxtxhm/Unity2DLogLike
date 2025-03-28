//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/PlayerShaderEevee" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_OverrideColor ("Override Color", Color) = (1,1,1,0)
_FlatColor ("Flat Color", Color) = (0.2,0.3,1,0)
_EeveeTex ("EeveeTex", 2D) = "white" { }
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
  GpuProgramID 3136
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
uniform  sampler2D _EeveeTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat16_2;
vec4 u_xlat10_2;
bvec3 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat8;
vec2 u_xlat10;
float u_xlat12;
bool u_xlatb12;
float u_xlat14;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = (-u_xlat10_0.xyz) * vs_COLOR0.xyz + _OverrideColor.xyz;
    u_xlat0.xyz = _OverrideColor.www * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = u_xlat10_0.w * vs_COLOR0.w + -0.100000001;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xy = vs_TEXCOORD1.xy * vec2(16.0, 16.0);
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat3.xyz = _Time.yyy * vec3(256.0, 170.666672, 4.0);
    u_xlat10.xy = floor(u_xlat3.xy);
    u_xlat10.xy = u_xlat10.xy * vec2(0.001953125, 0.001953125);
    u_xlat2.xy = u_xlat2.xy * vec2(0.0416666679, 0.0416666679) + u_xlat10.xy;
    u_xlat10_2 = texture(_EeveeTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(11.0, 11.0, 11.0);
    u_xlat16_2.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.35000002, 1.35000002, 1.35000002);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat12 = sin(u_xlat3.z);
    u_xlat12 = u_xlat12 + 1.0;
    u_xlat12 = u_xlat12 * 0.375 + 1.0;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat16_2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 + -0.400000006;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.25, 1.25, 1.25);
    u_xlat0.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * 0.669999957 + 0.330000013;
    u_xlat2.x = sin(_Time.z);
    u_xlat2.x = u_xlat2.x * 0.25 + 1.75;
    u_xlat2.xyz = u_xlat2.xxx * _FlatColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat12) + (-u_xlat0.xyz);
    u_xlat0.xyz = _FlatColor.www * u_xlat2.xyz + u_xlat0.xyz;
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _SpecialFlags.xyzx).xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat14 = max(u_xlat12, 0.300000012);
    u_xlat3.x = dot(_FlatColor.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat12 = u_xlat12 + (-u_xlat14);
    u_xlat12 = u_xlat3.x * u_xlat12 + u_xlat14;
    u_xlat12 = u_xlat12 * 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(3.0, 3.0, 3.0);
    u_xlat12 = min(vs_TEXCOORD1.y, 0.800000012);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat3.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat0.xyz = (u_xlatb2.x) ? u_xlat3.xyz : u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat12 = u_xlat12 * 0.699999988;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.xyz = (u_xlatb2.y) ? vec3(u_xlat12) : u_xlat0.xyz;
    if(u_xlatb2.z){
        u_xlatb0 = u_xlat1.y>=u_xlat1.z;
        u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
        u_xlat2.xy = u_xlat1.zy;
        u_xlat2.z = float(-1.0);
        u_xlat2.w = float(0.666666687);
        u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(-1.0);
        u_xlat0 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
        u_xlatb2.x = u_xlat1.x>=u_xlat0.x;
        u_xlat2.x = u_xlatb2.x ? 1.0 : float(0.0);
        u_xlat3.xyz = u_xlat0.xyw;
        u_xlat3.w = u_xlat1.x;
        u_xlat0.xyw = u_xlat3.wyx;
        u_xlat0 = (-u_xlat3) + u_xlat0;
        u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat3;
        u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
        u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
        u_xlat4.x = (-u_xlat0.y) + u_xlat0.w;
        u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-010;
        u_xlat4.x = u_xlat4.x / u_xlat12;
        u_xlat4.x = u_xlat4.x + u_xlat0.z;
        u_xlat8 = u_xlat0.x + 1.00000001e-010;
        u_xlat8 = u_xlat2.x / u_xlat8;
        u_xlat8 = u_xlat8 * 0.5;
        u_xlat2.xyz = abs(u_xlat4.xxx) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
        u_xlat1.xyz = u_xlat0.xyz * vec3(0.899999976, 0.899999976, 0.899999976) + vec3(0.0, 0.0, 0.300000012);
    //ENDIF
    }
    SV_Target0 = u_xlat1;
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
; Bound: 577
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %23 %81 %574 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %9 RelaxedPrecision 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %20 RelaxedPrecision 
                                                      OpDecorate %21 RelaxedPrecision 
                                                      OpDecorate %23 RelaxedPrecision 
                                                      OpDecorate %23 Location 23 
                                                      OpDecorate %24 RelaxedPrecision 
                                                      OpDecorate %25 RelaxedPrecision 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate %32 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpMemberDecorate %35 0 Offset 35 
                                                      OpMemberDecorate %35 1 RelaxedPrecision 
                                                      OpMemberDecorate %35 1 Offset 35 
                                                      OpMemberDecorate %35 2 RelaxedPrecision 
                                                      OpMemberDecorate %35 2 Offset 35 
                                                      OpMemberDecorate %35 3 Offset 35 
                                                      OpDecorate %35 Block 
                                                      OpDecorate %37 DescriptorSet 37 
                                                      OpDecorate %37 Binding 37 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %43 RelaxedPrecision 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %48 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %50 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %61 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %64 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %81 Location 81 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %123 DescriptorSet 123 
                                                      OpDecorate %123 Binding 123 
                                                      OpDecorate %124 RelaxedPrecision 
                                                      OpDecorate %128 RelaxedPrecision 
                                                      OpDecorate %131 RelaxedPrecision 
                                                      OpDecorate %132 RelaxedPrecision 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %136 RelaxedPrecision 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %143 RelaxedPrecision 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %353 SpecId 353 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %385 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %417 RelaxedPrecision 
                                                      OpDecorate %418 RelaxedPrecision 
                                                      OpDecorate %422 RelaxedPrecision 
                                                      OpDecorate %449 RelaxedPrecision 
                                                      OpDecorate %574 RelaxedPrecision 
                                                      OpDecorate %574 Location 574 
                                                      OpDecorate %575 RelaxedPrecision 
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
                                              %22 = OpTypePointer Input %7 
                                 Input f32_4* %23 = OpVariable Input 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypePointer Private %26 
                               Private f32_3* %28 = OpVariable Private 
                                              %35 = OpTypeStruct %7 %7 %7 %7 
                                              %36 = OpTypePointer Uniform %35 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %37 = OpVariable Uniform 
                                              %38 = OpTypeInt 32 1 
                                          i32 %39 = OpConstant 1 
                                              %40 = OpTypePointer Uniform %7 
                                              %53 = OpTypePointer Private %6 
                                 Private f32* %54 = OpVariable Private 
                                              %55 = OpTypeInt 32 0 
                                          u32 %56 = OpConstant 3 
                                              %59 = OpTypePointer Input %6 
                                          f32 %63 = OpConstant 3.67402E-40 
                                              %65 = OpTypeBool 
                                              %66 = OpTypePointer Private %65 
                                Private bool* %67 = OpVariable Private 
                                          f32 %69 = OpConstant 3.67402E-40 
                                          i32 %72 = OpConstant 0 
                                          i32 %74 = OpConstant -1 
                               Private f32_4* %80 = OpVariable Private 
                                 Input f32_4* %81 = OpVariable Input 
                                          f32 %84 = OpConstant 3.67402E-40 
                                        f32_2 %85 = OpConstantComposite %84 %84 
                               Private f32_4* %94 = OpVariable Private 
                                          f32 %98 = OpConstant 3.67402E-40 
                                          f32 %99 = OpConstant 3.67402E-40 
                                         f32 %100 = OpConstant 3.67402E-40 
                                       f32_3 %101 = OpConstantComposite %98 %99 %100 
                                             %105 = OpTypePointer Private %15 
                              Private f32_2* %106 = OpVariable Private 
                                         f32 %111 = OpConstant 3.67402E-40 
                                       f32_2 %112 = OpConstantComposite %111 %111 
                                         f32 %116 = OpConstant 3.67402E-40 
                                       f32_2 %117 = OpConstantComposite %116 %116 
 UniformConstant read_only Texture2DSampled* %123 = OpVariable UniformConstant 
                              Private f32_3* %131 = OpVariable Private 
                                         f32 %134 = OpConstant 3.67402E-40 
                                       f32_3 %135 = OpConstantComposite %134 %134 %134 
                                         f32 %140 = OpConstant 3.67402E-40 
                                       f32_3 %141 = OpConstantComposite %140 %140 %140 
                                         u32 %145 = OpConstant 2 
                                         u32 %149 = OpConstant 0 
                                         f32 %153 = OpConstant 3.67402E-40 
                                         f32 %158 = OpConstant 3.67402E-40 
                                         f32 %170 = OpConstant 3.67402E-40 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         f32 %172 = OpConstant 3.67402E-40 
                                       f32_3 %173 = OpConstantComposite %170 %171 %172 
                                         f32 %176 = OpConstant 3.67402E-40 
                               Private bool* %178 = OpVariable Private 
                                         f32 %190 = OpConstant 3.67402E-40 
                                       f32_3 %191 = OpConstantComposite %190 %190 %190 
                                         f32 %203 = OpConstant 3.67402E-40 
                                         f32 %205 = OpConstant 3.67402E-40 
                                             %207 = OpTypePointer Uniform %6 
                                         f32 %214 = OpConstant 3.67402E-40 
                                         f32 %216 = OpConstant 3.67402E-40 
                                         i32 %221 = OpConstant 2 
                                             %248 = OpTypeVector %65 3 
                                             %249 = OpTypePointer Private %248 
                             Private bool_3* %250 = OpVariable Private 
                                         f32 %251 = OpConstant 3.67402E-40 
                                       f32_4 %252 = OpConstantComposite %251 %251 %251 %69 
                                         i32 %253 = OpConstant 3 
                                             %257 = OpTypeVector %65 4 
                                Private f32* %264 = OpVariable Private 
                                         f32 %267 = OpConstant 3.67402E-40 
                                Private f32* %269 = OpVariable Private 
                                Private f32* %277 = OpVariable Private 
                                         f32 %289 = OpConstant 3.67402E-40 
                              Private f32_3* %294 = OpVariable Private 
                                       f32_3 %301 = OpConstantComposite %289 %289 %289 
                                Private f32* %303 = OpVariable Private 
                                         u32 %304 = OpConstant 1 
                                         f32 %307 = OpConstant 3.67402E-40 
                                             %315 = OpTypePointer Function %26 
                                         f32 %329 = OpConstant 3.67402E-40 
                                        bool %346 = OpConstantFalse 
                                        bool %353 = OpSpecConstantFalse 
                                             %361 = OpTypePointer Function %6 
                              Private f32_2* %369 = OpVariable Private 
                                         f32 %377 = OpConstant 3.67402E-40 
                              Private f32_4* %379 = OpVariable Private 
                                         f32 %394 = OpConstant 3.67402E-40 
                                       f32_2 %395 = OpConstantComposite %377 %394 
                              Private f32_4* %420 = OpVariable Private 
                              Private f32_3* %434 = OpVariable Private 
                                         f32 %474 = OpConstant 3.67402E-40 
                                         f32 %476 = OpConstant 3.67402E-40 
                                         f32 %508 = OpConstant 3.67402E-40 
                                       f32_3 %509 = OpConstantComposite %153 %394 %508 
                                       f32_3 %520 = OpConstantComposite %474 %474 %474 
                                         f32 %522 = OpConstant 3.67402E-40 
                                       f32_3 %523 = OpConstantComposite %522 %522 %522 
                                       f32_3 %530 = OpConstantComposite %377 %377 %377 
                                       f32_3 %551 = OpConstantComposite %153 %153 %153 
                              Private f32_3* %562 = OpVariable Private 
                                         f32 %565 = OpConstant 3.67402E-40 
                                       f32_3 %566 = OpConstantComposite %565 %565 %565 
                                       f32_3 %568 = OpConstantComposite %69 %69 %267 
                                             %573 = OpTypePointer Output %7 
                               Output f32_4* %574 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %316 = OpVariable Function 
                             Function f32_3* %334 = OpVariable Function 
                               Function f32* %362 = OpVariable Function 
                               Function f32* %404 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                        f32_4 %21 = OpLoad %9 
                                        f32_4 %24 = OpLoad %23 
                                        f32_4 %25 = OpFMul %21 %24 
                                                      OpStore %20 %25 
                                        f32_4 %29 = OpLoad %9 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                                        f32_3 %31 = OpFNegate %30 
                                        f32_4 %32 = OpLoad %23 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_3 %34 = OpFMul %31 %33 
                               Uniform f32_4* %41 = OpAccessChain %37 %39 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                                        f32_3 %44 = OpFAdd %34 %43 
                                                      OpStore %28 %44 
                               Uniform f32_4* %45 = OpAccessChain %37 %39 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 3 3 3 
                                        f32_3 %48 = OpLoad %28 
                                        f32_3 %49 = OpFMul %47 %48 
                                        f32_4 %50 = OpLoad %20 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                                      OpStore %28 %52 
                                 Private f32* %57 = OpAccessChain %9 %56 
                                          f32 %58 = OpLoad %57 
                                   Input f32* %60 = OpAccessChain %23 %56 
                                          f32 %61 = OpLoad %60 
                                          f32 %62 = OpFMul %58 %61 
                                          f32 %64 = OpFAdd %62 %63 
                                                      OpStore %54 %64 
                                          f32 %68 = OpLoad %54 
                                         bool %70 = OpFOrdLessThan %68 %69 
                                                      OpStore %67 %70 
                                         bool %71 = OpLoad %67 
                                          i32 %73 = OpSelect %71 %39 %72 
                                          i32 %75 = OpIMul %73 %74 
                                         bool %76 = OpINotEqual %75 %72 
                                                      OpSelectionMerge %78 None 
                                                      OpBranchConditional %76 %77 %78 
                                              %77 = OpLabel 
                                                      OpKill
                                              %78 = OpLabel 
                                        f32_4 %82 = OpLoad %81 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_2 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %80 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 2 3 
                                                      OpStore %80 %88 
                                        f32_4 %89 = OpLoad %80 
                                        f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                        f32_2 %91 = OpExtInst %1 8 %90 
                                        f32_4 %92 = OpLoad %80 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 2 3 
                                                      OpStore %80 %93 
                               Uniform f32_4* %95 = OpAccessChain %37 %72 
                                        f32_4 %96 = OpLoad %95 
                                        f32_3 %97 = OpVectorShuffle %96 %96 1 1 1 
                                       f32_3 %102 = OpFMul %97 %101 
                                       f32_4 %103 = OpLoad %94 
                                       f32_4 %104 = OpVectorShuffle %103 %102 4 5 6 3 
                                                      OpStore %94 %104 
                                       f32_4 %107 = OpLoad %94 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 8 %108 
                                                      OpStore %106 %109 
                                       f32_2 %110 = OpLoad %106 
                                       f32_2 %113 = OpFMul %110 %112 
                                                      OpStore %106 %113 
                                       f32_4 %114 = OpLoad %80 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %118 = OpFMul %115 %117 
                                       f32_2 %119 = OpLoad %106 
                                       f32_2 %120 = OpFAdd %118 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 2 3 
                                                      OpStore %80 %122 
                  read_only Texture2DSampled %124 = OpLoad %123 
                                       f32_4 %125 = OpLoad %80 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                                       f32_4 %127 = OpImageSampleImplicitLod %124 %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 2 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                                      OpStore %9 %130 
                                       f32_4 %132 = OpLoad %9 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %136 = OpFMul %133 %135 
                                                      OpStore %131 %136 
                                       f32_3 %137 = OpLoad %131 
                                       f32_3 %138 = OpExtInst %1 30 %137 
                                                      OpStore %131 %138 
                                       f32_3 %139 = OpLoad %131 
                                       f32_3 %142 = OpFMul %139 %141 
                                                      OpStore %131 %142 
                                       f32_3 %143 = OpLoad %131 
                                       f32_3 %144 = OpExtInst %1 29 %143 
                                                      OpStore %131 %144 
                                Private f32* %146 = OpAccessChain %94 %145 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpExtInst %1 13 %147 
                                Private f32* %150 = OpAccessChain %80 %149 
                                                      OpStore %150 %148 
                                Private f32* %151 = OpAccessChain %80 %149 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFAdd %152 %153 
                                Private f32* %155 = OpAccessChain %80 %149 
                                                      OpStore %155 %154 
                                Private f32* %156 = OpAccessChain %80 %149 
                                         f32 %157 = OpLoad %156 
                                         f32 %159 = OpFMul %157 %158 
                                         f32 %160 = OpFAdd %159 %153 
                                Private f32* %161 = OpAccessChain %80 %149 
                                                      OpStore %161 %160 
                                       f32_4 %162 = OpLoad %80 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 0 0 
                                       f32_3 %164 = OpLoad %131 
                                       f32_3 %165 = OpFMul %163 %164 
                                       f32_4 %166 = OpLoad %80 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %80 %167 
                                       f32_4 %168 = OpLoad %80 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %174 = OpDot %169 %173 
                                                      OpStore %54 %174 
                                         f32 %175 = OpLoad %54 
                                         f32 %177 = OpFAdd %175 %176 
                                                      OpStore %54 %177 
                                         f32 %179 = OpLoad %54 
                                        bool %180 = OpFOrdLessThan %179 %69 
                                                      OpStore %178 %180 
                                        bool %181 = OpLoad %178 
                                         i32 %182 = OpSelect %181 %39 %72 
                                         i32 %183 = OpIMul %182 %74 
                                        bool %184 = OpINotEqual %183 %72 
                                                      OpSelectionMerge %186 None 
                                                      OpBranchConditional %184 %185 %186 
                                             %185 = OpLabel 
                                                      OpKill
                                             %186 = OpLabel 
                                       f32_4 %188 = OpLoad %80 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %192 = OpFMul %189 %191 
                                                      OpStore %131 %192 
                                       f32_3 %193 = OpLoad %28 
                                         f32 %194 = OpDot %193 %173 
                                Private f32* %195 = OpAccessChain %28 %149 
                                                      OpStore %195 %194 
                                       f32_3 %196 = OpLoad %28 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 0 0 
                                       f32_3 %198 = OpLoad %131 
                                       f32_3 %199 = OpFMul %197 %198 
                                                      OpStore %28 %199 
                                       f32_3 %200 = OpLoad %28 
                                         f32 %201 = OpDot %200 %173 
                                                      OpStore %54 %201 
                                         f32 %202 = OpLoad %54 
                                         f32 %204 = OpFMul %202 %203 
                                         f32 %206 = OpFAdd %204 %205 
                                                      OpStore %54 %206 
                                Uniform f32* %208 = OpAccessChain %37 %72 %145 
                                         f32 %209 = OpLoad %208 
                                         f32 %210 = OpExtInst %1 13 %209 
                                Private f32* %211 = OpAccessChain %80 %149 
                                                      OpStore %211 %210 
                                Private f32* %212 = OpAccessChain %80 %149 
                                         f32 %213 = OpLoad %212 
                                         f32 %215 = OpFMul %213 %214 
                                         f32 %217 = OpFAdd %215 %216 
                                Private f32* %218 = OpAccessChain %80 %149 
                                                      OpStore %218 %217 
                                       f32_4 %219 = OpLoad %80 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 0 0 
                              Uniform f32_4* %222 = OpAccessChain %37 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_3 %224 = OpVectorShuffle %223 %223 0 1 2 
                                       f32_3 %225 = OpFMul %220 %224 
                                       f32_4 %226 = OpLoad %80 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %80 %227 
                                       f32_4 %228 = OpLoad %80 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                         f32 %230 = OpLoad %54 
                                       f32_3 %231 = OpCompositeConstruct %230 %230 %230 
                                       f32_3 %232 = OpFMul %229 %231 
                                       f32_3 %233 = OpLoad %28 
                                       f32_3 %234 = OpFNegate %233 
                                       f32_3 %235 = OpFAdd %232 %234 
                                       f32_4 %236 = OpLoad %80 
                                       f32_4 %237 = OpVectorShuffle %236 %235 4 5 6 3 
                                                      OpStore %80 %237 
                              Uniform f32_4* %238 = OpAccessChain %37 %221 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 3 3 3 
                                       f32_4 %241 = OpLoad %80 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                                       f32_3 %243 = OpFMul %240 %242 
                                       f32_3 %244 = OpLoad %28 
                                       f32_3 %245 = OpFAdd %243 %244 
                                       f32_4 %246 = OpLoad %80 
                                       f32_4 %247 = OpVectorShuffle %246 %245 4 5 6 3 
                                                      OpStore %80 %247 
                              Uniform f32_4* %254 = OpAccessChain %37 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpVectorShuffle %255 %255 0 1 2 0 
                                      bool_4 %258 = OpFOrdLessThan %252 %256 
                                      bool_3 %259 = OpVectorShuffle %258 %258 0 1 2 
                                                      OpStore %250 %259 
                                       f32_4 %260 = OpLoad %80 
                                       f32_3 %261 = OpVectorShuffle %260 %260 0 1 2 
                                         f32 %262 = OpDot %261 %173 
                                Private f32* %263 = OpAccessChain %28 %149 
                                                      OpStore %263 %262 
                                Private f32* %265 = OpAccessChain %28 %149 
                                         f32 %266 = OpLoad %265 
                                         f32 %268 = OpExtInst %1 40 %266 %267 
                                                      OpStore %264 %268 
                              Uniform f32_4* %270 = OpAccessChain %37 %221 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                         f32 %273 = OpDot %272 %173 
                                                      OpStore %269 %273 
                                         f32 %274 = OpLoad %269 
                                         f32 %275 = OpLoad %269 
                                         f32 %276 = OpFAdd %274 %275 
                                                      OpStore %269 %276 
                                         f32 %278 = OpLoad %264 
                                         f32 %279 = OpFNegate %278 
                                Private f32* %280 = OpAccessChain %28 %149 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpFAdd %279 %281 
                                                      OpStore %277 %282 
                                         f32 %283 = OpLoad %269 
                                         f32 %284 = OpLoad %277 
                                         f32 %285 = OpFMul %283 %284 
                                         f32 %286 = OpLoad %264 
                                         f32 %287 = OpFAdd %285 %286 
                                                      OpStore %264 %287 
                                         f32 %288 = OpLoad %264 
                                         f32 %290 = OpFMul %288 %289 
                                                      OpStore %264 %290 
                                         f32 %291 = OpLoad %264 
                                         f32 %292 = OpLoad %264 
                                         f32 %293 = OpFMul %291 %292 
                                                      OpStore %264 %293 
                                         f32 %295 = OpLoad %264 
                                       f32_3 %296 = OpCompositeConstruct %295 %295 %295 
                                       f32_4 %297 = OpLoad %80 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_3 %299 = OpFMul %296 %298 
                                                      OpStore %294 %299 
                                       f32_3 %300 = OpLoad %294 
                                       f32_3 %302 = OpFMul %300 %301 
                                                      OpStore %294 %302 
                                  Input f32* %305 = OpAccessChain %81 %304 
                                         f32 %306 = OpLoad %305 
                                         f32 %308 = OpExtInst %1 37 %306 %307 
                                                      OpStore %303 %308 
                                         f32 %309 = OpLoad %303 
                                         f32 %310 = OpExtInst %1 40 %309 %69 
                                                      OpStore %303 %310 
                                         f32 %311 = OpLoad %303 
                                       f32_3 %312 = OpCompositeConstruct %311 %311 %311 
                                       f32_3 %313 = OpLoad %294 
                                       f32_3 %314 = OpFMul %312 %313 
                                                      OpStore %294 %314 
                                      bool_3 %317 = OpLoad %250 
                                        bool %318 = OpCompositeExtract %317 0 
                                                      OpSelectionMerge %320 None 
                                                      OpBranchConditional %318 %319 %322 
                                             %319 = OpLabel 
                                       f32_3 %321 = OpLoad %294 
                                                      OpStore %316 %321 
                                                      OpBranch %320 
                                             %322 = OpLabel 
                                       f32_4 %323 = OpLoad %80 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                                                      OpStore %316 %324 
                                                      OpBranch %320 
                                             %320 = OpLabel 
                                       f32_3 %325 = OpLoad %316 
                                                      OpStore %28 %325 
                                       f32_3 %326 = OpLoad %28 
                                         f32 %327 = OpDot %326 %173 
                                                      OpStore %54 %327 
                                         f32 %328 = OpLoad %54 
                                         f32 %330 = OpFMul %328 %329 
                                                      OpStore %54 %330 
                                         f32 %331 = OpLoad %54 
                                         f32 %332 = OpLoad %54 
                                         f32 %333 = OpFMul %331 %332 
                                                      OpStore %54 %333 
                                      bool_3 %335 = OpLoad %250 
                                        bool %336 = OpCompositeExtract %335 1 
                                                      OpSelectionMerge %338 None 
                                                      OpBranchConditional %336 %337 %341 
                                             %337 = OpLabel 
                                         f32 %339 = OpLoad %54 
                                       f32_3 %340 = OpCompositeConstruct %339 %339 %339 
                                                      OpStore %334 %340 
                                                      OpBranch %338 
                                             %341 = OpLabel 
                                       f32_3 %342 = OpLoad %28 
                                                      OpStore %334 %342 
                                                      OpBranch %338 
                                             %338 = OpLabel 
                                       f32_3 %343 = OpLoad %334 
                                       f32_4 %344 = OpLoad %20 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 5 6 3 
                                                      OpStore %20 %345 
                                                      OpSelectionMerge %348 None 
                                                      OpBranchConditional %346 %347 %348 
                                             %347 = OpLabel 
                                      bool_3 %349 = OpLoad %250 
                                        bool %350 = OpCompositeExtract %349 2 
                                                      OpSelectionMerge %352 None 
                                                      OpBranchConditional %350 %351 %352 
                                             %351 = OpLabel 
                                                      OpBranch %352 
                                             %352 = OpLabel 
                                                      OpBranch %348 
                                             %348 = OpLabel 
                                                      OpSelectionMerge %355 None 
                                                      OpBranchConditional %353 %354 %355 
                                             %354 = OpLabel 
                                Private f32* %356 = OpAccessChain %20 %304 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %20 %145 
                                         f32 %359 = OpLoad %358 
                                        bool %360 = OpFOrdGreaterThanEqual %357 %359 
                                                      OpStore %67 %360 
                                        bool %363 = OpLoad %67 
                                                      OpSelectionMerge %365 None 
                                                      OpBranchConditional %363 %364 %366 
                                             %364 = OpLabel 
                                                      OpStore %362 %153 
                                                      OpBranch %365 
                                             %366 = OpLabel 
                                                      OpStore %362 %69 
                                                      OpBranch %365 
                                             %365 = OpLabel 
                                         f32 %367 = OpLoad %362 
                                Private f32* %368 = OpAccessChain %80 %149 
                                                      OpStore %368 %367 
                                       f32_4 %370 = OpLoad %20 
                                       f32_2 %371 = OpVectorShuffle %370 %370 2 1 
                                       f32_2 %372 = OpFNegate %371 
                                       f32_4 %373 = OpLoad %20 
                                       f32_2 %374 = OpVectorShuffle %373 %373 1 2 
                                       f32_2 %375 = OpFAdd %372 %374 
                                                      OpStore %369 %375 
                                Private f32* %376 = OpAccessChain %94 %149 
                                                      OpStore %376 %153 
                                Private f32* %378 = OpAccessChain %94 %304 
                                                      OpStore %378 %377 
                                       f32_4 %380 = OpLoad %80 
                                       f32_2 %381 = OpVectorShuffle %380 %380 0 0 
                                       f32_2 %382 = OpLoad %369 
                                       f32_2 %383 = OpFMul %381 %382 
                                       f32_4 %384 = OpLoad %20 
                                       f32_2 %385 = OpVectorShuffle %384 %384 2 1 
                                       f32_2 %386 = OpFAdd %383 %385 
                                       f32_4 %387 = OpLoad %379 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 2 3 
                                                      OpStore %379 %388 
                                       f32_4 %389 = OpLoad %80 
                                       f32_2 %390 = OpVectorShuffle %389 %389 0 0 
                                       f32_4 %391 = OpLoad %94 
                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
                                       f32_2 %393 = OpFMul %390 %392 
                                       f32_2 %396 = OpFAdd %393 %395 
                                       f32_4 %397 = OpLoad %379 
                                       f32_4 %398 = OpVectorShuffle %397 %396 0 1 4 5 
                                                      OpStore %379 %398 
                                Private f32* %399 = OpAccessChain %20 %149 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %379 %149 
                                         f32 %402 = OpLoad %401 
                                        bool %403 = OpFOrdGreaterThanEqual %400 %402 
                                                      OpStore %67 %403 
                                        bool %405 = OpLoad %67 
                                                      OpSelectionMerge %407 None 
                                                      OpBranchConditional %405 %406 %408 
                                             %406 = OpLabel 
                                                      OpStore %404 %153 
                                                      OpBranch %407 
                                             %408 = OpLabel 
                                                      OpStore %404 %69 
                                                      OpBranch %407 
                                             %407 = OpLabel 
                                         f32 %409 = OpLoad %404 
                                Private f32* %410 = OpAccessChain %80 %149 
                                                      OpStore %410 %409 
                                       f32_4 %411 = OpLoad %379 
                                       f32_3 %412 = OpVectorShuffle %411 %411 0 1 3 
                                       f32_3 %413 = OpFNegate %412 
                                       f32_4 %414 = OpLoad %94 
                                       f32_4 %415 = OpVectorShuffle %414 %413 4 5 6 3 
                                                      OpStore %94 %415 
                                Private f32* %416 = OpAccessChain %20 %149 
                                         f32 %417 = OpLoad %416 
                                         f32 %418 = OpFNegate %417 
                                Private f32* %419 = OpAccessChain %94 %56 
                                                      OpStore %419 %418 
                                Private f32* %421 = OpAccessChain %20 %149 
                                         f32 %422 = OpLoad %421 
                                Private f32* %423 = OpAccessChain %94 %149 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFAdd %422 %424 
                                Private f32* %426 = OpAccessChain %420 %149 
                                                      OpStore %426 %425 
                                       f32_4 %427 = OpLoad %379 
                                       f32_3 %428 = OpVectorShuffle %427 %427 1 2 0 
                                       f32_4 %429 = OpLoad %94 
                                       f32_3 %430 = OpVectorShuffle %429 %429 1 2 3 
                                       f32_3 %431 = OpFAdd %428 %430 
                                       f32_4 %432 = OpLoad %420 
                                       f32_4 %433 = OpVectorShuffle %432 %431 0 4 5 6 
                                                      OpStore %420 %433 
                                       f32_4 %435 = OpLoad %80 
                                       f32_3 %436 = OpVectorShuffle %435 %435 0 0 0 
                                       f32_4 %437 = OpLoad %420 
                                       f32_3 %438 = OpVectorShuffle %437 %437 0 1 2 
                                       f32_3 %439 = OpFMul %436 %438 
                                       f32_4 %440 = OpLoad %379 
                                       f32_3 %441 = OpVectorShuffle %440 %440 0 1 3 
                                       f32_3 %442 = OpFAdd %439 %441 
                                                      OpStore %434 %442 
                                Private f32* %443 = OpAccessChain %80 %149 
                                         f32 %444 = OpLoad %443 
                                Private f32* %445 = OpAccessChain %420 %56 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFMul %444 %446 
                                Private f32* %448 = OpAccessChain %20 %149 
                                         f32 %449 = OpLoad %448 
                                         f32 %450 = OpFAdd %447 %449 
                                Private f32* %451 = OpAccessChain %80 %149 
                                                      OpStore %451 %450 
                                Private f32* %452 = OpAccessChain %434 %304 
                                         f32 %453 = OpLoad %452 
                                Private f32* %454 = OpAccessChain %80 %149 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpExtInst %1 37 %453 %455 
                                Private f32* %457 = OpAccessChain %94 %149 
                                                      OpStore %457 %456 
                                Private f32* %458 = OpAccessChain %434 %149 
                                         f32 %459 = OpLoad %458 
                                Private f32* %460 = OpAccessChain %94 %149 
                                         f32 %461 = OpLoad %460 
                                         f32 %462 = OpFNegate %461 
                                         f32 %463 = OpFAdd %459 %462 
                                Private f32* %464 = OpAccessChain %94 %149 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %434 %304 
                                         f32 %466 = OpLoad %465 
                                         f32 %467 = OpFNegate %466 
                                Private f32* %468 = OpAccessChain %80 %149 
                                         f32 %469 = OpLoad %468 
                                         f32 %470 = OpFAdd %467 %469 
                                Private f32* %471 = OpAccessChain %80 %149 
                                                      OpStore %471 %470 
                                Private f32* %472 = OpAccessChain %94 %149 
                                         f32 %473 = OpLoad %472 
                                         f32 %475 = OpFMul %473 %474 
                                         f32 %477 = OpFAdd %475 %476 
                                Private f32* %478 = OpAccessChain %106 %149 
                                                      OpStore %478 %477 
                                Private f32* %479 = OpAccessChain %80 %149 
                                         f32 %480 = OpLoad %479 
                                Private f32* %481 = OpAccessChain %106 %149 
                                         f32 %482 = OpLoad %481 
                                         f32 %483 = OpFDiv %480 %482 
                                Private f32* %484 = OpAccessChain %80 %149 
                                                      OpStore %484 %483 
                                Private f32* %485 = OpAccessChain %80 %149 
                                         f32 %486 = OpLoad %485 
                                Private f32* %487 = OpAccessChain %434 %145 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFAdd %486 %488 
                                Private f32* %490 = OpAccessChain %80 %149 
                                                      OpStore %490 %489 
                                Private f32* %491 = OpAccessChain %434 %149 
                                         f32 %492 = OpLoad %491 
                                         f32 %493 = OpFAdd %492 %476 
                                Private f32* %494 = OpAccessChain %106 %149 
                                                      OpStore %494 %493 
                                Private f32* %495 = OpAccessChain %94 %149 
                                         f32 %496 = OpLoad %495 
                                Private f32* %497 = OpAccessChain %106 %149 
                                         f32 %498 = OpLoad %497 
                                         f32 %499 = OpFDiv %496 %498 
                                Private f32* %500 = OpAccessChain %106 %149 
                                                      OpStore %500 %499 
                                Private f32* %501 = OpAccessChain %106 %149 
                                         f32 %502 = OpLoad %501 
                                         f32 %503 = OpFMul %502 %251 
                                Private f32* %504 = OpAccessChain %106 %149 
                                                      OpStore %504 %503 
                                       f32_4 %505 = OpLoad %80 
                                       f32_3 %506 = OpVectorShuffle %505 %505 0 0 0 
                                       f32_3 %507 = OpExtInst %1 4 %506 
                                       f32_3 %510 = OpFAdd %507 %509 
                                       f32_4 %511 = OpLoad %94 
                                       f32_4 %512 = OpVectorShuffle %511 %510 4 5 6 3 
                                                      OpStore %94 %512 
                                       f32_4 %513 = OpLoad %94 
                                       f32_3 %514 = OpVectorShuffle %513 %513 0 1 2 
                                       f32_3 %515 = OpExtInst %1 10 %514 
                                       f32_4 %516 = OpLoad %94 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %94 %517 
                                       f32_4 %518 = OpLoad %94 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                       f32_3 %521 = OpFMul %519 %520 
                                       f32_3 %524 = OpFAdd %521 %523 
                                       f32_4 %525 = OpLoad %94 
                                       f32_4 %526 = OpVectorShuffle %525 %524 4 5 6 3 
                                                      OpStore %94 %526 
                                       f32_4 %527 = OpLoad %94 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %529 = OpExtInst %1 4 %528 
                                       f32_3 %531 = OpFAdd %529 %530 
                                       f32_4 %532 = OpLoad %94 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 5 6 3 
                                                      OpStore %94 %533 
                                       f32_4 %534 = OpLoad %94 
                                       f32_3 %535 = OpVectorShuffle %534 %534 0 1 2 
                                       f32_3 %536 = OpCompositeConstruct %69 %69 %69 
                                       f32_3 %537 = OpCompositeConstruct %153 %153 %153 
                                       f32_3 %538 = OpExtInst %1 43 %535 %536 %537 
                                       f32_4 %539 = OpLoad %94 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %94 %540 
                                       f32_4 %541 = OpLoad %94 
                                       f32_3 %542 = OpVectorShuffle %541 %541 0 1 2 
                                       f32_3 %543 = OpFAdd %542 %530 
                                       f32_4 %544 = OpLoad %94 
                                       f32_4 %545 = OpVectorShuffle %544 %543 4 5 6 3 
                                                      OpStore %94 %545 
                                       f32_2 %546 = OpLoad %106 
                                       f32_3 %547 = OpVectorShuffle %546 %546 0 0 0 
                                       f32_4 %548 = OpLoad %94 
                                       f32_3 %549 = OpVectorShuffle %548 %548 0 1 2 
                                       f32_3 %550 = OpFMul %547 %549 
                                       f32_3 %552 = OpFAdd %550 %551 
                                       f32_4 %553 = OpLoad %80 
                                       f32_4 %554 = OpVectorShuffle %553 %552 4 1 5 6 
                                                      OpStore %80 %554 
                                       f32_4 %555 = OpLoad %80 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 2 3 
                                       f32_3 %557 = OpLoad %434 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 0 0 
                                       f32_3 %559 = OpFMul %556 %558 
                                       f32_4 %560 = OpLoad %80 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %80 %561 
                                       f32_4 %563 = OpLoad %80 
                                       f32_3 %564 = OpVectorShuffle %563 %563 0 1 2 
                                       f32_3 %567 = OpFMul %564 %566 
                                       f32_3 %569 = OpFAdd %567 %568 
                                                      OpStore %562 %569 
                                       f32_3 %570 = OpLoad %562 
                                       f32_4 %571 = OpLoad %20 
                                       f32_4 %572 = OpVectorShuffle %571 %570 4 5 6 3 
                                                      OpStore %20 %572 
                                                      OpBranch %355 
                                             %355 = OpLabel 
                                       f32_4 %575 = OpLoad %20 
                                                      OpStore %574 %575 
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