//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/TilemapClampCutout" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
[Toggle] _Perpendicular ("Is Perpendicular Tilt", Float) = 1
_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5
_ValueMaximum ("Max Value", Float) = 1
_ValueMinimum ("Min value", Float) = 0.5
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" "SHADOWSUPPORT" = "true" }
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 50373
Program "vp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xyz = vec3(0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5 = u_xlat5 / u_xlat13;
    u_xlat5 = u_xlat5 + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(vec3(u_xlat5)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 189
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %111 %123 %124 %138 %167 %173 %176 %178 %181 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %167 Location 167 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %181 Location 181 
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
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                             %108 = OpTypeArray %6 %43 
                                             %109 = OpTypeStruct %7 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %7 
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                               Output f32_2* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                         i32 %127 = OpConstant 5 
                                             %136 = OpTypeVector %6 3 
                                             %137 = OpTypePointer Input %136 
                                Input f32_3* %138 = OpVariable Input 
                                         u32 %156 = OpConstant 2 
                                Private f32* %158 = OpVariable Private 
                                             %166 = OpTypePointer Output %136 
                               Output f32_3* %167 = OpVariable Output 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                                         f32 %179 = OpConstant 3.67402E-40 
                                       f32_4 %180 = OpConstantComposite %179 %179 %179 %179 
                               Output f32_3* %181 = OpVariable Output 
                                       f32_3 %182 = OpConstantComposite %179 %179 %179 
                                             %183 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %78 = OpAccessChain %17 %55 %23 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                               Uniform f32_4* %81 = OpAccessChain %17 %55 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %42 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %89 = OpLoad %76 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %17 %68 %56 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpFMul %90 %92 
                                                      OpStore %88 %93 
                               Uniform f32_4* %94 = OpAccessChain %17 %68 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %88 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %17 %68 %68 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpLoad %76 
                                       f32_4 %104 = OpVectorShuffle %103 %103 2 2 2 2 
                                       f32_4 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpFAdd %105 %106 
                                                      OpStore %88 %107 
                              Uniform f32_4* %112 = OpAccessChain %17 %68 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %76 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %55 
                                                      OpStore %120 %118 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                              Uniform f32_4* %128 = OpAccessChain %17 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %17 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore %123 %135 
                                       f32_3 %139 = OpLoad %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %56 %55 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                         f32 %143 = OpDot %139 %142 
                                Private f32* %144 = OpAccessChain %76 %27 
                                                      OpStore %144 %143 
                                       f32_3 %145 = OpLoad %138 
                              Uniform f32_4* %146 = OpAccessChain %17 %56 %56 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %145 %148 
                                Private f32* %150 = OpAccessChain %76 %43 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %138 
                              Uniform f32_4* %152 = OpAccessChain %17 %56 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %157 = OpAccessChain %76 %156 
                                                      OpStore %157 %155 
                                       f32_4 %159 = OpLoad %76 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_4 %161 = OpLoad %76 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %160 %162 
                                                      OpStore %158 %163 
                                         f32 %164 = OpLoad %158 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %158 %165 
                                         f32 %168 = OpLoad %158 
                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
                                       f32_4 %170 = OpLoad %76 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                                      OpStore %167 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                                      OpStore %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                                      OpStore %176 %177 
                                                      OpStore %178 %180 
                                                      OpStore %181 %182 
                                 Output f32* %184 = OpAccessChain %111 %55 %43 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFNegate %185 
                                 Output f32* %187 = OpAccessChain %111 %55 %43 
                                                      OpStore %187 %186 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 435
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %68 %198 %427 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %59 SpecId 59 
                                                      OpDecorate %68 Location 68 
                                                      OpDecorate %160 DescriptorSet 160 
                                                      OpDecorate %160 Binding 160 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %198 Location 198 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %427 Location 427 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                                          u32 %41 = OpConstant 4 
                                              %42 = OpTypeArray %7 %41 
                                              %43 = OpTypeVector %6 3 
                                              %44 = OpTypeStruct %7 %7 %42 %43 %43 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %46 = OpVariable Uniform 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Uniform %6 
                                          f32 %51 = OpConstant 3.67402E-40 
                                         bool %53 = OpConstantFalse 
                                         bool %59 = OpSpecConstantFalse 
                                          u32 %62 = OpConstant 1 
                               Private f32_4* %66 = OpVariable Private 
                                              %67 = OpTypePointer Input %43 
                                 Input f32_3* %68 = OpVariable Input 
                                          i32 %71 = OpConstant 2 
                                              %72 = OpTypePointer Uniform %7 
                                         i32 %103 = OpConstant 3 
                                             %110 = OpTypePointer Function %43 
                                         i32 %124 = OpConstant 4 
                                             %125 = OpTypePointer Uniform %43 
                                Private f32* %139 = OpVariable Private 
                                         f32 %142 = OpConstant 3.67402E-40 
                                         f32 %144 = OpConstant 3.67402E-40 
                                Private f32* %146 = OpVariable Private 
                                         u32 %147 = OpConstant 2 
                                         f32 %150 = OpConstant 3.67402E-40 
                                             %157 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %158 = OpTypeSampledImage %157 
                                             %159 = OpTypePointer UniformConstant %158 
 UniformConstant read_only Texture3DSampled* %160 = OpVariable UniformConstant 
                              Private f32_4* %165 = OpVariable Private 
                                             %172 = OpTypePointer Private %43 
                              Private f32_3* %173 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                Input f32_3* %198 = OpVariable Input 
                                             %208 = OpTypePointer Function %6 
                                             %215 = OpTypePointer Private %15 
                              Private f32_2* %216 = OpVariable Private 
                              Private f32_2* %223 = OpVariable Private 
                                         f32 %225 = OpConstant 3.67402E-40 
                                         f32 %240 = OpConstant 3.67402E-40 
                                       f32_2 %241 = OpConstantComposite %225 %240 
                              Private f32_4* %256 = OpVariable Private 
                              Private f32_4* %266 = OpVariable Private 
                                Private f32* %297 = OpVariable Private 
                                Private f32* %312 = OpVariable Private 
                                         f32 %314 = OpConstant 3.67402E-40 
                                         f32 %316 = OpConstant 3.67402E-40 
                               Private bool* %334 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                               Private bool* %362 = OpVariable Private 
                                Private f32* %368 = OpVariable Private 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_3 %394 = OpConstantComposite %51 %240 %393 
                                       f32_3 %399 = OpConstantComposite %314 %314 %314 
                                         f32 %401 = OpConstant 3.67402E-40 
                                       f32_3 %402 = OpConstantComposite %401 %401 %401 
                                       f32_3 %406 = OpConstantComposite %225 %225 %225 
                                       f32_3 %418 = OpConstantComposite %51 %51 %51 
                                             %426 = OpTypePointer Output %7 
                               Output f32_4* %427 = OpVariable Output 
                                             %432 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                               Function f32* %209 = OpVariable Function 
                               Function f32* %250 = OpVariable Function 
                               Function f32* %340 = OpVariable Function 
                               Function f32* %369 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %46 %33 %47 
                                          f32 %50 = OpLoad %49 
                                         bool %52 = OpFOrdEqual %50 %51 
                                                      OpStore %22 %52 
                                                      OpSelectionMerge %55 None 
                                                      OpBranchConditional %53 %54 %55 
                                              %54 = OpLabel 
                                         bool %56 = OpLoad %22 
                                                      OpSelectionMerge %58 None 
                                                      OpBranchConditional %56 %57 %58 
                                              %57 = OpLabel 
                                                      OpBranch %58 
                                              %58 = OpLabel 
                                                      OpBranch %55 
                                              %55 = OpLabel 
                                                      OpSelectionMerge %61 None 
                                                      OpBranchConditional %59 %60 %167 
                                              %60 = OpLabel 
                                 Uniform f32* %63 = OpAccessChain %46 %33 %62 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdEqual %64 %51 
                                                      OpStore %22 %65 
                                        f32_3 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 1 1 1 
                               Uniform f32_4* %73 = OpAccessChain %46 %71 %33 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %70 %75 
                                        f32_4 %77 = OpLoad %66 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %66 %78 
                               Uniform f32_4* %79 = OpAccessChain %46 %71 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %68 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 0 0 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %66 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %66 %89 
                               Uniform f32_4* %90 = OpAccessChain %46 %71 %71 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpLoad %68 
                                        f32_3 %94 = OpVectorShuffle %93 %93 2 2 2 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %66 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %95 %97 
                                        f32_4 %99 = OpLoad %66 
                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                                      OpStore %66 %100 
                                       f32_4 %101 = OpLoad %66 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %104 = OpAccessChain %46 %71 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %102 %106 
                                       f32_4 %108 = OpLoad %66 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %66 %109 
                                        bool %112 = OpLoad %22 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %117 
                                             %113 = OpLabel 
                                       f32_4 %115 = OpLoad %66 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                                      OpStore %111 %116 
                                                      OpBranch %114 
                                             %117 = OpLabel 
                                       f32_3 %118 = OpLoad %68 
                                                      OpStore %111 %118 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %119 = OpLoad %111 
                                       f32_4 %120 = OpLoad %66 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %66 %121 
                                       f32_4 %122 = OpLoad %66 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                              Uniform f32_3* %126 = OpAccessChain %46 %124 
                                       f32_3 %127 = OpLoad %126 
                                       f32_3 %128 = OpFNegate %127 
                                       f32_3 %129 = OpFAdd %123 %128 
                                       f32_4 %130 = OpLoad %66 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %66 %131 
                                       f32_4 %132 = OpLoad %66 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %46 %103 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %66 
                                       f32_4 %138 = OpVectorShuffle %137 %136 0 4 5 6 
                                                      OpStore %66 %138 
                                Private f32* %140 = OpAccessChain %66 %62 
                                         f32 %141 = OpLoad %140 
                                         f32 %143 = OpFMul %141 %142 
                                         f32 %145 = OpFAdd %143 %144 
                                                      OpStore %139 %145 
                                Uniform f32* %148 = OpAccessChain %46 %33 %147 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %152 = OpFAdd %151 %144 
                                                      OpStore %146 %152 
                                         f32 %153 = OpLoad %139 
                                         f32 %154 = OpLoad %146 
                                         f32 %155 = OpExtInst %1 40 %153 %154 
                                Private f32* %156 = OpAccessChain %66 %47 
                                                      OpStore %156 %155 
                  read_only Texture3DSampled %161 = OpLoad %160 
                                       f32_4 %162 = OpLoad %66 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 2 3 
                                       f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                                      OpStore %66 %164 
                                       f32_4 %166 = OpLoad %66 
                                                      OpStore %165 %166 
                                                      OpBranch %61 
                                             %167 = OpLabel 
                                Private f32* %168 = OpAccessChain %165 %47 
                                                      OpStore %168 %51 
                                Private f32* %169 = OpAccessChain %165 %62 
                                                      OpStore %169 %51 
                                Private f32* %170 = OpAccessChain %165 %147 
                                                      OpStore %170 %51 
                                Private f32* %171 = OpAccessChain %165 %24 
                                                      OpStore %171 %51 
                                                      OpBranch %61 
                                              %61 = OpLabel 
                                       f32_4 %174 = OpLoad %165 
                              Uniform f32_4* %175 = OpAccessChain %46 %32 
                                       f32_4 %176 = OpLoad %175 
                                         f32 %177 = OpDot %174 %176 
                                Private f32* %178 = OpAccessChain %173 %47 
                                                      OpStore %178 %177 
                                Private f32* %179 = OpAccessChain %173 %47 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %51 
                                Private f32* %183 = OpAccessChain %173 %47 
                                                      OpStore %183 %182 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %46 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %173 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %173 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %173 
                                       f32_3 %202 = OpFAdd %200 %201 
                                                      OpStore %173 %202 
                                Private f32* %203 = OpAccessChain %173 %62 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %173 %147 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %22 %207 
                                        bool %210 = OpLoad %22 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %213 
                                             %211 = OpLabel 
                                                      OpStore %209 %51 
                                                      OpBranch %212 
                                             %213 = OpLabel 
                                                      OpStore %209 %181 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                         f32 %214 = OpLoad %209 
                                                      OpStore %139 %214 
                                       f32_3 %217 = OpLoad %173 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 1 
                                       f32_2 %219 = OpFNegate %218 
                                       f32_3 %220 = OpLoad %173 
                                       f32_2 %221 = OpVectorShuffle %220 %220 1 2 
                                       f32_2 %222 = OpFAdd %219 %221 
                                                      OpStore %216 %222 
                                Private f32* %224 = OpAccessChain %223 %47 
                                                      OpStore %224 %51 
                                Private f32* %226 = OpAccessChain %223 %62 
                                                      OpStore %226 %225 
                                         f32 %227 = OpLoad %139 
                                       f32_2 %228 = OpCompositeConstruct %227 %227 
                                       f32_2 %229 = OpLoad %216 
                                       f32_2 %230 = OpFMul %228 %229 
                                       f32_3 %231 = OpLoad %173 
                                       f32_2 %232 = OpVectorShuffle %231 %231 2 1 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %66 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %66 %235 
                                         f32 %236 = OpLoad %139 
                                       f32_2 %237 = OpCompositeConstruct %236 %236 
                                       f32_2 %238 = OpLoad %223 
                                       f32_2 %239 = OpFMul %237 %238 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %66 
                                       f32_4 %244 = OpVectorShuffle %243 %242 0 1 4 5 
                                                      OpStore %66 %244 
                                Private f32* %245 = OpAccessChain %173 %47 
                                         f32 %246 = OpLoad %245 
                                Private f32* %247 = OpAccessChain %66 %47 
                                         f32 %248 = OpLoad %247 
                                        bool %249 = OpFOrdGreaterThanEqual %246 %248 
                                                      OpStore %22 %249 
                                        bool %251 = OpLoad %22 
                                                      OpSelectionMerge %253 None 
                                                      OpBranchConditional %251 %252 %254 
                                             %252 = OpLabel 
                                                      OpStore %250 %51 
                                                      OpBranch %253 
                                             %254 = OpLabel 
                                                      OpStore %250 %181 
                                                      OpBranch %253 
                                             %253 = OpLabel 
                                         f32 %255 = OpLoad %250 
                                                      OpStore %139 %255 
                                       f32_4 %257 = OpLoad %66 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 3 
                                       f32_3 %259 = OpFNegate %258 
                                       f32_4 %260 = OpLoad %256 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %256 %261 
                                Private f32* %262 = OpAccessChain %173 %47 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFNegate %263 
                                Private f32* %265 = OpAccessChain %256 %24 
                                                      OpStore %265 %264 
                                Private f32* %267 = OpAccessChain %173 %47 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %256 %47 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFAdd %268 %270 
                                Private f32* %272 = OpAccessChain %266 %47 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %66 
                                       f32_3 %274 = OpVectorShuffle %273 %273 1 2 0 
                                       f32_4 %275 = OpLoad %256 
                                       f32_3 %276 = OpVectorShuffle %275 %275 1 2 3 
                                       f32_3 %277 = OpFAdd %274 %276 
                                       f32_4 %278 = OpLoad %266 
                                       f32_4 %279 = OpVectorShuffle %278 %277 0 4 5 6 
                                                      OpStore %266 %279 
                                         f32 %280 = OpLoad %139 
                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
                                       f32_4 %282 = OpLoad %266 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFMul %281 %283 
                                       f32_4 %285 = OpLoad %66 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 3 
                                       f32_3 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %256 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %256 %289 
                                         f32 %290 = OpLoad %139 
                                Private f32* %291 = OpAccessChain %266 %24 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                Private f32* %294 = OpAccessChain %173 %47 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %293 %295 
                                                      OpStore %139 %296 
                                Private f32* %298 = OpAccessChain %256 %62 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpLoad %139 
                                         f32 %301 = OpExtInst %1 37 %299 %300 
                                                      OpStore %297 %301 
                                         f32 %302 = OpLoad %297 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %256 %47 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFAdd %303 %305 
                                                      OpStore %297 %306 
                                Private f32* %307 = OpAccessChain %256 %62 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFNegate %308 
                                         f32 %310 = OpLoad %139 
                                         f32 %311 = OpFAdd %309 %310 
                                                      OpStore %139 %311 
                                         f32 %313 = OpLoad %297 
                                         f32 %315 = OpFMul %313 %314 
                                         f32 %317 = OpFAdd %315 %316 
                                                      OpStore %312 %317 
                                         f32 %318 = OpLoad %139 
                                         f32 %319 = OpLoad %312 
                                         f32 %320 = OpFDiv %318 %319 
                                                      OpStore %139 %320 
                                         f32 %321 = OpLoad %139 
                                Private f32* %322 = OpAccessChain %256 %147 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFAdd %321 %323 
                                                      OpStore %139 %324 
                                Private f32* %325 = OpAccessChain %256 %47 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpFAdd %326 %316 
                                Private f32* %328 = OpAccessChain %256 %47 
                                                      OpStore %328 %327 
                                         f32 %329 = OpLoad %297 
                                Private f32* %330 = OpAccessChain %256 %47 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFDiv %329 %331 
                                Private f32* %333 = OpAccessChain %256 %47 
                                                      OpStore %333 %332 
                                Private f32* %335 = OpAccessChain %9 %62 
                                         f32 %336 = OpLoad %335 
                                Private f32* %337 = OpAccessChain %9 %147 
                                         f32 %338 = OpLoad %337 
                                        bool %339 = OpFOrdGreaterThanEqual %336 %338 
                                                      OpStore %334 %339 
                                        bool %341 = OpLoad %334 
                                                      OpSelectionMerge %343 None 
                                                      OpBranchConditional %341 %342 %344 
                                             %342 = OpLabel 
                                                      OpStore %340 %51 
                                                      OpBranch %343 
                                             %344 = OpLabel 
                                                      OpStore %340 %181 
                                                      OpBranch %343 
                                             %343 = OpLabel 
                                         f32 %345 = OpLoad %340 
                                                      OpStore %312 %345 
                                Private f32* %347 = OpAccessChain %9 %147 
                                         f32 %348 = OpLoad %347 
                                         f32 %349 = OpFNegate %348 
                                Private f32* %350 = OpAccessChain %9 %62 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %349 %351 
                                Private f32* %353 = OpAccessChain %346 %47 
                                                      OpStore %353 %352 
                                         f32 %354 = OpLoad %312 
                                Private f32* %355 = OpAccessChain %346 %47 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFMul %354 %356 
                                Private f32* %358 = OpAccessChain %9 %147 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %346 %47 
                                                      OpStore %361 %360 
                                Private f32* %363 = OpAccessChain %9 %47 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %346 %47 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdGreaterThanEqual %364 %366 
                                                      OpStore %362 %367 
                                        bool %370 = OpLoad %362 
                                                      OpSelectionMerge %372 None 
                                                      OpBranchConditional %370 %371 %373 
                                             %371 = OpLabel 
                                                      OpStore %369 %51 
                                                      OpBranch %372 
                                             %373 = OpLabel 
                                                      OpStore %369 %181 
                                                      OpBranch %372 
                                             %372 = OpLabel 
                                         f32 %374 = OpLoad %369 
                                                      OpStore %368 %374 
                                Private f32* %375 = OpAccessChain %346 %47 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Private f32* %378 = OpAccessChain %9 %47 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFAdd %377 %379 
                                Private f32* %381 = OpAccessChain %9 %47 
                                                      OpStore %381 %380 
                                         f32 %382 = OpLoad %368 
                                Private f32* %383 = OpAccessChain %9 %47 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFMul %382 %384 
                                Private f32* %386 = OpAccessChain %346 %47 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                Private f32* %389 = OpAccessChain %9 %47 
                                                      OpStore %389 %388 
                                         f32 %390 = OpLoad %139 
                                       f32_3 %391 = OpCompositeConstruct %390 %390 %390 
                                       f32_3 %392 = OpExtInst %1 4 %391 
                                       f32_3 %395 = OpFAdd %392 %394 
                                                      OpStore %346 %395 
                                       f32_3 %396 = OpLoad %346 
                                       f32_3 %397 = OpExtInst %1 10 %396 
                                                      OpStore %346 %397 
                                       f32_3 %398 = OpLoad %346 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_3 %403 = OpFAdd %400 %402 
                                                      OpStore %346 %403 
                                       f32_3 %404 = OpLoad %346 
                                       f32_3 %405 = OpExtInst %1 4 %404 
                                       f32_3 %407 = OpFAdd %405 %406 
                                                      OpStore %346 %407 
                                       f32_3 %408 = OpLoad %346 
                                       f32_3 %409 = OpCompositeConstruct %181 %181 %181 
                                       f32_3 %410 = OpCompositeConstruct %51 %51 %51 
                                       f32_3 %411 = OpExtInst %1 43 %408 %409 %410 
                                                      OpStore %346 %411 
                                       f32_3 %412 = OpLoad %346 
                                       f32_3 %413 = OpFAdd %412 %406 
                                                      OpStore %346 %413 
                                       f32_4 %414 = OpLoad %256 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 0 0 
                                       f32_3 %416 = OpLoad %346 
                                       f32_3 %417 = OpFMul %415 %416 
                                       f32_3 %419 = OpFAdd %417 %418 
                                                      OpStore %346 %419 
                                       f32_3 %420 = OpLoad %346 
                                       f32_4 %421 = OpLoad %9 
                                       f32_3 %422 = OpVectorShuffle %421 %421 0 0 0 
                                       f32_3 %423 = OpFMul %420 %422 
                                       f32_4 %424 = OpLoad %9 
                                       f32_4 %425 = OpVectorShuffle %424 %423 4 5 6 3 
                                                      OpStore %9 %425 
                                       f32_4 %428 = OpLoad %9 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                       f32_4 %430 = OpLoad %427 
                                       f32_4 %431 = OpVectorShuffle %430 %429 4 5 6 3 
                                                      OpStore %427 %431 
                                 Output f32* %433 = OpAccessChain %427 %24 
                                                      OpStore %433 %51 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat13;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat4 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat4 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * u_xlat1.y;
    u_xlat0.x = u_xlat1.x * u_xlat1.x + (-u_xlat0.x);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(unity_SHAr, u_xlat1);
    u_xlat2.y = dot(unity_SHAg, u_xlat1);
    u_xlat2.z = dot(unity_SHAb, u_xlat1);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat2.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5 = u_xlat5 / u_xlat13;
    u_xlat5 = u_xlat5 + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(vec3(u_xlat5)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 303
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %114 %126 %127 %141 %178 %181 %184 %186 %294 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 RelaxedPrecision 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 RelaxedPrecision 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 RelaxedPrecision 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 RelaxedPrecision 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 RelaxedPrecision 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %112 0 BuiltIn 112 
                                                      OpMemberDecorate %112 1 BuiltIn 112 
                                                      OpMemberDecorate %112 2 BuiltIn 112 
                                                      OpDecorate %112 Block 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %141 Location 141 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %294 Location 294 
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
                                              %15 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 11 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 10 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 7 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %61 = OpConstant 0 
                                          i32 %69 = OpConstant 2 
                               Private f32_4* %77 = OpVariable Private 
                                          i32 %79 = OpConstant 3 
                               Private f32_4* %90 = OpVariable Private 
                                          i32 %93 = OpConstant 9 
                                             %111 = OpTypeArray %6 %43 
                                             %112 = OpTypeStruct %7 %6 %111 
                                             %113 = OpTypePointer Output %112 
        Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                             %122 = OpTypePointer Output %7 
                                             %124 = OpTypeVector %6 2 
                                             %125 = OpTypePointer Output %124 
                               Output f32_2* %126 = OpVariable Output 
                                Input f32_4* %127 = OpVariable Input 
                                         i32 %130 = OpConstant 12 
                                             %139 = OpTypeVector %6 3 
                                             %140 = OpTypePointer Input %139 
                                Input f32_3* %141 = OpVariable Input 
                                         i32 %143 = OpConstant 8 
                                         u32 %160 = OpConstant 2 
                                Private f32* %162 = OpVariable Private 
                                             %177 = OpTypePointer Output %139 
                               Output f32_3* %178 = OpVariable Output 
                               Output f32_3* %181 = OpVariable Output 
                               Output f32_4* %184 = OpVariable Output 
                               Output f32_4* %186 = OpVariable Output 
                                         f32 %187 = OpConstant 3.67402E-40 
                                       f32_4 %188 = OpConstantComposite %187 %187 %187 %187 
                                             %189 = OpTypePointer Private %139 
                              Private f32_3* %190 = OpVariable Private 
                              Private f32_4* %207 = OpVariable Private 
                              Private f32_3* %213 = OpVariable Private 
                                         i32 %219 = OpConstant 4 
                                         i32 %225 = OpConstant 5 
                                         i32 %231 = OpConstant 6 
                                         u32 %240 = OpConstant 3 
                                       f32_3 %261 = OpConstantComposite %187 %187 %187 
                                         f32 %269 = OpConstant 3.67402E-40 
                                       f32_3 %270 = OpConstantComposite %269 %269 %269 
                                         f32 %281 = OpConstant 3.67402E-40 
                                       f32_3 %282 = OpConstantComposite %281 %281 %281 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %284 %284 %284 
                               Output f32_3* %294 = OpVariable Output 
                                             %297 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %62 = OpAccessChain %17 %55 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %42 
                                        f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %70 = OpAccessChain %17 %55 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %42 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                                        f32_4 %78 = OpLoad %9 
                               Uniform f32_4* %80 = OpAccessChain %17 %55 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %78 %81 
                                                      OpStore %77 %82 
                               Uniform f32_4* %83 = OpAccessChain %17 %55 %79 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpLoad %42 
                                        f32_4 %86 = OpVectorShuffle %85 %85 3 3 3 3 
                                        f32_4 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFAdd %87 %88 
                                                      OpStore %9 %89 
                                        f32_4 %91 = OpLoad %77 
                                        f32_4 %92 = OpVectorShuffle %91 %91 1 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %17 %93 %56 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %90 %96 
                               Uniform f32_4* %97 = OpAccessChain %17 %93 %61 
                                        f32_4 %98 = OpLoad %97 
                                        f32_4 %99 = OpLoad %77 
                                       f32_4 %100 = OpVectorShuffle %99 %99 0 0 0 0 
                                       f32_4 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %90 
                                       f32_4 %103 = OpFAdd %101 %102 
                                                      OpStore %90 %103 
                              Uniform f32_4* %104 = OpAccessChain %17 %93 %69 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %77 
                                       f32_4 %107 = OpVectorShuffle %106 %106 2 2 2 2 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %90 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %90 %110 
                              Uniform f32_4* %115 = OpAccessChain %17 %93 %79 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpLoad %77 
                                       f32_4 %118 = OpVectorShuffle %117 %117 3 3 3 3 
                                       f32_4 %119 = OpFMul %116 %118 
                                       f32_4 %120 = OpLoad %90 
                                       f32_4 %121 = OpFAdd %119 %120 
                               Output f32_4* %123 = OpAccessChain %114 %61 
                                                      OpStore %123 %121 
                                       f32_4 %128 = OpLoad %127 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                              Uniform f32_4* %131 = OpAccessChain %17 %130 
                                       f32_4 %132 = OpLoad %131 
                                       f32_2 %133 = OpVectorShuffle %132 %132 0 1 
                                       f32_2 %134 = OpFMul %129 %133 
                              Uniform f32_4* %135 = OpAccessChain %17 %130 
                                       f32_4 %136 = OpLoad %135 
                                       f32_2 %137 = OpVectorShuffle %136 %136 2 3 
                                       f32_2 %138 = OpFAdd %134 %137 
                                                      OpStore %126 %138 
                                       f32_3 %142 = OpLoad %141 
                              Uniform f32_4* %144 = OpAccessChain %17 %143 %61 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                         f32 %147 = OpDot %142 %146 
                                Private f32* %148 = OpAccessChain %77 %27 
                                                      OpStore %148 %147 
                                       f32_3 %149 = OpLoad %141 
                              Uniform f32_4* %150 = OpAccessChain %17 %143 %56 
                                       f32_4 %151 = OpLoad %150 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                         f32 %153 = OpDot %149 %152 
                                Private f32* %154 = OpAccessChain %77 %43 
                                                      OpStore %154 %153 
                                       f32_3 %155 = OpLoad %141 
                              Uniform f32_4* %156 = OpAccessChain %17 %143 %69 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                         f32 %159 = OpDot %155 %158 
                                Private f32* %161 = OpAccessChain %77 %160 
                                                      OpStore %161 %159 
                                       f32_4 %163 = OpLoad %77 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_4 %165 = OpLoad %77 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                         f32 %167 = OpDot %164 %166 
                                                      OpStore %162 %167 
                                         f32 %168 = OpLoad %162 
                                         f32 %169 = OpExtInst %1 32 %168 
                                                      OpStore %162 %169 
                                         f32 %170 = OpLoad %162 
                                       f32_3 %171 = OpCompositeConstruct %170 %170 %170 
                                       f32_4 %172 = OpLoad %77 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFMul %171 %173 
                                       f32_4 %175 = OpLoad %77 
                                       f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                                      OpStore %77 %176 
                                       f32_4 %179 = OpLoad %77 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                                      OpStore %178 %180 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                                      OpStore %181 %183 
                                       f32_4 %185 = OpLoad %9 
                                                      OpStore %184 %185 
                                                      OpStore %186 %188 
                                Private f32* %191 = OpAccessChain %77 %43 
                                         f32 %192 = OpLoad %191 
                                Private f32* %193 = OpAccessChain %77 %43 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFMul %192 %194 
                                Private f32* %196 = OpAccessChain %190 %27 
                                                      OpStore %196 %195 
                                Private f32* %197 = OpAccessChain %77 %27 
                                         f32 %198 = OpLoad %197 
                                Private f32* %199 = OpAccessChain %77 %27 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %198 %200 
                                Private f32* %202 = OpAccessChain %190 %27 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFNegate %203 
                                         f32 %205 = OpFAdd %201 %204 
                                Private f32* %206 = OpAccessChain %190 %27 
                                                      OpStore %206 %205 
                                       f32_4 %208 = OpLoad %77 
                                       f32_4 %209 = OpVectorShuffle %208 %208 1 2 2 0 
                                       f32_4 %210 = OpLoad %77 
                                       f32_4 %211 = OpVectorShuffle %210 %210 0 1 2 2 
                                       f32_4 %212 = OpFMul %209 %211 
                                                      OpStore %207 %212 
                              Uniform f32_4* %214 = OpAccessChain %17 %79 
                                       f32_4 %215 = OpLoad %214 
                                       f32_4 %216 = OpLoad %207 
                                         f32 %217 = OpDot %215 %216 
                                Private f32* %218 = OpAccessChain %213 %27 
                                                      OpStore %218 %217 
                              Uniform f32_4* %220 = OpAccessChain %17 %219 
                                       f32_4 %221 = OpLoad %220 
                                       f32_4 %222 = OpLoad %207 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %213 %43 
                                                      OpStore %224 %223 
                              Uniform f32_4* %226 = OpAccessChain %17 %225 
                                       f32_4 %227 = OpLoad %226 
                                       f32_4 %228 = OpLoad %207 
                                         f32 %229 = OpDot %227 %228 
                                Private f32* %230 = OpAccessChain %213 %160 
                                                      OpStore %230 %229 
                              Uniform f32_4* %232 = OpAccessChain %17 %231 
                                       f32_4 %233 = OpLoad %232 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 1 2 
                                       f32_3 %235 = OpLoad %190 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 0 0 
                                       f32_3 %237 = OpFMul %234 %236 
                                       f32_3 %238 = OpLoad %213 
                                       f32_3 %239 = OpFAdd %237 %238 
                                                      OpStore %190 %239 
                                Private f32* %241 = OpAccessChain %77 %240 
                                                      OpStore %241 %39 
                              Uniform f32_4* %242 = OpAccessChain %17 %61 
                                       f32_4 %243 = OpLoad %242 
                                       f32_4 %244 = OpLoad %77 
                                         f32 %245 = OpDot %243 %244 
                                Private f32* %246 = OpAccessChain %213 %27 
                                                      OpStore %246 %245 
                              Uniform f32_4* %247 = OpAccessChain %17 %56 
                                       f32_4 %248 = OpLoad %247 
                                       f32_4 %249 = OpLoad %77 
                                         f32 %250 = OpDot %248 %249 
                                Private f32* %251 = OpAccessChain %213 %43 
                                                      OpStore %251 %250 
                              Uniform f32_4* %252 = OpAccessChain %17 %69 
                                       f32_4 %253 = OpLoad %252 
                                       f32_4 %254 = OpLoad %77 
                                         f32 %255 = OpDot %253 %254 
                                Private f32* %256 = OpAccessChain %213 %160 
                                                      OpStore %256 %255 
                                       f32_3 %257 = OpLoad %190 
                                       f32_3 %258 = OpLoad %213 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %190 %259 
                                       f32_3 %260 = OpLoad %190 
                                       f32_3 %262 = OpExtInst %1 40 %260 %261 
                                                      OpStore %190 %262 
                                       f32_3 %263 = OpLoad %190 
                                       f32_3 %264 = OpExtInst %1 30 %263 
                                       f32_4 %265 = OpLoad %77 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 6 3 
                                                      OpStore %77 %266 
                                       f32_4 %267 = OpLoad %77 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                       f32_3 %271 = OpFMul %268 %270 
                                       f32_4 %272 = OpLoad %77 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %77 %273 
                                       f32_4 %274 = OpLoad %77 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpExtInst %1 29 %275 
                                       f32_4 %277 = OpLoad %77 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 6 3 
                                                      OpStore %77 %278 
                                       f32_4 %279 = OpLoad %77 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 1 2 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_3 %286 = OpFAdd %283 %285 
                                       f32_4 %287 = OpLoad %77 
                                       f32_4 %288 = OpVectorShuffle %287 %286 4 5 6 3 
                                                      OpStore %77 %288 
                                       f32_4 %289 = OpLoad %77 
                                       f32_3 %290 = OpVectorShuffle %289 %289 0 1 2 
                                       f32_3 %291 = OpExtInst %1 40 %290 %261 
                                       f32_4 %292 = OpLoad %77 
                                       f32_4 %293 = OpVectorShuffle %292 %291 4 5 6 3 
                                                      OpStore %77 %293 
                                       f32_4 %295 = OpLoad %77 
                                       f32_3 %296 = OpVectorShuffle %295 %295 0 1 2 
                                                      OpStore %294 %296 
                                 Output f32* %298 = OpAccessChain %114 %61 %43 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpFNegate %299 
                                 Output f32* %301 = OpAccessChain %114 %61 %43 
                                                      OpStore %301 %300 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 435
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %68 %198 %427 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %59 SpecId 59 
                                                      OpDecorate %68 Location 68 
                                                      OpDecorate %160 DescriptorSet 160 
                                                      OpDecorate %160 Binding 160 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %198 Location 198 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %427 Location 427 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                                          u32 %41 = OpConstant 4 
                                              %42 = OpTypeArray %7 %41 
                                              %43 = OpTypeVector %6 3 
                                              %44 = OpTypeStruct %7 %7 %42 %43 %43 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %46 = OpVariable Uniform 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Uniform %6 
                                          f32 %51 = OpConstant 3.67402E-40 
                                         bool %53 = OpConstantFalse 
                                         bool %59 = OpSpecConstantFalse 
                                          u32 %62 = OpConstant 1 
                               Private f32_4* %66 = OpVariable Private 
                                              %67 = OpTypePointer Input %43 
                                 Input f32_3* %68 = OpVariable Input 
                                          i32 %71 = OpConstant 2 
                                              %72 = OpTypePointer Uniform %7 
                                         i32 %103 = OpConstant 3 
                                             %110 = OpTypePointer Function %43 
                                         i32 %124 = OpConstant 4 
                                             %125 = OpTypePointer Uniform %43 
                                Private f32* %139 = OpVariable Private 
                                         f32 %142 = OpConstant 3.67402E-40 
                                         f32 %144 = OpConstant 3.67402E-40 
                                Private f32* %146 = OpVariable Private 
                                         u32 %147 = OpConstant 2 
                                         f32 %150 = OpConstant 3.67402E-40 
                                             %157 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %158 = OpTypeSampledImage %157 
                                             %159 = OpTypePointer UniformConstant %158 
 UniformConstant read_only Texture3DSampled* %160 = OpVariable UniformConstant 
                              Private f32_4* %165 = OpVariable Private 
                                             %172 = OpTypePointer Private %43 
                              Private f32_3* %173 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                Input f32_3* %198 = OpVariable Input 
                                             %208 = OpTypePointer Function %6 
                                             %215 = OpTypePointer Private %15 
                              Private f32_2* %216 = OpVariable Private 
                              Private f32_2* %223 = OpVariable Private 
                                         f32 %225 = OpConstant 3.67402E-40 
                                         f32 %240 = OpConstant 3.67402E-40 
                                       f32_2 %241 = OpConstantComposite %225 %240 
                              Private f32_4* %256 = OpVariable Private 
                              Private f32_4* %266 = OpVariable Private 
                                Private f32* %297 = OpVariable Private 
                                Private f32* %312 = OpVariable Private 
                                         f32 %314 = OpConstant 3.67402E-40 
                                         f32 %316 = OpConstant 3.67402E-40 
                               Private bool* %334 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                               Private bool* %362 = OpVariable Private 
                                Private f32* %368 = OpVariable Private 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_3 %394 = OpConstantComposite %51 %240 %393 
                                       f32_3 %399 = OpConstantComposite %314 %314 %314 
                                         f32 %401 = OpConstant 3.67402E-40 
                                       f32_3 %402 = OpConstantComposite %401 %401 %401 
                                       f32_3 %406 = OpConstantComposite %225 %225 %225 
                                       f32_3 %418 = OpConstantComposite %51 %51 %51 
                                             %426 = OpTypePointer Output %7 
                               Output f32_4* %427 = OpVariable Output 
                                             %432 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                               Function f32* %209 = OpVariable Function 
                               Function f32* %250 = OpVariable Function 
                               Function f32* %340 = OpVariable Function 
                               Function f32* %369 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %46 %33 %47 
                                          f32 %50 = OpLoad %49 
                                         bool %52 = OpFOrdEqual %50 %51 
                                                      OpStore %22 %52 
                                                      OpSelectionMerge %55 None 
                                                      OpBranchConditional %53 %54 %55 
                                              %54 = OpLabel 
                                         bool %56 = OpLoad %22 
                                                      OpSelectionMerge %58 None 
                                                      OpBranchConditional %56 %57 %58 
                                              %57 = OpLabel 
                                                      OpBranch %58 
                                              %58 = OpLabel 
                                                      OpBranch %55 
                                              %55 = OpLabel 
                                                      OpSelectionMerge %61 None 
                                                      OpBranchConditional %59 %60 %167 
                                              %60 = OpLabel 
                                 Uniform f32* %63 = OpAccessChain %46 %33 %62 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdEqual %64 %51 
                                                      OpStore %22 %65 
                                        f32_3 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 1 1 1 
                               Uniform f32_4* %73 = OpAccessChain %46 %71 %33 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %70 %75 
                                        f32_4 %77 = OpLoad %66 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %66 %78 
                               Uniform f32_4* %79 = OpAccessChain %46 %71 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %68 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 0 0 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %66 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %66 %89 
                               Uniform f32_4* %90 = OpAccessChain %46 %71 %71 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpLoad %68 
                                        f32_3 %94 = OpVectorShuffle %93 %93 2 2 2 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %66 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %95 %97 
                                        f32_4 %99 = OpLoad %66 
                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                                      OpStore %66 %100 
                                       f32_4 %101 = OpLoad %66 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %104 = OpAccessChain %46 %71 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %102 %106 
                                       f32_4 %108 = OpLoad %66 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %66 %109 
                                        bool %112 = OpLoad %22 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %117 
                                             %113 = OpLabel 
                                       f32_4 %115 = OpLoad %66 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                                      OpStore %111 %116 
                                                      OpBranch %114 
                                             %117 = OpLabel 
                                       f32_3 %118 = OpLoad %68 
                                                      OpStore %111 %118 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %119 = OpLoad %111 
                                       f32_4 %120 = OpLoad %66 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %66 %121 
                                       f32_4 %122 = OpLoad %66 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                              Uniform f32_3* %126 = OpAccessChain %46 %124 
                                       f32_3 %127 = OpLoad %126 
                                       f32_3 %128 = OpFNegate %127 
                                       f32_3 %129 = OpFAdd %123 %128 
                                       f32_4 %130 = OpLoad %66 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %66 %131 
                                       f32_4 %132 = OpLoad %66 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %46 %103 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %66 
                                       f32_4 %138 = OpVectorShuffle %137 %136 0 4 5 6 
                                                      OpStore %66 %138 
                                Private f32* %140 = OpAccessChain %66 %62 
                                         f32 %141 = OpLoad %140 
                                         f32 %143 = OpFMul %141 %142 
                                         f32 %145 = OpFAdd %143 %144 
                                                      OpStore %139 %145 
                                Uniform f32* %148 = OpAccessChain %46 %33 %147 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %152 = OpFAdd %151 %144 
                                                      OpStore %146 %152 
                                         f32 %153 = OpLoad %139 
                                         f32 %154 = OpLoad %146 
                                         f32 %155 = OpExtInst %1 40 %153 %154 
                                Private f32* %156 = OpAccessChain %66 %47 
                                                      OpStore %156 %155 
                  read_only Texture3DSampled %161 = OpLoad %160 
                                       f32_4 %162 = OpLoad %66 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 2 3 
                                       f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                                      OpStore %66 %164 
                                       f32_4 %166 = OpLoad %66 
                                                      OpStore %165 %166 
                                                      OpBranch %61 
                                             %167 = OpLabel 
                                Private f32* %168 = OpAccessChain %165 %47 
                                                      OpStore %168 %51 
                                Private f32* %169 = OpAccessChain %165 %62 
                                                      OpStore %169 %51 
                                Private f32* %170 = OpAccessChain %165 %147 
                                                      OpStore %170 %51 
                                Private f32* %171 = OpAccessChain %165 %24 
                                                      OpStore %171 %51 
                                                      OpBranch %61 
                                              %61 = OpLabel 
                                       f32_4 %174 = OpLoad %165 
                              Uniform f32_4* %175 = OpAccessChain %46 %32 
                                       f32_4 %176 = OpLoad %175 
                                         f32 %177 = OpDot %174 %176 
                                Private f32* %178 = OpAccessChain %173 %47 
                                                      OpStore %178 %177 
                                Private f32* %179 = OpAccessChain %173 %47 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %51 
                                Private f32* %183 = OpAccessChain %173 %47 
                                                      OpStore %183 %182 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %46 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %173 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %173 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %173 
                                       f32_3 %202 = OpFAdd %200 %201 
                                                      OpStore %173 %202 
                                Private f32* %203 = OpAccessChain %173 %62 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %173 %147 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %22 %207 
                                        bool %210 = OpLoad %22 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %213 
                                             %211 = OpLabel 
                                                      OpStore %209 %51 
                                                      OpBranch %212 
                                             %213 = OpLabel 
                                                      OpStore %209 %181 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                         f32 %214 = OpLoad %209 
                                                      OpStore %139 %214 
                                       f32_3 %217 = OpLoad %173 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 1 
                                       f32_2 %219 = OpFNegate %218 
                                       f32_3 %220 = OpLoad %173 
                                       f32_2 %221 = OpVectorShuffle %220 %220 1 2 
                                       f32_2 %222 = OpFAdd %219 %221 
                                                      OpStore %216 %222 
                                Private f32* %224 = OpAccessChain %223 %47 
                                                      OpStore %224 %51 
                                Private f32* %226 = OpAccessChain %223 %62 
                                                      OpStore %226 %225 
                                         f32 %227 = OpLoad %139 
                                       f32_2 %228 = OpCompositeConstruct %227 %227 
                                       f32_2 %229 = OpLoad %216 
                                       f32_2 %230 = OpFMul %228 %229 
                                       f32_3 %231 = OpLoad %173 
                                       f32_2 %232 = OpVectorShuffle %231 %231 2 1 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %66 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %66 %235 
                                         f32 %236 = OpLoad %139 
                                       f32_2 %237 = OpCompositeConstruct %236 %236 
                                       f32_2 %238 = OpLoad %223 
                                       f32_2 %239 = OpFMul %237 %238 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %66 
                                       f32_4 %244 = OpVectorShuffle %243 %242 0 1 4 5 
                                                      OpStore %66 %244 
                                Private f32* %245 = OpAccessChain %173 %47 
                                         f32 %246 = OpLoad %245 
                                Private f32* %247 = OpAccessChain %66 %47 
                                         f32 %248 = OpLoad %247 
                                        bool %249 = OpFOrdGreaterThanEqual %246 %248 
                                                      OpStore %22 %249 
                                        bool %251 = OpLoad %22 
                                                      OpSelectionMerge %253 None 
                                                      OpBranchConditional %251 %252 %254 
                                             %252 = OpLabel 
                                                      OpStore %250 %51 
                                                      OpBranch %253 
                                             %254 = OpLabel 
                                                      OpStore %250 %181 
                                                      OpBranch %253 
                                             %253 = OpLabel 
                                         f32 %255 = OpLoad %250 
                                                      OpStore %139 %255 
                                       f32_4 %257 = OpLoad %66 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 3 
                                       f32_3 %259 = OpFNegate %258 
                                       f32_4 %260 = OpLoad %256 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %256 %261 
                                Private f32* %262 = OpAccessChain %173 %47 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFNegate %263 
                                Private f32* %265 = OpAccessChain %256 %24 
                                                      OpStore %265 %264 
                                Private f32* %267 = OpAccessChain %173 %47 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %256 %47 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFAdd %268 %270 
                                Private f32* %272 = OpAccessChain %266 %47 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %66 
                                       f32_3 %274 = OpVectorShuffle %273 %273 1 2 0 
                                       f32_4 %275 = OpLoad %256 
                                       f32_3 %276 = OpVectorShuffle %275 %275 1 2 3 
                                       f32_3 %277 = OpFAdd %274 %276 
                                       f32_4 %278 = OpLoad %266 
                                       f32_4 %279 = OpVectorShuffle %278 %277 0 4 5 6 
                                                      OpStore %266 %279 
                                         f32 %280 = OpLoad %139 
                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
                                       f32_4 %282 = OpLoad %266 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFMul %281 %283 
                                       f32_4 %285 = OpLoad %66 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 3 
                                       f32_3 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %256 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %256 %289 
                                         f32 %290 = OpLoad %139 
                                Private f32* %291 = OpAccessChain %266 %24 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                Private f32* %294 = OpAccessChain %173 %47 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %293 %295 
                                                      OpStore %139 %296 
                                Private f32* %298 = OpAccessChain %256 %62 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpLoad %139 
                                         f32 %301 = OpExtInst %1 37 %299 %300 
                                                      OpStore %297 %301 
                                         f32 %302 = OpLoad %297 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %256 %47 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFAdd %303 %305 
                                                      OpStore %297 %306 
                                Private f32* %307 = OpAccessChain %256 %62 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFNegate %308 
                                         f32 %310 = OpLoad %139 
                                         f32 %311 = OpFAdd %309 %310 
                                                      OpStore %139 %311 
                                         f32 %313 = OpLoad %297 
                                         f32 %315 = OpFMul %313 %314 
                                         f32 %317 = OpFAdd %315 %316 
                                                      OpStore %312 %317 
                                         f32 %318 = OpLoad %139 
                                         f32 %319 = OpLoad %312 
                                         f32 %320 = OpFDiv %318 %319 
                                                      OpStore %139 %320 
                                         f32 %321 = OpLoad %139 
                                Private f32* %322 = OpAccessChain %256 %147 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFAdd %321 %323 
                                                      OpStore %139 %324 
                                Private f32* %325 = OpAccessChain %256 %47 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpFAdd %326 %316 
                                Private f32* %328 = OpAccessChain %256 %47 
                                                      OpStore %328 %327 
                                         f32 %329 = OpLoad %297 
                                Private f32* %330 = OpAccessChain %256 %47 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFDiv %329 %331 
                                Private f32* %333 = OpAccessChain %256 %47 
                                                      OpStore %333 %332 
                                Private f32* %335 = OpAccessChain %9 %62 
                                         f32 %336 = OpLoad %335 
                                Private f32* %337 = OpAccessChain %9 %147 
                                         f32 %338 = OpLoad %337 
                                        bool %339 = OpFOrdGreaterThanEqual %336 %338 
                                                      OpStore %334 %339 
                                        bool %341 = OpLoad %334 
                                                      OpSelectionMerge %343 None 
                                                      OpBranchConditional %341 %342 %344 
                                             %342 = OpLabel 
                                                      OpStore %340 %51 
                                                      OpBranch %343 
                                             %344 = OpLabel 
                                                      OpStore %340 %181 
                                                      OpBranch %343 
                                             %343 = OpLabel 
                                         f32 %345 = OpLoad %340 
                                                      OpStore %312 %345 
                                Private f32* %347 = OpAccessChain %9 %147 
                                         f32 %348 = OpLoad %347 
                                         f32 %349 = OpFNegate %348 
                                Private f32* %350 = OpAccessChain %9 %62 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %349 %351 
                                Private f32* %353 = OpAccessChain %346 %47 
                                                      OpStore %353 %352 
                                         f32 %354 = OpLoad %312 
                                Private f32* %355 = OpAccessChain %346 %47 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFMul %354 %356 
                                Private f32* %358 = OpAccessChain %9 %147 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %346 %47 
                                                      OpStore %361 %360 
                                Private f32* %363 = OpAccessChain %9 %47 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %346 %47 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdGreaterThanEqual %364 %366 
                                                      OpStore %362 %367 
                                        bool %370 = OpLoad %362 
                                                      OpSelectionMerge %372 None 
                                                      OpBranchConditional %370 %371 %373 
                                             %371 = OpLabel 
                                                      OpStore %369 %51 
                                                      OpBranch %372 
                                             %373 = OpLabel 
                                                      OpStore %369 %181 
                                                      OpBranch %372 
                                             %372 = OpLabel 
                                         f32 %374 = OpLoad %369 
                                                      OpStore %368 %374 
                                Private f32* %375 = OpAccessChain %346 %47 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Private f32* %378 = OpAccessChain %9 %47 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFAdd %377 %379 
                                Private f32* %381 = OpAccessChain %9 %47 
                                                      OpStore %381 %380 
                                         f32 %382 = OpLoad %368 
                                Private f32* %383 = OpAccessChain %9 %47 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFMul %382 %384 
                                Private f32* %386 = OpAccessChain %346 %47 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                Private f32* %389 = OpAccessChain %9 %47 
                                                      OpStore %389 %388 
                                         f32 %390 = OpLoad %139 
                                       f32_3 %391 = OpCompositeConstruct %390 %390 %390 
                                       f32_3 %392 = OpExtInst %1 4 %391 
                                       f32_3 %395 = OpFAdd %392 %394 
                                                      OpStore %346 %395 
                                       f32_3 %396 = OpLoad %346 
                                       f32_3 %397 = OpExtInst %1 10 %396 
                                                      OpStore %346 %397 
                                       f32_3 %398 = OpLoad %346 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_3 %403 = OpFAdd %400 %402 
                                                      OpStore %346 %403 
                                       f32_3 %404 = OpLoad %346 
                                       f32_3 %405 = OpExtInst %1 4 %404 
                                       f32_3 %407 = OpFAdd %405 %406 
                                                      OpStore %346 %407 
                                       f32_3 %408 = OpLoad %346 
                                       f32_3 %409 = OpCompositeConstruct %181 %181 %181 
                                       f32_3 %410 = OpCompositeConstruct %51 %51 %51 
                                       f32_3 %411 = OpExtInst %1 43 %408 %409 %410 
                                                      OpStore %346 %411 
                                       f32_3 %412 = OpLoad %346 
                                       f32_3 %413 = OpFAdd %412 %406 
                                                      OpStore %346 %413 
                                       f32_4 %414 = OpLoad %256 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 0 0 
                                       f32_3 %416 = OpLoad %346 
                                       f32_3 %417 = OpFMul %415 %416 
                                       f32_3 %419 = OpFAdd %417 %418 
                                                      OpStore %346 %419 
                                       f32_3 %420 = OpLoad %346 
                                       f32_4 %421 = OpLoad %9 
                                       f32_3 %422 = OpVectorShuffle %421 %421 0 0 0 
                                       f32_3 %423 = OpFMul %420 %422 
                                       f32_4 %424 = OpLoad %9 
                                       f32_4 %425 = OpVectorShuffle %424 %423 4 5 6 3 
                                                      OpStore %9 %425 
                                       f32_4 %428 = OpLoad %9 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                       f32_4 %430 = OpLoad %427 
                                       f32_4 %431 = OpVectorShuffle %430 %429 4 5 6 3 
                                                      OpStore %427 %431 
                                 Output f32* %433 = OpAccessChain %427 %24 
                                                      OpStore %433 %51 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat11;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat11 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat11 = inversesqrt(u_xlat11);
    vs_TEXCOORD1.xyz = vec3(u_xlat11) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD5.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat12) + u_xlat1.x;
    u_xlat12 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat12;
    u_xlat12 = u_xlat12 * _LightShadowData.z + _LightShadowData.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat9.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9.x, u_xlat5.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat9.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat9.xy);
    u_xlat12 = u_xlat12 + u_xlat10_2.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat5.x = min(u_xlat12, u_xlat5.x);
    u_xlat12 = (u_xlatb1) ? u_xlat5.x : u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5.x = u_xlat5.x / u_xlat13;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 220
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %119 %125 %126 %140 %169 %175 %178 %180 %183 %202 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %117 0 BuiltIn 117 
                                                      OpMemberDecorate %117 1 BuiltIn 117 
                                                      OpMemberDecorate %117 2 BuiltIn 117 
                                                      OpDecorate %117 Block 
                                                      OpDecorate %125 Location 125 
                                                      OpDecorate %126 Location 126 
                                                      OpDecorate %140 Location 140 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate %175 Location 175 
                                                      OpDecorate %178 Location 178 
                                                      OpDecorate %180 Location 180 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %202 Location 202 
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
                                              %15 = OpTypeStruct %7 %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 5 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 4 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 1 
                                              %56 = OpTypePointer Uniform %7 
                                          i32 %60 = OpConstant 0 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                                          i32 %78 = OpConstant 3 
                               Private f32_4* %89 = OpVariable Private 
                                             %116 = OpTypeArray %6 %43 
                                             %117 = OpTypeStruct %7 %6 %116 
                                             %118 = OpTypePointer Output %117 
        Output struct {f32_4; f32; f32[1];}* %119 = OpVariable Output 
                                             %121 = OpTypePointer Output %7 
                                             %123 = OpTypeVector %6 2 
                                             %124 = OpTypePointer Output %123 
                               Output f32_2* %125 = OpVariable Output 
                                Input f32_4* %126 = OpVariable Input 
                                         i32 %129 = OpConstant 6 
                                             %138 = OpTypeVector %6 3 
                                             %139 = OpTypePointer Input %138 
                                Input f32_3* %140 = OpVariable Input 
                                         u32 %158 = OpConstant 2 
                                Private f32* %160 = OpVariable Private 
                                             %168 = OpTypePointer Output %138 
                               Output f32_3* %169 = OpVariable Output 
                               Output f32_3* %175 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                               Output f32_4* %180 = OpVariable Output 
                                         f32 %181 = OpConstant 3.67402E-40 
                                       f32_4 %182 = OpConstantComposite %181 %181 %181 %181 
                               Output f32_3* %183 = OpVariable Output 
                                       f32_3 %184 = OpConstantComposite %181 %181 %181 
                                         u32 %194 = OpConstant 3 
                                       f32_2 %198 = OpConstantComposite %32 %32 
                               Output f32_4* %202 = OpVariable Output 
                                             %214 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %57 = OpAccessChain %17 %55 %55 
                                        f32_4 %58 = OpLoad %57 
                                        f32_4 %59 = OpFMul %54 %58 
                                                      OpStore %9 %59 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %60 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %79 = OpAccessChain %17 %55 %78 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpFAdd %77 %80 
                                                      OpStore %76 %81 
                               Uniform f32_4* %82 = OpAccessChain %17 %55 %78 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %42 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %9 %88 
                                        f32_4 %90 = OpLoad %76 
                                        f32_4 %91 = OpVectorShuffle %90 %90 1 1 1 1 
                               Uniform f32_4* %92 = OpAccessChain %17 %78 %55 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpFMul %91 %93 
                                                      OpStore %89 %94 
                               Uniform f32_4* %95 = OpAccessChain %17 %78 %60 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %76 
                                        f32_4 %98 = OpVectorShuffle %97 %97 0 0 0 0 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %89 
                                       f32_4 %101 = OpFAdd %99 %100 
                                                      OpStore %89 %101 
                              Uniform f32_4* %102 = OpAccessChain %17 %78 %68 
                                       f32_4 %103 = OpLoad %102 
                                       f32_4 %104 = OpLoad %76 
                                       f32_4 %105 = OpVectorShuffle %104 %104 2 2 2 2 
                                       f32_4 %106 = OpFMul %103 %105 
                                       f32_4 %107 = OpLoad %89 
                                       f32_4 %108 = OpFAdd %106 %107 
                                                      OpStore %89 %108 
                              Uniform f32_4* %109 = OpAccessChain %17 %78 %78 
                                       f32_4 %110 = OpLoad %109 
                                       f32_4 %111 = OpLoad %76 
                                       f32_4 %112 = OpVectorShuffle %111 %111 3 3 3 3 
                                       f32_4 %113 = OpFMul %110 %112 
                                       f32_4 %114 = OpLoad %89 
                                       f32_4 %115 = OpFAdd %113 %114 
                                                      OpStore %76 %115 
                                       f32_4 %120 = OpLoad %76 
                               Output f32_4* %122 = OpAccessChain %119 %60 
                                                      OpStore %122 %120 
                                       f32_4 %127 = OpLoad %126 
                                       f32_2 %128 = OpVectorShuffle %127 %127 0 1 
                              Uniform f32_4* %130 = OpAccessChain %17 %129 
                                       f32_4 %131 = OpLoad %130 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                                       f32_2 %133 = OpFMul %128 %132 
                              Uniform f32_4* %134 = OpAccessChain %17 %129 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 2 3 
                                       f32_2 %137 = OpFAdd %133 %136 
                                                      OpStore %125 %137 
                                       f32_3 %141 = OpLoad %140 
                              Uniform f32_4* %142 = OpAccessChain %17 %68 %60 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                         f32 %145 = OpDot %141 %144 
                                Private f32* %146 = OpAccessChain %89 %27 
                                                      OpStore %146 %145 
                                       f32_3 %147 = OpLoad %140 
                              Uniform f32_4* %148 = OpAccessChain %17 %68 %55 
                                       f32_4 %149 = OpLoad %148 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                         f32 %151 = OpDot %147 %150 
                                Private f32* %152 = OpAccessChain %89 %43 
                                                      OpStore %152 %151 
                                       f32_3 %153 = OpLoad %140 
                              Uniform f32_4* %154 = OpAccessChain %17 %68 %68 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 1 2 
                                         f32 %157 = OpDot %153 %156 
                                Private f32* %159 = OpAccessChain %89 %158 
                                                      OpStore %159 %157 
                                       f32_4 %161 = OpLoad %89 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                       f32_4 %163 = OpLoad %89 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                         f32 %165 = OpDot %162 %164 
                                                      OpStore %160 %165 
                                         f32 %166 = OpLoad %160 
                                         f32 %167 = OpExtInst %1 32 %166 
                                                      OpStore %160 %167 
                                         f32 %170 = OpLoad %160 
                                       f32_3 %171 = OpCompositeConstruct %170 %170 %170 
                                       f32_4 %172 = OpLoad %89 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 1 2 
                                       f32_3 %174 = OpFMul %171 %173 
                                                      OpStore %169 %174 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 2 
                                                      OpStore %175 %177 
                                       f32_4 %179 = OpLoad %9 
                                                      OpStore %178 %179 
                                                      OpStore %180 %182 
                                                      OpStore %183 %184 
                                Private f32* %185 = OpAccessChain %76 %43 
                                         f32 %186 = OpLoad %185 
                                Uniform f32* %187 = OpAccessChain %17 %60 %27 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFMul %186 %188 
                                Private f32* %190 = OpAccessChain %9 %27 
                                                      OpStore %190 %189 
                                Private f32* %191 = OpAccessChain %9 %27 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpFMul %192 %32 
                                Private f32* %195 = OpAccessChain %9 %194 
                                                      OpStore %195 %193 
                                       f32_4 %196 = OpLoad %76 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 3 
                                       f32_2 %199 = OpFMul %197 %198 
                                       f32_4 %200 = OpLoad %9 
                                       f32_4 %201 = OpVectorShuffle %200 %199 4 1 5 3 
                                                      OpStore %9 %201 
                                       f32_4 %203 = OpLoad %76 
                                       f32_2 %204 = OpVectorShuffle %203 %203 2 3 
                                       f32_4 %205 = OpLoad %202 
                                       f32_4 %206 = OpVectorShuffle %205 %204 0 1 4 5 
                                                      OpStore %202 %206 
                                       f32_4 %207 = OpLoad %9 
                                       f32_2 %208 = OpVectorShuffle %207 %207 2 2 
                                       f32_4 %209 = OpLoad %9 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 3 
                                       f32_2 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %202 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 2 3 
                                                      OpStore %202 %213 
                                 Output f32* %215 = OpAccessChain %119 %60 %43 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                 Output f32* %218 = OpAccessChain %119 %60 %43 
                                                      OpStore %218 %217 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 544
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %44 %254 %309 %536 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %44 Location 44 
                                                      OpDecorate %48 ArrayStride 48 
                                                      OpDecorate %49 ArrayStride 49 
                                                      OpMemberDecorate %50 0 Offset 50 
                                                      OpMemberDecorate %50 1 RelaxedPrecision 
                                                      OpMemberDecorate %50 1 Offset 50 
                                                      OpMemberDecorate %50 2 RelaxedPrecision 
                                                      OpMemberDecorate %50 2 Offset 50 
                                                      OpMemberDecorate %50 3 Offset 50 
                                                      OpMemberDecorate %50 4 Offset 50 
                                                      OpMemberDecorate %50 5 Offset 50 
                                                      OpMemberDecorate %50 6 Offset 50 
                                                      OpMemberDecorate %50 7 Offset 50 
                                                      OpMemberDecorate %50 8 Offset 50 
                                                      OpMemberDecorate %50 9 RelaxedPrecision 
                                                      OpMemberDecorate %50 9 Offset 50 
                                                      OpDecorate %50 Block 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %136 SpecId 136 
                                                      OpDecorate %231 DescriptorSet 231 
                                                      OpDecorate %231 Binding 231 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %254 Location 254 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 DescriptorSet 263 
                                                      OpDecorate %263 Binding 263 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 Location 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %536 Location 536 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Input %42 
                                 Input f32_3* %44 = OpVariable Input 
                                          u32 %47 = OpConstant 4 
                                              %48 = OpTypeArray %7 %47 
                                              %49 = OpTypeArray %7 %47 
                                              %50 = OpTypeStruct %42 %7 %7 %7 %48 %7 %49 %42 %42 %7 
                                              %51 = OpTypePointer Uniform %50 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %52 = OpVariable Uniform 
                                              %53 = OpTypePointer Uniform %42 
                               Private f32_4* %59 = OpVariable Private 
                                          i32 %60 = OpConstant 4 
                                          u32 %61 = OpConstant 2 
                                              %62 = OpTypePointer Uniform %6 
                                          u32 %65 = OpConstant 0 
                                          u32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant 2 
                                 Private f32* %75 = OpVariable Private 
                                          i32 %82 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                               Private bool* %125 = OpVariable Private 
                                         i32 %126 = OpConstant 5 
                                        bool %130 = OpConstantFalse 
                                        bool %136 = OpSpecConstantFalse 
                               Private bool* %139 = OpVariable Private 
                                         i32 %145 = OpConstant 6 
                                             %182 = OpTypePointer Private %42 
                              Private f32_3* %183 = OpVariable Private 
                                             %184 = OpTypePointer Function %42 
                                         i32 %195 = OpConstant 8 
                                         i32 %201 = OpConstant 7 
                                         f32 %209 = OpConstant 3.67402E-40 
                                         f32 %211 = OpConstant 3.67402E-40 
                                             %214 = OpTypePointer Private %15 
                              Private f32_2* %215 = OpVariable Private 
                                         f32 %218 = OpConstant 3.67402E-40 
                                             %228 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %229 = OpTypeSampledImage %228 
                                             %230 = OpTypePointer UniformConstant %229 
 UniformConstant read_only Texture3DSampled* %231 = OpVariable UniformConstant 
                              Private f32_4* %236 = OpVariable Private 
                              Private f32_3* %243 = OpVariable Private 
                                             %253 = OpTypePointer Input %7 
                                Input f32_4* %254 = OpVariable Input 
                                Private f32* %262 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %263 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %284 = OpTypePointer Function %6 
                                         i32 %298 = OpConstant 9 
                                Input f32_3* %309 = OpVariable Input 
                              Private f32_2* %325 = OpVariable Private 
                                         f32 %333 = OpConstant 3.67402E-40 
                                         f32 %348 = OpConstant 3.67402E-40 
                                       f32_2 %349 = OpConstantComposite %333 %348 
                              Private f32_4* %373 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                         f32 %420 = OpConstant 3.67402E-40 
                                         f32 %422 = OpConstant 3.67402E-40 
                              Private f32_3* %454 = OpVariable Private 
                               Private bool* %471 = OpVariable Private 
                                Private f32* %477 = OpVariable Private 
                                         f32 %502 = OpConstant 3.67402E-40 
                                       f32_3 %503 = OpConstantComposite %123 %348 %502 
                                       f32_3 %508 = OpConstantComposite %420 %420 %420 
                                         f32 %510 = OpConstant 3.67402E-40 
                                       f32_3 %511 = OpConstantComposite %510 %510 %510 
                                       f32_3 %515 = OpConstantComposite %333 %333 %333 
                                       f32_3 %527 = OpConstantComposite %123 %123 %123 
                                             %535 = OpTypePointer Output %7 
                               Output f32_4* %536 = OpVariable Output 
                                             %541 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %185 = OpVariable Function 
                               Function f32* %285 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                               Function f32* %358 = OpVariable Function 
                               Function f32* %447 = OpVariable Function 
                               Function f32* %478 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                        f32_3 %45 = OpLoad %44 
                                        f32_3 %46 = OpFNegate %45 
                               Uniform f32_3* %54 = OpAccessChain %52 %32 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpFAdd %46 %55 
                                        f32_4 %57 = OpLoad %41 
                                        f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                                      OpStore %41 %58 
                                 Uniform f32* %63 = OpAccessChain %52 %60 %32 %61 
                                          f32 %64 = OpLoad %63 
                                 Private f32* %66 = OpAccessChain %59 %65 
                                                      OpStore %66 %64 
                                 Uniform f32* %67 = OpAccessChain %52 %60 %33 %61 
                                          f32 %68 = OpLoad %67 
                                 Private f32* %70 = OpAccessChain %59 %69 
                                                      OpStore %70 %68 
                                 Uniform f32* %72 = OpAccessChain %52 %60 %71 %61 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %59 %61 
                                                      OpStore %74 %73 
                                        f32_4 %76 = OpLoad %41 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_4 %78 = OpLoad %59 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                          f32 %80 = OpDot %77 %79 
                                                      OpStore %75 %80 
                                        f32_3 %81 = OpLoad %44 
                               Uniform f32_4* %84 = OpAccessChain %52 %82 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFNegate %86 
                                        f32_3 %88 = OpFAdd %81 %87 
                                        f32_4 %89 = OpLoad %41 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 6 3 
                                                      OpStore %41 %90 
                                        f32_4 %91 = OpLoad %41 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_4 %93 = OpLoad %41 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                          f32 %95 = OpDot %92 %94 
                                 Private f32* %96 = OpAccessChain %41 %65 
                                                      OpStore %96 %95 
                                 Private f32* %97 = OpAccessChain %41 %65 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpExtInst %1 31 %98 
                                Private f32* %100 = OpAccessChain %41 %65 
                                                      OpStore %100 %99 
                                         f32 %101 = OpLoad %75 
                                         f32 %102 = OpFNegate %101 
                                Private f32* %103 = OpAccessChain %41 %65 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %41 %65 
                                                      OpStore %106 %105 
                                Uniform f32* %107 = OpAccessChain %52 %82 %24 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %41 %65 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                         f32 %112 = OpLoad %75 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %75 %113 
                                         f32 %114 = OpLoad %75 
                                Uniform f32* %115 = OpAccessChain %52 %71 %61 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %114 %116 
                                Uniform f32* %118 = OpAccessChain %52 %71 %24 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFAdd %117 %119 
                                                      OpStore %75 %120 
                                         f32 %121 = OpLoad %75 
                                         f32 %124 = OpExtInst %1 43 %121 %122 %123 
                                                      OpStore %75 %124 
                                Uniform f32* %127 = OpAccessChain %52 %126 %65 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %123 
                                                      OpStore %125 %129 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                        bool %133 = OpLoad %125 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %238 
                                             %137 = OpLabel 
                                Uniform f32* %140 = OpAccessChain %52 %126 %69 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdEqual %141 %123 
                                                      OpStore %139 %142 
                                       f32_3 %143 = OpLoad %44 
                                       f32_3 %144 = OpVectorShuffle %143 %143 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %52 %145 %33 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %144 %148 
                                       f32_4 %150 = OpLoad %59 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %59 %151 
                              Uniform f32_4* %152 = OpAccessChain %52 %145 %32 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %44 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %59 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %59 %162 
                              Uniform f32_4* %163 = OpAccessChain %52 %145 %71 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpLoad %44 
                                       f32_3 %167 = OpVectorShuffle %166 %166 2 2 2 
                                       f32_3 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %59 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %59 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %59 %173 
                                       f32_4 %174 = OpLoad %59 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_4* %176 = OpAccessChain %52 %145 %82 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                       f32_4 %180 = OpLoad %59 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %59 %181 
                                        bool %186 = OpLoad %139 
                                                      OpSelectionMerge %188 None 
                                                      OpBranchConditional %186 %187 %191 
                                             %187 = OpLabel 
                                       f32_4 %189 = OpLoad %59 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                      OpStore %185 %190 
                                                      OpBranch %188 
                                             %191 = OpLabel 
                                       f32_3 %192 = OpLoad %44 
                                                      OpStore %185 %192 
                                                      OpBranch %188 
                                             %188 = OpLabel 
                                       f32_3 %193 = OpLoad %185 
                                                      OpStore %183 %193 
                                       f32_3 %194 = OpLoad %183 
                              Uniform f32_3* %196 = OpAccessChain %52 %195 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpFAdd %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %200 = OpLoad %183 
                              Uniform f32_3* %202 = OpAccessChain %52 %201 
                                       f32_3 %203 = OpLoad %202 
                                       f32_3 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad %59 
                                       f32_4 %206 = OpVectorShuffle %205 %204 0 4 5 6 
                                                      OpStore %59 %206 
                                Private f32* %207 = OpAccessChain %59 %69 
                                         f32 %208 = OpLoad %207 
                                         f32 %210 = OpFMul %208 %209 
                                         f32 %212 = OpFAdd %210 %211 
                                Private f32* %213 = OpAccessChain %183 %65 
                                                      OpStore %213 %212 
                                Uniform f32* %216 = OpAccessChain %52 %126 %61 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                         f32 %220 = OpFAdd %219 %211 
                                Private f32* %221 = OpAccessChain %215 %65 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %215 %65 
                                         f32 %223 = OpLoad %222 
                                Private f32* %224 = OpAccessChain %183 %65 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpExtInst %1 40 %223 %225 
                                Private f32* %227 = OpAccessChain %59 %65 
                                                      OpStore %227 %226 
                  read_only Texture3DSampled %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %59 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 2 3 
                                       f32_4 %235 = OpImageSampleImplicitLod %232 %234 
                                                      OpStore %59 %235 
                                       f32_4 %237 = OpLoad %59 
                                                      OpStore %236 %237 
                                                      OpBranch %138 
                                             %238 = OpLabel 
                                Private f32* %239 = OpAccessChain %236 %65 
                                                      OpStore %239 %123 
                                Private f32* %240 = OpAccessChain %236 %69 
                                                      OpStore %240 %123 
                                Private f32* %241 = OpAccessChain %236 %61 
                                                      OpStore %241 %123 
                                Private f32* %242 = OpAccessChain %236 %24 
                                                      OpStore %242 %123 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_4 %244 = OpLoad %236 
                              Uniform f32_4* %245 = OpAccessChain %52 %33 
                                       f32_4 %246 = OpLoad %245 
                                         f32 %247 = OpDot %244 %246 
                                Private f32* %248 = OpAccessChain %243 %65 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %243 %65 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpExtInst %1 43 %250 %122 %123 
                                Private f32* %252 = OpAccessChain %243 %65 
                                                      OpStore %252 %251 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_4 %257 = OpLoad %254 
                                       f32_2 %258 = OpVectorShuffle %257 %257 3 3 
                                       f32_2 %259 = OpFDiv %256 %258 
                                       f32_3 %260 = OpLoad %183 
                                       f32_3 %261 = OpVectorShuffle %260 %259 3 4 2 
                                                      OpStore %183 %261 
                  read_only Texture2DSampled %264 = OpLoad %263 
                                       f32_3 %265 = OpLoad %183 
                                       f32_2 %266 = OpVectorShuffle %265 %265 0 1 
                                       f32_4 %267 = OpImageSampleImplicitLod %264 %266 
                                         f32 %268 = OpCompositeExtract %267 0 
                                                      OpStore %262 %268 
                                         f32 %270 = OpLoad %75 
                                         f32 %271 = OpLoad %262 
                                         f32 %272 = OpFAdd %270 %271 
                                Private f32* %273 = OpAccessChain %269 %65 
                                                      OpStore %273 %272 
                                Private f32* %274 = OpAccessChain %269 %65 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpExtInst %1 43 %275 %122 %123 
                                Private f32* %277 = OpAccessChain %269 %65 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %269 %65 
                                         f32 %279 = OpLoad %278 
                                Private f32* %280 = OpAccessChain %243 %65 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpExtInst %1 37 %279 %281 
                                Private f32* %283 = OpAccessChain %243 %65 
                                                      OpStore %283 %282 
                                        bool %286 = OpLoad %125 
                                                      OpSelectionMerge %288 None 
                                                      OpBranchConditional %286 %287 %291 
                                             %287 = OpLabel 
                                Private f32* %289 = OpAccessChain %243 %65 
                                         f32 %290 = OpLoad %289 
                                                      OpStore %285 %290 
                                                      OpBranch %288 
                                             %291 = OpLabel 
                                Private f32* %292 = OpAccessChain %269 %65 
                                         f32 %293 = OpLoad %292 
                                                      OpStore %285 %293 
                                                      OpBranch %288 
                                             %288 = OpLabel 
                                         f32 %294 = OpLoad %285 
                                Private f32* %295 = OpAccessChain %243 %65 
                                                      OpStore %295 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %299 = OpAccessChain %52 %298 
                                       f32_4 %300 = OpLoad %299 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpFMul %297 %301 
                                                      OpStore %269 %302 
                                       f32_3 %303 = OpLoad %243 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %269 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %243 %306 
                                       f32_4 %307 = OpLoad %9 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %310 = OpLoad %309 
                                       f32_3 %311 = OpFMul %308 %310 
                                       f32_3 %312 = OpLoad %243 
                                       f32_3 %313 = OpFAdd %311 %312 
                                                      OpStore %243 %313 
                                Private f32* %314 = OpAccessChain %243 %69 
                                         f32 %315 = OpLoad %314 
                                Private f32* %316 = OpAccessChain %243 %61 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %315 %317 
                                                      OpStore %22 %318 
                                        bool %320 = OpLoad %22 
                                                      OpSelectionMerge %322 None 
                                                      OpBranchConditional %320 %321 %323 
                                             %321 = OpLabel 
                                                      OpStore %319 %123 
                                                      OpBranch %322 
                                             %323 = OpLabel 
                                                      OpStore %319 %122 
                                                      OpBranch %322 
                                             %322 = OpLabel 
                                         f32 %324 = OpLoad %319 
                                                      OpStore %75 %324 
                                       f32_3 %326 = OpLoad %243 
                                       f32_2 %327 = OpVectorShuffle %326 %326 2 1 
                                       f32_2 %328 = OpFNegate %327 
                                       f32_3 %329 = OpLoad %243 
                                       f32_2 %330 = OpVectorShuffle %329 %329 1 2 
                                       f32_2 %331 = OpFAdd %328 %330 
                                                      OpStore %325 %331 
                                Private f32* %332 = OpAccessChain %215 %65 
                                                      OpStore %332 %123 
                                Private f32* %334 = OpAccessChain %215 %69 
                                                      OpStore %334 %333 
                                         f32 %335 = OpLoad %75 
                                       f32_2 %336 = OpCompositeConstruct %335 %335 
                                       f32_2 %337 = OpLoad %325 
                                       f32_2 %338 = OpFMul %336 %337 
                                       f32_3 %339 = OpLoad %243 
                                       f32_2 %340 = OpVectorShuffle %339 %339 2 1 
                                       f32_2 %341 = OpFAdd %338 %340 
                                       f32_4 %342 = OpLoad %59 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 2 3 
                                                      OpStore %59 %343 
                                         f32 %344 = OpLoad %75 
                                       f32_2 %345 = OpCompositeConstruct %344 %344 
                                       f32_2 %346 = OpLoad %215 
                                       f32_2 %347 = OpFMul %345 %346 
                                       f32_2 %350 = OpFAdd %347 %349 
                                       f32_4 %351 = OpLoad %59 
                                       f32_4 %352 = OpVectorShuffle %351 %350 0 1 4 5 
                                                      OpStore %59 %352 
                                Private f32* %353 = OpAccessChain %243 %65 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %59 %65 
                                         f32 %356 = OpLoad %355 
                                        bool %357 = OpFOrdGreaterThanEqual %354 %356 
                                                      OpStore %22 %357 
                                        bool %359 = OpLoad %22 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %359 %360 %362 
                                             %360 = OpLabel 
                                                      OpStore %358 %123 
                                                      OpBranch %361 
                                             %362 = OpLabel 
                                                      OpStore %358 %122 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                         f32 %363 = OpLoad %358 
                                                      OpStore %75 %363 
                                       f32_4 %364 = OpLoad %59 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 3 
                                       f32_3 %366 = OpFNegate %365 
                                       f32_4 %367 = OpLoad %41 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %41 %368 
                                Private f32* %369 = OpAccessChain %243 %65 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFNegate %370 
                                Private f32* %372 = OpAccessChain %41 %24 
                                                      OpStore %372 %371 
                                Private f32* %374 = OpAccessChain %41 %65 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %243 %65 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFAdd %375 %377 
                                Private f32* %379 = OpAccessChain %373 %65 
                                                      OpStore %379 %378 
                                       f32_4 %380 = OpLoad %41 
                                       f32_3 %381 = OpVectorShuffle %380 %380 1 2 3 
                                       f32_4 %382 = OpLoad %59 
                                       f32_3 %383 = OpVectorShuffle %382 %382 1 2 0 
                                       f32_3 %384 = OpFAdd %381 %383 
                                       f32_4 %385 = OpLoad %373 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 4 5 6 
                                                      OpStore %373 %386 
                                         f32 %387 = OpLoad %75 
                                       f32_3 %388 = OpCompositeConstruct %387 %387 %387 
                                       f32_4 %389 = OpLoad %373 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFMul %388 %390 
                                       f32_4 %392 = OpLoad %59 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 3 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %41 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 6 3 
                                                      OpStore %41 %396 
                                         f32 %397 = OpLoad %75 
                                Private f32* %398 = OpAccessChain %373 %24 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpFMul %397 %399 
                                Private f32* %401 = OpAccessChain %243 %65 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFAdd %400 %402 
                                                      OpStore %75 %403 
                                Private f32* %405 = OpAccessChain %41 %69 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpLoad %75 
                                         f32 %408 = OpExtInst %1 37 %406 %407 
                                                      OpStore %404 %408 
                                         f32 %409 = OpLoad %404 
                                         f32 %410 = OpFNegate %409 
                                Private f32* %411 = OpAccessChain %41 %65 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFAdd %410 %412 
                                                      OpStore %404 %413 
                                Private f32* %414 = OpAccessChain %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %75 
                                         f32 %418 = OpFAdd %416 %417 
                                                      OpStore %75 %418 
                                         f32 %419 = OpLoad %404 
                                         f32 %421 = OpFMul %419 %420 
                                         f32 %423 = OpFAdd %421 %422 
                                Private f32* %424 = OpAccessChain %183 %65 
                                                      OpStore %424 %423 
                                         f32 %425 = OpLoad %75 
                                Private f32* %426 = OpAccessChain %183 %65 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFDiv %425 %427 
                                                      OpStore %75 %428 
                                         f32 %429 = OpLoad %75 
                                Private f32* %430 = OpAccessChain %41 %61 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFAdd %429 %431 
                                                      OpStore %75 %432 
                                Private f32* %433 = OpAccessChain %41 %65 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFAdd %434 %422 
                                Private f32* %436 = OpAccessChain %41 %65 
                                                      OpStore %436 %435 
                                         f32 %437 = OpLoad %404 
                                Private f32* %438 = OpAccessChain %41 %65 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFDiv %437 %439 
                                Private f32* %441 = OpAccessChain %41 %65 
                                                      OpStore %441 %440 
                                Private f32* %442 = OpAccessChain %9 %69 
                                         f32 %443 = OpLoad %442 
                                Private f32* %444 = OpAccessChain %9 %61 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %139 %446 
                                        bool %448 = OpLoad %139 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %451 
                                             %449 = OpLabel 
                                                      OpStore %447 %123 
                                                      OpBranch %450 
                                             %451 = OpLabel 
                                                      OpStore %447 %122 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                                         f32 %452 = OpLoad %447 
                                Private f32* %453 = OpAccessChain %183 %65 
                                                      OpStore %453 %452 
                                Private f32* %455 = OpAccessChain %9 %61 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFNegate %456 
                                Private f32* %458 = OpAccessChain %9 %69 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFAdd %457 %459 
                                Private f32* %461 = OpAccessChain %454 %65 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %183 %65 
                                         f32 %463 = OpLoad %462 
                                Private f32* %464 = OpAccessChain %454 %65 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFMul %463 %465 
                                Private f32* %467 = OpAccessChain %9 %61 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFAdd %466 %468 
                                Private f32* %470 = OpAccessChain %454 %65 
                                                      OpStore %470 %469 
                                Private f32* %472 = OpAccessChain %9 %65 
                                         f32 %473 = OpLoad %472 
                                Private f32* %474 = OpAccessChain %454 %65 
                                         f32 %475 = OpLoad %474 
                                        bool %476 = OpFOrdGreaterThanEqual %473 %475 
                                                      OpStore %471 %476 
                                        bool %479 = OpLoad %471 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %479 %480 %482 
                                             %480 = OpLabel 
                                                      OpStore %478 %123 
                                                      OpBranch %481 
                                             %482 = OpLabel 
                                                      OpStore %478 %122 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %483 = OpLoad %478 
                                                      OpStore %477 %483 
                                Private f32* %484 = OpAccessChain %454 %65 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFNegate %485 
                                Private f32* %487 = OpAccessChain %9 %65 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFAdd %486 %488 
                                Private f32* %490 = OpAccessChain %9 %65 
                                                      OpStore %490 %489 
                                         f32 %491 = OpLoad %477 
                                Private f32* %492 = OpAccessChain %9 %65 
                                         f32 %493 = OpLoad %492 
                                         f32 %494 = OpFMul %491 %493 
                                Private f32* %495 = OpAccessChain %454 %65 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %9 %65 
                                                      OpStore %498 %497 
                                         f32 %499 = OpLoad %75 
                                       f32_3 %500 = OpCompositeConstruct %499 %499 %499 
                                       f32_3 %501 = OpExtInst %1 4 %500 
                                       f32_3 %504 = OpFAdd %501 %503 
                                                      OpStore %454 %504 
                                       f32_3 %505 = OpLoad %454 
                                       f32_3 %506 = OpExtInst %1 10 %505 
                                                      OpStore %454 %506 
                                       f32_3 %507 = OpLoad %454 
                                       f32_3 %509 = OpFMul %507 %508 
                                       f32_3 %512 = OpFAdd %509 %511 
                                                      OpStore %454 %512 
                                       f32_3 %513 = OpLoad %454 
                                       f32_3 %514 = OpExtInst %1 4 %513 
                                       f32_3 %516 = OpFAdd %514 %515 
                                                      OpStore %454 %516 
                                       f32_3 %517 = OpLoad %454 
                                       f32_3 %518 = OpCompositeConstruct %122 %122 %122 
                                       f32_3 %519 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %520 = OpExtInst %1 43 %517 %518 %519 
                                                      OpStore %454 %520 
                                       f32_3 %521 = OpLoad %454 
                                       f32_3 %522 = OpFAdd %521 %515 
                                                      OpStore %454 %522 
                                       f32_4 %523 = OpLoad %41 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 0 0 
                                       f32_3 %525 = OpLoad %454 
                                       f32_3 %526 = OpFMul %524 %525 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %454 %528 
                                       f32_3 %529 = OpLoad %454 
                                       f32_4 %530 = OpLoad %9 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 0 0 
                                       f32_3 %532 = OpFMul %529 %531 
                                       f32_4 %533 = OpLoad %9 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %9 %534 
                                       f32_4 %537 = OpLoad %9 
                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
                                       f32_4 %539 = OpLoad %536 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %536 %540 
                                 Output f32* %542 = OpAccessChain %536 %24 
                                                      OpStore %542 %123 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat17;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat5 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat5 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat2.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.x = u_xlat2.y * u_xlat2.y;
    u_xlat0.x = u_xlat2.x * u_xlat2.x + (-u_xlat0.x);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat0.xyz = unity_SHC.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat2);
    u_xlat3.y = dot(unity_SHAg, u_xlat2);
    u_xlat3.z = dot(unity_SHAb, u_xlat2);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    vs_TEXCOORD5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat12) + u_xlat1.x;
    u_xlat12 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat12;
    u_xlat12 = u_xlat12 * _LightShadowData.z + _LightShadowData.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat9.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9.x, u_xlat5.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat9.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat9.xy);
    u_xlat12 = u_xlat12 + u_xlat10_2.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat5.x = min(u_xlat12, u_xlat5.x);
    u_xlat12 = (u_xlatb1) ? u_xlat5.x : u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5.x = u_xlat5.x / u_xlat13;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 329
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %121 %127 %128 %142 %179 %182 %185 %187 %296 %311 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 RelaxedPrecision 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 RelaxedPrecision 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 RelaxedPrecision 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 RelaxedPrecision 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 RelaxedPrecision 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpMemberDecorate %15 6 RelaxedPrecision 
                                                      OpMemberDecorate %15 6 Offset 15 
                                                      OpMemberDecorate %15 7 RelaxedPrecision 
                                                      OpMemberDecorate %15 7 Offset 15 
                                                      OpMemberDecorate %15 8 Offset 15 
                                                      OpMemberDecorate %15 9 Offset 15 
                                                      OpMemberDecorate %15 10 Offset 15 
                                                      OpMemberDecorate %15 11 Offset 15 
                                                      OpMemberDecorate %15 12 Offset 15 
                                                      OpMemberDecorate %15 13 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %119 0 BuiltIn 119 
                                                      OpMemberDecorate %119 1 BuiltIn 119 
                                                      OpMemberDecorate %119 2 BuiltIn 119 
                                                      OpDecorate %119 Block 
                                                      OpDecorate %127 Location 127 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %142 Location 142 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %182 Location 182 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %187 Location 187 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %296 Location 296 
                                                      OpDecorate %311 Location 311 
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
                                              %15 = OpTypeStruct %7 %7 %7 %7 %7 %7 %7 %7 %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 12 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 11 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 8 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %61 = OpConstant 0 
                                          i32 %69 = OpConstant 2 
                               Private f32_4* %77 = OpVariable Private 
                                          i32 %79 = OpConstant 3 
                               Private f32_4* %90 = OpVariable Private 
                                          i32 %93 = OpConstant 10 
                                             %118 = OpTypeArray %6 %43 
                                             %119 = OpTypeStruct %7 %6 %118 
                                             %120 = OpTypePointer Output %119 
        Output struct {f32_4; f32; f32[1];}* %121 = OpVariable Output 
                                             %123 = OpTypePointer Output %7 
                                             %125 = OpTypeVector %6 2 
                                             %126 = OpTypePointer Output %125 
                               Output f32_2* %127 = OpVariable Output 
                                Input f32_4* %128 = OpVariable Input 
                                         i32 %131 = OpConstant 13 
                                             %140 = OpTypeVector %6 3 
                                             %141 = OpTypePointer Input %140 
                                Input f32_3* %142 = OpVariable Input 
                                         i32 %144 = OpConstant 9 
                                         u32 %161 = OpConstant 2 
                                Private f32* %163 = OpVariable Private 
                                             %178 = OpTypePointer Output %140 
                               Output f32_3* %179 = OpVariable Output 
                               Output f32_3* %182 = OpVariable Output 
                               Output f32_4* %185 = OpVariable Output 
                               Output f32_4* %187 = OpVariable Output 
                                         f32 %188 = OpConstant 3.67402E-40 
                                       f32_4 %189 = OpConstantComposite %188 %188 %188 %188 
                                             %190 = OpTypePointer Private %140 
                              Private f32_3* %191 = OpVariable Private 
                              Private f32_4* %208 = OpVariable Private 
                              Private f32_3* %214 = OpVariable Private 
                                         i32 %215 = OpConstant 4 
                                         i32 %221 = OpConstant 5 
                                         i32 %227 = OpConstant 6 
                                         i32 %233 = OpConstant 7 
                                         u32 %242 = OpConstant 3 
                                       f32_3 %263 = OpConstantComposite %188 %188 %188 
                                         f32 %271 = OpConstant 3.67402E-40 
                                       f32_3 %272 = OpConstantComposite %271 %271 %271 
                                         f32 %283 = OpConstant 3.67402E-40 
                                       f32_3 %284 = OpConstantComposite %283 %283 %283 
                                         f32 %286 = OpConstant 3.67402E-40 
                                       f32_3 %287 = OpConstantComposite %286 %286 %286 
                               Output f32_3* %296 = OpVariable Output 
                                       f32_3 %307 = OpConstantComposite %32 %32 %32 
                               Output f32_4* %311 = OpVariable Output 
                                             %323 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %62 = OpAccessChain %17 %55 %61 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %42 
                                        f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %9 %68 
                               Uniform f32_4* %70 = OpAccessChain %17 %55 %69 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %42 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                                        f32_4 %78 = OpLoad %9 
                               Uniform f32_4* %80 = OpAccessChain %17 %55 %79 
                                        f32_4 %81 = OpLoad %80 
                                        f32_4 %82 = OpFAdd %78 %81 
                                                      OpStore %77 %82 
                               Uniform f32_4* %83 = OpAccessChain %17 %55 %79 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpLoad %42 
                                        f32_4 %86 = OpVectorShuffle %85 %85 3 3 3 3 
                                        f32_4 %87 = OpFMul %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFAdd %87 %88 
                                                      OpStore %9 %89 
                                        f32_4 %91 = OpLoad %77 
                                        f32_4 %92 = OpVectorShuffle %91 %91 1 1 1 1 
                               Uniform f32_4* %94 = OpAccessChain %17 %93 %56 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %90 %96 
                               Uniform f32_4* %97 = OpAccessChain %17 %93 %61 
                                        f32_4 %98 = OpLoad %97 
                                        f32_4 %99 = OpLoad %77 
                                       f32_4 %100 = OpVectorShuffle %99 %99 0 0 0 0 
                                       f32_4 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %90 
                                       f32_4 %103 = OpFAdd %101 %102 
                                                      OpStore %90 %103 
                              Uniform f32_4* %104 = OpAccessChain %17 %93 %69 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %77 
                                       f32_4 %107 = OpVectorShuffle %106 %106 2 2 2 2 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %90 
                                       f32_4 %110 = OpFAdd %108 %109 
                                                      OpStore %90 %110 
                              Uniform f32_4* %111 = OpAccessChain %17 %93 %79 
                                       f32_4 %112 = OpLoad %111 
                                       f32_4 %113 = OpLoad %77 
                                       f32_4 %114 = OpVectorShuffle %113 %113 3 3 3 3 
                                       f32_4 %115 = OpFMul %112 %114 
                                       f32_4 %116 = OpLoad %90 
                                       f32_4 %117 = OpFAdd %115 %116 
                                                      OpStore %77 %117 
                                       f32_4 %122 = OpLoad %77 
                               Output f32_4* %124 = OpAccessChain %121 %61 
                                                      OpStore %124 %122 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                              Uniform f32_4* %132 = OpAccessChain %17 %131 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                                       f32_2 %135 = OpFMul %130 %134 
                              Uniform f32_4* %136 = OpAccessChain %17 %131 
                                       f32_4 %137 = OpLoad %136 
                                       f32_2 %138 = OpVectorShuffle %137 %137 2 3 
                                       f32_2 %139 = OpFAdd %135 %138 
                                                      OpStore %127 %139 
                                       f32_3 %143 = OpLoad %142 
                              Uniform f32_4* %145 = OpAccessChain %17 %144 %61 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                         f32 %148 = OpDot %143 %147 
                                Private f32* %149 = OpAccessChain %90 %27 
                                                      OpStore %149 %148 
                                       f32_3 %150 = OpLoad %142 
                              Uniform f32_4* %151 = OpAccessChain %17 %144 %56 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                                         f32 %154 = OpDot %150 %153 
                                Private f32* %155 = OpAccessChain %90 %43 
                                                      OpStore %155 %154 
                                       f32_3 %156 = OpLoad %142 
                              Uniform f32_4* %157 = OpAccessChain %17 %144 %69 
                                       f32_4 %158 = OpLoad %157 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                         f32 %160 = OpDot %156 %159 
                                Private f32* %162 = OpAccessChain %90 %161 
                                                      OpStore %162 %160 
                                       f32_4 %164 = OpLoad %90 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_4 %166 = OpLoad %90 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                         f32 %168 = OpDot %165 %167 
                                                      OpStore %163 %168 
                                         f32 %169 = OpLoad %163 
                                         f32 %170 = OpExtInst %1 32 %169 
                                                      OpStore %163 %170 
                                         f32 %171 = OpLoad %163 
                                       f32_3 %172 = OpCompositeConstruct %171 %171 %171 
                                       f32_4 %173 = OpLoad %90 
                                       f32_3 %174 = OpVectorShuffle %173 %173 0 1 2 
                                       f32_3 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %90 
                                       f32_4 %177 = OpVectorShuffle %176 %175 4 5 6 3 
                                                      OpStore %90 %177 
                                       f32_4 %180 = OpLoad %90 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                                      OpStore %179 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                                      OpStore %182 %184 
                                       f32_4 %186 = OpLoad %9 
                                                      OpStore %185 %186 
                                                      OpStore %187 %189 
                                Private f32* %192 = OpAccessChain %90 %43 
                                         f32 %193 = OpLoad %192 
                                Private f32* %194 = OpAccessChain %90 %43 
                                         f32 %195 = OpLoad %194 
                                         f32 %196 = OpFMul %193 %195 
                                Private f32* %197 = OpAccessChain %191 %27 
                                                      OpStore %197 %196 
                                Private f32* %198 = OpAccessChain %90 %27 
                                         f32 %199 = OpLoad %198 
                                Private f32* %200 = OpAccessChain %90 %27 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFMul %199 %201 
                                Private f32* %203 = OpAccessChain %191 %27 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFNegate %204 
                                         f32 %206 = OpFAdd %202 %205 
                                Private f32* %207 = OpAccessChain %191 %27 
                                                      OpStore %207 %206 
                                       f32_4 %209 = OpLoad %90 
                                       f32_4 %210 = OpVectorShuffle %209 %209 1 2 2 0 
                                       f32_4 %211 = OpLoad %90 
                                       f32_4 %212 = OpVectorShuffle %211 %211 0 1 2 2 
                                       f32_4 %213 = OpFMul %210 %212 
                                                      OpStore %208 %213 
                              Uniform f32_4* %216 = OpAccessChain %17 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpLoad %208 
                                         f32 %219 = OpDot %217 %218 
                                Private f32* %220 = OpAccessChain %214 %27 
                                                      OpStore %220 %219 
                              Uniform f32_4* %222 = OpAccessChain %17 %221 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpLoad %208 
                                         f32 %225 = OpDot %223 %224 
                                Private f32* %226 = OpAccessChain %214 %43 
                                                      OpStore %226 %225 
                              Uniform f32_4* %228 = OpAccessChain %17 %227 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %208 
                                         f32 %231 = OpDot %229 %230 
                                Private f32* %232 = OpAccessChain %214 %161 
                                                      OpStore %232 %231 
                              Uniform f32_4* %234 = OpAccessChain %17 %233 
                                       f32_4 %235 = OpLoad %234 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpLoad %191 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpFMul %236 %238 
                                       f32_3 %240 = OpLoad %214 
                                       f32_3 %241 = OpFAdd %239 %240 
                                                      OpStore %191 %241 
                                Private f32* %243 = OpAccessChain %90 %242 
                                                      OpStore %243 %39 
                              Uniform f32_4* %244 = OpAccessChain %17 %56 
                                       f32_4 %245 = OpLoad %244 
                                       f32_4 %246 = OpLoad %90 
                                         f32 %247 = OpDot %245 %246 
                                Private f32* %248 = OpAccessChain %214 %27 
                                                      OpStore %248 %247 
                              Uniform f32_4* %249 = OpAccessChain %17 %69 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %90 
                                         f32 %252 = OpDot %250 %251 
                                Private f32* %253 = OpAccessChain %214 %43 
                                                      OpStore %253 %252 
                              Uniform f32_4* %254 = OpAccessChain %17 %79 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %256 = OpLoad %90 
                                         f32 %257 = OpDot %255 %256 
                                Private f32* %258 = OpAccessChain %214 %161 
                                                      OpStore %258 %257 
                                       f32_3 %259 = OpLoad %191 
                                       f32_3 %260 = OpLoad %214 
                                       f32_3 %261 = OpFAdd %259 %260 
                                                      OpStore %191 %261 
                                       f32_3 %262 = OpLoad %191 
                                       f32_3 %264 = OpExtInst %1 40 %262 %263 
                                                      OpStore %191 %264 
                                       f32_3 %265 = OpLoad %191 
                                       f32_3 %266 = OpExtInst %1 30 %265 
                                       f32_4 %267 = OpLoad %90 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %90 %268 
                                       f32_4 %269 = OpLoad %90 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_3 %273 = OpFMul %270 %272 
                                       f32_4 %274 = OpLoad %90 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %90 %275 
                                       f32_4 %276 = OpLoad %90 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                                       f32_3 %278 = OpExtInst %1 29 %277 
                                       f32_4 %279 = OpLoad %90 
                                       f32_4 %280 = OpVectorShuffle %279 %278 4 5 6 3 
                                                      OpStore %90 %280 
                                       f32_4 %281 = OpLoad %90 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 1 2 
                                       f32_3 %285 = OpFMul %282 %284 
                                       f32_3 %288 = OpFAdd %285 %287 
                                       f32_4 %289 = OpLoad %90 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %90 %290 
                                       f32_4 %291 = OpLoad %90 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_3 %293 = OpExtInst %1 40 %292 %263 
                                       f32_4 %294 = OpLoad %90 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %90 %295 
                                       f32_4 %297 = OpLoad %90 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                                      OpStore %296 %298 
                                Private f32* %299 = OpAccessChain %77 %43 
                                         f32 %300 = OpLoad %299 
                                Uniform f32* %301 = OpAccessChain %17 %61 %27 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFMul %300 %302 
                                Private f32* %304 = OpAccessChain %77 %43 
                                                      OpStore %304 %303 
                                       f32_4 %305 = OpLoad %77 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 3 1 
                                       f32_3 %308 = OpFMul %306 %307 
                                       f32_4 %309 = OpLoad %90 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 1 5 6 
                                                      OpStore %90 %310 
                                       f32_4 %312 = OpLoad %77 
                                       f32_2 %313 = OpVectorShuffle %312 %312 2 3 
                                       f32_4 %314 = OpLoad %311 
                                       f32_4 %315 = OpVectorShuffle %314 %313 0 1 4 5 
                                                      OpStore %311 %315 
                                       f32_4 %316 = OpLoad %90 
                                       f32_2 %317 = OpVectorShuffle %316 %316 2 2 
                                       f32_4 %318 = OpLoad %90 
                                       f32_2 %319 = OpVectorShuffle %318 %318 0 3 
                                       f32_2 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %311 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 2 3 
                                                      OpStore %311 %322 
                                 Output f32* %324 = OpAccessChain %121 %61 %43 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFNegate %325 
                                 Output f32* %327 = OpAccessChain %121 %61 %43 
                                                      OpStore %327 %326 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 544
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %44 %254 %309 %536 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %44 Location 44 
                                                      OpDecorate %48 ArrayStride 48 
                                                      OpDecorate %49 ArrayStride 49 
                                                      OpMemberDecorate %50 0 Offset 50 
                                                      OpMemberDecorate %50 1 RelaxedPrecision 
                                                      OpMemberDecorate %50 1 Offset 50 
                                                      OpMemberDecorate %50 2 RelaxedPrecision 
                                                      OpMemberDecorate %50 2 Offset 50 
                                                      OpMemberDecorate %50 3 Offset 50 
                                                      OpMemberDecorate %50 4 Offset 50 
                                                      OpMemberDecorate %50 5 Offset 50 
                                                      OpMemberDecorate %50 6 Offset 50 
                                                      OpMemberDecorate %50 7 Offset 50 
                                                      OpMemberDecorate %50 8 Offset 50 
                                                      OpMemberDecorate %50 9 RelaxedPrecision 
                                                      OpMemberDecorate %50 9 Offset 50 
                                                      OpDecorate %50 Block 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %136 SpecId 136 
                                                      OpDecorate %231 DescriptorSet 231 
                                                      OpDecorate %231 Binding 231 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %254 Location 254 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 DescriptorSet 263 
                                                      OpDecorate %263 Binding 263 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 Location 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %536 Location 536 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Input %42 
                                 Input f32_3* %44 = OpVariable Input 
                                          u32 %47 = OpConstant 4 
                                              %48 = OpTypeArray %7 %47 
                                              %49 = OpTypeArray %7 %47 
                                              %50 = OpTypeStruct %42 %7 %7 %7 %48 %7 %49 %42 %42 %7 
                                              %51 = OpTypePointer Uniform %50 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %52 = OpVariable Uniform 
                                              %53 = OpTypePointer Uniform %42 
                               Private f32_4* %59 = OpVariable Private 
                                          i32 %60 = OpConstant 4 
                                          u32 %61 = OpConstant 2 
                                              %62 = OpTypePointer Uniform %6 
                                          u32 %65 = OpConstant 0 
                                          u32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant 2 
                                 Private f32* %75 = OpVariable Private 
                                          i32 %82 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                               Private bool* %125 = OpVariable Private 
                                         i32 %126 = OpConstant 5 
                                        bool %130 = OpConstantFalse 
                                        bool %136 = OpSpecConstantFalse 
                               Private bool* %139 = OpVariable Private 
                                         i32 %145 = OpConstant 6 
                                             %182 = OpTypePointer Private %42 
                              Private f32_3* %183 = OpVariable Private 
                                             %184 = OpTypePointer Function %42 
                                         i32 %195 = OpConstant 8 
                                         i32 %201 = OpConstant 7 
                                         f32 %209 = OpConstant 3.67402E-40 
                                         f32 %211 = OpConstant 3.67402E-40 
                                             %214 = OpTypePointer Private %15 
                              Private f32_2* %215 = OpVariable Private 
                                         f32 %218 = OpConstant 3.67402E-40 
                                             %228 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %229 = OpTypeSampledImage %228 
                                             %230 = OpTypePointer UniformConstant %229 
 UniformConstant read_only Texture3DSampled* %231 = OpVariable UniformConstant 
                              Private f32_4* %236 = OpVariable Private 
                              Private f32_3* %243 = OpVariable Private 
                                             %253 = OpTypePointer Input %7 
                                Input f32_4* %254 = OpVariable Input 
                                Private f32* %262 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %263 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %284 = OpTypePointer Function %6 
                                         i32 %298 = OpConstant 9 
                                Input f32_3* %309 = OpVariable Input 
                              Private f32_2* %325 = OpVariable Private 
                                         f32 %333 = OpConstant 3.67402E-40 
                                         f32 %348 = OpConstant 3.67402E-40 
                                       f32_2 %349 = OpConstantComposite %333 %348 
                              Private f32_4* %373 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                         f32 %420 = OpConstant 3.67402E-40 
                                         f32 %422 = OpConstant 3.67402E-40 
                              Private f32_3* %454 = OpVariable Private 
                               Private bool* %471 = OpVariable Private 
                                Private f32* %477 = OpVariable Private 
                                         f32 %502 = OpConstant 3.67402E-40 
                                       f32_3 %503 = OpConstantComposite %123 %348 %502 
                                       f32_3 %508 = OpConstantComposite %420 %420 %420 
                                         f32 %510 = OpConstant 3.67402E-40 
                                       f32_3 %511 = OpConstantComposite %510 %510 %510 
                                       f32_3 %515 = OpConstantComposite %333 %333 %333 
                                       f32_3 %527 = OpConstantComposite %123 %123 %123 
                                             %535 = OpTypePointer Output %7 
                               Output f32_4* %536 = OpVariable Output 
                                             %541 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %185 = OpVariable Function 
                               Function f32* %285 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                               Function f32* %358 = OpVariable Function 
                               Function f32* %447 = OpVariable Function 
                               Function f32* %478 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                        f32_3 %45 = OpLoad %44 
                                        f32_3 %46 = OpFNegate %45 
                               Uniform f32_3* %54 = OpAccessChain %52 %32 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpFAdd %46 %55 
                                        f32_4 %57 = OpLoad %41 
                                        f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                                      OpStore %41 %58 
                                 Uniform f32* %63 = OpAccessChain %52 %60 %32 %61 
                                          f32 %64 = OpLoad %63 
                                 Private f32* %66 = OpAccessChain %59 %65 
                                                      OpStore %66 %64 
                                 Uniform f32* %67 = OpAccessChain %52 %60 %33 %61 
                                          f32 %68 = OpLoad %67 
                                 Private f32* %70 = OpAccessChain %59 %69 
                                                      OpStore %70 %68 
                                 Uniform f32* %72 = OpAccessChain %52 %60 %71 %61 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %59 %61 
                                                      OpStore %74 %73 
                                        f32_4 %76 = OpLoad %41 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_4 %78 = OpLoad %59 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                          f32 %80 = OpDot %77 %79 
                                                      OpStore %75 %80 
                                        f32_3 %81 = OpLoad %44 
                               Uniform f32_4* %84 = OpAccessChain %52 %82 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFNegate %86 
                                        f32_3 %88 = OpFAdd %81 %87 
                                        f32_4 %89 = OpLoad %41 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 6 3 
                                                      OpStore %41 %90 
                                        f32_4 %91 = OpLoad %41 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_4 %93 = OpLoad %41 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                          f32 %95 = OpDot %92 %94 
                                 Private f32* %96 = OpAccessChain %41 %65 
                                                      OpStore %96 %95 
                                 Private f32* %97 = OpAccessChain %41 %65 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpExtInst %1 31 %98 
                                Private f32* %100 = OpAccessChain %41 %65 
                                                      OpStore %100 %99 
                                         f32 %101 = OpLoad %75 
                                         f32 %102 = OpFNegate %101 
                                Private f32* %103 = OpAccessChain %41 %65 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %41 %65 
                                                      OpStore %106 %105 
                                Uniform f32* %107 = OpAccessChain %52 %82 %24 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %41 %65 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                         f32 %112 = OpLoad %75 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %75 %113 
                                         f32 %114 = OpLoad %75 
                                Uniform f32* %115 = OpAccessChain %52 %71 %61 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %114 %116 
                                Uniform f32* %118 = OpAccessChain %52 %71 %24 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFAdd %117 %119 
                                                      OpStore %75 %120 
                                         f32 %121 = OpLoad %75 
                                         f32 %124 = OpExtInst %1 43 %121 %122 %123 
                                                      OpStore %75 %124 
                                Uniform f32* %127 = OpAccessChain %52 %126 %65 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %123 
                                                      OpStore %125 %129 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                        bool %133 = OpLoad %125 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %238 
                                             %137 = OpLabel 
                                Uniform f32* %140 = OpAccessChain %52 %126 %69 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdEqual %141 %123 
                                                      OpStore %139 %142 
                                       f32_3 %143 = OpLoad %44 
                                       f32_3 %144 = OpVectorShuffle %143 %143 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %52 %145 %33 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %144 %148 
                                       f32_4 %150 = OpLoad %59 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %59 %151 
                              Uniform f32_4* %152 = OpAccessChain %52 %145 %32 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %44 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %59 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %59 %162 
                              Uniform f32_4* %163 = OpAccessChain %52 %145 %71 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpLoad %44 
                                       f32_3 %167 = OpVectorShuffle %166 %166 2 2 2 
                                       f32_3 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %59 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %59 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %59 %173 
                                       f32_4 %174 = OpLoad %59 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_4* %176 = OpAccessChain %52 %145 %82 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                       f32_4 %180 = OpLoad %59 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %59 %181 
                                        bool %186 = OpLoad %139 
                                                      OpSelectionMerge %188 None 
                                                      OpBranchConditional %186 %187 %191 
                                             %187 = OpLabel 
                                       f32_4 %189 = OpLoad %59 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                      OpStore %185 %190 
                                                      OpBranch %188 
                                             %191 = OpLabel 
                                       f32_3 %192 = OpLoad %44 
                                                      OpStore %185 %192 
                                                      OpBranch %188 
                                             %188 = OpLabel 
                                       f32_3 %193 = OpLoad %185 
                                                      OpStore %183 %193 
                                       f32_3 %194 = OpLoad %183 
                              Uniform f32_3* %196 = OpAccessChain %52 %195 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpFAdd %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %200 = OpLoad %183 
                              Uniform f32_3* %202 = OpAccessChain %52 %201 
                                       f32_3 %203 = OpLoad %202 
                                       f32_3 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad %59 
                                       f32_4 %206 = OpVectorShuffle %205 %204 0 4 5 6 
                                                      OpStore %59 %206 
                                Private f32* %207 = OpAccessChain %59 %69 
                                         f32 %208 = OpLoad %207 
                                         f32 %210 = OpFMul %208 %209 
                                         f32 %212 = OpFAdd %210 %211 
                                Private f32* %213 = OpAccessChain %183 %65 
                                                      OpStore %213 %212 
                                Uniform f32* %216 = OpAccessChain %52 %126 %61 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                         f32 %220 = OpFAdd %219 %211 
                                Private f32* %221 = OpAccessChain %215 %65 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %215 %65 
                                         f32 %223 = OpLoad %222 
                                Private f32* %224 = OpAccessChain %183 %65 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpExtInst %1 40 %223 %225 
                                Private f32* %227 = OpAccessChain %59 %65 
                                                      OpStore %227 %226 
                  read_only Texture3DSampled %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %59 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 2 3 
                                       f32_4 %235 = OpImageSampleImplicitLod %232 %234 
                                                      OpStore %59 %235 
                                       f32_4 %237 = OpLoad %59 
                                                      OpStore %236 %237 
                                                      OpBranch %138 
                                             %238 = OpLabel 
                                Private f32* %239 = OpAccessChain %236 %65 
                                                      OpStore %239 %123 
                                Private f32* %240 = OpAccessChain %236 %69 
                                                      OpStore %240 %123 
                                Private f32* %241 = OpAccessChain %236 %61 
                                                      OpStore %241 %123 
                                Private f32* %242 = OpAccessChain %236 %24 
                                                      OpStore %242 %123 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_4 %244 = OpLoad %236 
                              Uniform f32_4* %245 = OpAccessChain %52 %33 
                                       f32_4 %246 = OpLoad %245 
                                         f32 %247 = OpDot %244 %246 
                                Private f32* %248 = OpAccessChain %243 %65 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %243 %65 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpExtInst %1 43 %250 %122 %123 
                                Private f32* %252 = OpAccessChain %243 %65 
                                                      OpStore %252 %251 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_4 %257 = OpLoad %254 
                                       f32_2 %258 = OpVectorShuffle %257 %257 3 3 
                                       f32_2 %259 = OpFDiv %256 %258 
                                       f32_3 %260 = OpLoad %183 
                                       f32_3 %261 = OpVectorShuffle %260 %259 3 4 2 
                                                      OpStore %183 %261 
                  read_only Texture2DSampled %264 = OpLoad %263 
                                       f32_3 %265 = OpLoad %183 
                                       f32_2 %266 = OpVectorShuffle %265 %265 0 1 
                                       f32_4 %267 = OpImageSampleImplicitLod %264 %266 
                                         f32 %268 = OpCompositeExtract %267 0 
                                                      OpStore %262 %268 
                                         f32 %270 = OpLoad %75 
                                         f32 %271 = OpLoad %262 
                                         f32 %272 = OpFAdd %270 %271 
                                Private f32* %273 = OpAccessChain %269 %65 
                                                      OpStore %273 %272 
                                Private f32* %274 = OpAccessChain %269 %65 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpExtInst %1 43 %275 %122 %123 
                                Private f32* %277 = OpAccessChain %269 %65 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %269 %65 
                                         f32 %279 = OpLoad %278 
                                Private f32* %280 = OpAccessChain %243 %65 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpExtInst %1 37 %279 %281 
                                Private f32* %283 = OpAccessChain %243 %65 
                                                      OpStore %283 %282 
                                        bool %286 = OpLoad %125 
                                                      OpSelectionMerge %288 None 
                                                      OpBranchConditional %286 %287 %291 
                                             %287 = OpLabel 
                                Private f32* %289 = OpAccessChain %243 %65 
                                         f32 %290 = OpLoad %289 
                                                      OpStore %285 %290 
                                                      OpBranch %288 
                                             %291 = OpLabel 
                                Private f32* %292 = OpAccessChain %269 %65 
                                         f32 %293 = OpLoad %292 
                                                      OpStore %285 %293 
                                                      OpBranch %288 
                                             %288 = OpLabel 
                                         f32 %294 = OpLoad %285 
                                Private f32* %295 = OpAccessChain %243 %65 
                                                      OpStore %295 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %299 = OpAccessChain %52 %298 
                                       f32_4 %300 = OpLoad %299 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpFMul %297 %301 
                                                      OpStore %269 %302 
                                       f32_3 %303 = OpLoad %243 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %269 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %243 %306 
                                       f32_4 %307 = OpLoad %9 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %310 = OpLoad %309 
                                       f32_3 %311 = OpFMul %308 %310 
                                       f32_3 %312 = OpLoad %243 
                                       f32_3 %313 = OpFAdd %311 %312 
                                                      OpStore %243 %313 
                                Private f32* %314 = OpAccessChain %243 %69 
                                         f32 %315 = OpLoad %314 
                                Private f32* %316 = OpAccessChain %243 %61 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %315 %317 
                                                      OpStore %22 %318 
                                        bool %320 = OpLoad %22 
                                                      OpSelectionMerge %322 None 
                                                      OpBranchConditional %320 %321 %323 
                                             %321 = OpLabel 
                                                      OpStore %319 %123 
                                                      OpBranch %322 
                                             %323 = OpLabel 
                                                      OpStore %319 %122 
                                                      OpBranch %322 
                                             %322 = OpLabel 
                                         f32 %324 = OpLoad %319 
                                                      OpStore %75 %324 
                                       f32_3 %326 = OpLoad %243 
                                       f32_2 %327 = OpVectorShuffle %326 %326 2 1 
                                       f32_2 %328 = OpFNegate %327 
                                       f32_3 %329 = OpLoad %243 
                                       f32_2 %330 = OpVectorShuffle %329 %329 1 2 
                                       f32_2 %331 = OpFAdd %328 %330 
                                                      OpStore %325 %331 
                                Private f32* %332 = OpAccessChain %215 %65 
                                                      OpStore %332 %123 
                                Private f32* %334 = OpAccessChain %215 %69 
                                                      OpStore %334 %333 
                                         f32 %335 = OpLoad %75 
                                       f32_2 %336 = OpCompositeConstruct %335 %335 
                                       f32_2 %337 = OpLoad %325 
                                       f32_2 %338 = OpFMul %336 %337 
                                       f32_3 %339 = OpLoad %243 
                                       f32_2 %340 = OpVectorShuffle %339 %339 2 1 
                                       f32_2 %341 = OpFAdd %338 %340 
                                       f32_4 %342 = OpLoad %59 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 2 3 
                                                      OpStore %59 %343 
                                         f32 %344 = OpLoad %75 
                                       f32_2 %345 = OpCompositeConstruct %344 %344 
                                       f32_2 %346 = OpLoad %215 
                                       f32_2 %347 = OpFMul %345 %346 
                                       f32_2 %350 = OpFAdd %347 %349 
                                       f32_4 %351 = OpLoad %59 
                                       f32_4 %352 = OpVectorShuffle %351 %350 0 1 4 5 
                                                      OpStore %59 %352 
                                Private f32* %353 = OpAccessChain %243 %65 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %59 %65 
                                         f32 %356 = OpLoad %355 
                                        bool %357 = OpFOrdGreaterThanEqual %354 %356 
                                                      OpStore %22 %357 
                                        bool %359 = OpLoad %22 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %359 %360 %362 
                                             %360 = OpLabel 
                                                      OpStore %358 %123 
                                                      OpBranch %361 
                                             %362 = OpLabel 
                                                      OpStore %358 %122 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                         f32 %363 = OpLoad %358 
                                                      OpStore %75 %363 
                                       f32_4 %364 = OpLoad %59 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 3 
                                       f32_3 %366 = OpFNegate %365 
                                       f32_4 %367 = OpLoad %41 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %41 %368 
                                Private f32* %369 = OpAccessChain %243 %65 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFNegate %370 
                                Private f32* %372 = OpAccessChain %41 %24 
                                                      OpStore %372 %371 
                                Private f32* %374 = OpAccessChain %41 %65 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %243 %65 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFAdd %375 %377 
                                Private f32* %379 = OpAccessChain %373 %65 
                                                      OpStore %379 %378 
                                       f32_4 %380 = OpLoad %41 
                                       f32_3 %381 = OpVectorShuffle %380 %380 1 2 3 
                                       f32_4 %382 = OpLoad %59 
                                       f32_3 %383 = OpVectorShuffle %382 %382 1 2 0 
                                       f32_3 %384 = OpFAdd %381 %383 
                                       f32_4 %385 = OpLoad %373 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 4 5 6 
                                                      OpStore %373 %386 
                                         f32 %387 = OpLoad %75 
                                       f32_3 %388 = OpCompositeConstruct %387 %387 %387 
                                       f32_4 %389 = OpLoad %373 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFMul %388 %390 
                                       f32_4 %392 = OpLoad %59 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 3 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %41 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 6 3 
                                                      OpStore %41 %396 
                                         f32 %397 = OpLoad %75 
                                Private f32* %398 = OpAccessChain %373 %24 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpFMul %397 %399 
                                Private f32* %401 = OpAccessChain %243 %65 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFAdd %400 %402 
                                                      OpStore %75 %403 
                                Private f32* %405 = OpAccessChain %41 %69 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpLoad %75 
                                         f32 %408 = OpExtInst %1 37 %406 %407 
                                                      OpStore %404 %408 
                                         f32 %409 = OpLoad %404 
                                         f32 %410 = OpFNegate %409 
                                Private f32* %411 = OpAccessChain %41 %65 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFAdd %410 %412 
                                                      OpStore %404 %413 
                                Private f32* %414 = OpAccessChain %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %75 
                                         f32 %418 = OpFAdd %416 %417 
                                                      OpStore %75 %418 
                                         f32 %419 = OpLoad %404 
                                         f32 %421 = OpFMul %419 %420 
                                         f32 %423 = OpFAdd %421 %422 
                                Private f32* %424 = OpAccessChain %183 %65 
                                                      OpStore %424 %423 
                                         f32 %425 = OpLoad %75 
                                Private f32* %426 = OpAccessChain %183 %65 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFDiv %425 %427 
                                                      OpStore %75 %428 
                                         f32 %429 = OpLoad %75 
                                Private f32* %430 = OpAccessChain %41 %61 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFAdd %429 %431 
                                                      OpStore %75 %432 
                                Private f32* %433 = OpAccessChain %41 %65 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFAdd %434 %422 
                                Private f32* %436 = OpAccessChain %41 %65 
                                                      OpStore %436 %435 
                                         f32 %437 = OpLoad %404 
                                Private f32* %438 = OpAccessChain %41 %65 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFDiv %437 %439 
                                Private f32* %441 = OpAccessChain %41 %65 
                                                      OpStore %441 %440 
                                Private f32* %442 = OpAccessChain %9 %69 
                                         f32 %443 = OpLoad %442 
                                Private f32* %444 = OpAccessChain %9 %61 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %139 %446 
                                        bool %448 = OpLoad %139 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %451 
                                             %449 = OpLabel 
                                                      OpStore %447 %123 
                                                      OpBranch %450 
                                             %451 = OpLabel 
                                                      OpStore %447 %122 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                                         f32 %452 = OpLoad %447 
                                Private f32* %453 = OpAccessChain %183 %65 
                                                      OpStore %453 %452 
                                Private f32* %455 = OpAccessChain %9 %61 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFNegate %456 
                                Private f32* %458 = OpAccessChain %9 %69 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFAdd %457 %459 
                                Private f32* %461 = OpAccessChain %454 %65 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %183 %65 
                                         f32 %463 = OpLoad %462 
                                Private f32* %464 = OpAccessChain %454 %65 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFMul %463 %465 
                                Private f32* %467 = OpAccessChain %9 %61 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFAdd %466 %468 
                                Private f32* %470 = OpAccessChain %454 %65 
                                                      OpStore %470 %469 
                                Private f32* %472 = OpAccessChain %9 %65 
                                         f32 %473 = OpLoad %472 
                                Private f32* %474 = OpAccessChain %454 %65 
                                         f32 %475 = OpLoad %474 
                                        bool %476 = OpFOrdGreaterThanEqual %473 %475 
                                                      OpStore %471 %476 
                                        bool %479 = OpLoad %471 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %479 %480 %482 
                                             %480 = OpLabel 
                                                      OpStore %478 %123 
                                                      OpBranch %481 
                                             %482 = OpLabel 
                                                      OpStore %478 %122 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %483 = OpLoad %478 
                                                      OpStore %477 %483 
                                Private f32* %484 = OpAccessChain %454 %65 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFNegate %485 
                                Private f32* %487 = OpAccessChain %9 %65 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFAdd %486 %488 
                                Private f32* %490 = OpAccessChain %9 %65 
                                                      OpStore %490 %489 
                                         f32 %491 = OpLoad %477 
                                Private f32* %492 = OpAccessChain %9 %65 
                                         f32 %493 = OpLoad %492 
                                         f32 %494 = OpFMul %491 %493 
                                Private f32* %495 = OpAccessChain %454 %65 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %9 %65 
                                                      OpStore %498 %497 
                                         f32 %499 = OpLoad %75 
                                       f32_3 %500 = OpCompositeConstruct %499 %499 %499 
                                       f32_3 %501 = OpExtInst %1 4 %500 
                                       f32_3 %504 = OpFAdd %501 %503 
                                                      OpStore %454 %504 
                                       f32_3 %505 = OpLoad %454 
                                       f32_3 %506 = OpExtInst %1 10 %505 
                                                      OpStore %454 %506 
                                       f32_3 %507 = OpLoad %454 
                                       f32_3 %509 = OpFMul %507 %508 
                                       f32_3 %512 = OpFAdd %509 %511 
                                                      OpStore %454 %512 
                                       f32_3 %513 = OpLoad %454 
                                       f32_3 %514 = OpExtInst %1 4 %513 
                                       f32_3 %516 = OpFAdd %514 %515 
                                                      OpStore %454 %516 
                                       f32_3 %517 = OpLoad %454 
                                       f32_3 %518 = OpCompositeConstruct %122 %122 %122 
                                       f32_3 %519 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %520 = OpExtInst %1 43 %517 %518 %519 
                                                      OpStore %454 %520 
                                       f32_3 %521 = OpLoad %454 
                                       f32_3 %522 = OpFAdd %521 %515 
                                                      OpStore %454 %522 
                                       f32_4 %523 = OpLoad %41 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 0 0 
                                       f32_3 %525 = OpLoad %454 
                                       f32_3 %526 = OpFMul %524 %525 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %454 %528 
                                       f32_3 %529 = OpLoad %454 
                                       f32_4 %530 = OpLoad %9 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 0 0 
                                       f32_3 %532 = OpFMul %529 %531 
                                       f32_4 %533 = OpLoad %9 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %9 %534 
                                       f32_4 %537 = OpLoad %9 
                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
                                       f32_4 %539 = OpLoad %536 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %536 %540 
                                 Output f32* %542 = OpAccessChain %536 %24 
                                                      OpStore %542 %123 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat5;
float u_xlat16;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat5 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat5 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4 = u_xlat0;
    u_xlat2 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat1.yyyy * u_xlat2;
    u_xlat2 = u_xlat2 * u_xlat2;
    u_xlat4 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat1.xxxx + u_xlat3;
    u_xlat2 = u_xlat4 * u_xlat4 + u_xlat2;
    u_xlat2 = u_xlat0 * u_xlat0 + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat1.zzzz + u_xlat3;
    u_xlat1 = max(u_xlat2, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat2 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat1 * u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    vs_TEXCOORD5.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5 = u_xlat5 / u_xlat13;
    u_xlat5 = u_xlat5 + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(vec3(u_xlat5)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 313
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %44 %116 %128 %129 %143 %180 %183 %186 %189 %304 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 RelaxedPrecision 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %44 Location 44 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %180 Location 180 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %304 Location 304 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %12 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 9 
                                              %22 = OpTypePointer Uniform %6 
                                          i32 %25 = OpConstant 8 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                 Private f32* %37 = OpVariable Private 
                                          f32 %41 = OpConstant 3.67402E-40 
                                              %43 = OpTypePointer Input %7 
                                 Input f32_4* %44 = OpVariable Input 
                                          u32 %45 = OpConstant 1 
                                              %46 = OpTypePointer Input %6 
                                          i32 %57 = OpConstant 5 
                                          i32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %71 = OpConstant 2 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %92 = OpVariable Private 
                                          i32 %95 = OpConstant 7 
                                             %113 = OpTypeArray %6 %45 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 10 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         i32 %145 = OpConstant 6 
                                         u32 %162 = OpConstant 2 
                                Private f32* %164 = OpVariable Private 
                                             %179 = OpTypePointer Output %141 
                               Output f32_3* %180 = OpVariable Output 
                               Output f32_3* %183 = OpVariable Output 
                               Output f32_4* %186 = OpVariable Output 
                                         f32 %187 = OpConstant 3.67402E-40 
                                       f32_4 %188 = OpConstantComposite %187 %187 %187 %187 
                               Output f32_4* %189 = OpVariable Output 
                              Private f32_4* %197 = OpVariable Private 
                              Private f32_4* %205 = OpVariable Private 
                                         f32 %241 = OpConstant 3.67402E-40 
                                       f32_4 %242 = OpConstantComposite %241 %241 %241 %241 
                                       f32_4 %250 = OpConstantComposite %41 %41 %41 %41 
                                         i32 %264 = OpConstant 4 
                               Output f32_3* %304 = OpVariable Output 
                                             %307 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                 Uniform f32* %26 = OpAccessChain %19 %25 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFMul %24 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                 Private f32* %32 = OpAccessChain %9 %29 
                                          f32 %33 = OpLoad %32 
                                          f32 %35 = OpFMul %33 %34 
                                 Private f32* %36 = OpAccessChain %9 %29 
                                                      OpStore %36 %35 
                                 Uniform f32* %38 = OpAccessChain %19 %25 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpFNegate %39 
                                          f32 %42 = OpFAdd %40 %41 
                                                      OpStore %37 %42 
                                   Input f32* %47 = OpAccessChain %44 %45 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpLoad %37 
                                          f32 %50 = OpFMul %48 %49 
                                 Private f32* %51 = OpAccessChain %9 %29 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %29 
                                                      OpStore %54 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               Uniform f32_4* %60 = OpAccessChain %19 %57 %58 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %56 %61 
                                                      OpStore %9 %62 
                               Uniform f32_4* %64 = OpAccessChain %19 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %44 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %9 %70 
                               Uniform f32_4* %72 = OpAccessChain %19 %57 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %44 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                               Uniform f32_4* %82 = OpAccessChain %19 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpFAdd %80 %83 
                                                      OpStore %79 %84 
                               Uniform f32_4* %85 = OpAccessChain %19 %57 %81 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %44 
                                        f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %9 %91 
                                        f32_4 %93 = OpLoad %79 
                                        f32_4 %94 = OpVectorShuffle %93 %93 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %19 %95 %58 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %94 %97 
                                                      OpStore %92 %98 
                               Uniform f32_4* %99 = OpAccessChain %19 %95 %63 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %79 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %92 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %92 %105 
                              Uniform f32_4* %106 = OpAccessChain %19 %95 %71 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %79 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %92 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %92 %112 
                              Uniform f32_4* %117 = OpAccessChain %19 %95 %81 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %79 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %92 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %63 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %19 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %19 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %146 = OpAccessChain %19 %145 %63 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %144 %148 
                                Private f32* %150 = OpAccessChain %79 %29 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %143 
                              Uniform f32_4* %152 = OpAccessChain %19 %145 %58 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %156 = OpAccessChain %79 %45 
                                                      OpStore %156 %155 
                                       f32_3 %157 = OpLoad %143 
                              Uniform f32_4* %158 = OpAccessChain %19 %145 %71 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %163 = OpAccessChain %79 %162 
                                                      OpStore %163 %161 
                                       f32_4 %165 = OpLoad %79 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_4 %167 = OpLoad %79 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                         f32 %169 = OpDot %166 %168 
                                                      OpStore %164 %169 
                                         f32 %170 = OpLoad %164 
                                         f32 %171 = OpExtInst %1 32 %170 
                                                      OpStore %164 %171 
                                         f32 %172 = OpLoad %164 
                                       f32_3 %173 = OpCompositeConstruct %172 %172 %172 
                                       f32_4 %174 = OpLoad %79 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %79 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %79 %178 
                                       f32_4 %181 = OpLoad %79 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                                      OpStore %180 %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                                      OpStore %183 %185 
                                                      OpStore %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                                      OpStore %189 %190 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %191 1 1 1 1 
                                       f32_4 %193 = OpFNegate %192 
                              Uniform f32_4* %194 = OpAccessChain %19 %58 
                                       f32_4 %195 = OpLoad %194 
                                       f32_4 %196 = OpFAdd %193 %195 
                                                      OpStore %92 %196 
                                       f32_4 %198 = OpLoad %79 
                                       f32_4 %199 = OpVectorShuffle %198 %198 1 1 1 1 
                                       f32_4 %200 = OpLoad %92 
                                       f32_4 %201 = OpFMul %199 %200 
                                                      OpStore %197 %201 
                                       f32_4 %202 = OpLoad %92 
                                       f32_4 %203 = OpLoad %92 
                                       f32_4 %204 = OpFMul %202 %203 
                                                      OpStore %92 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpVectorShuffle %206 %206 0 0 0 0 
                                       f32_4 %208 = OpFNegate %207 
                              Uniform f32_4* %209 = OpAccessChain %19 %63 
                                       f32_4 %210 = OpLoad %209 
                                       f32_4 %211 = OpFAdd %208 %210 
                                                      OpStore %205 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %212 2 2 2 2 
                                       f32_4 %214 = OpFNegate %213 
                              Uniform f32_4* %215 = OpAccessChain %19 %71 
                                       f32_4 %216 = OpLoad %215 
                                       f32_4 %217 = OpFAdd %214 %216 
                                                      OpStore %9 %217 
                                       f32_4 %218 = OpLoad %205 
                                       f32_4 %219 = OpLoad %79 
                                       f32_4 %220 = OpVectorShuffle %219 %219 0 0 0 0 
                                       f32_4 %221 = OpFMul %218 %220 
                                       f32_4 %222 = OpLoad %197 
                                       f32_4 %223 = OpFAdd %221 %222 
                                                      OpStore %197 %223 
                                       f32_4 %224 = OpLoad %205 
                                       f32_4 %225 = OpLoad %205 
                                       f32_4 %226 = OpFMul %224 %225 
                                       f32_4 %227 = OpLoad %92 
                                       f32_4 %228 = OpFAdd %226 %227 
                                                      OpStore %92 %228 
                                       f32_4 %229 = OpLoad %9 
                                       f32_4 %230 = OpLoad %9 
                                       f32_4 %231 = OpFMul %229 %230 
                                       f32_4 %232 = OpLoad %92 
                                       f32_4 %233 = OpFAdd %231 %232 
                                                      OpStore %92 %233 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpLoad %79 
                                       f32_4 %236 = OpVectorShuffle %235 %235 2 2 2 2 
                                       f32_4 %237 = OpFMul %234 %236 
                                       f32_4 %238 = OpLoad %197 
                                       f32_4 %239 = OpFAdd %237 %238 
                                                      OpStore %9 %239 
                                       f32_4 %240 = OpLoad %92 
                                       f32_4 %243 = OpExtInst %1 40 %240 %242 
                                                      OpStore %79 %243 
                                       f32_4 %244 = OpLoad %79 
                                       f32_4 %245 = OpExtInst %1 32 %244 
                                                      OpStore %92 %245 
                                       f32_4 %246 = OpLoad %79 
                              Uniform f32_4* %247 = OpAccessChain %19 %81 
                                       f32_4 %248 = OpLoad %247 
                                       f32_4 %249 = OpFMul %246 %248 
                                       f32_4 %251 = OpFAdd %249 %250 
                                                      OpStore %79 %251 
                                       f32_4 %252 = OpLoad %79 
                                       f32_4 %253 = OpFDiv %250 %252 
                                                      OpStore %79 %253 
                                       f32_4 %254 = OpLoad %9 
                                       f32_4 %255 = OpLoad %92 
                                       f32_4 %256 = OpFMul %254 %255 
                                                      OpStore %9 %256 
                                       f32_4 %257 = OpLoad %9 
                                       f32_4 %258 = OpExtInst %1 40 %257 %188 
                                                      OpStore %9 %258 
                                       f32_4 %259 = OpLoad %79 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpFMul %259 %260 
                                                      OpStore %9 %261 
                                       f32_4 %262 = OpLoad %9 
                                       f32_3 %263 = OpVectorShuffle %262 %262 1 1 1 
                              Uniform f32_4* %265 = OpAccessChain %19 %264 %58 
                                       f32_4 %266 = OpLoad %265 
                                       f32_3 %267 = OpVectorShuffle %266 %266 0 1 2 
                                       f32_3 %268 = OpFMul %263 %267 
                                       f32_4 %269 = OpLoad %79 
                                       f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                                      OpStore %79 %270 
                              Uniform f32_4* %271 = OpAccessChain %19 %264 %63 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_4 %274 = OpLoad %9 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 0 0 
                                       f32_3 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %79 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_3 %279 = OpFAdd %276 %278 
                                       f32_4 %280 = OpLoad %79 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 6 3 
                                                      OpStore %79 %281 
                              Uniform f32_4* %282 = OpAccessChain %19 %264 %71 
                                       f32_4 %283 = OpLoad %282 
                                       f32_3 %284 = OpVectorShuffle %283 %283 0 1 2 
                                       f32_4 %285 = OpLoad %9 
                                       f32_3 %286 = OpVectorShuffle %285 %285 2 2 2 
                                       f32_3 %287 = OpFMul %284 %286 
                                       f32_4 %288 = OpLoad %79 
                                       f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                       f32_3 %290 = OpFAdd %287 %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_4 %292 = OpVectorShuffle %291 %290 4 5 6 3 
                                                      OpStore %9 %292 
                              Uniform f32_4* %293 = OpAccessChain %19 %264 %81 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 3 3 3 
                                       f32_3 %298 = OpFMul %295 %297 
                                       f32_4 %299 = OpLoad %9 
                                       f32_3 %300 = OpVectorShuffle %299 %299 0 1 2 
                                       f32_3 %301 = OpFAdd %298 %300 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpVectorShuffle %302 %301 4 5 6 3 
                                                      OpStore %9 %303 
                                       f32_4 %305 = OpLoad %9 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                                                      OpStore %304 %306 
                                 Output f32* %308 = OpAccessChain %116 %63 %45 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpFNegate %309 
                                 Output f32* %311 = OpAccessChain %116 %63 %45 
                                                      OpStore %311 %310 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 435
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %68 %198 %427 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %59 SpecId 59 
                                                      OpDecorate %68 Location 68 
                                                      OpDecorate %160 DescriptorSet 160 
                                                      OpDecorate %160 Binding 160 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %198 Location 198 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %427 Location 427 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                                          u32 %41 = OpConstant 4 
                                              %42 = OpTypeArray %7 %41 
                                              %43 = OpTypeVector %6 3 
                                              %44 = OpTypeStruct %7 %7 %42 %43 %43 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %46 = OpVariable Uniform 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Uniform %6 
                                          f32 %51 = OpConstant 3.67402E-40 
                                         bool %53 = OpConstantFalse 
                                         bool %59 = OpSpecConstantFalse 
                                          u32 %62 = OpConstant 1 
                               Private f32_4* %66 = OpVariable Private 
                                              %67 = OpTypePointer Input %43 
                                 Input f32_3* %68 = OpVariable Input 
                                          i32 %71 = OpConstant 2 
                                              %72 = OpTypePointer Uniform %7 
                                         i32 %103 = OpConstant 3 
                                             %110 = OpTypePointer Function %43 
                                         i32 %124 = OpConstant 4 
                                             %125 = OpTypePointer Uniform %43 
                                Private f32* %139 = OpVariable Private 
                                         f32 %142 = OpConstant 3.67402E-40 
                                         f32 %144 = OpConstant 3.67402E-40 
                                Private f32* %146 = OpVariable Private 
                                         u32 %147 = OpConstant 2 
                                         f32 %150 = OpConstant 3.67402E-40 
                                             %157 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %158 = OpTypeSampledImage %157 
                                             %159 = OpTypePointer UniformConstant %158 
 UniformConstant read_only Texture3DSampled* %160 = OpVariable UniformConstant 
                              Private f32_4* %165 = OpVariable Private 
                                             %172 = OpTypePointer Private %43 
                              Private f32_3* %173 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                Input f32_3* %198 = OpVariable Input 
                                             %208 = OpTypePointer Function %6 
                                             %215 = OpTypePointer Private %15 
                              Private f32_2* %216 = OpVariable Private 
                              Private f32_2* %223 = OpVariable Private 
                                         f32 %225 = OpConstant 3.67402E-40 
                                         f32 %240 = OpConstant 3.67402E-40 
                                       f32_2 %241 = OpConstantComposite %225 %240 
                              Private f32_4* %256 = OpVariable Private 
                              Private f32_4* %266 = OpVariable Private 
                                Private f32* %297 = OpVariable Private 
                                Private f32* %312 = OpVariable Private 
                                         f32 %314 = OpConstant 3.67402E-40 
                                         f32 %316 = OpConstant 3.67402E-40 
                               Private bool* %334 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                               Private bool* %362 = OpVariable Private 
                                Private f32* %368 = OpVariable Private 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_3 %394 = OpConstantComposite %51 %240 %393 
                                       f32_3 %399 = OpConstantComposite %314 %314 %314 
                                         f32 %401 = OpConstant 3.67402E-40 
                                       f32_3 %402 = OpConstantComposite %401 %401 %401 
                                       f32_3 %406 = OpConstantComposite %225 %225 %225 
                                       f32_3 %418 = OpConstantComposite %51 %51 %51 
                                             %426 = OpTypePointer Output %7 
                               Output f32_4* %427 = OpVariable Output 
                                             %432 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                               Function f32* %209 = OpVariable Function 
                               Function f32* %250 = OpVariable Function 
                               Function f32* %340 = OpVariable Function 
                               Function f32* %369 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %46 %33 %47 
                                          f32 %50 = OpLoad %49 
                                         bool %52 = OpFOrdEqual %50 %51 
                                                      OpStore %22 %52 
                                                      OpSelectionMerge %55 None 
                                                      OpBranchConditional %53 %54 %55 
                                              %54 = OpLabel 
                                         bool %56 = OpLoad %22 
                                                      OpSelectionMerge %58 None 
                                                      OpBranchConditional %56 %57 %58 
                                              %57 = OpLabel 
                                                      OpBranch %58 
                                              %58 = OpLabel 
                                                      OpBranch %55 
                                              %55 = OpLabel 
                                                      OpSelectionMerge %61 None 
                                                      OpBranchConditional %59 %60 %167 
                                              %60 = OpLabel 
                                 Uniform f32* %63 = OpAccessChain %46 %33 %62 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdEqual %64 %51 
                                                      OpStore %22 %65 
                                        f32_3 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 1 1 1 
                               Uniform f32_4* %73 = OpAccessChain %46 %71 %33 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %70 %75 
                                        f32_4 %77 = OpLoad %66 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %66 %78 
                               Uniform f32_4* %79 = OpAccessChain %46 %71 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %68 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 0 0 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %66 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %66 %89 
                               Uniform f32_4* %90 = OpAccessChain %46 %71 %71 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpLoad %68 
                                        f32_3 %94 = OpVectorShuffle %93 %93 2 2 2 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %66 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %95 %97 
                                        f32_4 %99 = OpLoad %66 
                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                                      OpStore %66 %100 
                                       f32_4 %101 = OpLoad %66 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %104 = OpAccessChain %46 %71 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %102 %106 
                                       f32_4 %108 = OpLoad %66 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %66 %109 
                                        bool %112 = OpLoad %22 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %117 
                                             %113 = OpLabel 
                                       f32_4 %115 = OpLoad %66 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                                      OpStore %111 %116 
                                                      OpBranch %114 
                                             %117 = OpLabel 
                                       f32_3 %118 = OpLoad %68 
                                                      OpStore %111 %118 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %119 = OpLoad %111 
                                       f32_4 %120 = OpLoad %66 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %66 %121 
                                       f32_4 %122 = OpLoad %66 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                              Uniform f32_3* %126 = OpAccessChain %46 %124 
                                       f32_3 %127 = OpLoad %126 
                                       f32_3 %128 = OpFNegate %127 
                                       f32_3 %129 = OpFAdd %123 %128 
                                       f32_4 %130 = OpLoad %66 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %66 %131 
                                       f32_4 %132 = OpLoad %66 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %46 %103 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %66 
                                       f32_4 %138 = OpVectorShuffle %137 %136 0 4 5 6 
                                                      OpStore %66 %138 
                                Private f32* %140 = OpAccessChain %66 %62 
                                         f32 %141 = OpLoad %140 
                                         f32 %143 = OpFMul %141 %142 
                                         f32 %145 = OpFAdd %143 %144 
                                                      OpStore %139 %145 
                                Uniform f32* %148 = OpAccessChain %46 %33 %147 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %152 = OpFAdd %151 %144 
                                                      OpStore %146 %152 
                                         f32 %153 = OpLoad %139 
                                         f32 %154 = OpLoad %146 
                                         f32 %155 = OpExtInst %1 40 %153 %154 
                                Private f32* %156 = OpAccessChain %66 %47 
                                                      OpStore %156 %155 
                  read_only Texture3DSampled %161 = OpLoad %160 
                                       f32_4 %162 = OpLoad %66 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 2 3 
                                       f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                                      OpStore %66 %164 
                                       f32_4 %166 = OpLoad %66 
                                                      OpStore %165 %166 
                                                      OpBranch %61 
                                             %167 = OpLabel 
                                Private f32* %168 = OpAccessChain %165 %47 
                                                      OpStore %168 %51 
                                Private f32* %169 = OpAccessChain %165 %62 
                                                      OpStore %169 %51 
                                Private f32* %170 = OpAccessChain %165 %147 
                                                      OpStore %170 %51 
                                Private f32* %171 = OpAccessChain %165 %24 
                                                      OpStore %171 %51 
                                                      OpBranch %61 
                                              %61 = OpLabel 
                                       f32_4 %174 = OpLoad %165 
                              Uniform f32_4* %175 = OpAccessChain %46 %32 
                                       f32_4 %176 = OpLoad %175 
                                         f32 %177 = OpDot %174 %176 
                                Private f32* %178 = OpAccessChain %173 %47 
                                                      OpStore %178 %177 
                                Private f32* %179 = OpAccessChain %173 %47 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %51 
                                Private f32* %183 = OpAccessChain %173 %47 
                                                      OpStore %183 %182 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %46 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %173 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %173 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %173 
                                       f32_3 %202 = OpFAdd %200 %201 
                                                      OpStore %173 %202 
                                Private f32* %203 = OpAccessChain %173 %62 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %173 %147 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %22 %207 
                                        bool %210 = OpLoad %22 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %213 
                                             %211 = OpLabel 
                                                      OpStore %209 %51 
                                                      OpBranch %212 
                                             %213 = OpLabel 
                                                      OpStore %209 %181 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                         f32 %214 = OpLoad %209 
                                                      OpStore %139 %214 
                                       f32_3 %217 = OpLoad %173 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 1 
                                       f32_2 %219 = OpFNegate %218 
                                       f32_3 %220 = OpLoad %173 
                                       f32_2 %221 = OpVectorShuffle %220 %220 1 2 
                                       f32_2 %222 = OpFAdd %219 %221 
                                                      OpStore %216 %222 
                                Private f32* %224 = OpAccessChain %223 %47 
                                                      OpStore %224 %51 
                                Private f32* %226 = OpAccessChain %223 %62 
                                                      OpStore %226 %225 
                                         f32 %227 = OpLoad %139 
                                       f32_2 %228 = OpCompositeConstruct %227 %227 
                                       f32_2 %229 = OpLoad %216 
                                       f32_2 %230 = OpFMul %228 %229 
                                       f32_3 %231 = OpLoad %173 
                                       f32_2 %232 = OpVectorShuffle %231 %231 2 1 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %66 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %66 %235 
                                         f32 %236 = OpLoad %139 
                                       f32_2 %237 = OpCompositeConstruct %236 %236 
                                       f32_2 %238 = OpLoad %223 
                                       f32_2 %239 = OpFMul %237 %238 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %66 
                                       f32_4 %244 = OpVectorShuffle %243 %242 0 1 4 5 
                                                      OpStore %66 %244 
                                Private f32* %245 = OpAccessChain %173 %47 
                                         f32 %246 = OpLoad %245 
                                Private f32* %247 = OpAccessChain %66 %47 
                                         f32 %248 = OpLoad %247 
                                        bool %249 = OpFOrdGreaterThanEqual %246 %248 
                                                      OpStore %22 %249 
                                        bool %251 = OpLoad %22 
                                                      OpSelectionMerge %253 None 
                                                      OpBranchConditional %251 %252 %254 
                                             %252 = OpLabel 
                                                      OpStore %250 %51 
                                                      OpBranch %253 
                                             %254 = OpLabel 
                                                      OpStore %250 %181 
                                                      OpBranch %253 
                                             %253 = OpLabel 
                                         f32 %255 = OpLoad %250 
                                                      OpStore %139 %255 
                                       f32_4 %257 = OpLoad %66 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 3 
                                       f32_3 %259 = OpFNegate %258 
                                       f32_4 %260 = OpLoad %256 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %256 %261 
                                Private f32* %262 = OpAccessChain %173 %47 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFNegate %263 
                                Private f32* %265 = OpAccessChain %256 %24 
                                                      OpStore %265 %264 
                                Private f32* %267 = OpAccessChain %173 %47 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %256 %47 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFAdd %268 %270 
                                Private f32* %272 = OpAccessChain %266 %47 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %66 
                                       f32_3 %274 = OpVectorShuffle %273 %273 1 2 0 
                                       f32_4 %275 = OpLoad %256 
                                       f32_3 %276 = OpVectorShuffle %275 %275 1 2 3 
                                       f32_3 %277 = OpFAdd %274 %276 
                                       f32_4 %278 = OpLoad %266 
                                       f32_4 %279 = OpVectorShuffle %278 %277 0 4 5 6 
                                                      OpStore %266 %279 
                                         f32 %280 = OpLoad %139 
                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
                                       f32_4 %282 = OpLoad %266 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFMul %281 %283 
                                       f32_4 %285 = OpLoad %66 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 3 
                                       f32_3 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %256 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %256 %289 
                                         f32 %290 = OpLoad %139 
                                Private f32* %291 = OpAccessChain %266 %24 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                Private f32* %294 = OpAccessChain %173 %47 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %293 %295 
                                                      OpStore %139 %296 
                                Private f32* %298 = OpAccessChain %256 %62 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpLoad %139 
                                         f32 %301 = OpExtInst %1 37 %299 %300 
                                                      OpStore %297 %301 
                                         f32 %302 = OpLoad %297 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %256 %47 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFAdd %303 %305 
                                                      OpStore %297 %306 
                                Private f32* %307 = OpAccessChain %256 %62 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFNegate %308 
                                         f32 %310 = OpLoad %139 
                                         f32 %311 = OpFAdd %309 %310 
                                                      OpStore %139 %311 
                                         f32 %313 = OpLoad %297 
                                         f32 %315 = OpFMul %313 %314 
                                         f32 %317 = OpFAdd %315 %316 
                                                      OpStore %312 %317 
                                         f32 %318 = OpLoad %139 
                                         f32 %319 = OpLoad %312 
                                         f32 %320 = OpFDiv %318 %319 
                                                      OpStore %139 %320 
                                         f32 %321 = OpLoad %139 
                                Private f32* %322 = OpAccessChain %256 %147 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFAdd %321 %323 
                                                      OpStore %139 %324 
                                Private f32* %325 = OpAccessChain %256 %47 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpFAdd %326 %316 
                                Private f32* %328 = OpAccessChain %256 %47 
                                                      OpStore %328 %327 
                                         f32 %329 = OpLoad %297 
                                Private f32* %330 = OpAccessChain %256 %47 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFDiv %329 %331 
                                Private f32* %333 = OpAccessChain %256 %47 
                                                      OpStore %333 %332 
                                Private f32* %335 = OpAccessChain %9 %62 
                                         f32 %336 = OpLoad %335 
                                Private f32* %337 = OpAccessChain %9 %147 
                                         f32 %338 = OpLoad %337 
                                        bool %339 = OpFOrdGreaterThanEqual %336 %338 
                                                      OpStore %334 %339 
                                        bool %341 = OpLoad %334 
                                                      OpSelectionMerge %343 None 
                                                      OpBranchConditional %341 %342 %344 
                                             %342 = OpLabel 
                                                      OpStore %340 %51 
                                                      OpBranch %343 
                                             %344 = OpLabel 
                                                      OpStore %340 %181 
                                                      OpBranch %343 
                                             %343 = OpLabel 
                                         f32 %345 = OpLoad %340 
                                                      OpStore %312 %345 
                                Private f32* %347 = OpAccessChain %9 %147 
                                         f32 %348 = OpLoad %347 
                                         f32 %349 = OpFNegate %348 
                                Private f32* %350 = OpAccessChain %9 %62 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %349 %351 
                                Private f32* %353 = OpAccessChain %346 %47 
                                                      OpStore %353 %352 
                                         f32 %354 = OpLoad %312 
                                Private f32* %355 = OpAccessChain %346 %47 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFMul %354 %356 
                                Private f32* %358 = OpAccessChain %9 %147 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %346 %47 
                                                      OpStore %361 %360 
                                Private f32* %363 = OpAccessChain %9 %47 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %346 %47 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdGreaterThanEqual %364 %366 
                                                      OpStore %362 %367 
                                        bool %370 = OpLoad %362 
                                                      OpSelectionMerge %372 None 
                                                      OpBranchConditional %370 %371 %373 
                                             %371 = OpLabel 
                                                      OpStore %369 %51 
                                                      OpBranch %372 
                                             %373 = OpLabel 
                                                      OpStore %369 %181 
                                                      OpBranch %372 
                                             %372 = OpLabel 
                                         f32 %374 = OpLoad %369 
                                                      OpStore %368 %374 
                                Private f32* %375 = OpAccessChain %346 %47 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Private f32* %378 = OpAccessChain %9 %47 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFAdd %377 %379 
                                Private f32* %381 = OpAccessChain %9 %47 
                                                      OpStore %381 %380 
                                         f32 %382 = OpLoad %368 
                                Private f32* %383 = OpAccessChain %9 %47 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFMul %382 %384 
                                Private f32* %386 = OpAccessChain %346 %47 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                Private f32* %389 = OpAccessChain %9 %47 
                                                      OpStore %389 %388 
                                         f32 %390 = OpLoad %139 
                                       f32_3 %391 = OpCompositeConstruct %390 %390 %390 
                                       f32_3 %392 = OpExtInst %1 4 %391 
                                       f32_3 %395 = OpFAdd %392 %394 
                                                      OpStore %346 %395 
                                       f32_3 %396 = OpLoad %346 
                                       f32_3 %397 = OpExtInst %1 10 %396 
                                                      OpStore %346 %397 
                                       f32_3 %398 = OpLoad %346 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_3 %403 = OpFAdd %400 %402 
                                                      OpStore %346 %403 
                                       f32_3 %404 = OpLoad %346 
                                       f32_3 %405 = OpExtInst %1 4 %404 
                                       f32_3 %407 = OpFAdd %405 %406 
                                                      OpStore %346 %407 
                                       f32_3 %408 = OpLoad %346 
                                       f32_3 %409 = OpCompositeConstruct %181 %181 %181 
                                       f32_3 %410 = OpCompositeConstruct %51 %51 %51 
                                       f32_3 %411 = OpExtInst %1 43 %408 %409 %410 
                                                      OpStore %346 %411 
                                       f32_3 %412 = OpLoad %346 
                                       f32_3 %413 = OpFAdd %412 %406 
                                                      OpStore %346 %413 
                                       f32_4 %414 = OpLoad %256 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 0 0 
                                       f32_3 %416 = OpLoad %346 
                                       f32_3 %417 = OpFMul %415 %416 
                                       f32_3 %419 = OpFAdd %417 %418 
                                                      OpStore %346 %419 
                                       f32_3 %420 = OpLoad %346 
                                       f32_4 %421 = OpLoad %9 
                                       f32_3 %422 = OpVectorShuffle %421 %421 0 0 0 
                                       f32_3 %423 = OpFMul %420 %422 
                                       f32_4 %424 = OpLoad %9 
                                       f32_4 %425 = OpVectorShuffle %424 %423 4 5 6 3 
                                                      OpStore %9 %425 
                                       f32_4 %428 = OpLoad %9 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                       f32_4 %430 = OpLoad %427 
                                       f32_4 %431 = OpVectorShuffle %430 %429 4 5 6 3 
                                                      OpStore %427 %431 
                                 Output f32* %433 = OpAccessChain %427 %24 
                                                      OpStore %433 %51 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat6 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat6 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat1.xyz = vec3(u_xlat19) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4 = u_xlat0;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = u_xlat1.x * u_xlat1.x + (-u_xlat18);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat2);
    u_xlat3.y = dot(unity_SHBg, u_xlat2);
    u_xlat3.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat3.xyz;
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(unity_SHAr, u_xlat1);
    u_xlat3.y = dot(unity_SHAg, u_xlat1);
    u_xlat3.z = dot(unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat1.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat1.zzzz + u_xlat4;
    u_xlat1 = max(u_xlat3, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat1);
    u_xlat1 = u_xlat1 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat1 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat1 * u_xlat0;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz + u_xlat2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlatb12 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb12){
        u_xlatb12 = unity_ProbeVolumeParams.y==1.0;
        u_xlat1.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat1.xyz;
        u_xlat1.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat1.xyz;
        u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : vs_TEXCOORD2.xyz;
        u_xlat1.xyz = u_xlat1.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat1.yzw = u_xlat1.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat12 = u_xlat1.y * 0.25 + 0.75;
        u_xlat5 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat1.x = max(u_xlat12, u_xlat5);
        u_xlat1 = texture(unity_ProbeVolumeSH, u_xlat1.xzw);
    } else {
        u_xlat1.x = float(1.0);
        u_xlat1.y = float(1.0);
        u_xlat1.z = float(1.0);
        u_xlat1.w = float(1.0);
    //ENDIF
    }
    u_xlat12 = dot(u_xlat1, unity_OcclusionMaskSelector);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5 = u_xlat5 / u_xlat13;
    u_xlat5 = u_xlat5 + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(vec3(u_xlat5)) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 415
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %44 %116 %128 %129 %143 %180 %183 %186 %189 %406 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 RelaxedPrecision 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 RelaxedPrecision 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 RelaxedPrecision 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 RelaxedPrecision 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 RelaxedPrecision 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 RelaxedPrecision 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 RelaxedPrecision 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpMemberDecorate %17 11 RelaxedPrecision 
                                                      OpMemberDecorate %17 11 Offset 17 
                                                      OpMemberDecorate %17 12 Offset 17 
                                                      OpMemberDecorate %17 13 Offset 17 
                                                      OpMemberDecorate %17 14 Offset 17 
                                                      OpMemberDecorate %17 15 Offset 17 
                                                      OpMemberDecorate %17 16 Offset 17 
                                                      OpMemberDecorate %17 17 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %44 Location 44 
                                                      OpMemberDecorate %114 0 BuiltIn 114 
                                                      OpMemberDecorate %114 1 BuiltIn 114 
                                                      OpMemberDecorate %114 2 BuiltIn 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %143 Location 143 
                                                      OpDecorate %180 Location 180 
                                                      OpDecorate %183 Location 183 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %189 Location 189 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %390 RelaxedPrecision 
                                                      OpDecorate %391 RelaxedPrecision 
                                                      OpDecorate %406 RelaxedPrecision 
                                                      OpDecorate %406 Location 406 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %12 %7 %7 %7 %7 %7 %7 %7 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 16 
                                              %22 = OpTypePointer Uniform %6 
                                          i32 %25 = OpConstant 15 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                 Private f32* %37 = OpVariable Private 
                                          f32 %41 = OpConstant 3.67402E-40 
                                              %43 = OpTypePointer Input %7 
                                 Input f32_4* %44 = OpVariable Input 
                                          u32 %45 = OpConstant 1 
                                              %46 = OpTypePointer Input %6 
                                          i32 %57 = OpConstant 12 
                                          i32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %71 = OpConstant 2 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %92 = OpVariable Private 
                                          i32 %95 = OpConstant 14 
                                             %113 = OpTypeArray %6 %45 
                                             %114 = OpTypeStruct %7 %6 %113 
                                             %115 = OpTypePointer Output %114 
        Output struct {f32_4; f32; f32[1];}* %116 = OpVariable Output 
                                             %124 = OpTypePointer Output %7 
                                             %126 = OpTypeVector %6 2 
                                             %127 = OpTypePointer Output %126 
                               Output f32_2* %128 = OpVariable Output 
                                Input f32_4* %129 = OpVariable Input 
                                         i32 %132 = OpConstant 17 
                                             %141 = OpTypeVector %6 3 
                                             %142 = OpTypePointer Input %141 
                                Input f32_3* %143 = OpVariable Input 
                                         i32 %145 = OpConstant 13 
                                         u32 %162 = OpConstant 2 
                                Private f32* %164 = OpVariable Private 
                                             %179 = OpTypePointer Output %141 
                               Output f32_3* %180 = OpVariable Output 
                               Output f32_3* %183 = OpVariable Output 
                               Output f32_4* %186 = OpVariable Output 
                                         f32 %187 = OpConstant 3.67402E-40 
                                       f32_4 %188 = OpConstantComposite %187 %187 %187 %187 
                               Output f32_4* %189 = OpVariable Output 
                                             %191 = OpTypePointer Private %141 
                              Private f32_3* %192 = OpVariable Private 
                              Private f32_4* %209 = OpVariable Private 
                              Private f32_3* %215 = OpVariable Private 
                                         i32 %216 = OpConstant 8 
                                         i32 %222 = OpConstant 9 
                                         i32 %228 = OpConstant 10 
                                         i32 %234 = OpConstant 11 
                                         u32 %243 = OpConstant 3 
                                         i32 %245 = OpConstant 5 
                                         i32 %251 = OpConstant 6 
                                         i32 %257 = OpConstant 7 
                                       f32_3 %267 = OpConstantComposite %187 %187 %187 
                              Private f32_3* %269 = OpVariable Private 
                                         f32 %273 = OpConstant 3.67402E-40 
                                       f32_3 %274 = OpConstantComposite %273 %273 %273 
                                         f32 %279 = OpConstant 3.67402E-40 
                                       f32_3 %280 = OpConstantComposite %279 %279 %279 
                                         f32 %282 = OpConstant 3.67402E-40 
                                       f32_3 %283 = OpConstantComposite %282 %282 %282 
                              Private f32_4* %293 = OpVariable Private 
                              Private f32_4* %301 = OpVariable Private 
                                         f32 %337 = OpConstant 3.67402E-40 
                                       f32_4 %338 = OpConstantComposite %337 %337 %337 %337 
                                       f32_4 %346 = OpConstantComposite %41 %41 %41 %41 
                                         i32 %360 = OpConstant 4 
                               Output f32_3* %406 = OpVariable Output 
                                             %409 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                 Uniform f32* %26 = OpAccessChain %19 %25 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFMul %24 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                 Private f32* %32 = OpAccessChain %9 %29 
                                          f32 %33 = OpLoad %32 
                                          f32 %35 = OpFMul %33 %34 
                                 Private f32* %36 = OpAccessChain %9 %29 
                                                      OpStore %36 %35 
                                 Uniform f32* %38 = OpAccessChain %19 %25 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpFNegate %39 
                                          f32 %42 = OpFAdd %40 %41 
                                                      OpStore %37 %42 
                                   Input f32* %47 = OpAccessChain %44 %45 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpLoad %37 
                                          f32 %50 = OpFMul %48 %49 
                                 Private f32* %51 = OpAccessChain %9 %29 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %29 
                                                      OpStore %54 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               Uniform f32_4* %60 = OpAccessChain %19 %57 %58 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %56 %61 
                                                      OpStore %9 %62 
                               Uniform f32_4* %64 = OpAccessChain %19 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %44 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %9 %70 
                               Uniform f32_4* %72 = OpAccessChain %19 %57 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %44 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                               Uniform f32_4* %82 = OpAccessChain %19 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpFAdd %80 %83 
                                                      OpStore %79 %84 
                               Uniform f32_4* %85 = OpAccessChain %19 %57 %81 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %44 
                                        f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %9 %91 
                                        f32_4 %93 = OpLoad %79 
                                        f32_4 %94 = OpVectorShuffle %93 %93 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %19 %95 %58 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %94 %97 
                                                      OpStore %92 %98 
                               Uniform f32_4* %99 = OpAccessChain %19 %95 %63 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %79 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %92 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %92 %105 
                              Uniform f32_4* %106 = OpAccessChain %19 %95 %71 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %79 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %92 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %92 %112 
                              Uniform f32_4* %117 = OpAccessChain %19 %95 %81 
                                       f32_4 %118 = OpLoad %117 
                                       f32_4 %119 = OpLoad %79 
                                       f32_4 %120 = OpVectorShuffle %119 %119 3 3 3 3 
                                       f32_4 %121 = OpFMul %118 %120 
                                       f32_4 %122 = OpLoad %92 
                                       f32_4 %123 = OpFAdd %121 %122 
                               Output f32_4* %125 = OpAccessChain %116 %63 
                                                      OpStore %125 %123 
                                       f32_4 %130 = OpLoad %129 
                                       f32_2 %131 = OpVectorShuffle %130 %130 0 1 
                              Uniform f32_4* %133 = OpAccessChain %19 %132 
                                       f32_4 %134 = OpLoad %133 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 1 
                                       f32_2 %136 = OpFMul %131 %135 
                              Uniform f32_4* %137 = OpAccessChain %19 %132 
                                       f32_4 %138 = OpLoad %137 
                                       f32_2 %139 = OpVectorShuffle %138 %138 2 3 
                                       f32_2 %140 = OpFAdd %136 %139 
                                                      OpStore %128 %140 
                                       f32_3 %144 = OpLoad %143 
                              Uniform f32_4* %146 = OpAccessChain %19 %145 %63 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %144 %148 
                                Private f32* %150 = OpAccessChain %79 %29 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %143 
                              Uniform f32_4* %152 = OpAccessChain %19 %145 %58 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %156 = OpAccessChain %79 %45 
                                                      OpStore %156 %155 
                                       f32_3 %157 = OpLoad %143 
                              Uniform f32_4* %158 = OpAccessChain %19 %145 %71 
                                       f32_4 %159 = OpLoad %158 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %163 = OpAccessChain %79 %162 
                                                      OpStore %163 %161 
                                       f32_4 %165 = OpLoad %79 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_4 %167 = OpLoad %79 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                         f32 %169 = OpDot %166 %168 
                                                      OpStore %164 %169 
                                         f32 %170 = OpLoad %164 
                                         f32 %171 = OpExtInst %1 32 %170 
                                                      OpStore %164 %171 
                                         f32 %172 = OpLoad %164 
                                       f32_3 %173 = OpCompositeConstruct %172 %172 %172 
                                       f32_4 %174 = OpLoad %79 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFMul %173 %175 
                                       f32_4 %177 = OpLoad %79 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %79 %178 
                                       f32_4 %181 = OpLoad %79 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                                      OpStore %180 %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                                      OpStore %183 %185 
                                                      OpStore %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                                      OpStore %189 %190 
                                Private f32* %193 = OpAccessChain %79 %45 
                                         f32 %194 = OpLoad %193 
                                Private f32* %195 = OpAccessChain %79 %45 
                                         f32 %196 = OpLoad %195 
                                         f32 %197 = OpFMul %194 %196 
                                Private f32* %198 = OpAccessChain %192 %29 
                                                      OpStore %198 %197 
                                Private f32* %199 = OpAccessChain %79 %29 
                                         f32 %200 = OpLoad %199 
                                Private f32* %201 = OpAccessChain %79 %29 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %200 %202 
                                Private f32* %204 = OpAccessChain %192 %29 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                         f32 %207 = OpFAdd %203 %206 
                                Private f32* %208 = OpAccessChain %192 %29 
                                                      OpStore %208 %207 
                                       f32_4 %210 = OpLoad %79 
                                       f32_4 %211 = OpVectorShuffle %210 %210 1 2 2 0 
                                       f32_4 %212 = OpLoad %79 
                                       f32_4 %213 = OpVectorShuffle %212 %212 0 1 2 2 
                                       f32_4 %214 = OpFMul %211 %213 
                                                      OpStore %209 %214 
                              Uniform f32_4* %217 = OpAccessChain %19 %216 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpLoad %209 
                                         f32 %220 = OpDot %218 %219 
                                Private f32* %221 = OpAccessChain %215 %29 
                                                      OpStore %221 %220 
                              Uniform f32_4* %223 = OpAccessChain %19 %222 
                                       f32_4 %224 = OpLoad %223 
                                       f32_4 %225 = OpLoad %209 
                                         f32 %226 = OpDot %224 %225 
                                Private f32* %227 = OpAccessChain %215 %45 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %19 %228 
                                       f32_4 %230 = OpLoad %229 
                                       f32_4 %231 = OpLoad %209 
                                         f32 %232 = OpDot %230 %231 
                                Private f32* %233 = OpAccessChain %215 %162 
                                                      OpStore %233 %232 
                              Uniform f32_4* %235 = OpAccessChain %19 %234 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                                       f32_3 %238 = OpLoad %192 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 0 0 
                                       f32_3 %240 = OpFMul %237 %239 
                                       f32_3 %241 = OpLoad %215 
                                       f32_3 %242 = OpFAdd %240 %241 
                                                      OpStore %192 %242 
                                Private f32* %244 = OpAccessChain %79 %243 
                                                      OpStore %244 %41 
                              Uniform f32_4* %246 = OpAccessChain %19 %245 
                                       f32_4 %247 = OpLoad %246 
                                       f32_4 %248 = OpLoad %79 
                                         f32 %249 = OpDot %247 %248 
                                Private f32* %250 = OpAccessChain %215 %29 
                                                      OpStore %250 %249 
                              Uniform f32_4* %252 = OpAccessChain %19 %251 
                                       f32_4 %253 = OpLoad %252 
                                       f32_4 %254 = OpLoad %79 
                                         f32 %255 = OpDot %253 %254 
                                Private f32* %256 = OpAccessChain %215 %45 
                                                      OpStore %256 %255 
                              Uniform f32_4* %258 = OpAccessChain %19 %257 
                                       f32_4 %259 = OpLoad %258 
                                       f32_4 %260 = OpLoad %79 
                                         f32 %261 = OpDot %259 %260 
                                Private f32* %262 = OpAccessChain %215 %162 
                                                      OpStore %262 %261 
                                       f32_3 %263 = OpLoad %192 
                                       f32_3 %264 = OpLoad %215 
                                       f32_3 %265 = OpFAdd %263 %264 
                                                      OpStore %192 %265 
                                       f32_3 %266 = OpLoad %192 
                                       f32_3 %268 = OpExtInst %1 40 %266 %267 
                                                      OpStore %192 %268 
                                       f32_3 %270 = OpLoad %192 
                                       f32_3 %271 = OpExtInst %1 30 %270 
                                                      OpStore %269 %271 
                                       f32_3 %272 = OpLoad %269 
                                       f32_3 %275 = OpFMul %272 %274 
                                                      OpStore %269 %275 
                                       f32_3 %276 = OpLoad %269 
                                       f32_3 %277 = OpExtInst %1 29 %276 
                                                      OpStore %269 %277 
                                       f32_3 %278 = OpLoad %269 
                                       f32_3 %281 = OpFMul %278 %280 
                                       f32_3 %284 = OpFAdd %281 %283 
                                                      OpStore %269 %284 
                                       f32_3 %285 = OpLoad %269 
                                       f32_3 %286 = OpExtInst %1 40 %285 %267 
                                                      OpStore %269 %286 
                                       f32_4 %287 = OpLoad %9 
                                       f32_4 %288 = OpVectorShuffle %287 %287 1 1 1 1 
                                       f32_4 %289 = OpFNegate %288 
                              Uniform f32_4* %290 = OpAccessChain %19 %58 
                                       f32_4 %291 = OpLoad %290 
                                       f32_4 %292 = OpFAdd %289 %291 
                                                      OpStore %92 %292 
                                       f32_4 %294 = OpLoad %79 
                                       f32_4 %295 = OpVectorShuffle %294 %294 1 1 1 1 
                                       f32_4 %296 = OpLoad %92 
                                       f32_4 %297 = OpFMul %295 %296 
                                                      OpStore %293 %297 
                                       f32_4 %298 = OpLoad %92 
                                       f32_4 %299 = OpLoad %92 
                                       f32_4 %300 = OpFMul %298 %299 
                                                      OpStore %92 %300 
                                       f32_4 %302 = OpLoad %9 
                                       f32_4 %303 = OpVectorShuffle %302 %302 0 0 0 0 
                                       f32_4 %304 = OpFNegate %303 
                              Uniform f32_4* %305 = OpAccessChain %19 %63 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpFAdd %304 %306 
                                                      OpStore %301 %307 
                                       f32_4 %308 = OpLoad %9 
                                       f32_4 %309 = OpVectorShuffle %308 %308 2 2 2 2 
                                       f32_4 %310 = OpFNegate %309 
                              Uniform f32_4* %311 = OpAccessChain %19 %71 
                                       f32_4 %312 = OpLoad %311 
                                       f32_4 %313 = OpFAdd %310 %312 
                                                      OpStore %9 %313 
                                       f32_4 %314 = OpLoad %301 
                                       f32_4 %315 = OpLoad %79 
                                       f32_4 %316 = OpVectorShuffle %315 %315 0 0 0 0 
                                       f32_4 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %293 
                                       f32_4 %319 = OpFAdd %317 %318 
                                                      OpStore %293 %319 
                                       f32_4 %320 = OpLoad %301 
                                       f32_4 %321 = OpLoad %301 
                                       f32_4 %322 = OpFMul %320 %321 
                                       f32_4 %323 = OpLoad %92 
                                       f32_4 %324 = OpFAdd %322 %323 
                                                      OpStore %92 %324 
                                       f32_4 %325 = OpLoad %9 
                                       f32_4 %326 = OpLoad %9 
                                       f32_4 %327 = OpFMul %325 %326 
                                       f32_4 %328 = OpLoad %92 
                                       f32_4 %329 = OpFAdd %327 %328 
                                                      OpStore %92 %329 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpLoad %79 
                                       f32_4 %332 = OpVectorShuffle %331 %331 2 2 2 2 
                                       f32_4 %333 = OpFMul %330 %332 
                                       f32_4 %334 = OpLoad %293 
                                       f32_4 %335 = OpFAdd %333 %334 
                                                      OpStore %9 %335 
                                       f32_4 %336 = OpLoad %92 
                                       f32_4 %339 = OpExtInst %1 40 %336 %338 
                                                      OpStore %79 %339 
                                       f32_4 %340 = OpLoad %79 
                                       f32_4 %341 = OpExtInst %1 32 %340 
                                                      OpStore %92 %341 
                                       f32_4 %342 = OpLoad %79 
                              Uniform f32_4* %343 = OpAccessChain %19 %81 
                                       f32_4 %344 = OpLoad %343 
                                       f32_4 %345 = OpFMul %342 %344 
                                       f32_4 %347 = OpFAdd %345 %346 
                                                      OpStore %79 %347 
                                       f32_4 %348 = OpLoad %79 
                                       f32_4 %349 = OpFDiv %346 %348 
                                                      OpStore %79 %349 
                                       f32_4 %350 = OpLoad %9 
                                       f32_4 %351 = OpLoad %92 
                                       f32_4 %352 = OpFMul %350 %351 
                                                      OpStore %9 %352 
                                       f32_4 %353 = OpLoad %9 
                                       f32_4 %354 = OpExtInst %1 40 %353 %188 
                                                      OpStore %9 %354 
                                       f32_4 %355 = OpLoad %79 
                                       f32_4 %356 = OpLoad %9 
                                       f32_4 %357 = OpFMul %355 %356 
                                                      OpStore %9 %357 
                                       f32_4 %358 = OpLoad %9 
                                       f32_3 %359 = OpVectorShuffle %358 %358 1 1 1 
                              Uniform f32_4* %361 = OpAccessChain %19 %360 %58 
                                       f32_4 %362 = OpLoad %361 
                                       f32_3 %363 = OpVectorShuffle %362 %362 0 1 2 
                                       f32_3 %364 = OpFMul %359 %363 
                                       f32_4 %365 = OpLoad %79 
                                       f32_4 %366 = OpVectorShuffle %365 %364 4 5 6 3 
                                                      OpStore %79 %366 
                              Uniform f32_4* %367 = OpAccessChain %19 %360 %63 
                                       f32_4 %368 = OpLoad %367 
                                       f32_3 %369 = OpVectorShuffle %368 %368 0 1 2 
                                       f32_4 %370 = OpLoad %9 
                                       f32_3 %371 = OpVectorShuffle %370 %370 0 0 0 
                                       f32_3 %372 = OpFMul %369 %371 
                                       f32_4 %373 = OpLoad %79 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                       f32_3 %375 = OpFAdd %372 %374 
                                       f32_4 %376 = OpLoad %79 
                                       f32_4 %377 = OpVectorShuffle %376 %375 4 5 6 3 
                                                      OpStore %79 %377 
                              Uniform f32_4* %378 = OpAccessChain %19 %360 %71 
                                       f32_4 %379 = OpLoad %378 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_4 %381 = OpLoad %9 
                                       f32_3 %382 = OpVectorShuffle %381 %381 2 2 2 
                                       f32_3 %383 = OpFMul %380 %382 
                                       f32_4 %384 = OpLoad %79 
                                       f32_3 %385 = OpVectorShuffle %384 %384 0 1 2 
                                       f32_3 %386 = OpFAdd %383 %385 
                                       f32_4 %387 = OpLoad %9 
                                       f32_4 %388 = OpVectorShuffle %387 %386 4 5 6 3 
                                                      OpStore %9 %388 
                              Uniform f32_4* %389 = OpAccessChain %19 %360 %81 
                                       f32_4 %390 = OpLoad %389 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 1 2 
                                       f32_4 %392 = OpLoad %9 
                                       f32_3 %393 = OpVectorShuffle %392 %392 3 3 3 
                                       f32_3 %394 = OpFMul %391 %393 
                                       f32_4 %395 = OpLoad %9 
                                       f32_3 %396 = OpVectorShuffle %395 %395 0 1 2 
                                       f32_3 %397 = OpFAdd %394 %396 
                                       f32_4 %398 = OpLoad %9 
                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                      OpStore %9 %399 
                                       f32_4 %400 = OpLoad %9 
                                       f32_3 %401 = OpVectorShuffle %400 %400 0 1 2 
                                       f32_3 %402 = OpLoad %269 
                                       f32_3 %403 = OpFAdd %401 %402 
                                       f32_4 %404 = OpLoad %9 
                                       f32_4 %405 = OpVectorShuffle %404 %403 4 5 6 3 
                                                      OpStore %9 %405 
                                       f32_4 %407 = OpLoad %9 
                                       f32_3 %408 = OpVectorShuffle %407 %407 0 1 2 
                                                      OpStore %406 %408 
                                 Output f32* %410 = OpAccessChain %116 %63 %45 
                                         f32 %411 = OpLoad %410 
                                         f32 %412 = OpFNegate %411 
                                 Output f32* %413 = OpAccessChain %116 %63 %45 
                                                      OpStore %413 %412 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 435
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %68 %198 %427 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %42 ArrayStride 42 
                                                      OpMemberDecorate %44 0 RelaxedPrecision 
                                                      OpMemberDecorate %44 0 Offset 44 
                                                      OpMemberDecorate %44 1 Offset 44 
                                                      OpMemberDecorate %44 2 Offset 44 
                                                      OpMemberDecorate %44 3 Offset 44 
                                                      OpMemberDecorate %44 4 Offset 44 
                                                      OpMemberDecorate %44 5 RelaxedPrecision 
                                                      OpMemberDecorate %44 5 Offset 44 
                                                      OpDecorate %44 Block 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %59 SpecId 59 
                                                      OpDecorate %68 Location 68 
                                                      OpDecorate %160 DescriptorSet 160 
                                                      OpDecorate %160 Binding 160 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %198 Location 198 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %427 RelaxedPrecision 
                                                      OpDecorate %427 Location 427 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                                          u32 %41 = OpConstant 4 
                                              %42 = OpTypeArray %7 %41 
                                              %43 = OpTypeVector %6 3 
                                              %44 = OpTypeStruct %7 %7 %42 %43 %43 %7 
                                              %45 = OpTypePointer Uniform %44 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %46 = OpVariable Uniform 
                                          u32 %47 = OpConstant 0 
                                              %48 = OpTypePointer Uniform %6 
                                          f32 %51 = OpConstant 3.67402E-40 
                                         bool %53 = OpConstantFalse 
                                         bool %59 = OpSpecConstantFalse 
                                          u32 %62 = OpConstant 1 
                               Private f32_4* %66 = OpVariable Private 
                                              %67 = OpTypePointer Input %43 
                                 Input f32_3* %68 = OpVariable Input 
                                          i32 %71 = OpConstant 2 
                                              %72 = OpTypePointer Uniform %7 
                                         i32 %103 = OpConstant 3 
                                             %110 = OpTypePointer Function %43 
                                         i32 %124 = OpConstant 4 
                                             %125 = OpTypePointer Uniform %43 
                                Private f32* %139 = OpVariable Private 
                                         f32 %142 = OpConstant 3.67402E-40 
                                         f32 %144 = OpConstant 3.67402E-40 
                                Private f32* %146 = OpVariable Private 
                                         u32 %147 = OpConstant 2 
                                         f32 %150 = OpConstant 3.67402E-40 
                                             %157 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %158 = OpTypeSampledImage %157 
                                             %159 = OpTypePointer UniformConstant %158 
 UniformConstant read_only Texture3DSampled* %160 = OpVariable UniformConstant 
                              Private f32_4* %165 = OpVariable Private 
                                             %172 = OpTypePointer Private %43 
                              Private f32_3* %173 = OpVariable Private 
                                         f32 %181 = OpConstant 3.67402E-40 
                              Private f32_3* %184 = OpVariable Private 
                                         i32 %187 = OpConstant 5 
                                Input f32_3* %198 = OpVariable Input 
                                             %208 = OpTypePointer Function %6 
                                             %215 = OpTypePointer Private %15 
                              Private f32_2* %216 = OpVariable Private 
                              Private f32_2* %223 = OpVariable Private 
                                         f32 %225 = OpConstant 3.67402E-40 
                                         f32 %240 = OpConstant 3.67402E-40 
                                       f32_2 %241 = OpConstantComposite %225 %240 
                              Private f32_4* %256 = OpVariable Private 
                              Private f32_4* %266 = OpVariable Private 
                                Private f32* %297 = OpVariable Private 
                                Private f32* %312 = OpVariable Private 
                                         f32 %314 = OpConstant 3.67402E-40 
                                         f32 %316 = OpConstant 3.67402E-40 
                               Private bool* %334 = OpVariable Private 
                              Private f32_3* %346 = OpVariable Private 
                               Private bool* %362 = OpVariable Private 
                                Private f32* %368 = OpVariable Private 
                                         f32 %393 = OpConstant 3.67402E-40 
                                       f32_3 %394 = OpConstantComposite %51 %240 %393 
                                       f32_3 %399 = OpConstantComposite %314 %314 %314 
                                         f32 %401 = OpConstant 3.67402E-40 
                                       f32_3 %402 = OpConstantComposite %401 %401 %401 
                                       f32_3 %406 = OpConstantComposite %225 %225 %225 
                                       f32_3 %418 = OpConstantComposite %51 %51 %51 
                                             %426 = OpTypePointer Output %7 
                               Output f32_4* %427 = OpVariable Output 
                                             %432 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %111 = OpVariable Function 
                               Function f32* %209 = OpVariable Function 
                               Function f32* %250 = OpVariable Function 
                               Function f32* %340 = OpVariable Function 
                               Function f32* %369 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                 Uniform f32* %49 = OpAccessChain %46 %33 %47 
                                          f32 %50 = OpLoad %49 
                                         bool %52 = OpFOrdEqual %50 %51 
                                                      OpStore %22 %52 
                                                      OpSelectionMerge %55 None 
                                                      OpBranchConditional %53 %54 %55 
                                              %54 = OpLabel 
                                         bool %56 = OpLoad %22 
                                                      OpSelectionMerge %58 None 
                                                      OpBranchConditional %56 %57 %58 
                                              %57 = OpLabel 
                                                      OpBranch %58 
                                              %58 = OpLabel 
                                                      OpBranch %55 
                                              %55 = OpLabel 
                                                      OpSelectionMerge %61 None 
                                                      OpBranchConditional %59 %60 %167 
                                              %60 = OpLabel 
                                 Uniform f32* %63 = OpAccessChain %46 %33 %62 
                                          f32 %64 = OpLoad %63 
                                         bool %65 = OpFOrdEqual %64 %51 
                                                      OpStore %22 %65 
                                        f32_3 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 1 1 1 
                               Uniform f32_4* %73 = OpAccessChain %46 %71 %33 
                                        f32_4 %74 = OpLoad %73 
                                        f32_3 %75 = OpVectorShuffle %74 %74 0 1 2 
                                        f32_3 %76 = OpFMul %70 %75 
                                        f32_4 %77 = OpLoad %66 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %66 %78 
                               Uniform f32_4* %79 = OpAccessChain %46 %71 %32 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 0 1 2 
                                        f32_3 %82 = OpLoad %68 
                                        f32_3 %83 = OpVectorShuffle %82 %82 0 0 0 
                                        f32_3 %84 = OpFMul %81 %83 
                                        f32_4 %85 = OpLoad %66 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFAdd %84 %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %66 %89 
                               Uniform f32_4* %90 = OpAccessChain %46 %71 %71 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_3 %93 = OpLoad %68 
                                        f32_3 %94 = OpVectorShuffle %93 %93 2 2 2 
                                        f32_3 %95 = OpFMul %92 %94 
                                        f32_4 %96 = OpLoad %66 
                                        f32_3 %97 = OpVectorShuffle %96 %96 0 1 2 
                                        f32_3 %98 = OpFAdd %95 %97 
                                        f32_4 %99 = OpLoad %66 
                                       f32_4 %100 = OpVectorShuffle %99 %98 4 5 6 3 
                                                      OpStore %66 %100 
                                       f32_4 %101 = OpLoad %66 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %104 = OpAccessChain %46 %71 %103 
                                       f32_4 %105 = OpLoad %104 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %102 %106 
                                       f32_4 %108 = OpLoad %66 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %66 %109 
                                        bool %112 = OpLoad %22 
                                                      OpSelectionMerge %114 None 
                                                      OpBranchConditional %112 %113 %117 
                                             %113 = OpLabel 
                                       f32_4 %115 = OpLoad %66 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                                                      OpStore %111 %116 
                                                      OpBranch %114 
                                             %117 = OpLabel 
                                       f32_3 %118 = OpLoad %68 
                                                      OpStore %111 %118 
                                                      OpBranch %114 
                                             %114 = OpLabel 
                                       f32_3 %119 = OpLoad %111 
                                       f32_4 %120 = OpLoad %66 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %66 %121 
                                       f32_4 %122 = OpLoad %66 
                                       f32_3 %123 = OpVectorShuffle %122 %122 0 1 2 
                              Uniform f32_3* %126 = OpAccessChain %46 %124 
                                       f32_3 %127 = OpLoad %126 
                                       f32_3 %128 = OpFNegate %127 
                                       f32_3 %129 = OpFAdd %123 %128 
                                       f32_4 %130 = OpLoad %66 
                                       f32_4 %131 = OpVectorShuffle %130 %129 4 5 6 3 
                                                      OpStore %66 %131 
                                       f32_4 %132 = OpLoad %66 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_3* %134 = OpAccessChain %46 %103 
                                       f32_3 %135 = OpLoad %134 
                                       f32_3 %136 = OpFMul %133 %135 
                                       f32_4 %137 = OpLoad %66 
                                       f32_4 %138 = OpVectorShuffle %137 %136 0 4 5 6 
                                                      OpStore %66 %138 
                                Private f32* %140 = OpAccessChain %66 %62 
                                         f32 %141 = OpLoad %140 
                                         f32 %143 = OpFMul %141 %142 
                                         f32 %145 = OpFAdd %143 %144 
                                                      OpStore %139 %145 
                                Uniform f32* %148 = OpAccessChain %46 %33 %147 
                                         f32 %149 = OpLoad %148 
                                         f32 %151 = OpFMul %149 %150 
                                         f32 %152 = OpFAdd %151 %144 
                                                      OpStore %146 %152 
                                         f32 %153 = OpLoad %139 
                                         f32 %154 = OpLoad %146 
                                         f32 %155 = OpExtInst %1 40 %153 %154 
                                Private f32* %156 = OpAccessChain %66 %47 
                                                      OpStore %156 %155 
                  read_only Texture3DSampled %161 = OpLoad %160 
                                       f32_4 %162 = OpLoad %66 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 2 3 
                                       f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                                      OpStore %66 %164 
                                       f32_4 %166 = OpLoad %66 
                                                      OpStore %165 %166 
                                                      OpBranch %61 
                                             %167 = OpLabel 
                                Private f32* %168 = OpAccessChain %165 %47 
                                                      OpStore %168 %51 
                                Private f32* %169 = OpAccessChain %165 %62 
                                                      OpStore %169 %51 
                                Private f32* %170 = OpAccessChain %165 %147 
                                                      OpStore %170 %51 
                                Private f32* %171 = OpAccessChain %165 %24 
                                                      OpStore %171 %51 
                                                      OpBranch %61 
                                              %61 = OpLabel 
                                       f32_4 %174 = OpLoad %165 
                              Uniform f32_4* %175 = OpAccessChain %46 %32 
                                       f32_4 %176 = OpLoad %175 
                                         f32 %177 = OpDot %174 %176 
                                Private f32* %178 = OpAccessChain %173 %47 
                                                      OpStore %178 %177 
                                Private f32* %179 = OpAccessChain %173 %47 
                                         f32 %180 = OpLoad %179 
                                         f32 %182 = OpExtInst %1 43 %180 %181 %51 
                                Private f32* %183 = OpAccessChain %173 %47 
                                                      OpStore %183 %182 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %46 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                                      OpStore %184 %191 
                                       f32_3 %192 = OpLoad %173 
                                       f32_3 %193 = OpVectorShuffle %192 %192 0 0 0 
                                       f32_3 %194 = OpLoad %184 
                                       f32_3 %195 = OpFMul %193 %194 
                                                      OpStore %173 %195 
                                       f32_4 %196 = OpLoad %9 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                       f32_3 %199 = OpLoad %198 
                                       f32_3 %200 = OpFMul %197 %199 
                                       f32_3 %201 = OpLoad %173 
                                       f32_3 %202 = OpFAdd %200 %201 
                                                      OpStore %173 %202 
                                Private f32* %203 = OpAccessChain %173 %62 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %173 %147 
                                         f32 %206 = OpLoad %205 
                                        bool %207 = OpFOrdGreaterThanEqual %204 %206 
                                                      OpStore %22 %207 
                                        bool %210 = OpLoad %22 
                                                      OpSelectionMerge %212 None 
                                                      OpBranchConditional %210 %211 %213 
                                             %211 = OpLabel 
                                                      OpStore %209 %51 
                                                      OpBranch %212 
                                             %213 = OpLabel 
                                                      OpStore %209 %181 
                                                      OpBranch %212 
                                             %212 = OpLabel 
                                         f32 %214 = OpLoad %209 
                                                      OpStore %139 %214 
                                       f32_3 %217 = OpLoad %173 
                                       f32_2 %218 = OpVectorShuffle %217 %217 2 1 
                                       f32_2 %219 = OpFNegate %218 
                                       f32_3 %220 = OpLoad %173 
                                       f32_2 %221 = OpVectorShuffle %220 %220 1 2 
                                       f32_2 %222 = OpFAdd %219 %221 
                                                      OpStore %216 %222 
                                Private f32* %224 = OpAccessChain %223 %47 
                                                      OpStore %224 %51 
                                Private f32* %226 = OpAccessChain %223 %62 
                                                      OpStore %226 %225 
                                         f32 %227 = OpLoad %139 
                                       f32_2 %228 = OpCompositeConstruct %227 %227 
                                       f32_2 %229 = OpLoad %216 
                                       f32_2 %230 = OpFMul %228 %229 
                                       f32_3 %231 = OpLoad %173 
                                       f32_2 %232 = OpVectorShuffle %231 %231 2 1 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %66 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %66 %235 
                                         f32 %236 = OpLoad %139 
                                       f32_2 %237 = OpCompositeConstruct %236 %236 
                                       f32_2 %238 = OpLoad %223 
                                       f32_2 %239 = OpFMul %237 %238 
                                       f32_2 %242 = OpFAdd %239 %241 
                                       f32_4 %243 = OpLoad %66 
                                       f32_4 %244 = OpVectorShuffle %243 %242 0 1 4 5 
                                                      OpStore %66 %244 
                                Private f32* %245 = OpAccessChain %173 %47 
                                         f32 %246 = OpLoad %245 
                                Private f32* %247 = OpAccessChain %66 %47 
                                         f32 %248 = OpLoad %247 
                                        bool %249 = OpFOrdGreaterThanEqual %246 %248 
                                                      OpStore %22 %249 
                                        bool %251 = OpLoad %22 
                                                      OpSelectionMerge %253 None 
                                                      OpBranchConditional %251 %252 %254 
                                             %252 = OpLabel 
                                                      OpStore %250 %51 
                                                      OpBranch %253 
                                             %254 = OpLabel 
                                                      OpStore %250 %181 
                                                      OpBranch %253 
                                             %253 = OpLabel 
                                         f32 %255 = OpLoad %250 
                                                      OpStore %139 %255 
                                       f32_4 %257 = OpLoad %66 
                                       f32_3 %258 = OpVectorShuffle %257 %257 0 1 3 
                                       f32_3 %259 = OpFNegate %258 
                                       f32_4 %260 = OpLoad %256 
                                       f32_4 %261 = OpVectorShuffle %260 %259 4 5 6 3 
                                                      OpStore %256 %261 
                                Private f32* %262 = OpAccessChain %173 %47 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFNegate %263 
                                Private f32* %265 = OpAccessChain %256 %24 
                                                      OpStore %265 %264 
                                Private f32* %267 = OpAccessChain %173 %47 
                                         f32 %268 = OpLoad %267 
                                Private f32* %269 = OpAccessChain %256 %47 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFAdd %268 %270 
                                Private f32* %272 = OpAccessChain %266 %47 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %66 
                                       f32_3 %274 = OpVectorShuffle %273 %273 1 2 0 
                                       f32_4 %275 = OpLoad %256 
                                       f32_3 %276 = OpVectorShuffle %275 %275 1 2 3 
                                       f32_3 %277 = OpFAdd %274 %276 
                                       f32_4 %278 = OpLoad %266 
                                       f32_4 %279 = OpVectorShuffle %278 %277 0 4 5 6 
                                                      OpStore %266 %279 
                                         f32 %280 = OpLoad %139 
                                       f32_3 %281 = OpCompositeConstruct %280 %280 %280 
                                       f32_4 %282 = OpLoad %266 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 1 2 
                                       f32_3 %284 = OpFMul %281 %283 
                                       f32_4 %285 = OpLoad %66 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 3 
                                       f32_3 %287 = OpFAdd %284 %286 
                                       f32_4 %288 = OpLoad %256 
                                       f32_4 %289 = OpVectorShuffle %288 %287 4 5 6 3 
                                                      OpStore %256 %289 
                                         f32 %290 = OpLoad %139 
                                Private f32* %291 = OpAccessChain %266 %24 
                                         f32 %292 = OpLoad %291 
                                         f32 %293 = OpFMul %290 %292 
                                Private f32* %294 = OpAccessChain %173 %47 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %293 %295 
                                                      OpStore %139 %296 
                                Private f32* %298 = OpAccessChain %256 %62 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpLoad %139 
                                         f32 %301 = OpExtInst %1 37 %299 %300 
                                                      OpStore %297 %301 
                                         f32 %302 = OpLoad %297 
                                         f32 %303 = OpFNegate %302 
                                Private f32* %304 = OpAccessChain %256 %47 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFAdd %303 %305 
                                                      OpStore %297 %306 
                                Private f32* %307 = OpAccessChain %256 %62 
                                         f32 %308 = OpLoad %307 
                                         f32 %309 = OpFNegate %308 
                                         f32 %310 = OpLoad %139 
                                         f32 %311 = OpFAdd %309 %310 
                                                      OpStore %139 %311 
                                         f32 %313 = OpLoad %297 
                                         f32 %315 = OpFMul %313 %314 
                                         f32 %317 = OpFAdd %315 %316 
                                                      OpStore %312 %317 
                                         f32 %318 = OpLoad %139 
                                         f32 %319 = OpLoad %312 
                                         f32 %320 = OpFDiv %318 %319 
                                                      OpStore %139 %320 
                                         f32 %321 = OpLoad %139 
                                Private f32* %322 = OpAccessChain %256 %147 
                                         f32 %323 = OpLoad %322 
                                         f32 %324 = OpFAdd %321 %323 
                                                      OpStore %139 %324 
                                Private f32* %325 = OpAccessChain %256 %47 
                                         f32 %326 = OpLoad %325 
                                         f32 %327 = OpFAdd %326 %316 
                                Private f32* %328 = OpAccessChain %256 %47 
                                                      OpStore %328 %327 
                                         f32 %329 = OpLoad %297 
                                Private f32* %330 = OpAccessChain %256 %47 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFDiv %329 %331 
                                Private f32* %333 = OpAccessChain %256 %47 
                                                      OpStore %333 %332 
                                Private f32* %335 = OpAccessChain %9 %62 
                                         f32 %336 = OpLoad %335 
                                Private f32* %337 = OpAccessChain %9 %147 
                                         f32 %338 = OpLoad %337 
                                        bool %339 = OpFOrdGreaterThanEqual %336 %338 
                                                      OpStore %334 %339 
                                        bool %341 = OpLoad %334 
                                                      OpSelectionMerge %343 None 
                                                      OpBranchConditional %341 %342 %344 
                                             %342 = OpLabel 
                                                      OpStore %340 %51 
                                                      OpBranch %343 
                                             %344 = OpLabel 
                                                      OpStore %340 %181 
                                                      OpBranch %343 
                                             %343 = OpLabel 
                                         f32 %345 = OpLoad %340 
                                                      OpStore %312 %345 
                                Private f32* %347 = OpAccessChain %9 %147 
                                         f32 %348 = OpLoad %347 
                                         f32 %349 = OpFNegate %348 
                                Private f32* %350 = OpAccessChain %9 %62 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpFAdd %349 %351 
                                Private f32* %353 = OpAccessChain %346 %47 
                                                      OpStore %353 %352 
                                         f32 %354 = OpLoad %312 
                                Private f32* %355 = OpAccessChain %346 %47 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFMul %354 %356 
                                Private f32* %358 = OpAccessChain %9 %147 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %346 %47 
                                                      OpStore %361 %360 
                                Private f32* %363 = OpAccessChain %9 %47 
                                         f32 %364 = OpLoad %363 
                                Private f32* %365 = OpAccessChain %346 %47 
                                         f32 %366 = OpLoad %365 
                                        bool %367 = OpFOrdGreaterThanEqual %364 %366 
                                                      OpStore %362 %367 
                                        bool %370 = OpLoad %362 
                                                      OpSelectionMerge %372 None 
                                                      OpBranchConditional %370 %371 %373 
                                             %371 = OpLabel 
                                                      OpStore %369 %51 
                                                      OpBranch %372 
                                             %373 = OpLabel 
                                                      OpStore %369 %181 
                                                      OpBranch %372 
                                             %372 = OpLabel 
                                         f32 %374 = OpLoad %369 
                                                      OpStore %368 %374 
                                Private f32* %375 = OpAccessChain %346 %47 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpFNegate %376 
                                Private f32* %378 = OpAccessChain %9 %47 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpFAdd %377 %379 
                                Private f32* %381 = OpAccessChain %9 %47 
                                                      OpStore %381 %380 
                                         f32 %382 = OpLoad %368 
                                Private f32* %383 = OpAccessChain %9 %47 
                                         f32 %384 = OpLoad %383 
                                         f32 %385 = OpFMul %382 %384 
                                Private f32* %386 = OpAccessChain %346 %47 
                                         f32 %387 = OpLoad %386 
                                         f32 %388 = OpFAdd %385 %387 
                                Private f32* %389 = OpAccessChain %9 %47 
                                                      OpStore %389 %388 
                                         f32 %390 = OpLoad %139 
                                       f32_3 %391 = OpCompositeConstruct %390 %390 %390 
                                       f32_3 %392 = OpExtInst %1 4 %391 
                                       f32_3 %395 = OpFAdd %392 %394 
                                                      OpStore %346 %395 
                                       f32_3 %396 = OpLoad %346 
                                       f32_3 %397 = OpExtInst %1 10 %396 
                                                      OpStore %346 %397 
                                       f32_3 %398 = OpLoad %346 
                                       f32_3 %400 = OpFMul %398 %399 
                                       f32_3 %403 = OpFAdd %400 %402 
                                                      OpStore %346 %403 
                                       f32_3 %404 = OpLoad %346 
                                       f32_3 %405 = OpExtInst %1 4 %404 
                                       f32_3 %407 = OpFAdd %405 %406 
                                                      OpStore %346 %407 
                                       f32_3 %408 = OpLoad %346 
                                       f32_3 %409 = OpCompositeConstruct %181 %181 %181 
                                       f32_3 %410 = OpCompositeConstruct %51 %51 %51 
                                       f32_3 %411 = OpExtInst %1 43 %408 %409 %410 
                                                      OpStore %346 %411 
                                       f32_3 %412 = OpLoad %346 
                                       f32_3 %413 = OpFAdd %412 %406 
                                                      OpStore %346 %413 
                                       f32_4 %414 = OpLoad %256 
                                       f32_3 %415 = OpVectorShuffle %414 %414 0 0 0 
                                       f32_3 %416 = OpLoad %346 
                                       f32_3 %417 = OpFMul %415 %416 
                                       f32_3 %419 = OpFAdd %417 %418 
                                                      OpStore %346 %419 
                                       f32_3 %420 = OpLoad %346 
                                       f32_4 %421 = OpLoad %9 
                                       f32_3 %422 = OpVectorShuffle %421 %421 0 0 0 
                                       f32_3 %423 = OpFMul %420 %422 
                                       f32_4 %424 = OpLoad %9 
                                       f32_4 %425 = OpVectorShuffle %424 %423 4 5 6 3 
                                                      OpStore %9 %425 
                                       f32_4 %428 = OpLoad %9 
                                       f32_3 %429 = OpVectorShuffle %428 %428 0 1 2 
                                       f32_4 %430 = OpLoad %427 
                                       f32_4 %431 = OpVectorShuffle %430 %429 4 5 6 3 
                                                      OpStore %427 %431 
                                 Output f32* %433 = OpAccessChain %427 %24 
                                                      OpStore %433 %51 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat6;
float u_xlat20;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat6 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat6 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat20 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat2.xyz = vec3(u_xlat20) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4 = u_xlat0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat4 = u_xlat2.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat5 * u_xlat2.xxxx + u_xlat4;
    u_xlat3 = u_xlat5 * u_xlat5 + u_xlat3;
    u_xlat3 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat2.zzzz + u_xlat4;
    u_xlat2 = max(u_xlat3, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat3 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat2 * u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    vs_TEXCOORD5.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat12) + u_xlat1.x;
    u_xlat12 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat12;
    u_xlat12 = u_xlat12 * _LightShadowData.z + _LightShadowData.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat9.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9.x, u_xlat5.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat9.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat9.xy);
    u_xlat12 = u_xlat12 + u_xlat10_2.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat5.x = min(u_xlat12, u_xlat5.x);
    u_xlat12 = (u_xlatb1) ? u_xlat5.x : u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5.x = u_xlat5.x / u_xlat13;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 345
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %44 %123 %129 %130 %144 %181 %184 %187 %190 %307 %327 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 RelaxedPrecision 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpMemberDecorate %17 11 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %44 Location 44 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %187 Location 187 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %327 Location 327 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %7 %12 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 10 
                                              %22 = OpTypePointer Uniform %6 
                                          i32 %25 = OpConstant 9 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                 Private f32* %37 = OpVariable Private 
                                          f32 %41 = OpConstant 3.67402E-40 
                                              %43 = OpTypePointer Input %7 
                                 Input f32_4* %44 = OpVariable Input 
                                          u32 %45 = OpConstant 1 
                                              %46 = OpTypePointer Input %6 
                                          i32 %57 = OpConstant 6 
                                          i32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %71 = OpConstant 2 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %92 = OpVariable Private 
                                          i32 %95 = OpConstant 8 
                                             %120 = OpTypeArray %6 %45 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %125 = OpTypePointer Output %7 
                                             %127 = OpTypeVector %6 2 
                                             %128 = OpTypePointer Output %127 
                               Output f32_2* %129 = OpVariable Output 
                                Input f32_4* %130 = OpVariable Input 
                                         i32 %133 = OpConstant 11 
                                             %142 = OpTypeVector %6 3 
                                             %143 = OpTypePointer Input %142 
                                Input f32_3* %144 = OpVariable Input 
                                         i32 %146 = OpConstant 7 
                                         u32 %163 = OpConstant 2 
                                Private f32* %165 = OpVariable Private 
                                             %180 = OpTypePointer Output %142 
                               Output f32_3* %181 = OpVariable Output 
                               Output f32_3* %184 = OpVariable Output 
                               Output f32_4* %187 = OpVariable Output 
                                         f32 %188 = OpConstant 3.67402E-40 
                                       f32_4 %189 = OpConstantComposite %188 %188 %188 %188 
                               Output f32_4* %190 = OpVariable Output 
                              Private f32_4* %192 = OpVariable Private 
                              Private f32_4* %199 = OpVariable Private 
                              Private f32_4* %207 = OpVariable Private 
                                         f32 %243 = OpConstant 3.67402E-40 
                                       f32_4 %244 = OpConstantComposite %243 %243 %243 %243 
                                         i32 %249 = OpConstant 4 
                                       f32_4 %253 = OpConstantComposite %41 %41 %41 %41 
                                         i32 %267 = OpConstant 5 
                               Output f32_3* %307 = OpVariable Output 
                                         u32 %319 = OpConstant 3 
                                       f32_2 %323 = OpConstantComposite %34 %34 
                               Output f32_4* %327 = OpVariable Output 
                                             %339 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                 Uniform f32* %26 = OpAccessChain %19 %25 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFMul %24 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                 Private f32* %32 = OpAccessChain %9 %29 
                                          f32 %33 = OpLoad %32 
                                          f32 %35 = OpFMul %33 %34 
                                 Private f32* %36 = OpAccessChain %9 %29 
                                                      OpStore %36 %35 
                                 Uniform f32* %38 = OpAccessChain %19 %25 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpFNegate %39 
                                          f32 %42 = OpFAdd %40 %41 
                                                      OpStore %37 %42 
                                   Input f32* %47 = OpAccessChain %44 %45 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpLoad %37 
                                          f32 %50 = OpFMul %48 %49 
                                 Private f32* %51 = OpAccessChain %9 %29 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %29 
                                                      OpStore %54 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               Uniform f32_4* %60 = OpAccessChain %19 %57 %58 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %56 %61 
                                                      OpStore %9 %62 
                               Uniform f32_4* %64 = OpAccessChain %19 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %44 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %9 %70 
                               Uniform f32_4* %72 = OpAccessChain %19 %57 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %44 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                               Uniform f32_4* %82 = OpAccessChain %19 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpFAdd %80 %83 
                                                      OpStore %79 %84 
                               Uniform f32_4* %85 = OpAccessChain %19 %57 %81 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %44 
                                        f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %9 %91 
                                        f32_4 %93 = OpLoad %79 
                                        f32_4 %94 = OpVectorShuffle %93 %93 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %19 %95 %58 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %94 %97 
                                                      OpStore %92 %98 
                               Uniform f32_4* %99 = OpAccessChain %19 %95 %63 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %79 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %92 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %92 %105 
                              Uniform f32_4* %106 = OpAccessChain %19 %95 %71 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %79 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %92 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %92 %112 
                              Uniform f32_4* %113 = OpAccessChain %19 %95 %81 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %79 
                                       f32_4 %116 = OpVectorShuffle %115 %115 3 3 3 3 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %92 
                                       f32_4 %119 = OpFAdd %117 %118 
                                                      OpStore %79 %119 
                                       f32_4 %124 = OpLoad %79 
                               Output f32_4* %126 = OpAccessChain %123 %63 
                                                      OpStore %126 %124 
                                       f32_4 %131 = OpLoad %130 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                              Uniform f32_4* %134 = OpAccessChain %19 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                              Uniform f32_4* %138 = OpAccessChain %19 %133 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 2 3 
                                       f32_2 %141 = OpFAdd %137 %140 
                                                      OpStore %129 %141 
                                       f32_3 %145 = OpLoad %144 
                              Uniform f32_4* %147 = OpAccessChain %19 %146 %63 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %150 = OpDot %145 %149 
                                Private f32* %151 = OpAccessChain %92 %29 
                                                      OpStore %151 %150 
                                       f32_3 %152 = OpLoad %144 
                              Uniform f32_4* %153 = OpAccessChain %19 %146 %58 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %152 %155 
                                Private f32* %157 = OpAccessChain %92 %45 
                                                      OpStore %157 %156 
                                       f32_3 %158 = OpLoad %144 
                              Uniform f32_4* %159 = OpAccessChain %19 %146 %71 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                         f32 %162 = OpDot %158 %161 
                                Private f32* %164 = OpAccessChain %92 %163 
                                                      OpStore %164 %162 
                                       f32_4 %166 = OpLoad %92 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %92 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %173 = OpLoad %165 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %92 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                       f32_4 %178 = OpLoad %92 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %92 %179 
                                       f32_4 %182 = OpLoad %92 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                                      OpStore %181 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                                      OpStore %184 %186 
                                                      OpStore %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                                      OpStore %190 %191 
                                       f32_4 %193 = OpLoad %9 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                                       f32_4 %195 = OpFNegate %194 
                              Uniform f32_4* %196 = OpAccessChain %19 %71 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFAdd %195 %197 
                                                      OpStore %192 %198 
                                       f32_4 %200 = OpLoad %92 
                                       f32_4 %201 = OpVectorShuffle %200 %200 1 1 1 1 
                                       f32_4 %202 = OpLoad %192 
                                       f32_4 %203 = OpFMul %201 %202 
                                                      OpStore %199 %203 
                                       f32_4 %204 = OpLoad %192 
                                       f32_4 %205 = OpLoad %192 
                                       f32_4 %206 = OpFMul %204 %205 
                                                      OpStore %192 %206 
                                       f32_4 %208 = OpLoad %9 
                                       f32_4 %209 = OpVectorShuffle %208 %208 0 0 0 0 
                                       f32_4 %210 = OpFNegate %209 
                              Uniform f32_4* %211 = OpAccessChain %19 %58 
                                       f32_4 %212 = OpLoad %211 
                                       f32_4 %213 = OpFAdd %210 %212 
                                                      OpStore %207 %213 
                                       f32_4 %214 = OpLoad %9 
                                       f32_4 %215 = OpVectorShuffle %214 %214 2 2 2 2 
                                       f32_4 %216 = OpFNegate %215 
                              Uniform f32_4* %217 = OpAccessChain %19 %81 
                                       f32_4 %218 = OpLoad %217 
                                       f32_4 %219 = OpFAdd %216 %218 
                                                      OpStore %9 %219 
                                       f32_4 %220 = OpLoad %207 
                                       f32_4 %221 = OpLoad %92 
                                       f32_4 %222 = OpVectorShuffle %221 %221 0 0 0 0 
                                       f32_4 %223 = OpFMul %220 %222 
                                       f32_4 %224 = OpLoad %199 
                                       f32_4 %225 = OpFAdd %223 %224 
                                                      OpStore %199 %225 
                                       f32_4 %226 = OpLoad %207 
                                       f32_4 %227 = OpLoad %207 
                                       f32_4 %228 = OpFMul %226 %227 
                                       f32_4 %229 = OpLoad %192 
                                       f32_4 %230 = OpFAdd %228 %229 
                                                      OpStore %192 %230 
                                       f32_4 %231 = OpLoad %9 
                                       f32_4 %232 = OpLoad %9 
                                       f32_4 %233 = OpFMul %231 %232 
                                       f32_4 %234 = OpLoad %192 
                                       f32_4 %235 = OpFAdd %233 %234 
                                                      OpStore %192 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpLoad %92 
                                       f32_4 %238 = OpVectorShuffle %237 %237 2 2 2 2 
                                       f32_4 %239 = OpFMul %236 %238 
                                       f32_4 %240 = OpLoad %199 
                                       f32_4 %241 = OpFAdd %239 %240 
                                                      OpStore %9 %241 
                                       f32_4 %242 = OpLoad %192 
                                       f32_4 %245 = OpExtInst %1 40 %242 %244 
                                                      OpStore %92 %245 
                                       f32_4 %246 = OpLoad %92 
                                       f32_4 %247 = OpExtInst %1 32 %246 
                                                      OpStore %192 %247 
                                       f32_4 %248 = OpLoad %92 
                              Uniform f32_4* %250 = OpAccessChain %19 %249 
                                       f32_4 %251 = OpLoad %250 
                                       f32_4 %252 = OpFMul %248 %251 
                                       f32_4 %254 = OpFAdd %252 %253 
                                                      OpStore %92 %254 
                                       f32_4 %255 = OpLoad %92 
                                       f32_4 %256 = OpFDiv %253 %255 
                                                      OpStore %92 %256 
                                       f32_4 %257 = OpLoad %9 
                                       f32_4 %258 = OpLoad %192 
                                       f32_4 %259 = OpFMul %257 %258 
                                                      OpStore %9 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpExtInst %1 40 %260 %189 
                                                      OpStore %9 %261 
                                       f32_4 %262 = OpLoad %92 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpFMul %262 %263 
                                                      OpStore %9 %264 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 1 1 1 
                              Uniform f32_4* %268 = OpAccessChain %19 %267 %58 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                                       f32_3 %271 = OpFMul %266 %270 
                                       f32_4 %272 = OpLoad %92 
                                       f32_4 %273 = OpVectorShuffle %272 %271 4 5 6 3 
                                                      OpStore %92 %273 
                              Uniform f32_4* %274 = OpAccessChain %19 %267 %63 
                                       f32_4 %275 = OpLoad %274 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 1 2 
                                       f32_4 %277 = OpLoad %9 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 0 0 
                                       f32_3 %279 = OpFMul %276 %278 
                                       f32_4 %280 = OpLoad %92 
                                       f32_3 %281 = OpVectorShuffle %280 %280 0 1 2 
                                       f32_3 %282 = OpFAdd %279 %281 
                                       f32_4 %283 = OpLoad %92 
                                       f32_4 %284 = OpVectorShuffle %283 %282 4 5 6 3 
                                                      OpStore %92 %284 
                              Uniform f32_4* %285 = OpAccessChain %19 %267 %71 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                       f32_4 %288 = OpLoad %9 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %287 %289 
                                       f32_4 %291 = OpLoad %92 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_3 %293 = OpFAdd %290 %292 
                                       f32_4 %294 = OpLoad %9 
                                       f32_4 %295 = OpVectorShuffle %294 %293 4 5 6 3 
                                                      OpStore %9 %295 
                              Uniform f32_4* %296 = OpAccessChain %19 %267 %81 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 1 2 
                                       f32_4 %299 = OpLoad %9 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %298 %300 
                                       f32_4 %302 = OpLoad %9 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %304 = OpFAdd %301 %303 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpVectorShuffle %305 %304 4 5 6 3 
                                                      OpStore %9 %306 
                                       f32_4 %308 = OpLoad %9 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                                                      OpStore %307 %309 
                                Private f32* %310 = OpAccessChain %79 %45 
                                         f32 %311 = OpLoad %310 
                                Uniform f32* %312 = OpAccessChain %19 %63 %29 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFMul %311 %313 
                                Private f32* %315 = OpAccessChain %9 %29 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %9 %29 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFMul %317 %34 
                                Private f32* %320 = OpAccessChain %9 %319 
                                                      OpStore %320 %318 
                                       f32_4 %321 = OpLoad %79 
                                       f32_2 %322 = OpVectorShuffle %321 %321 0 3 
                                       f32_2 %324 = OpFMul %322 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_4 %326 = OpVectorShuffle %325 %324 4 1 5 3 
                                                      OpStore %9 %326 
                                       f32_4 %328 = OpLoad %79 
                                       f32_2 %329 = OpVectorShuffle %328 %328 2 3 
                                       f32_4 %330 = OpLoad %327 
                                       f32_4 %331 = OpVectorShuffle %330 %329 0 1 4 5 
                                                      OpStore %327 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_2 %333 = OpVectorShuffle %332 %332 2 2 
                                       f32_4 %334 = OpLoad %9 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 3 
                                       f32_2 %336 = OpFAdd %333 %335 
                                       f32_4 %337 = OpLoad %327 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 2 3 
                                                      OpStore %327 %338 
                                 Output f32* %340 = OpAccessChain %123 %63 %45 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpFNegate %341 
                                 Output f32* %343 = OpAccessChain %123 %63 %45 
                                                      OpStore %343 %342 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 544
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %44 %254 %309 %536 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %44 Location 44 
                                                      OpDecorate %48 ArrayStride 48 
                                                      OpDecorate %49 ArrayStride 49 
                                                      OpMemberDecorate %50 0 Offset 50 
                                                      OpMemberDecorate %50 1 RelaxedPrecision 
                                                      OpMemberDecorate %50 1 Offset 50 
                                                      OpMemberDecorate %50 2 RelaxedPrecision 
                                                      OpMemberDecorate %50 2 Offset 50 
                                                      OpMemberDecorate %50 3 Offset 50 
                                                      OpMemberDecorate %50 4 Offset 50 
                                                      OpMemberDecorate %50 5 Offset 50 
                                                      OpMemberDecorate %50 6 Offset 50 
                                                      OpMemberDecorate %50 7 Offset 50 
                                                      OpMemberDecorate %50 8 Offset 50 
                                                      OpMemberDecorate %50 9 RelaxedPrecision 
                                                      OpMemberDecorate %50 9 Offset 50 
                                                      OpDecorate %50 Block 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %136 SpecId 136 
                                                      OpDecorate %231 DescriptorSet 231 
                                                      OpDecorate %231 Binding 231 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %254 Location 254 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 DescriptorSet 263 
                                                      OpDecorate %263 Binding 263 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 Location 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %536 Location 536 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Input %42 
                                 Input f32_3* %44 = OpVariable Input 
                                          u32 %47 = OpConstant 4 
                                              %48 = OpTypeArray %7 %47 
                                              %49 = OpTypeArray %7 %47 
                                              %50 = OpTypeStruct %42 %7 %7 %7 %48 %7 %49 %42 %42 %7 
                                              %51 = OpTypePointer Uniform %50 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %52 = OpVariable Uniform 
                                              %53 = OpTypePointer Uniform %42 
                               Private f32_4* %59 = OpVariable Private 
                                          i32 %60 = OpConstant 4 
                                          u32 %61 = OpConstant 2 
                                              %62 = OpTypePointer Uniform %6 
                                          u32 %65 = OpConstant 0 
                                          u32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant 2 
                                 Private f32* %75 = OpVariable Private 
                                          i32 %82 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                               Private bool* %125 = OpVariable Private 
                                         i32 %126 = OpConstant 5 
                                        bool %130 = OpConstantFalse 
                                        bool %136 = OpSpecConstantFalse 
                               Private bool* %139 = OpVariable Private 
                                         i32 %145 = OpConstant 6 
                                             %182 = OpTypePointer Private %42 
                              Private f32_3* %183 = OpVariable Private 
                                             %184 = OpTypePointer Function %42 
                                         i32 %195 = OpConstant 8 
                                         i32 %201 = OpConstant 7 
                                         f32 %209 = OpConstant 3.67402E-40 
                                         f32 %211 = OpConstant 3.67402E-40 
                                             %214 = OpTypePointer Private %15 
                              Private f32_2* %215 = OpVariable Private 
                                         f32 %218 = OpConstant 3.67402E-40 
                                             %228 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %229 = OpTypeSampledImage %228 
                                             %230 = OpTypePointer UniformConstant %229 
 UniformConstant read_only Texture3DSampled* %231 = OpVariable UniformConstant 
                              Private f32_4* %236 = OpVariable Private 
                              Private f32_3* %243 = OpVariable Private 
                                             %253 = OpTypePointer Input %7 
                                Input f32_4* %254 = OpVariable Input 
                                Private f32* %262 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %263 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %284 = OpTypePointer Function %6 
                                         i32 %298 = OpConstant 9 
                                Input f32_3* %309 = OpVariable Input 
                              Private f32_2* %325 = OpVariable Private 
                                         f32 %333 = OpConstant 3.67402E-40 
                                         f32 %348 = OpConstant 3.67402E-40 
                                       f32_2 %349 = OpConstantComposite %333 %348 
                              Private f32_4* %373 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                         f32 %420 = OpConstant 3.67402E-40 
                                         f32 %422 = OpConstant 3.67402E-40 
                              Private f32_3* %454 = OpVariable Private 
                               Private bool* %471 = OpVariable Private 
                                Private f32* %477 = OpVariable Private 
                                         f32 %502 = OpConstant 3.67402E-40 
                                       f32_3 %503 = OpConstantComposite %123 %348 %502 
                                       f32_3 %508 = OpConstantComposite %420 %420 %420 
                                         f32 %510 = OpConstant 3.67402E-40 
                                       f32_3 %511 = OpConstantComposite %510 %510 %510 
                                       f32_3 %515 = OpConstantComposite %333 %333 %333 
                                       f32_3 %527 = OpConstantComposite %123 %123 %123 
                                             %535 = OpTypePointer Output %7 
                               Output f32_4* %536 = OpVariable Output 
                                             %541 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %185 = OpVariable Function 
                               Function f32* %285 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                               Function f32* %358 = OpVariable Function 
                               Function f32* %447 = OpVariable Function 
                               Function f32* %478 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                        f32_3 %45 = OpLoad %44 
                                        f32_3 %46 = OpFNegate %45 
                               Uniform f32_3* %54 = OpAccessChain %52 %32 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpFAdd %46 %55 
                                        f32_4 %57 = OpLoad %41 
                                        f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                                      OpStore %41 %58 
                                 Uniform f32* %63 = OpAccessChain %52 %60 %32 %61 
                                          f32 %64 = OpLoad %63 
                                 Private f32* %66 = OpAccessChain %59 %65 
                                                      OpStore %66 %64 
                                 Uniform f32* %67 = OpAccessChain %52 %60 %33 %61 
                                          f32 %68 = OpLoad %67 
                                 Private f32* %70 = OpAccessChain %59 %69 
                                                      OpStore %70 %68 
                                 Uniform f32* %72 = OpAccessChain %52 %60 %71 %61 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %59 %61 
                                                      OpStore %74 %73 
                                        f32_4 %76 = OpLoad %41 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_4 %78 = OpLoad %59 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                          f32 %80 = OpDot %77 %79 
                                                      OpStore %75 %80 
                                        f32_3 %81 = OpLoad %44 
                               Uniform f32_4* %84 = OpAccessChain %52 %82 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFNegate %86 
                                        f32_3 %88 = OpFAdd %81 %87 
                                        f32_4 %89 = OpLoad %41 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 6 3 
                                                      OpStore %41 %90 
                                        f32_4 %91 = OpLoad %41 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_4 %93 = OpLoad %41 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                          f32 %95 = OpDot %92 %94 
                                 Private f32* %96 = OpAccessChain %41 %65 
                                                      OpStore %96 %95 
                                 Private f32* %97 = OpAccessChain %41 %65 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpExtInst %1 31 %98 
                                Private f32* %100 = OpAccessChain %41 %65 
                                                      OpStore %100 %99 
                                         f32 %101 = OpLoad %75 
                                         f32 %102 = OpFNegate %101 
                                Private f32* %103 = OpAccessChain %41 %65 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %41 %65 
                                                      OpStore %106 %105 
                                Uniform f32* %107 = OpAccessChain %52 %82 %24 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %41 %65 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                         f32 %112 = OpLoad %75 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %75 %113 
                                         f32 %114 = OpLoad %75 
                                Uniform f32* %115 = OpAccessChain %52 %71 %61 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %114 %116 
                                Uniform f32* %118 = OpAccessChain %52 %71 %24 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFAdd %117 %119 
                                                      OpStore %75 %120 
                                         f32 %121 = OpLoad %75 
                                         f32 %124 = OpExtInst %1 43 %121 %122 %123 
                                                      OpStore %75 %124 
                                Uniform f32* %127 = OpAccessChain %52 %126 %65 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %123 
                                                      OpStore %125 %129 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                        bool %133 = OpLoad %125 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %238 
                                             %137 = OpLabel 
                                Uniform f32* %140 = OpAccessChain %52 %126 %69 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdEqual %141 %123 
                                                      OpStore %139 %142 
                                       f32_3 %143 = OpLoad %44 
                                       f32_3 %144 = OpVectorShuffle %143 %143 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %52 %145 %33 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %144 %148 
                                       f32_4 %150 = OpLoad %59 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %59 %151 
                              Uniform f32_4* %152 = OpAccessChain %52 %145 %32 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %44 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %59 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %59 %162 
                              Uniform f32_4* %163 = OpAccessChain %52 %145 %71 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpLoad %44 
                                       f32_3 %167 = OpVectorShuffle %166 %166 2 2 2 
                                       f32_3 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %59 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %59 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %59 %173 
                                       f32_4 %174 = OpLoad %59 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_4* %176 = OpAccessChain %52 %145 %82 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                       f32_4 %180 = OpLoad %59 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %59 %181 
                                        bool %186 = OpLoad %139 
                                                      OpSelectionMerge %188 None 
                                                      OpBranchConditional %186 %187 %191 
                                             %187 = OpLabel 
                                       f32_4 %189 = OpLoad %59 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                      OpStore %185 %190 
                                                      OpBranch %188 
                                             %191 = OpLabel 
                                       f32_3 %192 = OpLoad %44 
                                                      OpStore %185 %192 
                                                      OpBranch %188 
                                             %188 = OpLabel 
                                       f32_3 %193 = OpLoad %185 
                                                      OpStore %183 %193 
                                       f32_3 %194 = OpLoad %183 
                              Uniform f32_3* %196 = OpAccessChain %52 %195 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpFAdd %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %200 = OpLoad %183 
                              Uniform f32_3* %202 = OpAccessChain %52 %201 
                                       f32_3 %203 = OpLoad %202 
                                       f32_3 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad %59 
                                       f32_4 %206 = OpVectorShuffle %205 %204 0 4 5 6 
                                                      OpStore %59 %206 
                                Private f32* %207 = OpAccessChain %59 %69 
                                         f32 %208 = OpLoad %207 
                                         f32 %210 = OpFMul %208 %209 
                                         f32 %212 = OpFAdd %210 %211 
                                Private f32* %213 = OpAccessChain %183 %65 
                                                      OpStore %213 %212 
                                Uniform f32* %216 = OpAccessChain %52 %126 %61 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                         f32 %220 = OpFAdd %219 %211 
                                Private f32* %221 = OpAccessChain %215 %65 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %215 %65 
                                         f32 %223 = OpLoad %222 
                                Private f32* %224 = OpAccessChain %183 %65 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpExtInst %1 40 %223 %225 
                                Private f32* %227 = OpAccessChain %59 %65 
                                                      OpStore %227 %226 
                  read_only Texture3DSampled %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %59 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 2 3 
                                       f32_4 %235 = OpImageSampleImplicitLod %232 %234 
                                                      OpStore %59 %235 
                                       f32_4 %237 = OpLoad %59 
                                                      OpStore %236 %237 
                                                      OpBranch %138 
                                             %238 = OpLabel 
                                Private f32* %239 = OpAccessChain %236 %65 
                                                      OpStore %239 %123 
                                Private f32* %240 = OpAccessChain %236 %69 
                                                      OpStore %240 %123 
                                Private f32* %241 = OpAccessChain %236 %61 
                                                      OpStore %241 %123 
                                Private f32* %242 = OpAccessChain %236 %24 
                                                      OpStore %242 %123 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_4 %244 = OpLoad %236 
                              Uniform f32_4* %245 = OpAccessChain %52 %33 
                                       f32_4 %246 = OpLoad %245 
                                         f32 %247 = OpDot %244 %246 
                                Private f32* %248 = OpAccessChain %243 %65 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %243 %65 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpExtInst %1 43 %250 %122 %123 
                                Private f32* %252 = OpAccessChain %243 %65 
                                                      OpStore %252 %251 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_4 %257 = OpLoad %254 
                                       f32_2 %258 = OpVectorShuffle %257 %257 3 3 
                                       f32_2 %259 = OpFDiv %256 %258 
                                       f32_3 %260 = OpLoad %183 
                                       f32_3 %261 = OpVectorShuffle %260 %259 3 4 2 
                                                      OpStore %183 %261 
                  read_only Texture2DSampled %264 = OpLoad %263 
                                       f32_3 %265 = OpLoad %183 
                                       f32_2 %266 = OpVectorShuffle %265 %265 0 1 
                                       f32_4 %267 = OpImageSampleImplicitLod %264 %266 
                                         f32 %268 = OpCompositeExtract %267 0 
                                                      OpStore %262 %268 
                                         f32 %270 = OpLoad %75 
                                         f32 %271 = OpLoad %262 
                                         f32 %272 = OpFAdd %270 %271 
                                Private f32* %273 = OpAccessChain %269 %65 
                                                      OpStore %273 %272 
                                Private f32* %274 = OpAccessChain %269 %65 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpExtInst %1 43 %275 %122 %123 
                                Private f32* %277 = OpAccessChain %269 %65 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %269 %65 
                                         f32 %279 = OpLoad %278 
                                Private f32* %280 = OpAccessChain %243 %65 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpExtInst %1 37 %279 %281 
                                Private f32* %283 = OpAccessChain %243 %65 
                                                      OpStore %283 %282 
                                        bool %286 = OpLoad %125 
                                                      OpSelectionMerge %288 None 
                                                      OpBranchConditional %286 %287 %291 
                                             %287 = OpLabel 
                                Private f32* %289 = OpAccessChain %243 %65 
                                         f32 %290 = OpLoad %289 
                                                      OpStore %285 %290 
                                                      OpBranch %288 
                                             %291 = OpLabel 
                                Private f32* %292 = OpAccessChain %269 %65 
                                         f32 %293 = OpLoad %292 
                                                      OpStore %285 %293 
                                                      OpBranch %288 
                                             %288 = OpLabel 
                                         f32 %294 = OpLoad %285 
                                Private f32* %295 = OpAccessChain %243 %65 
                                                      OpStore %295 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %299 = OpAccessChain %52 %298 
                                       f32_4 %300 = OpLoad %299 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpFMul %297 %301 
                                                      OpStore %269 %302 
                                       f32_3 %303 = OpLoad %243 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %269 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %243 %306 
                                       f32_4 %307 = OpLoad %9 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %310 = OpLoad %309 
                                       f32_3 %311 = OpFMul %308 %310 
                                       f32_3 %312 = OpLoad %243 
                                       f32_3 %313 = OpFAdd %311 %312 
                                                      OpStore %243 %313 
                                Private f32* %314 = OpAccessChain %243 %69 
                                         f32 %315 = OpLoad %314 
                                Private f32* %316 = OpAccessChain %243 %61 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %315 %317 
                                                      OpStore %22 %318 
                                        bool %320 = OpLoad %22 
                                                      OpSelectionMerge %322 None 
                                                      OpBranchConditional %320 %321 %323 
                                             %321 = OpLabel 
                                                      OpStore %319 %123 
                                                      OpBranch %322 
                                             %323 = OpLabel 
                                                      OpStore %319 %122 
                                                      OpBranch %322 
                                             %322 = OpLabel 
                                         f32 %324 = OpLoad %319 
                                                      OpStore %75 %324 
                                       f32_3 %326 = OpLoad %243 
                                       f32_2 %327 = OpVectorShuffle %326 %326 2 1 
                                       f32_2 %328 = OpFNegate %327 
                                       f32_3 %329 = OpLoad %243 
                                       f32_2 %330 = OpVectorShuffle %329 %329 1 2 
                                       f32_2 %331 = OpFAdd %328 %330 
                                                      OpStore %325 %331 
                                Private f32* %332 = OpAccessChain %215 %65 
                                                      OpStore %332 %123 
                                Private f32* %334 = OpAccessChain %215 %69 
                                                      OpStore %334 %333 
                                         f32 %335 = OpLoad %75 
                                       f32_2 %336 = OpCompositeConstruct %335 %335 
                                       f32_2 %337 = OpLoad %325 
                                       f32_2 %338 = OpFMul %336 %337 
                                       f32_3 %339 = OpLoad %243 
                                       f32_2 %340 = OpVectorShuffle %339 %339 2 1 
                                       f32_2 %341 = OpFAdd %338 %340 
                                       f32_4 %342 = OpLoad %59 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 2 3 
                                                      OpStore %59 %343 
                                         f32 %344 = OpLoad %75 
                                       f32_2 %345 = OpCompositeConstruct %344 %344 
                                       f32_2 %346 = OpLoad %215 
                                       f32_2 %347 = OpFMul %345 %346 
                                       f32_2 %350 = OpFAdd %347 %349 
                                       f32_4 %351 = OpLoad %59 
                                       f32_4 %352 = OpVectorShuffle %351 %350 0 1 4 5 
                                                      OpStore %59 %352 
                                Private f32* %353 = OpAccessChain %243 %65 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %59 %65 
                                         f32 %356 = OpLoad %355 
                                        bool %357 = OpFOrdGreaterThanEqual %354 %356 
                                                      OpStore %22 %357 
                                        bool %359 = OpLoad %22 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %359 %360 %362 
                                             %360 = OpLabel 
                                                      OpStore %358 %123 
                                                      OpBranch %361 
                                             %362 = OpLabel 
                                                      OpStore %358 %122 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                         f32 %363 = OpLoad %358 
                                                      OpStore %75 %363 
                                       f32_4 %364 = OpLoad %59 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 3 
                                       f32_3 %366 = OpFNegate %365 
                                       f32_4 %367 = OpLoad %41 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %41 %368 
                                Private f32* %369 = OpAccessChain %243 %65 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFNegate %370 
                                Private f32* %372 = OpAccessChain %41 %24 
                                                      OpStore %372 %371 
                                Private f32* %374 = OpAccessChain %41 %65 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %243 %65 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFAdd %375 %377 
                                Private f32* %379 = OpAccessChain %373 %65 
                                                      OpStore %379 %378 
                                       f32_4 %380 = OpLoad %41 
                                       f32_3 %381 = OpVectorShuffle %380 %380 1 2 3 
                                       f32_4 %382 = OpLoad %59 
                                       f32_3 %383 = OpVectorShuffle %382 %382 1 2 0 
                                       f32_3 %384 = OpFAdd %381 %383 
                                       f32_4 %385 = OpLoad %373 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 4 5 6 
                                                      OpStore %373 %386 
                                         f32 %387 = OpLoad %75 
                                       f32_3 %388 = OpCompositeConstruct %387 %387 %387 
                                       f32_4 %389 = OpLoad %373 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFMul %388 %390 
                                       f32_4 %392 = OpLoad %59 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 3 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %41 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 6 3 
                                                      OpStore %41 %396 
                                         f32 %397 = OpLoad %75 
                                Private f32* %398 = OpAccessChain %373 %24 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpFMul %397 %399 
                                Private f32* %401 = OpAccessChain %243 %65 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFAdd %400 %402 
                                                      OpStore %75 %403 
                                Private f32* %405 = OpAccessChain %41 %69 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpLoad %75 
                                         f32 %408 = OpExtInst %1 37 %406 %407 
                                                      OpStore %404 %408 
                                         f32 %409 = OpLoad %404 
                                         f32 %410 = OpFNegate %409 
                                Private f32* %411 = OpAccessChain %41 %65 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFAdd %410 %412 
                                                      OpStore %404 %413 
                                Private f32* %414 = OpAccessChain %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %75 
                                         f32 %418 = OpFAdd %416 %417 
                                                      OpStore %75 %418 
                                         f32 %419 = OpLoad %404 
                                         f32 %421 = OpFMul %419 %420 
                                         f32 %423 = OpFAdd %421 %422 
                                Private f32* %424 = OpAccessChain %183 %65 
                                                      OpStore %424 %423 
                                         f32 %425 = OpLoad %75 
                                Private f32* %426 = OpAccessChain %183 %65 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFDiv %425 %427 
                                                      OpStore %75 %428 
                                         f32 %429 = OpLoad %75 
                                Private f32* %430 = OpAccessChain %41 %61 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFAdd %429 %431 
                                                      OpStore %75 %432 
                                Private f32* %433 = OpAccessChain %41 %65 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFAdd %434 %422 
                                Private f32* %436 = OpAccessChain %41 %65 
                                                      OpStore %436 %435 
                                         f32 %437 = OpLoad %404 
                                Private f32* %438 = OpAccessChain %41 %65 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFDiv %437 %439 
                                Private f32* %441 = OpAccessChain %41 %65 
                                                      OpStore %441 %440 
                                Private f32* %442 = OpAccessChain %9 %69 
                                         f32 %443 = OpLoad %442 
                                Private f32* %444 = OpAccessChain %9 %61 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %139 %446 
                                        bool %448 = OpLoad %139 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %451 
                                             %449 = OpLabel 
                                                      OpStore %447 %123 
                                                      OpBranch %450 
                                             %451 = OpLabel 
                                                      OpStore %447 %122 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                                         f32 %452 = OpLoad %447 
                                Private f32* %453 = OpAccessChain %183 %65 
                                                      OpStore %453 %452 
                                Private f32* %455 = OpAccessChain %9 %61 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFNegate %456 
                                Private f32* %458 = OpAccessChain %9 %69 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFAdd %457 %459 
                                Private f32* %461 = OpAccessChain %454 %65 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %183 %65 
                                         f32 %463 = OpLoad %462 
                                Private f32* %464 = OpAccessChain %454 %65 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFMul %463 %465 
                                Private f32* %467 = OpAccessChain %9 %61 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFAdd %466 %468 
                                Private f32* %470 = OpAccessChain %454 %65 
                                                      OpStore %470 %469 
                                Private f32* %472 = OpAccessChain %9 %65 
                                         f32 %473 = OpLoad %472 
                                Private f32* %474 = OpAccessChain %454 %65 
                                         f32 %475 = OpLoad %474 
                                        bool %476 = OpFOrdGreaterThanEqual %473 %475 
                                                      OpStore %471 %476 
                                        bool %479 = OpLoad %471 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %479 %480 %482 
                                             %480 = OpLabel 
                                                      OpStore %478 %123 
                                                      OpBranch %481 
                                             %482 = OpLabel 
                                                      OpStore %478 %122 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %483 = OpLoad %478 
                                                      OpStore %477 %483 
                                Private f32* %484 = OpAccessChain %454 %65 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFNegate %485 
                                Private f32* %487 = OpAccessChain %9 %65 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFAdd %486 %488 
                                Private f32* %490 = OpAccessChain %9 %65 
                                                      OpStore %490 %489 
                                         f32 %491 = OpLoad %477 
                                Private f32* %492 = OpAccessChain %9 %65 
                                         f32 %493 = OpLoad %492 
                                         f32 %494 = OpFMul %491 %493 
                                Private f32* %495 = OpAccessChain %454 %65 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %9 %65 
                                                      OpStore %498 %497 
                                         f32 %499 = OpLoad %75 
                                       f32_3 %500 = OpCompositeConstruct %499 %499 %499 
                                       f32_3 %501 = OpExtInst %1 4 %500 
                                       f32_3 %504 = OpFAdd %501 %503 
                                                      OpStore %454 %504 
                                       f32_3 %505 = OpLoad %454 
                                       f32_3 %506 = OpExtInst %1 10 %505 
                                                      OpStore %454 %506 
                                       f32_3 %507 = OpLoad %454 
                                       f32_3 %509 = OpFMul %507 %508 
                                       f32_3 %512 = OpFAdd %509 %511 
                                                      OpStore %454 %512 
                                       f32_3 %513 = OpLoad %454 
                                       f32_3 %514 = OpExtInst %1 4 %513 
                                       f32_3 %516 = OpFAdd %514 %515 
                                                      OpStore %454 %516 
                                       f32_3 %517 = OpLoad %454 
                                       f32_3 %518 = OpCompositeConstruct %122 %122 %122 
                                       f32_3 %519 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %520 = OpExtInst %1 43 %517 %518 %519 
                                                      OpStore %454 %520 
                                       f32_3 %521 = OpLoad %454 
                                       f32_3 %522 = OpFAdd %521 %515 
                                                      OpStore %454 %522 
                                       f32_4 %523 = OpLoad %41 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 0 0 
                                       f32_3 %525 = OpLoad %454 
                                       f32_3 %526 = OpFMul %524 %525 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %454 %528 
                                       f32_3 %529 = OpLoad %454 
                                       f32_4 %530 = OpLoad %9 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 0 0 
                                       f32_3 %532 = OpFMul %529 %531 
                                       f32_4 %533 = OpLoad %9 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %9 %534 
                                       f32_4 %537 = OpLoad %9 
                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
                                       f32_4 %539 = OpLoad %536 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %536 %540 
                                 Output f32* %542 = OpAccessChain %536 %24 
                                                      OpStore %542 %123 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
float u_xlat21;
float u_xlat23;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat7 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat7 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
    vs_TEXCOORD4 = u_xlat0;
    u_xlat21 = u_xlat2.y * u_xlat2.y;
    u_xlat21 = u_xlat2.x * u_xlat2.x + (-u_xlat21);
    u_xlat3 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat3);
    u_xlat4.y = dot(unity_SHBg, u_xlat3);
    u_xlat4.z = dot(unity_SHBb, u_xlat3);
    u_xlat3.xyz = unity_SHC.xyz * vec3(u_xlat21) + u_xlat4.xyz;
    u_xlat2.w = 1.0;
    u_xlat4.x = dot(unity_SHAr, u_xlat2);
    u_xlat4.y = dot(unity_SHAg, u_xlat2);
    u_xlat4.z = dot(unity_SHAb, u_xlat2);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xyz;
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = max(u_xlat3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat6 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat6 * u_xlat2.xxxx + u_xlat5;
    u_xlat4 = u_xlat6 * u_xlat6 + u_xlat4;
    u_xlat4 = u_xlat0 * u_xlat0 + u_xlat4;
    u_xlat0 = u_xlat0 * u_xlat2.zzzz + u_xlat5;
    u_xlat2 = max(u_xlat4, vec4(9.99999997e-007, 9.99999997e-007, 9.99999997e-007, 9.99999997e-007));
    u_xlat4 = inversesqrt(u_xlat2);
    u_xlat2 = u_xlat2 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat2 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat4;
    u_xlat0 = max(u_xlat0, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat2 * u_xlat0;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz + u_xlat3.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
in  vec4 vs_TEXCOORD6;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb12 = u_xlat0.w<0.100000001;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat1.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat2.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat2.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat2.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat1.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat12) + u_xlat1.x;
    u_xlat12 = unity_ShadowFadeCenterAndType.w * u_xlat1.x + u_xlat12;
    u_xlat12 = u_xlat12 * _LightShadowData.z + _LightShadowData.w;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlatb1 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb1){
        u_xlatb5 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat5.x = u_xlat2.y * 0.25 + 0.75;
        u_xlat9.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat2.x = max(u_xlat9.x, u_xlat5.x);
        u_xlat2 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
    } else {
        u_xlat2.x = float(1.0);
        u_xlat2.y = float(1.0);
        u_xlat2.z = float(1.0);
        u_xlat2.w = float(1.0);
    //ENDIF
    }
    u_xlat5.x = dot(u_xlat2, unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat9.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat10_2 = texture(_ShadowMapTexture, u_xlat9.xy);
    u_xlat12 = u_xlat12 + u_xlat10_2.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat5.x = min(u_xlat12, u_xlat5.x);
    u_xlat12 = (u_xlatb1) ? u_xlat5.x : u_xlat12;
    u_xlat1.xyz = u_xlat0.xyz * _LightColor0.xyz;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat1.xyw = u_xlat0.yzx * vs_TEXCOORD5.yzx + u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = vec4(u_xlat12) * u_xlat3 + u_xlat2;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat5.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat13 = u_xlat12 * 6.0 + 1.00000001e-010;
    u_xlat5.x = u_xlat5.x / u_xlat13;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat1.x = u_xlat1.x + 1.00000001e-010;
    u_xlat12 = u_xlat12 / u_xlat1.x;
    u_xlatb1 = u_xlat0.y>=u_xlat0.z;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.x = (-u_xlat0.z) + u_xlat0.y;
    u_xlat4.x = u_xlat1.x * u_xlat4.x + u_xlat0.z;
    u_xlatb8 = u_xlat0.x>=u_xlat4.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.x = (-u_xlat4.x) + u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x + u_xlat4.x;
    u_xlat1.xyz = abs(u_xlat5.xxx) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = vec3(u_xlat12) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 447
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %44 %123 %129 %130 %144 %181 %184 %187 %190 %410 %429 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpMemberDecorate %17 0 Offset 17 
                                                      OpMemberDecorate %17 1 Offset 17 
                                                      OpMemberDecorate %17 2 Offset 17 
                                                      OpMemberDecorate %17 3 Offset 17 
                                                      OpMemberDecorate %17 4 RelaxedPrecision 
                                                      OpMemberDecorate %17 4 Offset 17 
                                                      OpMemberDecorate %17 5 RelaxedPrecision 
                                                      OpMemberDecorate %17 5 Offset 17 
                                                      OpMemberDecorate %17 6 RelaxedPrecision 
                                                      OpMemberDecorate %17 6 Offset 17 
                                                      OpMemberDecorate %17 7 RelaxedPrecision 
                                                      OpMemberDecorate %17 7 Offset 17 
                                                      OpMemberDecorate %17 8 RelaxedPrecision 
                                                      OpMemberDecorate %17 8 Offset 17 
                                                      OpMemberDecorate %17 9 RelaxedPrecision 
                                                      OpMemberDecorate %17 9 Offset 17 
                                                      OpMemberDecorate %17 10 RelaxedPrecision 
                                                      OpMemberDecorate %17 10 Offset 17 
                                                      OpMemberDecorate %17 11 RelaxedPrecision 
                                                      OpMemberDecorate %17 11 Offset 17 
                                                      OpMemberDecorate %17 12 RelaxedPrecision 
                                                      OpMemberDecorate %17 12 Offset 17 
                                                      OpMemberDecorate %17 13 Offset 17 
                                                      OpMemberDecorate %17 14 Offset 17 
                                                      OpMemberDecorate %17 15 Offset 17 
                                                      OpMemberDecorate %17 16 Offset 17 
                                                      OpMemberDecorate %17 17 Offset 17 
                                                      OpMemberDecorate %17 18 Offset 17 
                                                      OpDecorate %17 Block 
                                                      OpDecorate %19 DescriptorSet 19 
                                                      OpDecorate %19 Binding 19 
                                                      OpDecorate %44 Location 44 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %130 Location 130 
                                                      OpDecorate %144 Location 144 
                                                      OpDecorate %181 Location 181 
                                                      OpDecorate %184 Location 184 
                                                      OpDecorate %187 Location 187 
                                                      OpDecorate %190 Location 190 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %394 RelaxedPrecision 
                                                      OpDecorate %395 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %410 Location 410 
                                                      OpDecorate %429 Location 429 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                          u32 %13 = OpConstant 4 
                                              %14 = OpTypeArray %7 %13 
                                              %15 = OpTypeArray %7 %13 
                                              %16 = OpTypeArray %7 %13 
                                              %17 = OpTypeStruct %7 %7 %7 %7 %7 %12 %7 %7 %7 %7 %7 %7 %7 %14 %15 %16 %6 %6 %7 
                                              %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[8]; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %19 = OpVariable Uniform 
                                              %20 = OpTypeInt 32 1 
                                          i32 %21 = OpConstant 17 
                                              %22 = OpTypePointer Uniform %6 
                                          i32 %25 = OpConstant 16 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                          f32 %34 = OpConstant 3.67402E-40 
                                 Private f32* %37 = OpVariable Private 
                                          f32 %41 = OpConstant 3.67402E-40 
                                              %43 = OpTypePointer Input %7 
                                 Input f32_4* %44 = OpVariable Input 
                                          u32 %45 = OpConstant 1 
                                              %46 = OpTypePointer Input %6 
                                          i32 %57 = OpConstant 13 
                                          i32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Uniform %7 
                                          i32 %63 = OpConstant 0 
                                          i32 %71 = OpConstant 2 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %81 = OpConstant 3 
                               Private f32_4* %92 = OpVariable Private 
                                          i32 %95 = OpConstant 15 
                                             %120 = OpTypeArray %6 %45 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %125 = OpTypePointer Output %7 
                                             %127 = OpTypeVector %6 2 
                                             %128 = OpTypePointer Output %127 
                               Output f32_2* %129 = OpVariable Output 
                                Input f32_4* %130 = OpVariable Input 
                                         i32 %133 = OpConstant 18 
                                             %142 = OpTypeVector %6 3 
                                             %143 = OpTypePointer Input %142 
                                Input f32_3* %144 = OpVariable Input 
                                         i32 %146 = OpConstant 14 
                                         u32 %163 = OpConstant 2 
                                Private f32* %165 = OpVariable Private 
                                             %180 = OpTypePointer Output %142 
                               Output f32_3* %181 = OpVariable Output 
                               Output f32_3* %184 = OpVariable Output 
                               Output f32_4* %187 = OpVariable Output 
                                         f32 %188 = OpConstant 3.67402E-40 
                                       f32_4 %189 = OpConstantComposite %188 %188 %188 %188 
                               Output f32_4* %190 = OpVariable Output 
                                             %192 = OpTypePointer Private %142 
                              Private f32_3* %193 = OpVariable Private 
                              Private f32_4* %210 = OpVariable Private 
                              Private f32_3* %216 = OpVariable Private 
                                         i32 %217 = OpConstant 9 
                                         i32 %223 = OpConstant 10 
                                         i32 %229 = OpConstant 11 
                                         i32 %235 = OpConstant 12 
                                         u32 %244 = OpConstant 3 
                                         i32 %246 = OpConstant 6 
                                         i32 %252 = OpConstant 7 
                                         i32 %258 = OpConstant 8 
                                       f32_3 %269 = OpConstantComposite %188 %188 %188 
                              Private f32_3* %271 = OpVariable Private 
                                         f32 %275 = OpConstant 3.67402E-40 
                                       f32_3 %276 = OpConstantComposite %275 %275 %275 
                                         f32 %281 = OpConstant 3.67402E-40 
                                       f32_3 %282 = OpConstantComposite %281 %281 %281 
                                         f32 %284 = OpConstant 3.67402E-40 
                                       f32_3 %285 = OpConstantComposite %284 %284 %284 
                              Private f32_4* %289 = OpVariable Private 
                              Private f32_4* %296 = OpVariable Private 
                              Private f32_4* %304 = OpVariable Private 
                                         f32 %340 = OpConstant 3.67402E-40 
                                       f32_4 %341 = OpConstantComposite %340 %340 %340 %340 
                                         i32 %346 = OpConstant 4 
                                       f32_4 %350 = OpConstantComposite %41 %41 %41 %41 
                                         i32 %364 = OpConstant 5 
                               Output f32_3* %410 = OpVariable Output 
                                       f32_2 %425 = OpConstantComposite %34 %34 
                               Output f32_4* %429 = OpVariable Output 
                                             %441 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %23 = OpAccessChain %19 %21 
                                          f32 %24 = OpLoad %23 
                                 Uniform f32* %26 = OpAccessChain %19 %25 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFMul %24 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                 Private f32* %32 = OpAccessChain %9 %29 
                                          f32 %33 = OpLoad %32 
                                          f32 %35 = OpFMul %33 %34 
                                 Private f32* %36 = OpAccessChain %9 %29 
                                                      OpStore %36 %35 
                                 Uniform f32* %38 = OpAccessChain %19 %25 
                                          f32 %39 = OpLoad %38 
                                          f32 %40 = OpFNegate %39 
                                          f32 %42 = OpFAdd %40 %41 
                                                      OpStore %37 %42 
                                   Input f32* %47 = OpAccessChain %44 %45 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpLoad %37 
                                          f32 %50 = OpFMul %48 %49 
                                 Private f32* %51 = OpAccessChain %9 %29 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFAdd %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %29 
                                                      OpStore %54 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpVectorShuffle %55 %55 0 0 0 0 
                               Uniform f32_4* %60 = OpAccessChain %19 %57 %58 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %56 %61 
                                                      OpStore %9 %62 
                               Uniform f32_4* %64 = OpAccessChain %19 %57 %63 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %44 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %9 %70 
                               Uniform f32_4* %72 = OpAccessChain %19 %57 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %44 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                               Uniform f32_4* %82 = OpAccessChain %19 %57 %81 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpFAdd %80 %83 
                                                      OpStore %79 %84 
                               Uniform f32_4* %85 = OpAccessChain %19 %57 %81 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %44 
                                        f32_4 %88 = OpVectorShuffle %87 %87 3 3 3 3 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %9 %91 
                                        f32_4 %93 = OpLoad %79 
                                        f32_4 %94 = OpVectorShuffle %93 %93 1 1 1 1 
                               Uniform f32_4* %96 = OpAccessChain %19 %95 %58 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpFMul %94 %97 
                                                      OpStore %92 %98 
                               Uniform f32_4* %99 = OpAccessChain %19 %95 %63 
                                       f32_4 %100 = OpLoad %99 
                                       f32_4 %101 = OpLoad %79 
                                       f32_4 %102 = OpVectorShuffle %101 %101 0 0 0 0 
                                       f32_4 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %92 
                                       f32_4 %105 = OpFAdd %103 %104 
                                                      OpStore %92 %105 
                              Uniform f32_4* %106 = OpAccessChain %19 %95 %71 
                                       f32_4 %107 = OpLoad %106 
                                       f32_4 %108 = OpLoad %79 
                                       f32_4 %109 = OpVectorShuffle %108 %108 2 2 2 2 
                                       f32_4 %110 = OpFMul %107 %109 
                                       f32_4 %111 = OpLoad %92 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %92 %112 
                              Uniform f32_4* %113 = OpAccessChain %19 %95 %81 
                                       f32_4 %114 = OpLoad %113 
                                       f32_4 %115 = OpLoad %79 
                                       f32_4 %116 = OpVectorShuffle %115 %115 3 3 3 3 
                                       f32_4 %117 = OpFMul %114 %116 
                                       f32_4 %118 = OpLoad %92 
                                       f32_4 %119 = OpFAdd %117 %118 
                                                      OpStore %79 %119 
                                       f32_4 %124 = OpLoad %79 
                               Output f32_4* %126 = OpAccessChain %123 %63 
                                                      OpStore %126 %124 
                                       f32_4 %131 = OpLoad %130 
                                       f32_2 %132 = OpVectorShuffle %131 %131 0 1 
                              Uniform f32_4* %134 = OpAccessChain %19 %133 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                              Uniform f32_4* %138 = OpAccessChain %19 %133 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 2 3 
                                       f32_2 %141 = OpFAdd %137 %140 
                                                      OpStore %129 %141 
                                       f32_3 %145 = OpLoad %144 
                              Uniform f32_4* %147 = OpAccessChain %19 %146 %63 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %150 = OpDot %145 %149 
                                Private f32* %151 = OpAccessChain %92 %29 
                                                      OpStore %151 %150 
                                       f32_3 %152 = OpLoad %144 
                              Uniform f32_4* %153 = OpAccessChain %19 %146 %58 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                         f32 %156 = OpDot %152 %155 
                                Private f32* %157 = OpAccessChain %92 %45 
                                                      OpStore %157 %156 
                                       f32_3 %158 = OpLoad %144 
                              Uniform f32_4* %159 = OpAccessChain %19 %146 %71 
                                       f32_4 %160 = OpLoad %159 
                                       f32_3 %161 = OpVectorShuffle %160 %160 0 1 2 
                                         f32 %162 = OpDot %158 %161 
                                Private f32* %164 = OpAccessChain %92 %163 
                                                      OpStore %164 %162 
                                       f32_4 %166 = OpLoad %92 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_4 %168 = OpLoad %92 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                                         f32 %170 = OpDot %167 %169 
                                                      OpStore %165 %170 
                                         f32 %171 = OpLoad %165 
                                         f32 %172 = OpExtInst %1 32 %171 
                                                      OpStore %165 %172 
                                         f32 %173 = OpLoad %165 
                                       f32_3 %174 = OpCompositeConstruct %173 %173 %173 
                                       f32_4 %175 = OpLoad %92 
                                       f32_3 %176 = OpVectorShuffle %175 %175 0 1 2 
                                       f32_3 %177 = OpFMul %174 %176 
                                       f32_4 %178 = OpLoad %92 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 6 3 
                                                      OpStore %92 %179 
                                       f32_4 %182 = OpLoad %92 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                                      OpStore %181 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                                      OpStore %184 %186 
                                                      OpStore %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                                      OpStore %190 %191 
                                Private f32* %194 = OpAccessChain %92 %45 
                                         f32 %195 = OpLoad %194 
                                Private f32* %196 = OpAccessChain %92 %45 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFMul %195 %197 
                                Private f32* %199 = OpAccessChain %193 %29 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %92 %29 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %92 %29 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFMul %201 %203 
                                Private f32* %205 = OpAccessChain %193 %29 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpFNegate %206 
                                         f32 %208 = OpFAdd %204 %207 
                                Private f32* %209 = OpAccessChain %193 %29 
                                                      OpStore %209 %208 
                                       f32_4 %211 = OpLoad %92 
                                       f32_4 %212 = OpVectorShuffle %211 %211 1 2 2 0 
                                       f32_4 %213 = OpLoad %92 
                                       f32_4 %214 = OpVectorShuffle %213 %213 0 1 2 2 
                                       f32_4 %215 = OpFMul %212 %214 
                                                      OpStore %210 %215 
                              Uniform f32_4* %218 = OpAccessChain %19 %217 
                                       f32_4 %219 = OpLoad %218 
                                       f32_4 %220 = OpLoad %210 
                                         f32 %221 = OpDot %219 %220 
                                Private f32* %222 = OpAccessChain %216 %29 
                                                      OpStore %222 %221 
                              Uniform f32_4* %224 = OpAccessChain %19 %223 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpLoad %210 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %216 %45 
                                                      OpStore %228 %227 
                              Uniform f32_4* %230 = OpAccessChain %19 %229 
                                       f32_4 %231 = OpLoad %230 
                                       f32_4 %232 = OpLoad %210 
                                         f32 %233 = OpDot %231 %232 
                                Private f32* %234 = OpAccessChain %216 %163 
                                                      OpStore %234 %233 
                              Uniform f32_4* %236 = OpAccessChain %19 %235 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 1 2 
                                       f32_3 %239 = OpLoad %193 
                                       f32_3 %240 = OpVectorShuffle %239 %239 0 0 0 
                                       f32_3 %241 = OpFMul %238 %240 
                                       f32_3 %242 = OpLoad %216 
                                       f32_3 %243 = OpFAdd %241 %242 
                                                      OpStore %193 %243 
                                Private f32* %245 = OpAccessChain %92 %244 
                                                      OpStore %245 %41 
                              Uniform f32_4* %247 = OpAccessChain %19 %246 
                                       f32_4 %248 = OpLoad %247 
                                       f32_4 %249 = OpLoad %92 
                                         f32 %250 = OpDot %248 %249 
                                Private f32* %251 = OpAccessChain %210 %29 
                                                      OpStore %251 %250 
                              Uniform f32_4* %253 = OpAccessChain %19 %252 
                                       f32_4 %254 = OpLoad %253 
                                       f32_4 %255 = OpLoad %92 
                                         f32 %256 = OpDot %254 %255 
                                Private f32* %257 = OpAccessChain %210 %45 
                                                      OpStore %257 %256 
                              Uniform f32_4* %259 = OpAccessChain %19 %258 
                                       f32_4 %260 = OpLoad %259 
                                       f32_4 %261 = OpLoad %92 
                                         f32 %262 = OpDot %260 %261 
                                Private f32* %263 = OpAccessChain %210 %163 
                                                      OpStore %263 %262 
                                       f32_3 %264 = OpLoad %193 
                                       f32_4 %265 = OpLoad %210 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_3 %267 = OpFAdd %264 %266 
                                                      OpStore %193 %267 
                                       f32_3 %268 = OpLoad %193 
                                       f32_3 %270 = OpExtInst %1 40 %268 %269 
                                                      OpStore %193 %270 
                                       f32_3 %272 = OpLoad %193 
                                       f32_3 %273 = OpExtInst %1 30 %272 
                                                      OpStore %271 %273 
                                       f32_3 %274 = OpLoad %271 
                                       f32_3 %277 = OpFMul %274 %276 
                                                      OpStore %271 %277 
                                       f32_3 %278 = OpLoad %271 
                                       f32_3 %279 = OpExtInst %1 29 %278 
                                                      OpStore %271 %279 
                                       f32_3 %280 = OpLoad %271 
                                       f32_3 %283 = OpFMul %280 %282 
                                       f32_3 %286 = OpFAdd %283 %285 
                                                      OpStore %271 %286 
                                       f32_3 %287 = OpLoad %271 
                                       f32_3 %288 = OpExtInst %1 40 %287 %269 
                                                      OpStore %271 %288 
                                       f32_4 %290 = OpLoad %9 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 1 1 1 
                                       f32_4 %292 = OpFNegate %291 
                              Uniform f32_4* %293 = OpAccessChain %19 %71 
                                       f32_4 %294 = OpLoad %293 
                                       f32_4 %295 = OpFAdd %292 %294 
                                                      OpStore %289 %295 
                                       f32_4 %297 = OpLoad %92 
                                       f32_4 %298 = OpVectorShuffle %297 %297 1 1 1 1 
                                       f32_4 %299 = OpLoad %289 
                                       f32_4 %300 = OpFMul %298 %299 
                                                      OpStore %296 %300 
                                       f32_4 %301 = OpLoad %289 
                                       f32_4 %302 = OpLoad %289 
                                       f32_4 %303 = OpFMul %301 %302 
                                                      OpStore %289 %303 
                                       f32_4 %305 = OpLoad %9 
                                       f32_4 %306 = OpVectorShuffle %305 %305 0 0 0 0 
                                       f32_4 %307 = OpFNegate %306 
                              Uniform f32_4* %308 = OpAccessChain %19 %58 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpFAdd %307 %309 
                                                      OpStore %304 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_4 %312 = OpVectorShuffle %311 %311 2 2 2 2 
                                       f32_4 %313 = OpFNegate %312 
                              Uniform f32_4* %314 = OpAccessChain %19 %81 
                                       f32_4 %315 = OpLoad %314 
                                       f32_4 %316 = OpFAdd %313 %315 
                                                      OpStore %9 %316 
                                       f32_4 %317 = OpLoad %304 
                                       f32_4 %318 = OpLoad %92 
                                       f32_4 %319 = OpVectorShuffle %318 %318 0 0 0 0 
                                       f32_4 %320 = OpFMul %317 %319 
                                       f32_4 %321 = OpLoad %296 
                                       f32_4 %322 = OpFAdd %320 %321 
                                                      OpStore %296 %322 
                                       f32_4 %323 = OpLoad %304 
                                       f32_4 %324 = OpLoad %304 
                                       f32_4 %325 = OpFMul %323 %324 
                                       f32_4 %326 = OpLoad %289 
                                       f32_4 %327 = OpFAdd %325 %326 
                                                      OpStore %289 %327 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpLoad %9 
                                       f32_4 %330 = OpFMul %328 %329 
                                       f32_4 %331 = OpLoad %289 
                                       f32_4 %332 = OpFAdd %330 %331 
                                                      OpStore %289 %332 
                                       f32_4 %333 = OpLoad %9 
                                       f32_4 %334 = OpLoad %92 
                                       f32_4 %335 = OpVectorShuffle %334 %334 2 2 2 2 
                                       f32_4 %336 = OpFMul %333 %335 
                                       f32_4 %337 = OpLoad %296 
                                       f32_4 %338 = OpFAdd %336 %337 
                                                      OpStore %9 %338 
                                       f32_4 %339 = OpLoad %289 
                                       f32_4 %342 = OpExtInst %1 40 %339 %341 
                                                      OpStore %92 %342 
                                       f32_4 %343 = OpLoad %92 
                                       f32_4 %344 = OpExtInst %1 32 %343 
                                                      OpStore %289 %344 
                                       f32_4 %345 = OpLoad %92 
                              Uniform f32_4* %347 = OpAccessChain %19 %346 
                                       f32_4 %348 = OpLoad %347 
                                       f32_4 %349 = OpFMul %345 %348 
                                       f32_4 %351 = OpFAdd %349 %350 
                                                      OpStore %92 %351 
                                       f32_4 %352 = OpLoad %92 
                                       f32_4 %353 = OpFDiv %350 %352 
                                                      OpStore %92 %353 
                                       f32_4 %354 = OpLoad %9 
                                       f32_4 %355 = OpLoad %289 
                                       f32_4 %356 = OpFMul %354 %355 
                                                      OpStore %9 %356 
                                       f32_4 %357 = OpLoad %9 
                                       f32_4 %358 = OpExtInst %1 40 %357 %189 
                                                      OpStore %9 %358 
                                       f32_4 %359 = OpLoad %92 
                                       f32_4 %360 = OpLoad %9 
                                       f32_4 %361 = OpFMul %359 %360 
                                                      OpStore %9 %361 
                                       f32_4 %362 = OpLoad %9 
                                       f32_3 %363 = OpVectorShuffle %362 %362 1 1 1 
                              Uniform f32_4* %365 = OpAccessChain %19 %364 %58 
                                       f32_4 %366 = OpLoad %365 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFMul %363 %367 
                                       f32_4 %369 = OpLoad %92 
                                       f32_4 %370 = OpVectorShuffle %369 %368 4 5 6 3 
                                                      OpStore %92 %370 
                              Uniform f32_4* %371 = OpAccessChain %19 %364 %63 
                                       f32_4 %372 = OpLoad %371 
                                       f32_3 %373 = OpVectorShuffle %372 %372 0 1 2 
                                       f32_4 %374 = OpLoad %9 
                                       f32_3 %375 = OpVectorShuffle %374 %374 0 0 0 
                                       f32_3 %376 = OpFMul %373 %375 
                                       f32_4 %377 = OpLoad %92 
                                       f32_3 %378 = OpVectorShuffle %377 %377 0 1 2 
                                       f32_3 %379 = OpFAdd %376 %378 
                                       f32_4 %380 = OpLoad %92 
                                       f32_4 %381 = OpVectorShuffle %380 %379 4 5 6 3 
                                                      OpStore %92 %381 
                              Uniform f32_4* %382 = OpAccessChain %19 %364 %71 
                                       f32_4 %383 = OpLoad %382 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_4 %385 = OpLoad %9 
                                       f32_3 %386 = OpVectorShuffle %385 %385 2 2 2 
                                       f32_3 %387 = OpFMul %384 %386 
                                       f32_4 %388 = OpLoad %92 
                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
                                       f32_3 %390 = OpFAdd %387 %389 
                                       f32_4 %391 = OpLoad %9 
                                       f32_4 %392 = OpVectorShuffle %391 %390 4 5 6 3 
                                                      OpStore %9 %392 
                              Uniform f32_4* %393 = OpAccessChain %19 %364 %81 
                                       f32_4 %394 = OpLoad %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 0 1 2 
                                       f32_4 %396 = OpLoad %9 
                                       f32_3 %397 = OpVectorShuffle %396 %396 3 3 3 
                                       f32_3 %398 = OpFMul %395 %397 
                                       f32_4 %399 = OpLoad %9 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_3 %401 = OpFAdd %398 %400 
                                       f32_4 %402 = OpLoad %9 
                                       f32_4 %403 = OpVectorShuffle %402 %401 4 5 6 3 
                                                      OpStore %9 %403 
                                       f32_4 %404 = OpLoad %9 
                                       f32_3 %405 = OpVectorShuffle %404 %404 0 1 2 
                                       f32_3 %406 = OpLoad %271 
                                       f32_3 %407 = OpFAdd %405 %406 
                                       f32_4 %408 = OpLoad %9 
                                       f32_4 %409 = OpVectorShuffle %408 %407 4 5 6 3 
                                                      OpStore %9 %409 
                                       f32_4 %411 = OpLoad %9 
                                       f32_3 %412 = OpVectorShuffle %411 %411 0 1 2 
                                                      OpStore %410 %412 
                                Private f32* %413 = OpAccessChain %79 %45 
                                         f32 %414 = OpLoad %413 
                                Uniform f32* %415 = OpAccessChain %19 %63 %29 
                                         f32 %416 = OpLoad %415 
                                         f32 %417 = OpFMul %414 %416 
                                Private f32* %418 = OpAccessChain %9 %29 
                                                      OpStore %418 %417 
                                Private f32* %419 = OpAccessChain %9 %29 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFMul %420 %34 
                                Private f32* %422 = OpAccessChain %9 %244 
                                                      OpStore %422 %421 
                                       f32_4 %423 = OpLoad %79 
                                       f32_2 %424 = OpVectorShuffle %423 %423 0 3 
                                       f32_2 %426 = OpFMul %424 %425 
                                       f32_4 %427 = OpLoad %9 
                                       f32_4 %428 = OpVectorShuffle %427 %426 4 1 5 3 
                                                      OpStore %9 %428 
                                       f32_4 %430 = OpLoad %79 
                                       f32_2 %431 = OpVectorShuffle %430 %430 2 3 
                                       f32_4 %432 = OpLoad %429 
                                       f32_4 %433 = OpVectorShuffle %432 %431 0 1 4 5 
                                                      OpStore %429 %433 
                                       f32_4 %434 = OpLoad %9 
                                       f32_2 %435 = OpVectorShuffle %434 %434 2 2 
                                       f32_4 %436 = OpLoad %9 
                                       f32_2 %437 = OpVectorShuffle %436 %436 0 3 
                                       f32_2 %438 = OpFAdd %435 %437 
                                       f32_4 %439 = OpLoad %429 
                                       f32_4 %440 = OpVectorShuffle %439 %438 4 5 2 3 
                                                      OpStore %429 %440 
                                 Output f32* %442 = OpAccessChain %123 %63 %45 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFNegate %443 
                                 Output f32* %445 = OpAccessChain %123 %63 %45 
                                                      OpStore %445 %444 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 544
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %17 %44 %254 %309 %536 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %13 RelaxedPrecision 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %14 RelaxedPrecision 
                                                      OpDecorate %17 Location 17 
                                                      OpDecorate %44 Location 44 
                                                      OpDecorate %48 ArrayStride 48 
                                                      OpDecorate %49 ArrayStride 49 
                                                      OpMemberDecorate %50 0 Offset 50 
                                                      OpMemberDecorate %50 1 RelaxedPrecision 
                                                      OpMemberDecorate %50 1 Offset 50 
                                                      OpMemberDecorate %50 2 RelaxedPrecision 
                                                      OpMemberDecorate %50 2 Offset 50 
                                                      OpMemberDecorate %50 3 Offset 50 
                                                      OpMemberDecorate %50 4 Offset 50 
                                                      OpMemberDecorate %50 5 Offset 50 
                                                      OpMemberDecorate %50 6 Offset 50 
                                                      OpMemberDecorate %50 7 Offset 50 
                                                      OpMemberDecorate %50 8 Offset 50 
                                                      OpMemberDecorate %50 9 RelaxedPrecision 
                                                      OpMemberDecorate %50 9 Offset 50 
                                                      OpDecorate %50 Block 
                                                      OpDecorate %52 DescriptorSet 52 
                                                      OpDecorate %52 Binding 52 
                                                      OpDecorate %116 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %136 SpecId 136 
                                                      OpDecorate %231 DescriptorSet 231 
                                                      OpDecorate %231 Binding 231 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %254 Location 254 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %263 DescriptorSet 263 
                                                      OpDecorate %263 Binding 263 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %309 Location 309 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %402 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %536 Location 536 
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
                                              %20 = OpTypeBool 
                                              %21 = OpTypePointer Private %20 
                                Private bool* %22 = OpVariable Private 
                                              %23 = OpTypeInt 32 0 
                                          u32 %24 = OpConstant 3 
                                              %25 = OpTypePointer Private %6 
                                          f32 %28 = OpConstant 3.67402E-40 
                                              %31 = OpTypeInt 32 1 
                                          i32 %32 = OpConstant 0 
                                          i32 %33 = OpConstant 1 
                                          i32 %35 = OpConstant -1 
                               Private f32_4* %41 = OpVariable Private 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Input %42 
                                 Input f32_3* %44 = OpVariable Input 
                                          u32 %47 = OpConstant 4 
                                              %48 = OpTypeArray %7 %47 
                                              %49 = OpTypeArray %7 %47 
                                              %50 = OpTypeStruct %42 %7 %7 %7 %48 %7 %49 %42 %42 %7 
                                              %51 = OpTypePointer Uniform %50 
Uniform struct {f32_3; f32_4; f32_4; f32_4; f32_4[4]; f32_4; f32_4[4]; f32_3; f32_3; f32_4;}* %52 = OpVariable Uniform 
                                              %53 = OpTypePointer Uniform %42 
                               Private f32_4* %59 = OpVariable Private 
                                          i32 %60 = OpConstant 4 
                                          u32 %61 = OpConstant 2 
                                              %62 = OpTypePointer Uniform %6 
                                          u32 %65 = OpConstant 0 
                                          u32 %69 = OpConstant 1 
                                          i32 %71 = OpConstant 2 
                                 Private f32* %75 = OpVariable Private 
                                          i32 %82 = OpConstant 3 
                                              %83 = OpTypePointer Uniform %7 
                                         f32 %122 = OpConstant 3.67402E-40 
                                         f32 %123 = OpConstant 3.67402E-40 
                               Private bool* %125 = OpVariable Private 
                                         i32 %126 = OpConstant 5 
                                        bool %130 = OpConstantFalse 
                                        bool %136 = OpSpecConstantFalse 
                               Private bool* %139 = OpVariable Private 
                                         i32 %145 = OpConstant 6 
                                             %182 = OpTypePointer Private %42 
                              Private f32_3* %183 = OpVariable Private 
                                             %184 = OpTypePointer Function %42 
                                         i32 %195 = OpConstant 8 
                                         i32 %201 = OpConstant 7 
                                         f32 %209 = OpConstant 3.67402E-40 
                                         f32 %211 = OpConstant 3.67402E-40 
                                             %214 = OpTypePointer Private %15 
                              Private f32_2* %215 = OpVariable Private 
                                         f32 %218 = OpConstant 3.67402E-40 
                                             %228 = OpTypeImage %6 Dim3D 0 0 0 1 Unknown 
                                             %229 = OpTypeSampledImage %228 
                                             %230 = OpTypePointer UniformConstant %229 
 UniformConstant read_only Texture3DSampled* %231 = OpVariable UniformConstant 
                              Private f32_4* %236 = OpVariable Private 
                              Private f32_3* %243 = OpVariable Private 
                                             %253 = OpTypePointer Input %7 
                                Input f32_4* %254 = OpVariable Input 
                                Private f32* %262 = OpVariable Private 
 UniformConstant read_only Texture2DSampled* %263 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                             %284 = OpTypePointer Function %6 
                                         i32 %298 = OpConstant 9 
                                Input f32_3* %309 = OpVariable Input 
                              Private f32_2* %325 = OpVariable Private 
                                         f32 %333 = OpConstant 3.67402E-40 
                                         f32 %348 = OpConstant 3.67402E-40 
                                       f32_2 %349 = OpConstantComposite %333 %348 
                              Private f32_4* %373 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                         f32 %420 = OpConstant 3.67402E-40 
                                         f32 %422 = OpConstant 3.67402E-40 
                              Private f32_3* %454 = OpVariable Private 
                               Private bool* %471 = OpVariable Private 
                                Private f32* %477 = OpVariable Private 
                                         f32 %502 = OpConstant 3.67402E-40 
                                       f32_3 %503 = OpConstantComposite %123 %348 %502 
                                       f32_3 %508 = OpConstantComposite %420 %420 %420 
                                         f32 %510 = OpConstant 3.67402E-40 
                                       f32_3 %511 = OpConstantComposite %510 %510 %510 
                                       f32_3 %515 = OpConstantComposite %333 %333 %333 
                                       f32_3 %527 = OpConstantComposite %123 %123 %123 
                                             %535 = OpTypePointer Output %7 
                               Output f32_4* %536 = OpVariable Output 
                                             %541 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %185 = OpVariable Function 
                               Function f32* %285 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                               Function f32* %358 = OpVariable Function 
                               Function f32* %447 = OpVariable Function 
                               Function f32* %478 = OpVariable Function 
                   read_only Texture2DSampled %14 = OpLoad %13 
                                        f32_2 %18 = OpLoad %17 
                                        f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                      OpStore %9 %19 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                          f32 %27 = OpLoad %26 
                                         bool %29 = OpFOrdLessThan %27 %28 
                                                      OpStore %22 %29 
                                         bool %30 = OpLoad %22 
                                          i32 %34 = OpSelect %30 %33 %32 
                                          i32 %36 = OpIMul %34 %35 
                                         bool %37 = OpINotEqual %36 %32 
                                                      OpSelectionMerge %39 None 
                                                      OpBranchConditional %37 %38 %39 
                                              %38 = OpLabel 
                                                      OpKill
                                              %39 = OpLabel 
                                        f32_3 %45 = OpLoad %44 
                                        f32_3 %46 = OpFNegate %45 
                               Uniform f32_3* %54 = OpAccessChain %52 %32 
                                        f32_3 %55 = OpLoad %54 
                                        f32_3 %56 = OpFAdd %46 %55 
                                        f32_4 %57 = OpLoad %41 
                                        f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                                      OpStore %41 %58 
                                 Uniform f32* %63 = OpAccessChain %52 %60 %32 %61 
                                          f32 %64 = OpLoad %63 
                                 Private f32* %66 = OpAccessChain %59 %65 
                                                      OpStore %66 %64 
                                 Uniform f32* %67 = OpAccessChain %52 %60 %33 %61 
                                          f32 %68 = OpLoad %67 
                                 Private f32* %70 = OpAccessChain %59 %69 
                                                      OpStore %70 %68 
                                 Uniform f32* %72 = OpAccessChain %52 %60 %71 %61 
                                          f32 %73 = OpLoad %72 
                                 Private f32* %74 = OpAccessChain %59 %61 
                                                      OpStore %74 %73 
                                        f32_4 %76 = OpLoad %41 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_4 %78 = OpLoad %59 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                                          f32 %80 = OpDot %77 %79 
                                                      OpStore %75 %80 
                                        f32_3 %81 = OpLoad %44 
                               Uniform f32_4* %84 = OpAccessChain %52 %82 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFNegate %86 
                                        f32_3 %88 = OpFAdd %81 %87 
                                        f32_4 %89 = OpLoad %41 
                                        f32_4 %90 = OpVectorShuffle %89 %88 4 5 6 3 
                                                      OpStore %41 %90 
                                        f32_4 %91 = OpLoad %41 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                                        f32_4 %93 = OpLoad %41 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                          f32 %95 = OpDot %92 %94 
                                 Private f32* %96 = OpAccessChain %41 %65 
                                                      OpStore %96 %95 
                                 Private f32* %97 = OpAccessChain %41 %65 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpExtInst %1 31 %98 
                                Private f32* %100 = OpAccessChain %41 %65 
                                                      OpStore %100 %99 
                                         f32 %101 = OpLoad %75 
                                         f32 %102 = OpFNegate %101 
                                Private f32* %103 = OpAccessChain %41 %65 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %41 %65 
                                                      OpStore %106 %105 
                                Uniform f32* %107 = OpAccessChain %52 %82 %24 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %41 %65 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFMul %108 %110 
                                         f32 %112 = OpLoad %75 
                                         f32 %113 = OpFAdd %111 %112 
                                                      OpStore %75 %113 
                                         f32 %114 = OpLoad %75 
                                Uniform f32* %115 = OpAccessChain %52 %71 %61 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFMul %114 %116 
                                Uniform f32* %118 = OpAccessChain %52 %71 %24 
                                         f32 %119 = OpLoad %118 
                                         f32 %120 = OpFAdd %117 %119 
                                                      OpStore %75 %120 
                                         f32 %121 = OpLoad %75 
                                         f32 %124 = OpExtInst %1 43 %121 %122 %123 
                                                      OpStore %75 %124 
                                Uniform f32* %127 = OpAccessChain %52 %126 %65 
                                         f32 %128 = OpLoad %127 
                                        bool %129 = OpFOrdEqual %128 %123 
                                                      OpStore %125 %129 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %132 
                                             %131 = OpLabel 
                                        bool %133 = OpLoad %125 
                                                      OpSelectionMerge %135 None 
                                                      OpBranchConditional %133 %134 %135 
                                             %134 = OpLabel 
                                                      OpBranch %135 
                                             %135 = OpLabel 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                                      OpSelectionMerge %138 None 
                                                      OpBranchConditional %136 %137 %238 
                                             %137 = OpLabel 
                                Uniform f32* %140 = OpAccessChain %52 %126 %69 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdEqual %141 %123 
                                                      OpStore %139 %142 
                                       f32_3 %143 = OpLoad %44 
                                       f32_3 %144 = OpVectorShuffle %143 %143 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %52 %145 %33 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                       f32_3 %149 = OpFMul %144 %148 
                                       f32_4 %150 = OpLoad %59 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 6 3 
                                                      OpStore %59 %151 
                              Uniform f32_4* %152 = OpAccessChain %52 %145 %32 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpLoad %44 
                                       f32_3 %156 = OpVectorShuffle %155 %155 0 0 0 
                                       f32_3 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %59 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 6 3 
                                                      OpStore %59 %162 
                              Uniform f32_4* %163 = OpAccessChain %52 %145 %71 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpLoad %44 
                                       f32_3 %167 = OpVectorShuffle %166 %166 2 2 2 
                                       f32_3 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %59 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                       f32_3 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %59 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %59 %173 
                                       f32_4 %174 = OpLoad %59 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                              Uniform f32_4* %176 = OpAccessChain %52 %145 %82 
                                       f32_4 %177 = OpLoad %176 
                                       f32_3 %178 = OpVectorShuffle %177 %177 0 1 2 
                                       f32_3 %179 = OpFAdd %175 %178 
                                       f32_4 %180 = OpLoad %59 
                                       f32_4 %181 = OpVectorShuffle %180 %179 4 5 6 3 
                                                      OpStore %59 %181 
                                        bool %186 = OpLoad %139 
                                                      OpSelectionMerge %188 None 
                                                      OpBranchConditional %186 %187 %191 
                                             %187 = OpLabel 
                                       f32_4 %189 = OpLoad %59 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                                      OpStore %185 %190 
                                                      OpBranch %188 
                                             %191 = OpLabel 
                                       f32_3 %192 = OpLoad %44 
                                                      OpStore %185 %192 
                                                      OpBranch %188 
                                             %188 = OpLabel 
                                       f32_3 %193 = OpLoad %185 
                                                      OpStore %183 %193 
                                       f32_3 %194 = OpLoad %183 
                              Uniform f32_3* %196 = OpAccessChain %52 %195 
                                       f32_3 %197 = OpLoad %196 
                                       f32_3 %198 = OpFNegate %197 
                                       f32_3 %199 = OpFAdd %194 %198 
                                                      OpStore %183 %199 
                                       f32_3 %200 = OpLoad %183 
                              Uniform f32_3* %202 = OpAccessChain %52 %201 
                                       f32_3 %203 = OpLoad %202 
                                       f32_3 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad %59 
                                       f32_4 %206 = OpVectorShuffle %205 %204 0 4 5 6 
                                                      OpStore %59 %206 
                                Private f32* %207 = OpAccessChain %59 %69 
                                         f32 %208 = OpLoad %207 
                                         f32 %210 = OpFMul %208 %209 
                                         f32 %212 = OpFAdd %210 %211 
                                Private f32* %213 = OpAccessChain %183 %65 
                                                      OpStore %213 %212 
                                Uniform f32* %216 = OpAccessChain %52 %126 %61 
                                         f32 %217 = OpLoad %216 
                                         f32 %219 = OpFMul %217 %218 
                                         f32 %220 = OpFAdd %219 %211 
                                Private f32* %221 = OpAccessChain %215 %65 
                                                      OpStore %221 %220 
                                Private f32* %222 = OpAccessChain %215 %65 
                                         f32 %223 = OpLoad %222 
                                Private f32* %224 = OpAccessChain %183 %65 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpExtInst %1 40 %223 %225 
                                Private f32* %227 = OpAccessChain %59 %65 
                                                      OpStore %227 %226 
                  read_only Texture3DSampled %232 = OpLoad %231 
                                       f32_4 %233 = OpLoad %59 
                                       f32_3 %234 = OpVectorShuffle %233 %233 0 2 3 
                                       f32_4 %235 = OpImageSampleImplicitLod %232 %234 
                                                      OpStore %59 %235 
                                       f32_4 %237 = OpLoad %59 
                                                      OpStore %236 %237 
                                                      OpBranch %138 
                                             %238 = OpLabel 
                                Private f32* %239 = OpAccessChain %236 %65 
                                                      OpStore %239 %123 
                                Private f32* %240 = OpAccessChain %236 %69 
                                                      OpStore %240 %123 
                                Private f32* %241 = OpAccessChain %236 %61 
                                                      OpStore %241 %123 
                                Private f32* %242 = OpAccessChain %236 %24 
                                                      OpStore %242 %123 
                                                      OpBranch %138 
                                             %138 = OpLabel 
                                       f32_4 %244 = OpLoad %236 
                              Uniform f32_4* %245 = OpAccessChain %52 %33 
                                       f32_4 %246 = OpLoad %245 
                                         f32 %247 = OpDot %244 %246 
                                Private f32* %248 = OpAccessChain %243 %65 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %243 %65 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpExtInst %1 43 %250 %122 %123 
                                Private f32* %252 = OpAccessChain %243 %65 
                                                      OpStore %252 %251 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_4 %257 = OpLoad %254 
                                       f32_2 %258 = OpVectorShuffle %257 %257 3 3 
                                       f32_2 %259 = OpFDiv %256 %258 
                                       f32_3 %260 = OpLoad %183 
                                       f32_3 %261 = OpVectorShuffle %260 %259 3 4 2 
                                                      OpStore %183 %261 
                  read_only Texture2DSampled %264 = OpLoad %263 
                                       f32_3 %265 = OpLoad %183 
                                       f32_2 %266 = OpVectorShuffle %265 %265 0 1 
                                       f32_4 %267 = OpImageSampleImplicitLod %264 %266 
                                         f32 %268 = OpCompositeExtract %267 0 
                                                      OpStore %262 %268 
                                         f32 %270 = OpLoad %75 
                                         f32 %271 = OpLoad %262 
                                         f32 %272 = OpFAdd %270 %271 
                                Private f32* %273 = OpAccessChain %269 %65 
                                                      OpStore %273 %272 
                                Private f32* %274 = OpAccessChain %269 %65 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpExtInst %1 43 %275 %122 %123 
                                Private f32* %277 = OpAccessChain %269 %65 
                                                      OpStore %277 %276 
                                Private f32* %278 = OpAccessChain %269 %65 
                                         f32 %279 = OpLoad %278 
                                Private f32* %280 = OpAccessChain %243 %65 
                                         f32 %281 = OpLoad %280 
                                         f32 %282 = OpExtInst %1 37 %279 %281 
                                Private f32* %283 = OpAccessChain %243 %65 
                                                      OpStore %283 %282 
                                        bool %286 = OpLoad %125 
                                                      OpSelectionMerge %288 None 
                                                      OpBranchConditional %286 %287 %291 
                                             %287 = OpLabel 
                                Private f32* %289 = OpAccessChain %243 %65 
                                         f32 %290 = OpLoad %289 
                                                      OpStore %285 %290 
                                                      OpBranch %288 
                                             %291 = OpLabel 
                                Private f32* %292 = OpAccessChain %269 %65 
                                         f32 %293 = OpLoad %292 
                                                      OpStore %285 %293 
                                                      OpBranch %288 
                                             %288 = OpLabel 
                                         f32 %294 = OpLoad %285 
                                Private f32* %295 = OpAccessChain %243 %65 
                                                      OpStore %295 %294 
                                       f32_4 %296 = OpLoad %9 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %299 = OpAccessChain %52 %298 
                                       f32_4 %300 = OpLoad %299 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_3 %302 = OpFMul %297 %301 
                                                      OpStore %269 %302 
                                       f32_3 %303 = OpLoad %243 
                                       f32_3 %304 = OpVectorShuffle %303 %303 0 0 0 
                                       f32_3 %305 = OpLoad %269 
                                       f32_3 %306 = OpFMul %304 %305 
                                                      OpStore %243 %306 
                                       f32_4 %307 = OpLoad %9 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                       f32_3 %310 = OpLoad %309 
                                       f32_3 %311 = OpFMul %308 %310 
                                       f32_3 %312 = OpLoad %243 
                                       f32_3 %313 = OpFAdd %311 %312 
                                                      OpStore %243 %313 
                                Private f32* %314 = OpAccessChain %243 %69 
                                         f32 %315 = OpLoad %314 
                                Private f32* %316 = OpAccessChain %243 %61 
                                         f32 %317 = OpLoad %316 
                                        bool %318 = OpFOrdGreaterThanEqual %315 %317 
                                                      OpStore %22 %318 
                                        bool %320 = OpLoad %22 
                                                      OpSelectionMerge %322 None 
                                                      OpBranchConditional %320 %321 %323 
                                             %321 = OpLabel 
                                                      OpStore %319 %123 
                                                      OpBranch %322 
                                             %323 = OpLabel 
                                                      OpStore %319 %122 
                                                      OpBranch %322 
                                             %322 = OpLabel 
                                         f32 %324 = OpLoad %319 
                                                      OpStore %75 %324 
                                       f32_3 %326 = OpLoad %243 
                                       f32_2 %327 = OpVectorShuffle %326 %326 2 1 
                                       f32_2 %328 = OpFNegate %327 
                                       f32_3 %329 = OpLoad %243 
                                       f32_2 %330 = OpVectorShuffle %329 %329 1 2 
                                       f32_2 %331 = OpFAdd %328 %330 
                                                      OpStore %325 %331 
                                Private f32* %332 = OpAccessChain %215 %65 
                                                      OpStore %332 %123 
                                Private f32* %334 = OpAccessChain %215 %69 
                                                      OpStore %334 %333 
                                         f32 %335 = OpLoad %75 
                                       f32_2 %336 = OpCompositeConstruct %335 %335 
                                       f32_2 %337 = OpLoad %325 
                                       f32_2 %338 = OpFMul %336 %337 
                                       f32_3 %339 = OpLoad %243 
                                       f32_2 %340 = OpVectorShuffle %339 %339 2 1 
                                       f32_2 %341 = OpFAdd %338 %340 
                                       f32_4 %342 = OpLoad %59 
                                       f32_4 %343 = OpVectorShuffle %342 %341 4 5 2 3 
                                                      OpStore %59 %343 
                                         f32 %344 = OpLoad %75 
                                       f32_2 %345 = OpCompositeConstruct %344 %344 
                                       f32_2 %346 = OpLoad %215 
                                       f32_2 %347 = OpFMul %345 %346 
                                       f32_2 %350 = OpFAdd %347 %349 
                                       f32_4 %351 = OpLoad %59 
                                       f32_4 %352 = OpVectorShuffle %351 %350 0 1 4 5 
                                                      OpStore %59 %352 
                                Private f32* %353 = OpAccessChain %243 %65 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %59 %65 
                                         f32 %356 = OpLoad %355 
                                        bool %357 = OpFOrdGreaterThanEqual %354 %356 
                                                      OpStore %22 %357 
                                        bool %359 = OpLoad %22 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %359 %360 %362 
                                             %360 = OpLabel 
                                                      OpStore %358 %123 
                                                      OpBranch %361 
                                             %362 = OpLabel 
                                                      OpStore %358 %122 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                         f32 %363 = OpLoad %358 
                                                      OpStore %75 %363 
                                       f32_4 %364 = OpLoad %59 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 3 
                                       f32_3 %366 = OpFNegate %365 
                                       f32_4 %367 = OpLoad %41 
                                       f32_4 %368 = OpVectorShuffle %367 %366 4 5 6 3 
                                                      OpStore %41 %368 
                                Private f32* %369 = OpAccessChain %243 %65 
                                         f32 %370 = OpLoad %369 
                                         f32 %371 = OpFNegate %370 
                                Private f32* %372 = OpAccessChain %41 %24 
                                                      OpStore %372 %371 
                                Private f32* %374 = OpAccessChain %41 %65 
                                         f32 %375 = OpLoad %374 
                                Private f32* %376 = OpAccessChain %243 %65 
                                         f32 %377 = OpLoad %376 
                                         f32 %378 = OpFAdd %375 %377 
                                Private f32* %379 = OpAccessChain %373 %65 
                                                      OpStore %379 %378 
                                       f32_4 %380 = OpLoad %41 
                                       f32_3 %381 = OpVectorShuffle %380 %380 1 2 3 
                                       f32_4 %382 = OpLoad %59 
                                       f32_3 %383 = OpVectorShuffle %382 %382 1 2 0 
                                       f32_3 %384 = OpFAdd %381 %383 
                                       f32_4 %385 = OpLoad %373 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 4 5 6 
                                                      OpStore %373 %386 
                                         f32 %387 = OpLoad %75 
                                       f32_3 %388 = OpCompositeConstruct %387 %387 %387 
                                       f32_4 %389 = OpLoad %373 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFMul %388 %390 
                                       f32_4 %392 = OpLoad %59 
                                       f32_3 %393 = OpVectorShuffle %392 %392 0 1 3 
                                       f32_3 %394 = OpFAdd %391 %393 
                                       f32_4 %395 = OpLoad %41 
                                       f32_4 %396 = OpVectorShuffle %395 %394 4 5 6 3 
                                                      OpStore %41 %396 
                                         f32 %397 = OpLoad %75 
                                Private f32* %398 = OpAccessChain %373 %24 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpFMul %397 %399 
                                Private f32* %401 = OpAccessChain %243 %65 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFAdd %400 %402 
                                                      OpStore %75 %403 
                                Private f32* %405 = OpAccessChain %41 %69 
                                         f32 %406 = OpLoad %405 
                                         f32 %407 = OpLoad %75 
                                         f32 %408 = OpExtInst %1 37 %406 %407 
                                                      OpStore %404 %408 
                                         f32 %409 = OpLoad %404 
                                         f32 %410 = OpFNegate %409 
                                Private f32* %411 = OpAccessChain %41 %65 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFAdd %410 %412 
                                                      OpStore %404 %413 
                                Private f32* %414 = OpAccessChain %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %75 
                                         f32 %418 = OpFAdd %416 %417 
                                                      OpStore %75 %418 
                                         f32 %419 = OpLoad %404 
                                         f32 %421 = OpFMul %419 %420 
                                         f32 %423 = OpFAdd %421 %422 
                                Private f32* %424 = OpAccessChain %183 %65 
                                                      OpStore %424 %423 
                                         f32 %425 = OpLoad %75 
                                Private f32* %426 = OpAccessChain %183 %65 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFDiv %425 %427 
                                                      OpStore %75 %428 
                                         f32 %429 = OpLoad %75 
                                Private f32* %430 = OpAccessChain %41 %61 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFAdd %429 %431 
                                                      OpStore %75 %432 
                                Private f32* %433 = OpAccessChain %41 %65 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFAdd %434 %422 
                                Private f32* %436 = OpAccessChain %41 %65 
                                                      OpStore %436 %435 
                                         f32 %437 = OpLoad %404 
                                Private f32* %438 = OpAccessChain %41 %65 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpFDiv %437 %439 
                                Private f32* %441 = OpAccessChain %41 %65 
                                                      OpStore %441 %440 
                                Private f32* %442 = OpAccessChain %9 %69 
                                         f32 %443 = OpLoad %442 
                                Private f32* %444 = OpAccessChain %9 %61 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %139 %446 
                                        bool %448 = OpLoad %139 
                                                      OpSelectionMerge %450 None 
                                                      OpBranchConditional %448 %449 %451 
                                             %449 = OpLabel 
                                                      OpStore %447 %123 
                                                      OpBranch %450 
                                             %451 = OpLabel 
                                                      OpStore %447 %122 
                                                      OpBranch %450 
                                             %450 = OpLabel 
                                         f32 %452 = OpLoad %447 
                                Private f32* %453 = OpAccessChain %183 %65 
                                                      OpStore %453 %452 
                                Private f32* %455 = OpAccessChain %9 %61 
                                         f32 %456 = OpLoad %455 
                                         f32 %457 = OpFNegate %456 
                                Private f32* %458 = OpAccessChain %9 %69 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFAdd %457 %459 
                                Private f32* %461 = OpAccessChain %454 %65 
                                                      OpStore %461 %460 
                                Private f32* %462 = OpAccessChain %183 %65 
                                         f32 %463 = OpLoad %462 
                                Private f32* %464 = OpAccessChain %454 %65 
                                         f32 %465 = OpLoad %464 
                                         f32 %466 = OpFMul %463 %465 
                                Private f32* %467 = OpAccessChain %9 %61 
                                         f32 %468 = OpLoad %467 
                                         f32 %469 = OpFAdd %466 %468 
                                Private f32* %470 = OpAccessChain %454 %65 
                                                      OpStore %470 %469 
                                Private f32* %472 = OpAccessChain %9 %65 
                                         f32 %473 = OpLoad %472 
                                Private f32* %474 = OpAccessChain %454 %65 
                                         f32 %475 = OpLoad %474 
                                        bool %476 = OpFOrdGreaterThanEqual %473 %475 
                                                      OpStore %471 %476 
                                        bool %479 = OpLoad %471 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %479 %480 %482 
                                             %480 = OpLabel 
                                                      OpStore %478 %123 
                                                      OpBranch %481 
                                             %482 = OpLabel 
                                                      OpStore %478 %122 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %483 = OpLoad %478 
                                                      OpStore %477 %483 
                                Private f32* %484 = OpAccessChain %454 %65 
                                         f32 %485 = OpLoad %484 
                                         f32 %486 = OpFNegate %485 
                                Private f32* %487 = OpAccessChain %9 %65 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFAdd %486 %488 
                                Private f32* %490 = OpAccessChain %9 %65 
                                                      OpStore %490 %489 
                                         f32 %491 = OpLoad %477 
                                Private f32* %492 = OpAccessChain %9 %65 
                                         f32 %493 = OpLoad %492 
                                         f32 %494 = OpFMul %491 %493 
                                Private f32* %495 = OpAccessChain %454 %65 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %9 %65 
                                                      OpStore %498 %497 
                                         f32 %499 = OpLoad %75 
                                       f32_3 %500 = OpCompositeConstruct %499 %499 %499 
                                       f32_3 %501 = OpExtInst %1 4 %500 
                                       f32_3 %504 = OpFAdd %501 %503 
                                                      OpStore %454 %504 
                                       f32_3 %505 = OpLoad %454 
                                       f32_3 %506 = OpExtInst %1 10 %505 
                                                      OpStore %454 %506 
                                       f32_3 %507 = OpLoad %454 
                                       f32_3 %509 = OpFMul %507 %508 
                                       f32_3 %512 = OpFAdd %509 %511 
                                                      OpStore %454 %512 
                                       f32_3 %513 = OpLoad %454 
                                       f32_3 %514 = OpExtInst %1 4 %513 
                                       f32_3 %516 = OpFAdd %514 %515 
                                                      OpStore %454 %516 
                                       f32_3 %517 = OpLoad %454 
                                       f32_3 %518 = OpCompositeConstruct %122 %122 %122 
                                       f32_3 %519 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %520 = OpExtInst %1 43 %517 %518 %519 
                                                      OpStore %454 %520 
                                       f32_3 %521 = OpLoad %454 
                                       f32_3 %522 = OpFAdd %521 %515 
                                                      OpStore %454 %522 
                                       f32_4 %523 = OpLoad %41 
                                       f32_3 %524 = OpVectorShuffle %523 %523 0 0 0 
                                       f32_3 %525 = OpLoad %454 
                                       f32_3 %526 = OpFMul %524 %525 
                                       f32_3 %528 = OpFAdd %526 %527 
                                                      OpStore %454 %528 
                                       f32_3 %529 = OpLoad %454 
                                       f32_4 %530 = OpLoad %9 
                                       f32_3 %531 = OpVectorShuffle %530 %530 0 0 0 
                                       f32_3 %532 = OpFMul %529 %531 
                                       f32_4 %533 = OpLoad %9 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %9 %534 
                                       f32_4 %537 = OpLoad %9 
                                       f32_3 %538 = OpVectorShuffle %537 %537 0 1 2 
                                       f32_4 %539 = OpLoad %536 
                                       f32_4 %540 = OpVectorShuffle %539 %538 4 5 6 3 
                                                      OpStore %536 %540 
                                 Output f32* %542 = OpAccessChain %536 %24 
                                                      OpStore %542 %123 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "LIGHTPROBE_SH" }
""
}
}
}
 Pass {
  Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "TransparentCutout" }
  Blend One One, One One
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 74681
Program "vp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb0 = u_xlat10_0.w<0.100000001;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 187
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %111 %123 %124 %138 %167 %173 %176 %178 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %167 Location 167 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %178 Location 178 
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
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                             %108 = OpTypeArray %6 %43 
                                             %109 = OpTypeStruct %7 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %7 
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                               Output f32_2* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                         i32 %127 = OpConstant 5 
                                             %136 = OpTypeVector %6 3 
                                             %137 = OpTypePointer Input %136 
                                Input f32_3* %138 = OpVariable Input 
                                         u32 %156 = OpConstant 2 
                                Private f32* %158 = OpVariable Private 
                                             %166 = OpTypePointer Output %136 
                               Output f32_3* %167 = OpVariable Output 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                                         f32 %179 = OpConstant 3.67402E-40 
                                       f32_4 %180 = OpConstantComposite %179 %179 %179 %179 
                                             %181 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %78 = OpAccessChain %17 %55 %23 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                               Uniform f32_4* %81 = OpAccessChain %17 %55 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %42 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %89 = OpLoad %76 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %17 %68 %56 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpFMul %90 %92 
                                                      OpStore %88 %93 
                               Uniform f32_4* %94 = OpAccessChain %17 %68 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %88 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %17 %68 %68 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpLoad %76 
                                       f32_4 %104 = OpVectorShuffle %103 %103 2 2 2 2 
                                       f32_4 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpFAdd %105 %106 
                                                      OpStore %88 %107 
                              Uniform f32_4* %112 = OpAccessChain %17 %68 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %76 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %55 
                                                      OpStore %120 %118 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                              Uniform f32_4* %128 = OpAccessChain %17 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %17 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore %123 %135 
                                       f32_3 %139 = OpLoad %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %56 %55 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                         f32 %143 = OpDot %139 %142 
                                Private f32* %144 = OpAccessChain %76 %27 
                                                      OpStore %144 %143 
                                       f32_3 %145 = OpLoad %138 
                              Uniform f32_4* %146 = OpAccessChain %17 %56 %56 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %145 %148 
                                Private f32* %150 = OpAccessChain %76 %43 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %138 
                              Uniform f32_4* %152 = OpAccessChain %17 %56 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %157 = OpAccessChain %76 %156 
                                                      OpStore %157 %155 
                                       f32_4 %159 = OpLoad %76 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_4 %161 = OpLoad %76 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %160 %162 
                                                      OpStore %158 %163 
                                         f32 %164 = OpLoad %158 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %158 %165 
                                         f32 %168 = OpLoad %158 
                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
                                       f32_4 %170 = OpLoad %76 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                                      OpStore %167 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                                      OpStore %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                                      OpStore %176 %177 
                                                      OpStore %178 %180 
                                 Output f32* %182 = OpAccessChain %111 %55 %43 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFNegate %183 
                                 Output f32* %185 = OpAccessChain %111 %55 %43 
                                                      OpStore %185 %184 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 46
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %41 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %27 = OpConstant 3.67402E-40 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                        i32 %32 = OpConstant 1 
                                        i32 %34 = OpConstant -1 
                                            %40 = OpTypePointer Output %18 
                              Output f32_4* %41 = OpVariable Output 
                                        f32 %42 = OpConstant 3.67402E-40 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %42 %42 %42 %43 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %26 = OpLoad %8 
                                       bool %28 = OpFOrdLessThan %26 %27 
                                                    OpStore %25 %28 
                                       bool %29 = OpLoad %25 
                                        i32 %33 = OpSelect %29 %32 %31 
                                        i32 %35 = OpIMul %33 %34 
                                       bool %36 = OpINotEqual %35 %31 
                                                    OpSelectionMerge %38 None 
                                                    OpBranchConditional %36 %37 %38 
                                            %37 = OpLabel 
                                                    OpKill
                                            %38 = OpLabel 
                                                    OpStore %41 %44 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb0 = u_xlat10_0.w<0.100000001;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 187
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %111 %123 %124 %138 %167 %173 %176 %178 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %167 Location 167 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %178 Location 178 
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
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                             %108 = OpTypeArray %6 %43 
                                             %109 = OpTypeStruct %7 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %7 
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                               Output f32_2* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                         i32 %127 = OpConstant 5 
                                             %136 = OpTypeVector %6 3 
                                             %137 = OpTypePointer Input %136 
                                Input f32_3* %138 = OpVariable Input 
                                         u32 %156 = OpConstant 2 
                                Private f32* %158 = OpVariable Private 
                                             %166 = OpTypePointer Output %136 
                               Output f32_3* %167 = OpVariable Output 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                                         f32 %179 = OpConstant 3.67402E-40 
                                       f32_4 %180 = OpConstantComposite %179 %179 %179 %179 
                                             %181 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %78 = OpAccessChain %17 %55 %23 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                               Uniform f32_4* %81 = OpAccessChain %17 %55 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %42 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %89 = OpLoad %76 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %17 %68 %56 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpFMul %90 %92 
                                                      OpStore %88 %93 
                               Uniform f32_4* %94 = OpAccessChain %17 %68 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %88 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %17 %68 %68 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpLoad %76 
                                       f32_4 %104 = OpVectorShuffle %103 %103 2 2 2 2 
                                       f32_4 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpFAdd %105 %106 
                                                      OpStore %88 %107 
                              Uniform f32_4* %112 = OpAccessChain %17 %68 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %76 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %55 
                                                      OpStore %120 %118 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                              Uniform f32_4* %128 = OpAccessChain %17 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %17 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore %123 %135 
                                       f32_3 %139 = OpLoad %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %56 %55 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                         f32 %143 = OpDot %139 %142 
                                Private f32* %144 = OpAccessChain %76 %27 
                                                      OpStore %144 %143 
                                       f32_3 %145 = OpLoad %138 
                              Uniform f32_4* %146 = OpAccessChain %17 %56 %56 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %145 %148 
                                Private f32* %150 = OpAccessChain %76 %43 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %138 
                              Uniform f32_4* %152 = OpAccessChain %17 %56 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %157 = OpAccessChain %76 %156 
                                                      OpStore %157 %155 
                                       f32_4 %159 = OpLoad %76 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_4 %161 = OpLoad %76 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %160 %162 
                                                      OpStore %158 %163 
                                         f32 %164 = OpLoad %158 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %158 %165 
                                         f32 %168 = OpLoad %158 
                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
                                       f32_4 %170 = OpLoad %76 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                                      OpStore %167 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                                      OpStore %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                                      OpStore %176 %177 
                                                      OpStore %178 %180 
                                 Output f32* %182 = OpAccessChain %111 %55 %43 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFNegate %183 
                                 Output f32* %185 = OpAccessChain %111 %55 %43 
                                                      OpStore %185 %184 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 46
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %41 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %27 = OpConstant 3.67402E-40 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                        i32 %32 = OpConstant 1 
                                        i32 %34 = OpConstant -1 
                                            %40 = OpTypePointer Output %18 
                              Output f32_4* %41 = OpVariable Output 
                                        f32 %42 = OpConstant 3.67402E-40 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %42 %42 %42 %43 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %26 = OpLoad %8 
                                       bool %28 = OpFOrdLessThan %26 %27 
                                                    OpStore %25 %28 
                                       bool %29 = OpLoad %25 
                                        i32 %33 = OpSelect %29 %32 %31 
                                        i32 %35 = OpIMul %33 %34 
                                       bool %36 = OpINotEqual %35 %31 
                                                    OpSelectionMerge %38 None 
                                                    OpBranchConditional %36 %37 %38 
                                            %37 = OpLabel 
                                                    OpKill
                                            %38 = OpLabel 
                                                    OpStore %41 %44 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb0 = u_xlat10_0.w<0.100000001;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 187
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %111 %123 %124 %138 %167 %173 %176 %178 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %167 Location 167 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %178 Location 178 
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
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                             %108 = OpTypeArray %6 %43 
                                             %109 = OpTypeStruct %7 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %7 
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                               Output f32_2* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                         i32 %127 = OpConstant 5 
                                             %136 = OpTypeVector %6 3 
                                             %137 = OpTypePointer Input %136 
                                Input f32_3* %138 = OpVariable Input 
                                         u32 %156 = OpConstant 2 
                                Private f32* %158 = OpVariable Private 
                                             %166 = OpTypePointer Output %136 
                               Output f32_3* %167 = OpVariable Output 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                                         f32 %179 = OpConstant 3.67402E-40 
                                       f32_4 %180 = OpConstantComposite %179 %179 %179 %179 
                                             %181 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %78 = OpAccessChain %17 %55 %23 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                               Uniform f32_4* %81 = OpAccessChain %17 %55 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %42 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %89 = OpLoad %76 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %17 %68 %56 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpFMul %90 %92 
                                                      OpStore %88 %93 
                               Uniform f32_4* %94 = OpAccessChain %17 %68 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %88 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %17 %68 %68 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpLoad %76 
                                       f32_4 %104 = OpVectorShuffle %103 %103 2 2 2 2 
                                       f32_4 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpFAdd %105 %106 
                                                      OpStore %88 %107 
                              Uniform f32_4* %112 = OpAccessChain %17 %68 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %76 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %55 
                                                      OpStore %120 %118 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                              Uniform f32_4* %128 = OpAccessChain %17 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %17 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore %123 %135 
                                       f32_3 %139 = OpLoad %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %56 %55 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                         f32 %143 = OpDot %139 %142 
                                Private f32* %144 = OpAccessChain %76 %27 
                                                      OpStore %144 %143 
                                       f32_3 %145 = OpLoad %138 
                              Uniform f32_4* %146 = OpAccessChain %17 %56 %56 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %145 %148 
                                Private f32* %150 = OpAccessChain %76 %43 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %138 
                              Uniform f32_4* %152 = OpAccessChain %17 %56 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %157 = OpAccessChain %76 %156 
                                                      OpStore %157 %155 
                                       f32_4 %159 = OpLoad %76 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_4 %161 = OpLoad %76 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %160 %162 
                                                      OpStore %158 %163 
                                         f32 %164 = OpLoad %158 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %158 %165 
                                         f32 %168 = OpLoad %158 
                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
                                       f32_4 %170 = OpLoad %76 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                                      OpStore %167 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                                      OpStore %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                                      OpStore %176 %177 
                                                      OpStore %178 %180 
                                 Output f32* %182 = OpAccessChain %111 %55 %43 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFNegate %183 
                                 Output f32* %185 = OpAccessChain %111 %55 %43 
                                                      OpStore %185 %184 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 46
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %41 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %27 = OpConstant 3.67402E-40 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                        i32 %32 = OpConstant 1 
                                        i32 %34 = OpConstant -1 
                                            %40 = OpTypePointer Output %18 
                              Output f32_4* %41 = OpVariable Output 
                                        f32 %42 = OpConstant 3.67402E-40 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %42 %42 %42 %43 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %26 = OpLoad %8 
                                       bool %28 = OpFOrdLessThan %26 %27 
                                                    OpStore %25 %28 
                                       bool %29 = OpLoad %25 
                                        i32 %33 = OpSelect %29 %32 %31 
                                        i32 %35 = OpIMul %33 %34 
                                       bool %36 = OpINotEqual %35 %31 
                                                    OpSelectionMerge %38 None 
                                                    OpBranchConditional %36 %37 %38 
                                            %37 = OpLabel 
                                                    OpKill
                                            %38 = OpLabel 
                                                    OpStore %41 %44 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb0 = u_xlat10_0.w<0.100000001;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 187
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %111 %123 %124 %138 %167 %173 %176 %178 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %167 Location 167 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %178 Location 178 
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
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                             %108 = OpTypeArray %6 %43 
                                             %109 = OpTypeStruct %7 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %7 
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                               Output f32_2* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                         i32 %127 = OpConstant 5 
                                             %136 = OpTypeVector %6 3 
                                             %137 = OpTypePointer Input %136 
                                Input f32_3* %138 = OpVariable Input 
                                         u32 %156 = OpConstant 2 
                                Private f32* %158 = OpVariable Private 
                                             %166 = OpTypePointer Output %136 
                               Output f32_3* %167 = OpVariable Output 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                                         f32 %179 = OpConstant 3.67402E-40 
                                       f32_4 %180 = OpConstantComposite %179 %179 %179 %179 
                                             %181 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %78 = OpAccessChain %17 %55 %23 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                               Uniform f32_4* %81 = OpAccessChain %17 %55 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %42 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %89 = OpLoad %76 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %17 %68 %56 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpFMul %90 %92 
                                                      OpStore %88 %93 
                               Uniform f32_4* %94 = OpAccessChain %17 %68 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %88 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %17 %68 %68 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpLoad %76 
                                       f32_4 %104 = OpVectorShuffle %103 %103 2 2 2 2 
                                       f32_4 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpFAdd %105 %106 
                                                      OpStore %88 %107 
                              Uniform f32_4* %112 = OpAccessChain %17 %68 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %76 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %55 
                                                      OpStore %120 %118 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                              Uniform f32_4* %128 = OpAccessChain %17 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %17 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore %123 %135 
                                       f32_3 %139 = OpLoad %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %56 %55 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                         f32 %143 = OpDot %139 %142 
                                Private f32* %144 = OpAccessChain %76 %27 
                                                      OpStore %144 %143 
                                       f32_3 %145 = OpLoad %138 
                              Uniform f32_4* %146 = OpAccessChain %17 %56 %56 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %145 %148 
                                Private f32* %150 = OpAccessChain %76 %43 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %138 
                              Uniform f32_4* %152 = OpAccessChain %17 %56 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %157 = OpAccessChain %76 %156 
                                                      OpStore %157 %155 
                                       f32_4 %159 = OpLoad %76 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_4 %161 = OpLoad %76 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %160 %162 
                                                      OpStore %158 %163 
                                         f32 %164 = OpLoad %158 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %158 %165 
                                         f32 %168 = OpLoad %158 
                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
                                       f32_4 %170 = OpLoad %76 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                                      OpStore %167 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                                      OpStore %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                                      OpStore %176 %177 
                                                      OpStore %178 %180 
                                 Output f32* %182 = OpAccessChain %111 %55 %43 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFNegate %183 
                                 Output f32* %185 = OpAccessChain %111 %55 %43 
                                                      OpStore %185 %184 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 46
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %41 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %27 = OpConstant 3.67402E-40 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                        i32 %32 = OpConstant 1 
                                        i32 %34 = OpConstant -1 
                                            %40 = OpTypePointer Output %18 
                              Output f32_4* %41 = OpVariable Output 
                                        f32 %42 = OpConstant 3.67402E-40 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %42 %42 %42 %43 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %26 = OpLoad %8 
                                       bool %28 = OpFOrdLessThan %26 %27 
                                                    OpStore %25 %28 
                                       bool %29 = OpLoad %25 
                                        i32 %33 = OpSelect %29 %32 %31 
                                        i32 %35 = OpIMul %33 %34 
                                       bool %36 = OpINotEqual %35 %31 
                                                    OpSelectionMerge %38 None 
                                                    OpBranchConditional %36 %37 %38 
                                            %37 = OpLabel 
                                                    OpKill
                                            %38 = OpLabel 
                                                    OpStore %41 %44 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _ReflectionYFactor;
uniform 	float _ReflectionYOffset;
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat10;
void main()
{
    u_xlat0.x = _ReflectionYOffset * _ReflectionYFactor;
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat3 = (-_ReflectionYFactor) + 1.0;
    u_xlat0.x = in_POSITION0.y * u_xlat3 + u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = u_xlat0;
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
vec4 u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb0 = u_xlat10_0.w<0.100000001;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 187
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %42 %111 %123 %124 %138 %167 %173 %176 %178 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpMemberDecorate %15 5 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate %42 Location 42 
                                                      OpMemberDecorate %109 0 BuiltIn 109 
                                                      OpMemberDecorate %109 1 BuiltIn 109 
                                                      OpMemberDecorate %109 2 BuiltIn 109 
                                                      OpDecorate %109 Block 
                                                      OpDecorate %123 Location 123 
                                                      OpDecorate %124 Location 124 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %167 Location 167 
                                                      OpDecorate %173 Location 173 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %178 Location 178 
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
                                              %15 = OpTypeStruct %12 %13 %14 %6 %6 %7 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32; f32; f32_4;}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 4 
                                              %20 = OpTypePointer Uniform %6 
                                          i32 %23 = OpConstant 3 
                                          u32 %27 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          f32 %32 = OpConstant 3.67402E-40 
                                 Private f32* %35 = OpVariable Private 
                                          f32 %39 = OpConstant 3.67402E-40 
                                              %41 = OpTypePointer Input %7 
                                 Input f32_4* %42 = OpVariable Input 
                                          u32 %43 = OpConstant 1 
                                              %44 = OpTypePointer Input %6 
                                          i32 %55 = OpConstant 0 
                                          i32 %56 = OpConstant 1 
                                              %57 = OpTypePointer Uniform %7 
                                          i32 %68 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                               Private f32_4* %88 = OpVariable Private 
                                             %108 = OpTypeArray %6 %43 
                                             %109 = OpTypeStruct %7 %6 %108 
                                             %110 = OpTypePointer Output %109 
        Output struct {f32_4; f32; f32[1];}* %111 = OpVariable Output 
                                             %119 = OpTypePointer Output %7 
                                             %121 = OpTypeVector %6 2 
                                             %122 = OpTypePointer Output %121 
                               Output f32_2* %123 = OpVariable Output 
                                Input f32_4* %124 = OpVariable Input 
                                         i32 %127 = OpConstant 5 
                                             %136 = OpTypeVector %6 3 
                                             %137 = OpTypePointer Input %136 
                                Input f32_3* %138 = OpVariable Input 
                                         u32 %156 = OpConstant 2 
                                Private f32* %158 = OpVariable Private 
                                             %166 = OpTypePointer Output %136 
                               Output f32_3* %167 = OpVariable Output 
                               Output f32_3* %173 = OpVariable Output 
                               Output f32_4* %176 = OpVariable Output 
                               Output f32_4* %178 = OpVariable Output 
                                         f32 %179 = OpConstant 3.67402E-40 
                                       f32_4 %180 = OpConstantComposite %179 %179 %179 %179 
                                             %181 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %17 %19 
                                          f32 %22 = OpLoad %21 
                                 Uniform f32* %24 = OpAccessChain %17 %23 
                                          f32 %25 = OpLoad %24 
                                          f32 %26 = OpFMul %22 %25 
                                 Private f32* %29 = OpAccessChain %9 %27 
                                                      OpStore %29 %26 
                                 Private f32* %30 = OpAccessChain %9 %27 
                                          f32 %31 = OpLoad %30 
                                          f32 %33 = OpFMul %31 %32 
                                 Private f32* %34 = OpAccessChain %9 %27 
                                                      OpStore %34 %33 
                                 Uniform f32* %36 = OpAccessChain %17 %23 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFNegate %37 
                                          f32 %40 = OpFAdd %38 %39 
                                                      OpStore %35 %40 
                                   Input f32* %45 = OpAccessChain %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpLoad %35 
                                          f32 %48 = OpFMul %46 %47 
                                 Private f32* %49 = OpAccessChain %9 %27 
                                          f32 %50 = OpLoad %49 
                                          f32 %51 = OpFAdd %48 %50 
                                 Private f32* %52 = OpAccessChain %9 %27 
                                                      OpStore %52 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 0 0 0 0 
                               Uniform f32_4* %58 = OpAccessChain %17 %55 %56 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpFMul %54 %59 
                                                      OpStore %9 %60 
                               Uniform f32_4* %61 = OpAccessChain %17 %55 %55 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %42 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 0 0 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %9 %67 
                               Uniform f32_4* %69 = OpAccessChain %17 %55 %68 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %42 
                                        f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %77 = OpLoad %9 
                               Uniform f32_4* %78 = OpAccessChain %17 %55 %23 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFAdd %77 %79 
                                                      OpStore %76 %80 
                               Uniform f32_4* %81 = OpAccessChain %17 %55 %23 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %42 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %9 %87 
                                        f32_4 %89 = OpLoad %76 
                                        f32_4 %90 = OpVectorShuffle %89 %89 1 1 1 1 
                               Uniform f32_4* %91 = OpAccessChain %17 %68 %56 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpFMul %90 %92 
                                                      OpStore %88 %93 
                               Uniform f32_4* %94 = OpAccessChain %17 %68 %55 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %96 0 0 0 0 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %88 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %88 %100 
                              Uniform f32_4* %101 = OpAccessChain %17 %68 %68 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpLoad %76 
                                       f32_4 %104 = OpVectorShuffle %103 %103 2 2 2 2 
                                       f32_4 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %88 
                                       f32_4 %107 = OpFAdd %105 %106 
                                                      OpStore %88 %107 
                              Uniform f32_4* %112 = OpAccessChain %17 %68 %23 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpLoad %76 
                                       f32_4 %115 = OpVectorShuffle %114 %114 3 3 3 3 
                                       f32_4 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %88 
                                       f32_4 %118 = OpFAdd %116 %117 
                               Output f32_4* %120 = OpAccessChain %111 %55 
                                                      OpStore %120 %118 
                                       f32_4 %125 = OpLoad %124 
                                       f32_2 %126 = OpVectorShuffle %125 %125 0 1 
                              Uniform f32_4* %128 = OpAccessChain %17 %127 
                                       f32_4 %129 = OpLoad %128 
                                       f32_2 %130 = OpVectorShuffle %129 %129 0 1 
                                       f32_2 %131 = OpFMul %126 %130 
                              Uniform f32_4* %132 = OpAccessChain %17 %127 
                                       f32_4 %133 = OpLoad %132 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                                       f32_2 %135 = OpFAdd %131 %134 
                                                      OpStore %123 %135 
                                       f32_3 %139 = OpLoad %138 
                              Uniform f32_4* %140 = OpAccessChain %17 %56 %55 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                                         f32 %143 = OpDot %139 %142 
                                Private f32* %144 = OpAccessChain %76 %27 
                                                      OpStore %144 %143 
                                       f32_3 %145 = OpLoad %138 
                              Uniform f32_4* %146 = OpAccessChain %17 %56 %56 
                                       f32_4 %147 = OpLoad %146 
                                       f32_3 %148 = OpVectorShuffle %147 %147 0 1 2 
                                         f32 %149 = OpDot %145 %148 
                                Private f32* %150 = OpAccessChain %76 %43 
                                                      OpStore %150 %149 
                                       f32_3 %151 = OpLoad %138 
                              Uniform f32_4* %152 = OpAccessChain %17 %56 %68 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                         f32 %155 = OpDot %151 %154 
                                Private f32* %157 = OpAccessChain %76 %156 
                                                      OpStore %157 %155 
                                       f32_4 %159 = OpLoad %76 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 1 2 
                                       f32_4 %161 = OpLoad %76 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 1 2 
                                         f32 %163 = OpDot %160 %162 
                                                      OpStore %158 %163 
                                         f32 %164 = OpLoad %158 
                                         f32 %165 = OpExtInst %1 32 %164 
                                                      OpStore %158 %165 
                                         f32 %168 = OpLoad %158 
                                       f32_3 %169 = OpCompositeConstruct %168 %168 %168 
                                       f32_4 %170 = OpLoad %76 
                                       f32_3 %171 = OpVectorShuffle %170 %170 0 1 2 
                                       f32_3 %172 = OpFMul %169 %171 
                                                      OpStore %167 %172 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                                      OpStore %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                                      OpStore %176 %177 
                                                      OpStore %178 %180 
                                 Output f32* %182 = OpAccessChain %111 %55 %43 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpFNegate %183 
                                 Output f32* %185 = OpAccessChain %111 %55 %43 
                                                      OpStore %185 %184 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 46
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %16 %41 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %12 RelaxedPrecision 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %16 Location 16 
                                                    OpDecorate %22 RelaxedPrecision 
                                                    OpDecorate %41 RelaxedPrecision 
                                                    OpDecorate %41 Location 41 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypePointer Private %6 
                                Private f32* %8 = OpVariable Private 
                                             %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %10 = OpTypeSampledImage %9 
                                            %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2DSampled* %12 = OpVariable UniformConstant 
                                            %14 = OpTypeVector %6 2 
                                            %15 = OpTypePointer Input %14 
                               Input f32_2* %16 = OpVariable Input 
                                            %18 = OpTypeVector %6 4 
                                            %20 = OpTypeInt 32 0 
                                        u32 %21 = OpConstant 3 
                                            %23 = OpTypeBool 
                                            %24 = OpTypePointer Private %23 
                              Private bool* %25 = OpVariable Private 
                                        f32 %27 = OpConstant 3.67402E-40 
                                            %30 = OpTypeInt 32 1 
                                        i32 %31 = OpConstant 0 
                                        i32 %32 = OpConstant 1 
                                        i32 %34 = OpConstant -1 
                                            %40 = OpTypePointer Output %18 
                              Output f32_4* %41 = OpVariable Output 
                                        f32 %42 = OpConstant 3.67402E-40 
                                        f32 %43 = OpConstant 3.67402E-40 
                                      f32_4 %44 = OpConstantComposite %42 %42 %42 %43 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %13 = OpLoad %12 
                                      f32_2 %17 = OpLoad %16 
                                      f32_4 %19 = OpImageSampleImplicitLod %13 %17 
                                        f32 %22 = OpCompositeExtract %19 3 
                                                    OpStore %8 %22 
                                        f32 %26 = OpLoad %8 
                                       bool %28 = OpFOrdLessThan %26 %27 
                                                    OpStore %25 %28 
                                       bool %29 = OpLoad %25 
                                        i32 %33 = OpSelect %29 %32 %31 
                                        i32 %35 = OpIMul %33 %34 
                                       bool %36 = OpINotEqual %35 %31 
                                                    OpSelectionMerge %38 None 
                                                    OpBranchConditional %36 %37 %38 
                                            %37 = OpLabel 
                                                    OpKill
                                            %38 = OpLabel 
                                                    OpStore %41 %44 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "POINT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT" }
""
}
SubProgram "vulkan " {
Keywords { "POINT" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan " {
Keywords { "SPOT" }
""
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "d3d11 " {
Keywords { "SPOT" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "POINT_COOKIE" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "vulkan " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "d3d11 " {
Keywords { "DIRECTIONAL_COOKIE" }
"// shader disassembly not supported on DXBC"
}
}
}
}
Fallback "VertexLit"
}