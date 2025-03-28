//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRect" {
Properties {
_MainTex ("Texture", any) = "white" { }
}
SubShader {
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, One One
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 62409
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
bvec3 u_xlatb5;
float u_xlat6;
bool u_xlatb6;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat0 = (-u_xlat0) + _Rect[2];
    u_xlat5.x = _BorderWidths[0] + _Rect[0];
    u_xlat0 = u_xlat0 + u_xlat5.x;
    u_xlatb5.x = vs_TEXCOORD2.x>=u_xlat5.x;
    u_xlatb0 = u_xlat0>=vs_TEXCOORD2.x;
    u_xlatb0 = u_xlatb0 && u_xlatb5.x;
    u_xlat5.x = _BorderWidths[1] + _Rect[1];
    u_xlatb10 = vs_TEXCOORD2.y>=u_xlat5.x;
    u_xlatb0 = u_xlatb10 && u_xlatb0;
    u_xlat10 = _BorderWidths[1] + _BorderWidths[3];
    u_xlat10 = (-u_xlat10) + _Rect[3];
    u_xlat5.x = u_xlat10 + u_xlat5.x;
    u_xlatb5.x = u_xlat5.x>=vs_TEXCOORD2.y;
    u_xlatb0 = u_xlatb5.x && u_xlatb0;
    u_xlat1.x = _BorderWidths[0];
    u_xlat2.x = _BorderWidths[2];
    u_xlat5.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat5.x = (-_Rect[2]) * 0.5 + u_xlat5.x;
    u_xlat10 = _Rect[0] + _Rect[2];
    u_xlat15 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat5.z = (-_Rect[3]) * 0.5 + u_xlat15;
    u_xlatb5.xz = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xxzz).xz;
    u_xlati11.xy = (u_xlatb5.z) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati11.x = (u_xlatb5.x) ? u_xlati11.x : u_xlati11.y;
    u_xlat2.y = u_xlat10 + (-_CornerRadiuses[u_xlati11.x]);
    u_xlat1.y = _Rect[0] + _CornerRadiuses[u_xlati11.x];
    u_xlat2.xy = (u_xlatb5.x) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat13.x = _BorderWidths[1];
    u_xlat14.x = _BorderWidths[3];
    u_xlat10 = _Rect[1] + _Rect[3];
    u_xlat14.y = u_xlat10 + (-_CornerRadiuses[u_xlati11.x]);
    u_xlat13.y = _Rect[1] + _CornerRadiuses[u_xlati11.x];
    u_xlat2.zw = (u_xlatb5.z) ? u_xlat13.xy : u_xlat14.xy;
    u_xlat1.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati11.x]);
    u_xlat10 = u_xlat1.x / u_xlat1.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat10 * u_xlat3.y;
    u_xlat10 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat16 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat16 = sqrt(u_xlat16);
    u_xlat11 = u_xlat16 + (-_CornerRadiuses[u_xlati11.x]);
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat1.x) + u_xlat10;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlat6 = dFdx(vs_TEXCOORD2.x);
    u_xlat6 = float(1.0) / abs(u_xlat6);
    u_xlat10 = u_xlat10 * u_xlat6 + 0.5;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat6 = u_xlat11 * u_xlat6 + 0.5;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat10 = (u_xlatb1.x) ? u_xlat10 : 1.0;
    u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
    u_xlatb1.x = u_xlatb1.z || u_xlatb1.x;
    u_xlat10 = u_xlatb1.x ? u_xlat10 : float(0.0);
    u_xlat1.x = u_xlatb1.x ? u_xlat6 : float(0.0);
    u_xlatb6 = u_xlat1.x==0.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat10 = (u_xlatb6) ? u_xlat10 : u_xlat1.x;
    u_xlatb1.xy = greaterThanEqual(u_xlat2.ywyy, vs_TEXCOORD2.xyxx).xy;
    u_xlatb11.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, u_xlat2.ywyw).xy;
    u_xlatb5.x = (u_xlatb5.x) ? u_xlatb1.x : u_xlatb11.x;
    u_xlatb5.z = (u_xlatb5.z) ? u_xlatb1.y : u_xlatb11.y;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlat10 = (u_xlatb5.x) ? u_xlat10 : 1.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat10 = u_xlat10 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat0 = (u_xlatb0) ? 0.0 : u_xlat10;
    u_xlat0 = (u_xlatb5.x) ? u_xlat10 : u_xlat0;
    u_xlatb5.x = 0.0<_BorderWidths[0];
    u_xlatb15 = 0.0<_BorderWidths[1];
    u_xlatb5.x = u_xlatb15 || u_xlatb5.x;
    u_xlatb15 = 0.0<_BorderWidths[2];
    u_xlatb5.x = u_xlatb15 || u_xlatb5.x;
    u_xlatb15 = 0.0<_BorderWidths[3];
    u_xlatb5.x = u_xlatb15 || u_xlatb5.x;
    u_xlat0 = (u_xlatb5.x) ? u_xlat0 : 1.0;
    u_xlat0 = u_xlat0 * u_xlat10;
    u_xlat10_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    SV_Target0.w = u_xlat0 * u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %168 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                               Output f32_2* %149 = OpVariable Output 
                               Output f32_2* %156 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                               Output f32_4* %168 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore %149 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore %156 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore %168 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 567
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %52 %483 %487 %555 %564 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 ArrayStride 11 
                                                     OpDecorate %12 ArrayStride 12 
                                                     OpDecorate %13 ArrayStride 13 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpMemberDecorate %14 1 Offset 14 
                                                     OpMemberDecorate %14 2 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %52 Location 52 
                                                     OpDecorate %476 RelaxedPrecision 
                                                     OpDecorate %480 RelaxedPrecision 
                                                     OpDecorate %480 DescriptorSet 480 
                                                     OpDecorate %480 Binding 480 
                                                     OpDecorate %481 RelaxedPrecision 
                                                     OpDecorate %483 Location 483 
                                                     OpDecorate %486 RelaxedPrecision 
                                                     OpDecorate %487 RelaxedPrecision 
                                                     OpDecorate %487 Location 487 
                                                     OpDecorate %488 RelaxedPrecision 
                                                     OpDecorate %489 RelaxedPrecision 
                                                     OpDecorate %502 RelaxedPrecision 
                                                     OpDecorate %546 RelaxedPrecision 
                                                     OpDecorate %548 RelaxedPrecision 
                                                     OpDecorate %552 RelaxedPrecision 
                                                     OpDecorate %553 RelaxedPrecision 
                                                     OpDecorate %553 DescriptorSet 553 
                                                     OpDecorate %553 Binding 553 
                                                     OpDecorate %554 RelaxedPrecision 
                                                     OpDecorate %555 Location 555 
                                                     OpDecorate %558 RelaxedPrecision 
                                                     OpDecorate %559 RelaxedPrecision 
                                                     OpDecorate %564 RelaxedPrecision 
                                                     OpDecorate %564 Location 564 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypePointer Private %6 
                                 Private f32* %8 = OpVariable Private 
                                              %9 = OpTypeInt 32 0 
                                         u32 %10 = OpConstant 4 
                                             %11 = OpTypeArray %6 %10 
                                             %12 = OpTypeArray %6 %10 
                                             %13 = OpTypeArray %6 %10 
                                             %14 = OpTypeStruct %11 %12 %13 
                                             %15 = OpTypePointer Uniform %14 
   Uniform struct {f32[4]; f32[4]; f32[4];}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 1 
                                         i32 %19 = OpConstant 0 
                                             %20 = OpTypePointer Uniform %6 
                                         i32 %23 = OpConstant 2 
                                             %32 = OpTypeVector %6 3 
                                             %33 = OpTypePointer Private %32 
                              Private f32_3* %34 = OpVariable Private 
                                         u32 %40 = OpConstant 0 
                                             %46 = OpTypeBool 
                                             %47 = OpTypeVector %46 3 
                                             %48 = OpTypePointer Private %47 
                             Private bool_3* %49 = OpVariable Private 
                                             %50 = OpTypeVector %6 4 
                                             %51 = OpTypePointer Input %50 
                                Input f32_4* %52 = OpVariable Input 
                                             %53 = OpTypePointer Input %6 
                                             %61 = OpTypePointer Private %46 
                               Private bool* %62 = OpVariable Private 
                               Private bool* %77 = OpVariable Private 
                                         u32 %78 = OpConstant 1 
                                Private f32* %87 = OpVariable Private 
                                         i32 %90 = OpConstant 3 
                                            %115 = OpTypePointer Private %50 
                             Private f32_4* %116 = OpVariable Private 
                             Private f32_4* %120 = OpVariable Private 
                                        f32 %134 = OpConstant 3.67402E-40 
                               Private f32* %145 = OpVariable Private 
                                        u32 %158 = OpConstant 2 
                                        f32 %160 = OpConstant 3.67402E-40 
                                      f32_4 %161 = OpConstantComposite %160 %160 %160 %160 
                                            %164 = OpTypeVector %46 4 
                                            %166 = OpTypeVector %46 2 
                                            %170 = OpTypeVector %17 2 
                                            %171 = OpTypePointer Private %170 
                             Private i32_2* %172 = OpVariable Private 
                                            %173 = OpTypePointer Function %170 
                                      i32_2 %179 = OpConstantComposite %19 %18 
                                      i32_2 %181 = OpConstantComposite %90 %23 
                                            %183 = OpTypePointer Function %17 
                                            %189 = OpTypePointer Private %17 
                                            %213 = OpTypeVector %6 2 
                                            %214 = OpTypePointer Function %213 
                                            %228 = OpTypePointer Private %213 
                             Private f32_2* %229 = OpVariable Private 
                             Private f32_2* %233 = OpVariable Private 
                             Private f32_3* %285 = OpVariable Private 
                               Private f32* %304 = OpVariable Private 
                               Private f32* %312 = OpVariable Private 
                            Private bool_3* %327 = OpVariable Private 
                               Private f32* %341 = OpVariable Private 
                                        f32 %345 = OpConstant 3.67402E-40 
                                            %361 = OpTypePointer Function %6 
                              Private bool* %400 = OpVariable Private 
                                            %426 = OpTypePointer Private %166 
                            Private bool_2* %427 = OpVariable Private 
                                            %434 = OpTypePointer Function %46 
                             Private f32_4* %476 = OpVariable Private 
                                            %477 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %478 = OpTypeSampledImage %477 
                                            %479 = OpTypePointer UniformConstant %478 
UniformConstant read_only Texture2DSampled* %480 = OpVariable UniformConstant 
                                            %482 = OpTypePointer Input %213 
                               Input f32_2* %483 = OpVariable Input 
                               Input f32_4* %487 = OpVariable Input 
                                        u32 %491 = OpConstant 3 
                               Private f32* %502 = OpVariable Private 
                               Private f32* %552 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %553 = OpVariable UniformConstant 
                               Input f32_2* %555 = OpVariable Input 
                                            %563 = OpTypePointer Output %50 
                              Output f32_4* %564 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                            Function i32_2* %174 = OpVariable Function 
                              Function i32* %184 = OpVariable Function 
                            Function f32_2* %215 = OpVariable Function 
                            Function f32_2* %258 = OpVariable Function 
                              Function f32* %362 = OpVariable Function 
                              Function f32* %383 = OpVariable Function 
                              Function f32* %391 = OpVariable Function 
                              Function f32* %409 = OpVariable Function 
                             Function bool* %435 = OpVariable Function 
                             Function bool* %448 = OpVariable Function 
                              Function f32* %468 = OpVariable Function 
                              Function f32* %495 = OpVariable Function 
                              Function f32* %503 = OpVariable Function 
                              Function f32* %542 = OpVariable Function 
                                Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                         f32 %22 = OpLoad %21 
                                Uniform f32* %24 = OpAccessChain %16 %18 %23 
                                         f32 %25 = OpLoad %24 
                                         f32 %26 = OpFAdd %22 %25 
                                                     OpStore %8 %26 
                                         f32 %27 = OpLoad %8 
                                         f32 %28 = OpFNegate %27 
                                Uniform f32* %29 = OpAccessChain %16 %23 %23 
                                         f32 %30 = OpLoad %29 
                                         f32 %31 = OpFAdd %28 %30 
                                                     OpStore %8 %31 
                                Uniform f32* %35 = OpAccessChain %16 %18 %19 
                                         f32 %36 = OpLoad %35 
                                Uniform f32* %37 = OpAccessChain %16 %23 %19 
                                         f32 %38 = OpLoad %37 
                                         f32 %39 = OpFAdd %36 %38 
                                Private f32* %41 = OpAccessChain %34 %40 
                                                     OpStore %41 %39 
                                         f32 %42 = OpLoad %8 
                                Private f32* %43 = OpAccessChain %34 %40 
                                         f32 %44 = OpLoad %43 
                                         f32 %45 = OpFAdd %42 %44 
                                                     OpStore %8 %45 
                                  Input f32* %54 = OpAccessChain %52 %40 
                                         f32 %55 = OpLoad %54 
                                Private f32* %56 = OpAccessChain %34 %40 
                                         f32 %57 = OpLoad %56 
                                        bool %58 = OpFOrdGreaterThanEqual %55 %57 
                                      bool_3 %59 = OpLoad %49 
                                      bool_3 %60 = OpCompositeInsert %58 %59 0 
                                                     OpStore %49 %60 
                                         f32 %63 = OpLoad %8 
                                  Input f32* %64 = OpAccessChain %52 %40 
                                         f32 %65 = OpLoad %64 
                                        bool %66 = OpFOrdGreaterThanEqual %63 %65 
                                                     OpStore %62 %66 
                                        bool %67 = OpLoad %62 
                                      bool_3 %68 = OpLoad %49 
                                        bool %69 = OpCompositeExtract %68 0 
                                        bool %70 = OpLogicalAnd %67 %69 
                                                     OpStore %62 %70 
                                Uniform f32* %71 = OpAccessChain %16 %18 %18 
                                         f32 %72 = OpLoad %71 
                                Uniform f32* %73 = OpAccessChain %16 %23 %18 
                                         f32 %74 = OpLoad %73 
                                         f32 %75 = OpFAdd %72 %74 
                                Private f32* %76 = OpAccessChain %34 %40 
                                                     OpStore %76 %75 
                                  Input f32* %79 = OpAccessChain %52 %78 
                                         f32 %80 = OpLoad %79 
                                Private f32* %81 = OpAccessChain %34 %40 
                                         f32 %82 = OpLoad %81 
                                        bool %83 = OpFOrdGreaterThanEqual %80 %82 
                                                     OpStore %77 %83 
                                        bool %84 = OpLoad %77 
                                        bool %85 = OpLoad %62 
                                        bool %86 = OpLogicalAnd %84 %85 
                                                     OpStore %62 %86 
                                Uniform f32* %88 = OpAccessChain %16 %18 %18 
                                         f32 %89 = OpLoad %88 
                                Uniform f32* %91 = OpAccessChain %16 %18 %90 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFAdd %89 %92 
                                                     OpStore %87 %93 
                                         f32 %94 = OpLoad %87 
                                         f32 %95 = OpFNegate %94 
                                Uniform f32* %96 = OpAccessChain %16 %23 %90 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFAdd %95 %97 
                                                     OpStore %87 %98 
                                         f32 %99 = OpLoad %87 
                               Private f32* %100 = OpAccessChain %34 %40 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFAdd %99 %101 
                               Private f32* %103 = OpAccessChain %34 %40 
                                                     OpStore %103 %102 
                               Private f32* %104 = OpAccessChain %34 %40 
                                        f32 %105 = OpLoad %104 
                                 Input f32* %106 = OpAccessChain %52 %78 
                                        f32 %107 = OpLoad %106 
                                       bool %108 = OpFOrdGreaterThanEqual %105 %107 
                                     bool_3 %109 = OpLoad %49 
                                     bool_3 %110 = OpCompositeInsert %108 %109 0 
                                                     OpStore %49 %110 
                                     bool_3 %111 = OpLoad %49 
                                       bool %112 = OpCompositeExtract %111 0 
                                       bool %113 = OpLoad %62 
                                       bool %114 = OpLogicalAnd %112 %113 
                                                     OpStore %62 %114 
                               Uniform f32* %117 = OpAccessChain %16 %18 %19 
                                        f32 %118 = OpLoad %117 
                               Private f32* %119 = OpAccessChain %116 %40 
                                                     OpStore %119 %118 
                               Uniform f32* %121 = OpAccessChain %16 %18 %23 
                                        f32 %122 = OpLoad %121 
                               Private f32* %123 = OpAccessChain %120 %40 
                                                     OpStore %123 %122 
                                 Input f32* %124 = OpAccessChain %52 %40 
                                        f32 %125 = OpLoad %124 
                               Uniform f32* %126 = OpAccessChain %16 %23 %19 
                                        f32 %127 = OpLoad %126 
                                        f32 %128 = OpFNegate %127 
                                        f32 %129 = OpFAdd %125 %128 
                               Private f32* %130 = OpAccessChain %34 %40 
                                                     OpStore %130 %129 
                               Uniform f32* %131 = OpAccessChain %16 %23 %23 
                                        f32 %132 = OpLoad %131 
                                        f32 %133 = OpFNegate %132 
                                        f32 %135 = OpFMul %133 %134 
                               Private f32* %136 = OpAccessChain %34 %40 
                                        f32 %137 = OpLoad %136 
                                        f32 %138 = OpFAdd %135 %137 
                               Private f32* %139 = OpAccessChain %34 %40 
                                                     OpStore %139 %138 
                               Uniform f32* %140 = OpAccessChain %16 %23 %19 
                                        f32 %141 = OpLoad %140 
                               Uniform f32* %142 = OpAccessChain %16 %23 %23 
                                        f32 %143 = OpLoad %142 
                                        f32 %144 = OpFAdd %141 %143 
                                                     OpStore %87 %144 
                                 Input f32* %146 = OpAccessChain %52 %78 
                                        f32 %147 = OpLoad %146 
                               Uniform f32* %148 = OpAccessChain %16 %23 %18 
                                        f32 %149 = OpLoad %148 
                                        f32 %150 = OpFNegate %149 
                                        f32 %151 = OpFAdd %147 %150 
                                                     OpStore %145 %151 
                               Uniform f32* %152 = OpAccessChain %16 %23 %90 
                                        f32 %153 = OpLoad %152 
                                        f32 %154 = OpFNegate %153 
                                        f32 %155 = OpFMul %154 %134 
                                        f32 %156 = OpLoad %145 
                                        f32 %157 = OpFAdd %155 %156 
                               Private f32* %159 = OpAccessChain %34 %158 
                                                     OpStore %159 %157 
                                      f32_3 %162 = OpLoad %34 
                                      f32_4 %163 = OpVectorShuffle %162 %162 0 0 2 2 
                                     bool_4 %165 = OpFOrdGreaterThanEqual %161 %163 
                                     bool_2 %167 = OpVectorShuffle %165 %165 0 2 
                                     bool_3 %168 = OpLoad %49 
                                     bool_3 %169 = OpVectorShuffle %168 %167 3 1 4 
                                                     OpStore %49 %169 
                                     bool_3 %175 = OpLoad %49 
                                       bool %176 = OpCompositeExtract %175 2 
                                                     OpSelectionMerge %178 None 
                                                     OpBranchConditional %176 %177 %180 
                                            %177 = OpLabel 
                                                     OpStore %174 %179 
                                                     OpBranch %178 
                                            %180 = OpLabel 
                                                     OpStore %174 %181 
                                                     OpBranch %178 
                                            %178 = OpLabel 
                                      i32_2 %182 = OpLoad %174 
                                                     OpStore %172 %182 
                                     bool_3 %185 = OpLoad %49 
                                       bool %186 = OpCompositeExtract %185 0 
                                                     OpSelectionMerge %188 None 
                                                     OpBranchConditional %186 %187 %192 
                                            %187 = OpLabel 
                               Private i32* %190 = OpAccessChain %172 %40 
                                        i32 %191 = OpLoad %190 
                                                     OpStore %184 %191 
                                                     OpBranch %188 
                                            %192 = OpLabel 
                               Private i32* %193 = OpAccessChain %172 %78 
                                        i32 %194 = OpLoad %193 
                                                     OpStore %184 %194 
                                                     OpBranch %188 
                                            %188 = OpLabel 
                                        i32 %195 = OpLoad %184 
                               Private i32* %196 = OpAccessChain %172 %40 
                                                     OpStore %196 %195 
                                        f32 %197 = OpLoad %87 
                               Private i32* %198 = OpAccessChain %172 %40 
                                        i32 %199 = OpLoad %198 
                               Uniform f32* %200 = OpAccessChain %16 %19 %199 
                                        f32 %201 = OpLoad %200 
                                        f32 %202 = OpFNegate %201 
                                        f32 %203 = OpFAdd %197 %202 
                               Private f32* %204 = OpAccessChain %120 %78 
                                                     OpStore %204 %203 
                               Uniform f32* %205 = OpAccessChain %16 %23 %19 
                                        f32 %206 = OpLoad %205 
                               Private i32* %207 = OpAccessChain %172 %40 
                                        i32 %208 = OpLoad %207 
                               Uniform f32* %209 = OpAccessChain %16 %19 %208 
                                        f32 %210 = OpLoad %209 
                                        f32 %211 = OpFAdd %206 %210 
                               Private f32* %212 = OpAccessChain %116 %78 
                                                     OpStore %212 %211 
                                     bool_3 %216 = OpLoad %49 
                                       bool %217 = OpCompositeExtract %216 0 
                                                     OpSelectionMerge %219 None 
                                                     OpBranchConditional %217 %218 %222 
                                            %218 = OpLabel 
                                      f32_4 %220 = OpLoad %116 
                                      f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                                     OpStore %215 %221 
                                                     OpBranch %219 
                                            %222 = OpLabel 
                                      f32_4 %223 = OpLoad %120 
                                      f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                                                     OpStore %215 %224 
                                                     OpBranch %219 
                                            %219 = OpLabel 
                                      f32_2 %225 = OpLoad %215 
                                      f32_4 %226 = OpLoad %120 
                                      f32_4 %227 = OpVectorShuffle %226 %225 4 5 2 3 
                                                     OpStore %120 %227 
                               Uniform f32* %230 = OpAccessChain %16 %18 %18 
                                        f32 %231 = OpLoad %230 
                               Private f32* %232 = OpAccessChain %229 %40 
                                                     OpStore %232 %231 
                               Uniform f32* %234 = OpAccessChain %16 %18 %90 
                                        f32 %235 = OpLoad %234 
                               Private f32* %236 = OpAccessChain %233 %40 
                                                     OpStore %236 %235 
                               Uniform f32* %237 = OpAccessChain %16 %23 %18 
                                        f32 %238 = OpLoad %237 
                               Uniform f32* %239 = OpAccessChain %16 %23 %90 
                                        f32 %240 = OpLoad %239 
                                        f32 %241 = OpFAdd %238 %240 
                                                     OpStore %87 %241 
                                        f32 %242 = OpLoad %87 
                               Private i32* %243 = OpAccessChain %172 %40 
                                        i32 %244 = OpLoad %243 
                               Uniform f32* %245 = OpAccessChain %16 %19 %244 
                                        f32 %246 = OpLoad %245 
                                        f32 %247 = OpFNegate %246 
                                        f32 %248 = OpFAdd %242 %247 
                               Private f32* %249 = OpAccessChain %233 %78 
                                                     OpStore %249 %248 
                               Uniform f32* %250 = OpAccessChain %16 %23 %18 
                                        f32 %251 = OpLoad %250 
                               Private i32* %252 = OpAccessChain %172 %40 
                                        i32 %253 = OpLoad %252 
                               Uniform f32* %254 = OpAccessChain %16 %19 %253 
                                        f32 %255 = OpLoad %254 
                                        f32 %256 = OpFAdd %251 %255 
                               Private f32* %257 = OpAccessChain %229 %78 
                                                     OpStore %257 %256 
                                     bool_3 %259 = OpLoad %49 
                                       bool %260 = OpCompositeExtract %259 2 
                                                     OpSelectionMerge %262 None 
                                                     OpBranchConditional %260 %261 %264 
                                            %261 = OpLabel 
                                      f32_2 %263 = OpLoad %229 
                                                     OpStore %258 %263 
                                                     OpBranch %262 
                                            %264 = OpLabel 
                                      f32_2 %265 = OpLoad %233 
                                                     OpStore %258 %265 
                                                     OpBranch %262 
                                            %262 = OpLabel 
                                      f32_2 %266 = OpLoad %258 
                                      f32_4 %267 = OpLoad %120 
                                      f32_4 %268 = OpVectorShuffle %267 %266 0 1 4 5 
                                                     OpStore %120 %268 
                                      f32_4 %269 = OpLoad %120 
                                      f32_2 %270 = OpVectorShuffle %269 %269 0 2 
                                      f32_2 %271 = OpFNegate %270 
                               Private i32* %272 = OpAccessChain %172 %40 
                                        i32 %273 = OpLoad %272 
                               Uniform f32* %274 = OpAccessChain %16 %19 %273 
                                        f32 %275 = OpLoad %274 
                                      f32_2 %276 = OpCompositeConstruct %275 %275 
                                      f32_2 %277 = OpFAdd %271 %276 
                                      f32_4 %278 = OpLoad %116 
                                      f32_4 %279 = OpVectorShuffle %278 %277 4 5 2 3 
                                                     OpStore %116 %279 
                               Private f32* %280 = OpAccessChain %116 %40 
                                        f32 %281 = OpLoad %280 
                               Private f32* %282 = OpAccessChain %116 %78 
                                        f32 %283 = OpLoad %282 
                                        f32 %284 = OpFDiv %281 %283 
                                                     OpStore %87 %284 
                                      f32_4 %286 = OpLoad %120 
                                      f32_2 %287 = OpVectorShuffle %286 %286 1 3 
                                      f32_2 %288 = OpFNegate %287 
                                      f32_4 %289 = OpLoad %52 
                                      f32_2 %290 = OpVectorShuffle %289 %289 0 1 
                                      f32_2 %291 = OpFAdd %288 %290 
                                      f32_3 %292 = OpLoad %285 
                                      f32_3 %293 = OpVectorShuffle %292 %291 3 4 2 
                                                     OpStore %285 %293 
                                        f32 %294 = OpLoad %87 
                               Private f32* %295 = OpAccessChain %285 %78 
                                        f32 %296 = OpLoad %295 
                                        f32 %297 = OpFMul %294 %296 
                               Private f32* %298 = OpAccessChain %285 %158 
                                                     OpStore %298 %297 
                                      f32_3 %299 = OpLoad %285 
                                      f32_2 %300 = OpVectorShuffle %299 %299 0 2 
                                      f32_3 %301 = OpLoad %285 
                                      f32_2 %302 = OpVectorShuffle %301 %301 0 2 
                                        f32 %303 = OpDot %300 %302 
                                                     OpStore %87 %303 
                                      f32_3 %305 = OpLoad %285 
                                      f32_2 %306 = OpVectorShuffle %305 %305 0 1 
                                      f32_3 %307 = OpLoad %285 
                                      f32_2 %308 = OpVectorShuffle %307 %307 0 1 
                                        f32 %309 = OpDot %306 %308 
                                                     OpStore %304 %309 
                                        f32 %310 = OpLoad %304 
                                        f32 %311 = OpExtInst %1 31 %310 
                                                     OpStore %304 %311 
                                        f32 %313 = OpLoad %304 
                               Private i32* %314 = OpAccessChain %172 %40 
                                        i32 %315 = OpLoad %314 
                               Uniform f32* %316 = OpAccessChain %16 %19 %315 
                                        f32 %317 = OpLoad %316 
                                        f32 %318 = OpFNegate %317 
                                        f32 %319 = OpFAdd %313 %318 
                                                     OpStore %312 %319 
                                        f32 %320 = OpLoad %87 
                                        f32 %321 = OpExtInst %1 31 %320 
                                                     OpStore %87 %321 
                               Private f32* %322 = OpAccessChain %116 %40 
                                        f32 %323 = OpLoad %322 
                                        f32 %324 = OpFNegate %323 
                                        f32 %325 = OpLoad %87 
                                        f32 %326 = OpFAdd %324 %325 
                                                     OpStore %87 %326 
                                      f32_4 %328 = OpLoad %116 
                                      f32_4 %329 = OpVectorShuffle %328 %328 0 1 0 0 
                                     bool_4 %330 = OpFOrdLessThan %161 %329 
                                     bool_2 %331 = OpVectorShuffle %330 %330 0 1 
                                     bool_3 %332 = OpLoad %327 
                                     bool_3 %333 = OpVectorShuffle %332 %331 3 4 2 
                                                     OpStore %327 %333 
                                     bool_3 %334 = OpLoad %327 
                                       bool %335 = OpCompositeExtract %334 1 
                                     bool_3 %336 = OpLoad %327 
                                       bool %337 = OpCompositeExtract %336 0 
                                       bool %338 = OpLogicalAnd %335 %337 
                                     bool_3 %339 = OpLoad %327 
                                     bool_3 %340 = OpCompositeInsert %338 %339 0 
                                                     OpStore %327 %340 
                                 Input f32* %342 = OpAccessChain %52 %40 
                                        f32 %343 = OpLoad %342 
                                        f32 %344 = OpDPdx %343 
                                                     OpStore %341 %344 
                                        f32 %346 = OpLoad %341 
                                        f32 %347 = OpExtInst %1 4 %346 
                                        f32 %348 = OpFDiv %345 %347 
                                                     OpStore %341 %348 
                                        f32 %349 = OpLoad %87 
                                        f32 %350 = OpLoad %341 
                                        f32 %351 = OpFMul %349 %350 
                                        f32 %352 = OpFAdd %351 %134 
                                                     OpStore %87 %352 
                                        f32 %353 = OpLoad %87 
                                        f32 %354 = OpExtInst %1 43 %353 %160 %345 
                                                     OpStore %87 %354 
                                        f32 %355 = OpLoad %312 
                                        f32 %356 = OpLoad %341 
                                        f32 %357 = OpFMul %355 %356 
                                        f32 %358 = OpFAdd %357 %134 
                                                     OpStore %341 %358 
                                        f32 %359 = OpLoad %341 
                                        f32 %360 = OpExtInst %1 43 %359 %160 %345 
                                                     OpStore %341 %360 
                                     bool_3 %363 = OpLoad %327 
                                       bool %364 = OpCompositeExtract %363 0 
                                                     OpSelectionMerge %366 None 
                                                     OpBranchConditional %364 %365 %368 
                                            %365 = OpLabel 
                                        f32 %367 = OpLoad %87 
                                                     OpStore %362 %367 
                                                     OpBranch %366 
                                            %368 = OpLabel 
                                                     OpStore %362 %345 
                                                     OpBranch %366 
                                            %366 = OpLabel 
                                        f32 %369 = OpLoad %362 
                                                     OpStore %87 %369 
                                      f32_4 %370 = OpLoad %120 
                                      f32_4 %371 = OpVectorShuffle %370 %370 0 0 2 0 
                                     bool_4 %372 = OpFOrdLessThan %161 %371 
                                     bool_2 %373 = OpVectorShuffle %372 %372 0 2 
                                     bool_3 %374 = OpLoad %327 
                                     bool_3 %375 = OpVectorShuffle %374 %373 3 1 4 
                                                     OpStore %327 %375 
                                     bool_3 %376 = OpLoad %327 
                                       bool %377 = OpCompositeExtract %376 2 
                                     bool_3 %378 = OpLoad %327 
                                       bool %379 = OpCompositeExtract %378 0 
                                       bool %380 = OpLogicalOr %377 %379 
                                     bool_3 %381 = OpLoad %327 
                                     bool_3 %382 = OpCompositeInsert %380 %381 0 
                                                     OpStore %327 %382 
                                     bool_3 %384 = OpLoad %327 
                                       bool %385 = OpCompositeExtract %384 0 
                                                     OpSelectionMerge %387 None 
                                                     OpBranchConditional %385 %386 %389 
                                            %386 = OpLabel 
                                        f32 %388 = OpLoad %87 
                                                     OpStore %383 %388 
                                                     OpBranch %387 
                                            %389 = OpLabel 
                                                     OpStore %383 %160 
                                                     OpBranch %387 
                                            %387 = OpLabel 
                                        f32 %390 = OpLoad %383 
                                                     OpStore %87 %390 
                                     bool_3 %392 = OpLoad %327 
                                       bool %393 = OpCompositeExtract %392 0 
                                                     OpSelectionMerge %395 None 
                                                     OpBranchConditional %393 %394 %397 
                                            %394 = OpLabel 
                                        f32 %396 = OpLoad %341 
                                                     OpStore %391 %396 
                                                     OpBranch %395 
                                            %397 = OpLabel 
                                                     OpStore %391 %160 
                                                     OpBranch %395 
                                            %395 = OpLabel 
                                        f32 %398 = OpLoad %391 
                               Private f32* %399 = OpAccessChain %116 %40 
                                                     OpStore %399 %398 
                               Private f32* %401 = OpAccessChain %116 %40 
                                        f32 %402 = OpLoad %401 
                                       bool %403 = OpFOrdEqual %402 %160 
                                                     OpStore %400 %403 
                               Private f32* %404 = OpAccessChain %116 %40 
                                        f32 %405 = OpLoad %404 
                                        f32 %406 = OpFNegate %405 
                                        f32 %407 = OpFAdd %406 %345 
                               Private f32* %408 = OpAccessChain %116 %40 
                                                     OpStore %408 %407 
                                       bool %410 = OpLoad %400 
                                                     OpSelectionMerge %412 None 
                                                     OpBranchConditional %410 %411 %414 
                                            %411 = OpLabel 
                                        f32 %413 = OpLoad %87 
                                                     OpStore %409 %413 
                                                     OpBranch %412 
                                            %414 = OpLabel 
                               Private f32* %415 = OpAccessChain %116 %40 
                                        f32 %416 = OpLoad %415 
                                                     OpStore %409 %416 
                                                     OpBranch %412 
                                            %412 = OpLabel 
                                        f32 %417 = OpLoad %409 
                                                     OpStore %87 %417 
                                      f32_4 %418 = OpLoad %120 
                                      f32_4 %419 = OpVectorShuffle %418 %418 1 3 1 1 
                                      f32_4 %420 = OpLoad %52 
                                      f32_4 %421 = OpVectorShuffle %420 %420 0 1 0 0 
                                     bool_4 %422 = OpFOrdGreaterThanEqual %419 %421 
                                     bool_2 %423 = OpVectorShuffle %422 %422 0 1 
                                     bool_3 %424 = OpLoad %327 
                                     bool_3 %425 = OpVectorShuffle %424 %423 3 4 2 
                                                     OpStore %327 %425 
                                      f32_4 %428 = OpLoad %52 
                                      f32_4 %429 = OpVectorShuffle %428 %428 0 1 0 1 
                                      f32_4 %430 = OpLoad %120 
                                      f32_4 %431 = OpVectorShuffle %430 %430 1 3 1 3 
                                     bool_4 %432 = OpFOrdGreaterThanEqual %429 %431 
                                     bool_2 %433 = OpVectorShuffle %432 %432 0 1 
                                                     OpStore %427 %433 
                                     bool_3 %436 = OpLoad %49 
                                       bool %437 = OpCompositeExtract %436 0 
                                                     OpSelectionMerge %439 None 
                                                     OpBranchConditional %437 %438 %442 
                                            %438 = OpLabel 
                                     bool_3 %440 = OpLoad %327 
                                       bool %441 = OpCompositeExtract %440 0 
                                                     OpStore %435 %441 
                                                     OpBranch %439 
                                            %442 = OpLabel 
                                     bool_2 %443 = OpLoad %427 
                                       bool %444 = OpCompositeExtract %443 0 
                                                     OpStore %435 %444 
                                                     OpBranch %439 
                                            %439 = OpLabel 
                                       bool %445 = OpLoad %435 
                                     bool_3 %446 = OpLoad %49 
                                     bool_3 %447 = OpCompositeInsert %445 %446 0 
                                                     OpStore %49 %447 
                                     bool_3 %449 = OpLoad %49 
                                       bool %450 = OpCompositeExtract %449 2 
                                                     OpSelectionMerge %452 None 
                                                     OpBranchConditional %450 %451 %455 
                                            %451 = OpLabel 
                                     bool_3 %453 = OpLoad %327 
                                       bool %454 = OpCompositeExtract %453 1 
                                                     OpStore %448 %454 
                                                     OpBranch %452 
                                            %455 = OpLabel 
                                     bool_2 %456 = OpLoad %427 
                                       bool %457 = OpCompositeExtract %456 1 
                                                     OpStore %448 %457 
                                                     OpBranch %452 
                                            %452 = OpLabel 
                                       bool %458 = OpLoad %448 
                                     bool_3 %459 = OpLoad %49 
                                     bool_3 %460 = OpCompositeInsert %458 %459 2 
                                                     OpStore %49 %460 
                                     bool_3 %461 = OpLoad %49 
                                       bool %462 = OpCompositeExtract %461 2 
                                     bool_3 %463 = OpLoad %49 
                                       bool %464 = OpCompositeExtract %463 0 
                                       bool %465 = OpLogicalAnd %462 %464 
                                     bool_3 %466 = OpLoad %49 
                                     bool_3 %467 = OpCompositeInsert %465 %466 0 
                                                     OpStore %49 %467 
                                     bool_3 %469 = OpLoad %49 
                                       bool %470 = OpCompositeExtract %469 0 
                                                     OpSelectionMerge %472 None 
                                                     OpBranchConditional %470 %471 %474 
                                            %471 = OpLabel 
                                        f32 %473 = OpLoad %87 
                                                     OpStore %468 %473 
                                                     OpBranch %472 
                                            %474 = OpLabel 
                                                     OpStore %468 %345 
                                                     OpBranch %472 
                                            %472 = OpLabel 
                                        f32 %475 = OpLoad %468 
                                                     OpStore %87 %475 
                 read_only Texture2DSampled %481 = OpLoad %480 
                                      f32_2 %484 = OpLoad %483 
                                      f32_4 %485 = OpImageSampleImplicitLod %481 %484 
                                                     OpStore %476 %485 
                                      f32_4 %486 = OpLoad %476 
                                      f32_4 %488 = OpLoad %487 
                                      f32_4 %489 = OpFMul %486 %488 
                                                     OpStore %116 %489 
                                        f32 %490 = OpLoad %87 
                               Private f32* %492 = OpAccessChain %116 %491 
                                        f32 %493 = OpLoad %492 
                                        f32 %494 = OpFMul %490 %493 
                                                     OpStore %87 %494 
                                       bool %496 = OpLoad %62 
                                                     OpSelectionMerge %498 None 
                                                     OpBranchConditional %496 %497 %499 
                                            %497 = OpLabel 
                                                     OpStore %495 %160 
                                                     OpBranch %498 
                                            %499 = OpLabel 
                                        f32 %500 = OpLoad %87 
                                                     OpStore %495 %500 
                                                     OpBranch %498 
                                            %498 = OpLabel 
                                        f32 %501 = OpLoad %495 
                                                     OpStore %8 %501 
                                     bool_3 %504 = OpLoad %49 
                                       bool %505 = OpCompositeExtract %504 0 
                                                     OpSelectionMerge %507 None 
                                                     OpBranchConditional %505 %506 %509 
                                            %506 = OpLabel 
                                        f32 %508 = OpLoad %87 
                                                     OpStore %503 %508 
                                                     OpBranch %507 
                                            %509 = OpLabel 
                                        f32 %510 = OpLoad %8 
                                                     OpStore %503 %510 
                                                     OpBranch %507 
                                            %507 = OpLabel 
                                        f32 %511 = OpLoad %503 
                                                     OpStore %502 %511 
                               Uniform f32* %512 = OpAccessChain %16 %18 %19 
                                        f32 %513 = OpLoad %512 
                                       bool %514 = OpFOrdLessThan %160 %513 
                                                     OpStore %62 %514 
                               Uniform f32* %515 = OpAccessChain %16 %18 %18 
                                        f32 %516 = OpLoad %515 
                                       bool %517 = OpFOrdLessThan %160 %516 
                                     bool_3 %518 = OpLoad %49 
                                     bool_3 %519 = OpCompositeInsert %517 %518 0 
                                                     OpStore %49 %519 
                                     bool_3 %520 = OpLoad %49 
                                       bool %521 = OpCompositeExtract %520 0 
                                       bool %522 = OpLoad %62 
                                       bool %523 = OpLogicalOr %521 %522 
                                                     OpStore %62 %523 
                               Uniform f32* %524 = OpAccessChain %16 %18 %23 
                                        f32 %525 = OpLoad %524 
                                       bool %526 = OpFOrdLessThan %160 %525 
                                     bool_3 %527 = OpLoad %49 
                                     bool_3 %528 = OpCompositeInsert %526 %527 0 
                                                     OpStore %49 %528 
                                     bool_3 %529 = OpLoad %49 
                                       bool %530 = OpCompositeExtract %529 0 
                                       bool %531 = OpLoad %62 
                                       bool %532 = OpLogicalOr %530 %531 
                                                     OpStore %62 %532 
                               Uniform f32* %533 = OpAccessChain %16 %18 %90 
                                        f32 %534 = OpLoad %533 
                                       bool %535 = OpFOrdLessThan %160 %534 
                                     bool_3 %536 = OpLoad %49 
                                     bool_3 %537 = OpCompositeInsert %535 %536 0 
                                                     OpStore %49 %537 
                                     bool_3 %538 = OpLoad %49 
                                       bool %539 = OpCompositeExtract %538 0 
                                       bool %540 = OpLoad %62 
                                       bool %541 = OpLogicalOr %539 %540 
                                                     OpStore %62 %541 
                                       bool %543 = OpLoad %62 
                                                     OpSelectionMerge %545 None 
                                                     OpBranchConditional %543 %544 %547 
                                            %544 = OpLabel 
                                        f32 %546 = OpLoad %502 
                                                     OpStore %542 %546 
                                                     OpBranch %545 
                                            %547 = OpLabel 
                                                     OpStore %542 %345 
                                                     OpBranch %545 
                                            %545 = OpLabel 
                                        f32 %548 = OpLoad %542 
                                                     OpStore %8 %548 
                                        f32 %549 = OpLoad %8 
                                        f32 %550 = OpLoad %87 
                                        f32 %551 = OpFMul %549 %550 
                                                     OpStore %8 %551 
                 read_only Texture2DSampled %554 = OpLoad %553 
                                      f32_2 %556 = OpLoad %555 
                                      f32_4 %557 = OpImageSampleImplicitLod %554 %556 
                                        f32 %558 = OpCompositeExtract %557 3 
                                                     OpStore %552 %558 
                                        f32 %559 = OpLoad %552 
                                        f32 %560 = OpLoad %8 
                                        f32 %561 = OpFMul %559 %560 
                               Private f32* %562 = OpAccessChain %116 %491 
                                                     OpStore %562 %561 
                                      f32_4 %565 = OpLoad %116 
                                                     OpStore %564 %565 
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
SubShader {
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 77836
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform  sampler2D _MainTex;
uniform  sampler2D _GUIClipTexture;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec4 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bvec3 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat5;
bvec3 u_xlatb5;
float u_xlat6;
bool u_xlatb6;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
void main()
{
    u_xlat0 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat0 = (-u_xlat0) + _Rect[2];
    u_xlat5.x = _BorderWidths[0] + _Rect[0];
    u_xlat0 = u_xlat0 + u_xlat5.x;
    u_xlatb5.x = vs_TEXCOORD2.x>=u_xlat5.x;
    u_xlatb0 = u_xlat0>=vs_TEXCOORD2.x;
    u_xlatb0 = u_xlatb0 && u_xlatb5.x;
    u_xlat5.x = _BorderWidths[1] + _Rect[1];
    u_xlatb10 = vs_TEXCOORD2.y>=u_xlat5.x;
    u_xlatb0 = u_xlatb10 && u_xlatb0;
    u_xlat10 = _BorderWidths[1] + _BorderWidths[3];
    u_xlat10 = (-u_xlat10) + _Rect[3];
    u_xlat5.x = u_xlat10 + u_xlat5.x;
    u_xlatb5.x = u_xlat5.x>=vs_TEXCOORD2.y;
    u_xlatb0 = u_xlatb5.x && u_xlatb0;
    u_xlat1.x = _BorderWidths[0];
    u_xlat2.x = _BorderWidths[2];
    u_xlat5.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat5.x = (-_Rect[2]) * 0.5 + u_xlat5.x;
    u_xlat10 = _Rect[0] + _Rect[2];
    u_xlat15 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat5.z = (-_Rect[3]) * 0.5 + u_xlat15;
    u_xlatb5.xz = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5.xxzz).xz;
    u_xlati11.xy = (u_xlatb5.z) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati11.x = (u_xlatb5.x) ? u_xlati11.x : u_xlati11.y;
    u_xlat2.y = u_xlat10 + (-_CornerRadiuses[u_xlati11.x]);
    u_xlat1.y = _Rect[0] + _CornerRadiuses[u_xlati11.x];
    u_xlat2.xy = (u_xlatb5.x) ? u_xlat1.xy : u_xlat2.xy;
    u_xlat13.x = _BorderWidths[1];
    u_xlat14.x = _BorderWidths[3];
    u_xlat10 = _Rect[1] + _Rect[3];
    u_xlat14.y = u_xlat10 + (-_CornerRadiuses[u_xlati11.x]);
    u_xlat13.y = _Rect[1] + _CornerRadiuses[u_xlati11.x];
    u_xlat2.zw = (u_xlatb5.z) ? u_xlat13.xy : u_xlat14.xy;
    u_xlat1.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati11.x]);
    u_xlat10 = u_xlat1.x / u_xlat1.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat10 * u_xlat3.y;
    u_xlat10 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat16 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat16 = sqrt(u_xlat16);
    u_xlat11 = u_xlat16 + (-_CornerRadiuses[u_xlati11.x]);
    u_xlat10 = sqrt(u_xlat10);
    u_xlat10 = (-u_xlat1.x) + u_xlat10;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxx).xy;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlat6 = dFdx(vs_TEXCOORD2.x);
    u_xlat6 = float(1.0) / abs(u_xlat6);
    u_xlat10 = u_xlat10 * u_xlat6 + 0.5;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat6 = u_xlat11 * u_xlat6 + 0.5;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat10 = (u_xlatb1.x) ? u_xlat10 : 1.0;
    u_xlatb1.xz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xxzx).xz;
    u_xlatb1.x = u_xlatb1.z || u_xlatb1.x;
    u_xlat10 = u_xlatb1.x ? u_xlat10 : float(0.0);
    u_xlat1.x = u_xlatb1.x ? u_xlat6 : float(0.0);
    u_xlatb6 = u_xlat1.x==0.0;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat10 = (u_xlatb6) ? u_xlat10 : u_xlat1.x;
    u_xlatb1.xy = greaterThanEqual(u_xlat2.ywyy, vs_TEXCOORD2.xyxx).xy;
    u_xlatb11.xy = greaterThanEqual(vs_TEXCOORD2.xyxy, u_xlat2.ywyw).xy;
    u_xlatb5.x = (u_xlatb5.x) ? u_xlatb1.x : u_xlatb11.x;
    u_xlatb5.z = (u_xlatb5.z) ? u_xlatb1.y : u_xlatb11.y;
    u_xlatb5.x = u_xlatb5.z && u_xlatb5.x;
    u_xlat10 = (u_xlatb5.x) ? u_xlat10 : 1.0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * vs_COLOR0;
    u_xlat10 = u_xlat10 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat0 = (u_xlatb0) ? 0.0 : u_xlat10;
    u_xlat0 = (u_xlatb5.x) ? u_xlat10 : u_xlat0;
    u_xlatb5.x = 0.0<_BorderWidths[0];
    u_xlatb15 = 0.0<_BorderWidths[1];
    u_xlatb5.x = u_xlatb15 || u_xlatb5.x;
    u_xlatb15 = 0.0<_BorderWidths[2];
    u_xlatb5.x = u_xlatb15 || u_xlatb5.x;
    u_xlatb15 = 0.0<_BorderWidths[3];
    u_xlatb5.x = u_xlatb15 || u_xlatb5.x;
    u_xlat0 = (u_xlatb5.x) ? u_xlat0 : 1.0;
    u_xlat0 = u_xlat0 * u_xlat10;
    u_xlat10_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy);
    SV_Target0.w = u_xlat0 * u_xlat10_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %149 Location 149 
                                                      OpDecorate %156 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate %168 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                               Output f32_2* %149 = OpVariable Output 
                               Output f32_2* %156 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                               Output f32_4* %168 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore %149 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore %156 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore %168 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 567
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Fragment %4 "main" %52 %483 %487 %555 %564 
                                                     OpExecutionMode %4 OriginUpperLeft 
                                                     OpDecorate %11 ArrayStride 11 
                                                     OpDecorate %12 ArrayStride 12 
                                                     OpDecorate %13 ArrayStride 13 
                                                     OpMemberDecorate %14 0 Offset 14 
                                                     OpMemberDecorate %14 1 Offset 14 
                                                     OpMemberDecorate %14 2 Offset 14 
                                                     OpDecorate %14 Block 
                                                     OpDecorate %16 DescriptorSet 16 
                                                     OpDecorate %16 Binding 16 
                                                     OpDecorate %52 Location 52 
                                                     OpDecorate %476 RelaxedPrecision 
                                                     OpDecorate %480 RelaxedPrecision 
                                                     OpDecorate %480 DescriptorSet 480 
                                                     OpDecorate %480 Binding 480 
                                                     OpDecorate %481 RelaxedPrecision 
                                                     OpDecorate %483 Location 483 
                                                     OpDecorate %486 RelaxedPrecision 
                                                     OpDecorate %487 RelaxedPrecision 
                                                     OpDecorate %487 Location 487 
                                                     OpDecorate %488 RelaxedPrecision 
                                                     OpDecorate %489 RelaxedPrecision 
                                                     OpDecorate %502 RelaxedPrecision 
                                                     OpDecorate %546 RelaxedPrecision 
                                                     OpDecorate %548 RelaxedPrecision 
                                                     OpDecorate %552 RelaxedPrecision 
                                                     OpDecorate %553 RelaxedPrecision 
                                                     OpDecorate %553 DescriptorSet 553 
                                                     OpDecorate %553 Binding 553 
                                                     OpDecorate %554 RelaxedPrecision 
                                                     OpDecorate %555 Location 555 
                                                     OpDecorate %558 RelaxedPrecision 
                                                     OpDecorate %559 RelaxedPrecision 
                                                     OpDecorate %564 RelaxedPrecision 
                                                     OpDecorate %564 Location 564 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypePointer Private %6 
                                 Private f32* %8 = OpVariable Private 
                                              %9 = OpTypeInt 32 0 
                                         u32 %10 = OpConstant 4 
                                             %11 = OpTypeArray %6 %10 
                                             %12 = OpTypeArray %6 %10 
                                             %13 = OpTypeArray %6 %10 
                                             %14 = OpTypeStruct %11 %12 %13 
                                             %15 = OpTypePointer Uniform %14 
   Uniform struct {f32[4]; f32[4]; f32[4];}* %16 = OpVariable Uniform 
                                             %17 = OpTypeInt 32 1 
                                         i32 %18 = OpConstant 1 
                                         i32 %19 = OpConstant 0 
                                             %20 = OpTypePointer Uniform %6 
                                         i32 %23 = OpConstant 2 
                                             %32 = OpTypeVector %6 3 
                                             %33 = OpTypePointer Private %32 
                              Private f32_3* %34 = OpVariable Private 
                                         u32 %40 = OpConstant 0 
                                             %46 = OpTypeBool 
                                             %47 = OpTypeVector %46 3 
                                             %48 = OpTypePointer Private %47 
                             Private bool_3* %49 = OpVariable Private 
                                             %50 = OpTypeVector %6 4 
                                             %51 = OpTypePointer Input %50 
                                Input f32_4* %52 = OpVariable Input 
                                             %53 = OpTypePointer Input %6 
                                             %61 = OpTypePointer Private %46 
                               Private bool* %62 = OpVariable Private 
                               Private bool* %77 = OpVariable Private 
                                         u32 %78 = OpConstant 1 
                                Private f32* %87 = OpVariable Private 
                                         i32 %90 = OpConstant 3 
                                            %115 = OpTypePointer Private %50 
                             Private f32_4* %116 = OpVariable Private 
                             Private f32_4* %120 = OpVariable Private 
                                        f32 %134 = OpConstant 3.67402E-40 
                               Private f32* %145 = OpVariable Private 
                                        u32 %158 = OpConstant 2 
                                        f32 %160 = OpConstant 3.67402E-40 
                                      f32_4 %161 = OpConstantComposite %160 %160 %160 %160 
                                            %164 = OpTypeVector %46 4 
                                            %166 = OpTypeVector %46 2 
                                            %170 = OpTypeVector %17 2 
                                            %171 = OpTypePointer Private %170 
                             Private i32_2* %172 = OpVariable Private 
                                            %173 = OpTypePointer Function %170 
                                      i32_2 %179 = OpConstantComposite %19 %18 
                                      i32_2 %181 = OpConstantComposite %90 %23 
                                            %183 = OpTypePointer Function %17 
                                            %189 = OpTypePointer Private %17 
                                            %213 = OpTypeVector %6 2 
                                            %214 = OpTypePointer Function %213 
                                            %228 = OpTypePointer Private %213 
                             Private f32_2* %229 = OpVariable Private 
                             Private f32_2* %233 = OpVariable Private 
                             Private f32_3* %285 = OpVariable Private 
                               Private f32* %304 = OpVariable Private 
                               Private f32* %312 = OpVariable Private 
                            Private bool_3* %327 = OpVariable Private 
                               Private f32* %341 = OpVariable Private 
                                        f32 %345 = OpConstant 3.67402E-40 
                                            %361 = OpTypePointer Function %6 
                              Private bool* %400 = OpVariable Private 
                                            %426 = OpTypePointer Private %166 
                            Private bool_2* %427 = OpVariable Private 
                                            %434 = OpTypePointer Function %46 
                             Private f32_4* %476 = OpVariable Private 
                                            %477 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %478 = OpTypeSampledImage %477 
                                            %479 = OpTypePointer UniformConstant %478 
UniformConstant read_only Texture2DSampled* %480 = OpVariable UniformConstant 
                                            %482 = OpTypePointer Input %213 
                               Input f32_2* %483 = OpVariable Input 
                               Input f32_4* %487 = OpVariable Input 
                                        u32 %491 = OpConstant 3 
                               Private f32* %502 = OpVariable Private 
                               Private f32* %552 = OpVariable Private 
UniformConstant read_only Texture2DSampled* %553 = OpVariable UniformConstant 
                               Input f32_2* %555 = OpVariable Input 
                                            %563 = OpTypePointer Output %50 
                              Output f32_4* %564 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                            Function i32_2* %174 = OpVariable Function 
                              Function i32* %184 = OpVariable Function 
                            Function f32_2* %215 = OpVariable Function 
                            Function f32_2* %258 = OpVariable Function 
                              Function f32* %362 = OpVariable Function 
                              Function f32* %383 = OpVariable Function 
                              Function f32* %391 = OpVariable Function 
                              Function f32* %409 = OpVariable Function 
                             Function bool* %435 = OpVariable Function 
                             Function bool* %448 = OpVariable Function 
                              Function f32* %468 = OpVariable Function 
                              Function f32* %495 = OpVariable Function 
                              Function f32* %503 = OpVariable Function 
                              Function f32* %542 = OpVariable Function 
                                Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                         f32 %22 = OpLoad %21 
                                Uniform f32* %24 = OpAccessChain %16 %18 %23 
                                         f32 %25 = OpLoad %24 
                                         f32 %26 = OpFAdd %22 %25 
                                                     OpStore %8 %26 
                                         f32 %27 = OpLoad %8 
                                         f32 %28 = OpFNegate %27 
                                Uniform f32* %29 = OpAccessChain %16 %23 %23 
                                         f32 %30 = OpLoad %29 
                                         f32 %31 = OpFAdd %28 %30 
                                                     OpStore %8 %31 
                                Uniform f32* %35 = OpAccessChain %16 %18 %19 
                                         f32 %36 = OpLoad %35 
                                Uniform f32* %37 = OpAccessChain %16 %23 %19 
                                         f32 %38 = OpLoad %37 
                                         f32 %39 = OpFAdd %36 %38 
                                Private f32* %41 = OpAccessChain %34 %40 
                                                     OpStore %41 %39 
                                         f32 %42 = OpLoad %8 
                                Private f32* %43 = OpAccessChain %34 %40 
                                         f32 %44 = OpLoad %43 
                                         f32 %45 = OpFAdd %42 %44 
                                                     OpStore %8 %45 
                                  Input f32* %54 = OpAccessChain %52 %40 
                                         f32 %55 = OpLoad %54 
                                Private f32* %56 = OpAccessChain %34 %40 
                                         f32 %57 = OpLoad %56 
                                        bool %58 = OpFOrdGreaterThanEqual %55 %57 
                                      bool_3 %59 = OpLoad %49 
                                      bool_3 %60 = OpCompositeInsert %58 %59 0 
                                                     OpStore %49 %60 
                                         f32 %63 = OpLoad %8 
                                  Input f32* %64 = OpAccessChain %52 %40 
                                         f32 %65 = OpLoad %64 
                                        bool %66 = OpFOrdGreaterThanEqual %63 %65 
                                                     OpStore %62 %66 
                                        bool %67 = OpLoad %62 
                                      bool_3 %68 = OpLoad %49 
                                        bool %69 = OpCompositeExtract %68 0 
                                        bool %70 = OpLogicalAnd %67 %69 
                                                     OpStore %62 %70 
                                Uniform f32* %71 = OpAccessChain %16 %18 %18 
                                         f32 %72 = OpLoad %71 
                                Uniform f32* %73 = OpAccessChain %16 %23 %18 
                                         f32 %74 = OpLoad %73 
                                         f32 %75 = OpFAdd %72 %74 
                                Private f32* %76 = OpAccessChain %34 %40 
                                                     OpStore %76 %75 
                                  Input f32* %79 = OpAccessChain %52 %78 
                                         f32 %80 = OpLoad %79 
                                Private f32* %81 = OpAccessChain %34 %40 
                                         f32 %82 = OpLoad %81 
                                        bool %83 = OpFOrdGreaterThanEqual %80 %82 
                                                     OpStore %77 %83 
                                        bool %84 = OpLoad %77 
                                        bool %85 = OpLoad %62 
                                        bool %86 = OpLogicalAnd %84 %85 
                                                     OpStore %62 %86 
                                Uniform f32* %88 = OpAccessChain %16 %18 %18 
                                         f32 %89 = OpLoad %88 
                                Uniform f32* %91 = OpAccessChain %16 %18 %90 
                                         f32 %92 = OpLoad %91 
                                         f32 %93 = OpFAdd %89 %92 
                                                     OpStore %87 %93 
                                         f32 %94 = OpLoad %87 
                                         f32 %95 = OpFNegate %94 
                                Uniform f32* %96 = OpAccessChain %16 %23 %90 
                                         f32 %97 = OpLoad %96 
                                         f32 %98 = OpFAdd %95 %97 
                                                     OpStore %87 %98 
                                         f32 %99 = OpLoad %87 
                               Private f32* %100 = OpAccessChain %34 %40 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFAdd %99 %101 
                               Private f32* %103 = OpAccessChain %34 %40 
                                                     OpStore %103 %102 
                               Private f32* %104 = OpAccessChain %34 %40 
                                        f32 %105 = OpLoad %104 
                                 Input f32* %106 = OpAccessChain %52 %78 
                                        f32 %107 = OpLoad %106 
                                       bool %108 = OpFOrdGreaterThanEqual %105 %107 
                                     bool_3 %109 = OpLoad %49 
                                     bool_3 %110 = OpCompositeInsert %108 %109 0 
                                                     OpStore %49 %110 
                                     bool_3 %111 = OpLoad %49 
                                       bool %112 = OpCompositeExtract %111 0 
                                       bool %113 = OpLoad %62 
                                       bool %114 = OpLogicalAnd %112 %113 
                                                     OpStore %62 %114 
                               Uniform f32* %117 = OpAccessChain %16 %18 %19 
                                        f32 %118 = OpLoad %117 
                               Private f32* %119 = OpAccessChain %116 %40 
                                                     OpStore %119 %118 
                               Uniform f32* %121 = OpAccessChain %16 %18 %23 
                                        f32 %122 = OpLoad %121 
                               Private f32* %123 = OpAccessChain %120 %40 
                                                     OpStore %123 %122 
                                 Input f32* %124 = OpAccessChain %52 %40 
                                        f32 %125 = OpLoad %124 
                               Uniform f32* %126 = OpAccessChain %16 %23 %19 
                                        f32 %127 = OpLoad %126 
                                        f32 %128 = OpFNegate %127 
                                        f32 %129 = OpFAdd %125 %128 
                               Private f32* %130 = OpAccessChain %34 %40 
                                                     OpStore %130 %129 
                               Uniform f32* %131 = OpAccessChain %16 %23 %23 
                                        f32 %132 = OpLoad %131 
                                        f32 %133 = OpFNegate %132 
                                        f32 %135 = OpFMul %133 %134 
                               Private f32* %136 = OpAccessChain %34 %40 
                                        f32 %137 = OpLoad %136 
                                        f32 %138 = OpFAdd %135 %137 
                               Private f32* %139 = OpAccessChain %34 %40 
                                                     OpStore %139 %138 
                               Uniform f32* %140 = OpAccessChain %16 %23 %19 
                                        f32 %141 = OpLoad %140 
                               Uniform f32* %142 = OpAccessChain %16 %23 %23 
                                        f32 %143 = OpLoad %142 
                                        f32 %144 = OpFAdd %141 %143 
                                                     OpStore %87 %144 
                                 Input f32* %146 = OpAccessChain %52 %78 
                                        f32 %147 = OpLoad %146 
                               Uniform f32* %148 = OpAccessChain %16 %23 %18 
                                        f32 %149 = OpLoad %148 
                                        f32 %150 = OpFNegate %149 
                                        f32 %151 = OpFAdd %147 %150 
                                                     OpStore %145 %151 
                               Uniform f32* %152 = OpAccessChain %16 %23 %90 
                                        f32 %153 = OpLoad %152 
                                        f32 %154 = OpFNegate %153 
                                        f32 %155 = OpFMul %154 %134 
                                        f32 %156 = OpLoad %145 
                                        f32 %157 = OpFAdd %155 %156 
                               Private f32* %159 = OpAccessChain %34 %158 
                                                     OpStore %159 %157 
                                      f32_3 %162 = OpLoad %34 
                                      f32_4 %163 = OpVectorShuffle %162 %162 0 0 2 2 
                                     bool_4 %165 = OpFOrdGreaterThanEqual %161 %163 
                                     bool_2 %167 = OpVectorShuffle %165 %165 0 2 
                                     bool_3 %168 = OpLoad %49 
                                     bool_3 %169 = OpVectorShuffle %168 %167 3 1 4 
                                                     OpStore %49 %169 
                                     bool_3 %175 = OpLoad %49 
                                       bool %176 = OpCompositeExtract %175 2 
                                                     OpSelectionMerge %178 None 
                                                     OpBranchConditional %176 %177 %180 
                                            %177 = OpLabel 
                                                     OpStore %174 %179 
                                                     OpBranch %178 
                                            %180 = OpLabel 
                                                     OpStore %174 %181 
                                                     OpBranch %178 
                                            %178 = OpLabel 
                                      i32_2 %182 = OpLoad %174 
                                                     OpStore %172 %182 
                                     bool_3 %185 = OpLoad %49 
                                       bool %186 = OpCompositeExtract %185 0 
                                                     OpSelectionMerge %188 None 
                                                     OpBranchConditional %186 %187 %192 
                                            %187 = OpLabel 
                               Private i32* %190 = OpAccessChain %172 %40 
                                        i32 %191 = OpLoad %190 
                                                     OpStore %184 %191 
                                                     OpBranch %188 
                                            %192 = OpLabel 
                               Private i32* %193 = OpAccessChain %172 %78 
                                        i32 %194 = OpLoad %193 
                                                     OpStore %184 %194 
                                                     OpBranch %188 
                                            %188 = OpLabel 
                                        i32 %195 = OpLoad %184 
                               Private i32* %196 = OpAccessChain %172 %40 
                                                     OpStore %196 %195 
                                        f32 %197 = OpLoad %87 
                               Private i32* %198 = OpAccessChain %172 %40 
                                        i32 %199 = OpLoad %198 
                               Uniform f32* %200 = OpAccessChain %16 %19 %199 
                                        f32 %201 = OpLoad %200 
                                        f32 %202 = OpFNegate %201 
                                        f32 %203 = OpFAdd %197 %202 
                               Private f32* %204 = OpAccessChain %120 %78 
                                                     OpStore %204 %203 
                               Uniform f32* %205 = OpAccessChain %16 %23 %19 
                                        f32 %206 = OpLoad %205 
                               Private i32* %207 = OpAccessChain %172 %40 
                                        i32 %208 = OpLoad %207 
                               Uniform f32* %209 = OpAccessChain %16 %19 %208 
                                        f32 %210 = OpLoad %209 
                                        f32 %211 = OpFAdd %206 %210 
                               Private f32* %212 = OpAccessChain %116 %78 
                                                     OpStore %212 %211 
                                     bool_3 %216 = OpLoad %49 
                                       bool %217 = OpCompositeExtract %216 0 
                                                     OpSelectionMerge %219 None 
                                                     OpBranchConditional %217 %218 %222 
                                            %218 = OpLabel 
                                      f32_4 %220 = OpLoad %116 
                                      f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                                     OpStore %215 %221 
                                                     OpBranch %219 
                                            %222 = OpLabel 
                                      f32_4 %223 = OpLoad %120 
                                      f32_2 %224 = OpVectorShuffle %223 %223 0 1 
                                                     OpStore %215 %224 
                                                     OpBranch %219 
                                            %219 = OpLabel 
                                      f32_2 %225 = OpLoad %215 
                                      f32_4 %226 = OpLoad %120 
                                      f32_4 %227 = OpVectorShuffle %226 %225 4 5 2 3 
                                                     OpStore %120 %227 
                               Uniform f32* %230 = OpAccessChain %16 %18 %18 
                                        f32 %231 = OpLoad %230 
                               Private f32* %232 = OpAccessChain %229 %40 
                                                     OpStore %232 %231 
                               Uniform f32* %234 = OpAccessChain %16 %18 %90 
                                        f32 %235 = OpLoad %234 
                               Private f32* %236 = OpAccessChain %233 %40 
                                                     OpStore %236 %235 
                               Uniform f32* %237 = OpAccessChain %16 %23 %18 
                                        f32 %238 = OpLoad %237 
                               Uniform f32* %239 = OpAccessChain %16 %23 %90 
                                        f32 %240 = OpLoad %239 
                                        f32 %241 = OpFAdd %238 %240 
                                                     OpStore %87 %241 
                                        f32 %242 = OpLoad %87 
                               Private i32* %243 = OpAccessChain %172 %40 
                                        i32 %244 = OpLoad %243 
                               Uniform f32* %245 = OpAccessChain %16 %19 %244 
                                        f32 %246 = OpLoad %245 
                                        f32 %247 = OpFNegate %246 
                                        f32 %248 = OpFAdd %242 %247 
                               Private f32* %249 = OpAccessChain %233 %78 
                                                     OpStore %249 %248 
                               Uniform f32* %250 = OpAccessChain %16 %23 %18 
                                        f32 %251 = OpLoad %250 
                               Private i32* %252 = OpAccessChain %172 %40 
                                        i32 %253 = OpLoad %252 
                               Uniform f32* %254 = OpAccessChain %16 %19 %253 
                                        f32 %255 = OpLoad %254 
                                        f32 %256 = OpFAdd %251 %255 
                               Private f32* %257 = OpAccessChain %229 %78 
                                                     OpStore %257 %256 
                                     bool_3 %259 = OpLoad %49 
                                       bool %260 = OpCompositeExtract %259 2 
                                                     OpSelectionMerge %262 None 
                                                     OpBranchConditional %260 %261 %264 
                                            %261 = OpLabel 
                                      f32_2 %263 = OpLoad %229 
                                                     OpStore %258 %263 
                                                     OpBranch %262 
                                            %264 = OpLabel 
                                      f32_2 %265 = OpLoad %233 
                                                     OpStore %258 %265 
                                                     OpBranch %262 
                                            %262 = OpLabel 
                                      f32_2 %266 = OpLoad %258 
                                      f32_4 %267 = OpLoad %120 
                                      f32_4 %268 = OpVectorShuffle %267 %266 0 1 4 5 
                                                     OpStore %120 %268 
                                      f32_4 %269 = OpLoad %120 
                                      f32_2 %270 = OpVectorShuffle %269 %269 0 2 
                                      f32_2 %271 = OpFNegate %270 
                               Private i32* %272 = OpAccessChain %172 %40 
                                        i32 %273 = OpLoad %272 
                               Uniform f32* %274 = OpAccessChain %16 %19 %273 
                                        f32 %275 = OpLoad %274 
                                      f32_2 %276 = OpCompositeConstruct %275 %275 
                                      f32_2 %277 = OpFAdd %271 %276 
                                      f32_4 %278 = OpLoad %116 
                                      f32_4 %279 = OpVectorShuffle %278 %277 4 5 2 3 
                                                     OpStore %116 %279 
                               Private f32* %280 = OpAccessChain %116 %40 
                                        f32 %281 = OpLoad %280 
                               Private f32* %282 = OpAccessChain %116 %78 
                                        f32 %283 = OpLoad %282 
                                        f32 %284 = OpFDiv %281 %283 
                                                     OpStore %87 %284 
                                      f32_4 %286 = OpLoad %120 
                                      f32_2 %287 = OpVectorShuffle %286 %286 1 3 
                                      f32_2 %288 = OpFNegate %287 
                                      f32_4 %289 = OpLoad %52 
                                      f32_2 %290 = OpVectorShuffle %289 %289 0 1 
                                      f32_2 %291 = OpFAdd %288 %290 
                                      f32_3 %292 = OpLoad %285 
                                      f32_3 %293 = OpVectorShuffle %292 %291 3 4 2 
                                                     OpStore %285 %293 
                                        f32 %294 = OpLoad %87 
                               Private f32* %295 = OpAccessChain %285 %78 
                                        f32 %296 = OpLoad %295 
                                        f32 %297 = OpFMul %294 %296 
                               Private f32* %298 = OpAccessChain %285 %158 
                                                     OpStore %298 %297 
                                      f32_3 %299 = OpLoad %285 
                                      f32_2 %300 = OpVectorShuffle %299 %299 0 2 
                                      f32_3 %301 = OpLoad %285 
                                      f32_2 %302 = OpVectorShuffle %301 %301 0 2 
                                        f32 %303 = OpDot %300 %302 
                                                     OpStore %87 %303 
                                      f32_3 %305 = OpLoad %285 
                                      f32_2 %306 = OpVectorShuffle %305 %305 0 1 
                                      f32_3 %307 = OpLoad %285 
                                      f32_2 %308 = OpVectorShuffle %307 %307 0 1 
                                        f32 %309 = OpDot %306 %308 
                                                     OpStore %304 %309 
                                        f32 %310 = OpLoad %304 
                                        f32 %311 = OpExtInst %1 31 %310 
                                                     OpStore %304 %311 
                                        f32 %313 = OpLoad %304 
                               Private i32* %314 = OpAccessChain %172 %40 
                                        i32 %315 = OpLoad %314 
                               Uniform f32* %316 = OpAccessChain %16 %19 %315 
                                        f32 %317 = OpLoad %316 
                                        f32 %318 = OpFNegate %317 
                                        f32 %319 = OpFAdd %313 %318 
                                                     OpStore %312 %319 
                                        f32 %320 = OpLoad %87 
                                        f32 %321 = OpExtInst %1 31 %320 
                                                     OpStore %87 %321 
                               Private f32* %322 = OpAccessChain %116 %40 
                                        f32 %323 = OpLoad %322 
                                        f32 %324 = OpFNegate %323 
                                        f32 %325 = OpLoad %87 
                                        f32 %326 = OpFAdd %324 %325 
                                                     OpStore %87 %326 
                                      f32_4 %328 = OpLoad %116 
                                      f32_4 %329 = OpVectorShuffle %328 %328 0 1 0 0 
                                     bool_4 %330 = OpFOrdLessThan %161 %329 
                                     bool_2 %331 = OpVectorShuffle %330 %330 0 1 
                                     bool_3 %332 = OpLoad %327 
                                     bool_3 %333 = OpVectorShuffle %332 %331 3 4 2 
                                                     OpStore %327 %333 
                                     bool_3 %334 = OpLoad %327 
                                       bool %335 = OpCompositeExtract %334 1 
                                     bool_3 %336 = OpLoad %327 
                                       bool %337 = OpCompositeExtract %336 0 
                                       bool %338 = OpLogicalAnd %335 %337 
                                     bool_3 %339 = OpLoad %327 
                                     bool_3 %340 = OpCompositeInsert %338 %339 0 
                                                     OpStore %327 %340 
                                 Input f32* %342 = OpAccessChain %52 %40 
                                        f32 %343 = OpLoad %342 
                                        f32 %344 = OpDPdx %343 
                                                     OpStore %341 %344 
                                        f32 %346 = OpLoad %341 
                                        f32 %347 = OpExtInst %1 4 %346 
                                        f32 %348 = OpFDiv %345 %347 
                                                     OpStore %341 %348 
                                        f32 %349 = OpLoad %87 
                                        f32 %350 = OpLoad %341 
                                        f32 %351 = OpFMul %349 %350 
                                        f32 %352 = OpFAdd %351 %134 
                                                     OpStore %87 %352 
                                        f32 %353 = OpLoad %87 
                                        f32 %354 = OpExtInst %1 43 %353 %160 %345 
                                                     OpStore %87 %354 
                                        f32 %355 = OpLoad %312 
                                        f32 %356 = OpLoad %341 
                                        f32 %357 = OpFMul %355 %356 
                                        f32 %358 = OpFAdd %357 %134 
                                                     OpStore %341 %358 
                                        f32 %359 = OpLoad %341 
                                        f32 %360 = OpExtInst %1 43 %359 %160 %345 
                                                     OpStore %341 %360 
                                     bool_3 %363 = OpLoad %327 
                                       bool %364 = OpCompositeExtract %363 0 
                                                     OpSelectionMerge %366 None 
                                                     OpBranchConditional %364 %365 %368 
                                            %365 = OpLabel 
                                        f32 %367 = OpLoad %87 
                                                     OpStore %362 %367 
                                                     OpBranch %366 
                                            %368 = OpLabel 
                                                     OpStore %362 %345 
                                                     OpBranch %366 
                                            %366 = OpLabel 
                                        f32 %369 = OpLoad %362 
                                                     OpStore %87 %369 
                                      f32_4 %370 = OpLoad %120 
                                      f32_4 %371 = OpVectorShuffle %370 %370 0 0 2 0 
                                     bool_4 %372 = OpFOrdLessThan %161 %371 
                                     bool_2 %373 = OpVectorShuffle %372 %372 0 2 
                                     bool_3 %374 = OpLoad %327 
                                     bool_3 %375 = OpVectorShuffle %374 %373 3 1 4 
                                                     OpStore %327 %375 
                                     bool_3 %376 = OpLoad %327 
                                       bool %377 = OpCompositeExtract %376 2 
                                     bool_3 %378 = OpLoad %327 
                                       bool %379 = OpCompositeExtract %378 0 
                                       bool %380 = OpLogicalOr %377 %379 
                                     bool_3 %381 = OpLoad %327 
                                     bool_3 %382 = OpCompositeInsert %380 %381 0 
                                                     OpStore %327 %382 
                                     bool_3 %384 = OpLoad %327 
                                       bool %385 = OpCompositeExtract %384 0 
                                                     OpSelectionMerge %387 None 
                                                     OpBranchConditional %385 %386 %389 
                                            %386 = OpLabel 
                                        f32 %388 = OpLoad %87 
                                                     OpStore %383 %388 
                                                     OpBranch %387 
                                            %389 = OpLabel 
                                                     OpStore %383 %160 
                                                     OpBranch %387 
                                            %387 = OpLabel 
                                        f32 %390 = OpLoad %383 
                                                     OpStore %87 %390 
                                     bool_3 %392 = OpLoad %327 
                                       bool %393 = OpCompositeExtract %392 0 
                                                     OpSelectionMerge %395 None 
                                                     OpBranchConditional %393 %394 %397 
                                            %394 = OpLabel 
                                        f32 %396 = OpLoad %341 
                                                     OpStore %391 %396 
                                                     OpBranch %395 
                                            %397 = OpLabel 
                                                     OpStore %391 %160 
                                                     OpBranch %395 
                                            %395 = OpLabel 
                                        f32 %398 = OpLoad %391 
                               Private f32* %399 = OpAccessChain %116 %40 
                                                     OpStore %399 %398 
                               Private f32* %401 = OpAccessChain %116 %40 
                                        f32 %402 = OpLoad %401 
                                       bool %403 = OpFOrdEqual %402 %160 
                                                     OpStore %400 %403 
                               Private f32* %404 = OpAccessChain %116 %40 
                                        f32 %405 = OpLoad %404 
                                        f32 %406 = OpFNegate %405 
                                        f32 %407 = OpFAdd %406 %345 
                               Private f32* %408 = OpAccessChain %116 %40 
                                                     OpStore %408 %407 
                                       bool %410 = OpLoad %400 
                                                     OpSelectionMerge %412 None 
                                                     OpBranchConditional %410 %411 %414 
                                            %411 = OpLabel 
                                        f32 %413 = OpLoad %87 
                                                     OpStore %409 %413 
                                                     OpBranch %412 
                                            %414 = OpLabel 
                               Private f32* %415 = OpAccessChain %116 %40 
                                        f32 %416 = OpLoad %415 
                                                     OpStore %409 %416 
                                                     OpBranch %412 
                                            %412 = OpLabel 
                                        f32 %417 = OpLoad %409 
                                                     OpStore %87 %417 
                                      f32_4 %418 = OpLoad %120 
                                      f32_4 %419 = OpVectorShuffle %418 %418 1 3 1 1 
                                      f32_4 %420 = OpLoad %52 
                                      f32_4 %421 = OpVectorShuffle %420 %420 0 1 0 0 
                                     bool_4 %422 = OpFOrdGreaterThanEqual %419 %421 
                                     bool_2 %423 = OpVectorShuffle %422 %422 0 1 
                                     bool_3 %424 = OpLoad %327 
                                     bool_3 %425 = OpVectorShuffle %424 %423 3 4 2 
                                                     OpStore %327 %425 
                                      f32_4 %428 = OpLoad %52 
                                      f32_4 %429 = OpVectorShuffle %428 %428 0 1 0 1 
                                      f32_4 %430 = OpLoad %120 
                                      f32_4 %431 = OpVectorShuffle %430 %430 1 3 1 3 
                                     bool_4 %432 = OpFOrdGreaterThanEqual %429 %431 
                                     bool_2 %433 = OpVectorShuffle %432 %432 0 1 
                                                     OpStore %427 %433 
                                     bool_3 %436 = OpLoad %49 
                                       bool %437 = OpCompositeExtract %436 0 
                                                     OpSelectionMerge %439 None 
                                                     OpBranchConditional %437 %438 %442 
                                            %438 = OpLabel 
                                     bool_3 %440 = OpLoad %327 
                                       bool %441 = OpCompositeExtract %440 0 
                                                     OpStore %435 %441 
                                                     OpBranch %439 
                                            %442 = OpLabel 
                                     bool_2 %443 = OpLoad %427 
                                       bool %444 = OpCompositeExtract %443 0 
                                                     OpStore %435 %444 
                                                     OpBranch %439 
                                            %439 = OpLabel 
                                       bool %445 = OpLoad %435 
                                     bool_3 %446 = OpLoad %49 
                                     bool_3 %447 = OpCompositeInsert %445 %446 0 
                                                     OpStore %49 %447 
                                     bool_3 %449 = OpLoad %49 
                                       bool %450 = OpCompositeExtract %449 2 
                                                     OpSelectionMerge %452 None 
                                                     OpBranchConditional %450 %451 %455 
                                            %451 = OpLabel 
                                     bool_3 %453 = OpLoad %327 
                                       bool %454 = OpCompositeExtract %453 1 
                                                     OpStore %448 %454 
                                                     OpBranch %452 
                                            %455 = OpLabel 
                                     bool_2 %456 = OpLoad %427 
                                       bool %457 = OpCompositeExtract %456 1 
                                                     OpStore %448 %457 
                                                     OpBranch %452 
                                            %452 = OpLabel 
                                       bool %458 = OpLoad %448 
                                     bool_3 %459 = OpLoad %49 
                                     bool_3 %460 = OpCompositeInsert %458 %459 2 
                                                     OpStore %49 %460 
                                     bool_3 %461 = OpLoad %49 
                                       bool %462 = OpCompositeExtract %461 2 
                                     bool_3 %463 = OpLoad %49 
                                       bool %464 = OpCompositeExtract %463 0 
                                       bool %465 = OpLogicalAnd %462 %464 
                                     bool_3 %466 = OpLoad %49 
                                     bool_3 %467 = OpCompositeInsert %465 %466 0 
                                                     OpStore %49 %467 
                                     bool_3 %469 = OpLoad %49 
                                       bool %470 = OpCompositeExtract %469 0 
                                                     OpSelectionMerge %472 None 
                                                     OpBranchConditional %470 %471 %474 
                                            %471 = OpLabel 
                                        f32 %473 = OpLoad %87 
                                                     OpStore %468 %473 
                                                     OpBranch %472 
                                            %474 = OpLabel 
                                                     OpStore %468 %345 
                                                     OpBranch %472 
                                            %472 = OpLabel 
                                        f32 %475 = OpLoad %468 
                                                     OpStore %87 %475 
                 read_only Texture2DSampled %481 = OpLoad %480 
                                      f32_2 %484 = OpLoad %483 
                                      f32_4 %485 = OpImageSampleImplicitLod %481 %484 
                                                     OpStore %476 %485 
                                      f32_4 %486 = OpLoad %476 
                                      f32_4 %488 = OpLoad %487 
                                      f32_4 %489 = OpFMul %486 %488 
                                                     OpStore %116 %489 
                                        f32 %490 = OpLoad %87 
                               Private f32* %492 = OpAccessChain %116 %491 
                                        f32 %493 = OpLoad %492 
                                        f32 %494 = OpFMul %490 %493 
                                                     OpStore %87 %494 
                                       bool %496 = OpLoad %62 
                                                     OpSelectionMerge %498 None 
                                                     OpBranchConditional %496 %497 %499 
                                            %497 = OpLabel 
                                                     OpStore %495 %160 
                                                     OpBranch %498 
                                            %499 = OpLabel 
                                        f32 %500 = OpLoad %87 
                                                     OpStore %495 %500 
                                                     OpBranch %498 
                                            %498 = OpLabel 
                                        f32 %501 = OpLoad %495 
                                                     OpStore %8 %501 
                                     bool_3 %504 = OpLoad %49 
                                       bool %505 = OpCompositeExtract %504 0 
                                                     OpSelectionMerge %507 None 
                                                     OpBranchConditional %505 %506 %509 
                                            %506 = OpLabel 
                                        f32 %508 = OpLoad %87 
                                                     OpStore %503 %508 
                                                     OpBranch %507 
                                            %509 = OpLabel 
                                        f32 %510 = OpLoad %8 
                                                     OpStore %503 %510 
                                                     OpBranch %507 
                                            %507 = OpLabel 
                                        f32 %511 = OpLoad %503 
                                                     OpStore %502 %511 
                               Uniform f32* %512 = OpAccessChain %16 %18 %19 
                                        f32 %513 = OpLoad %512 
                                       bool %514 = OpFOrdLessThan %160 %513 
                                                     OpStore %62 %514 
                               Uniform f32* %515 = OpAccessChain %16 %18 %18 
                                        f32 %516 = OpLoad %515 
                                       bool %517 = OpFOrdLessThan %160 %516 
                                     bool_3 %518 = OpLoad %49 
                                     bool_3 %519 = OpCompositeInsert %517 %518 0 
                                                     OpStore %49 %519 
                                     bool_3 %520 = OpLoad %49 
                                       bool %521 = OpCompositeExtract %520 0 
                                       bool %522 = OpLoad %62 
                                       bool %523 = OpLogicalOr %521 %522 
                                                     OpStore %62 %523 
                               Uniform f32* %524 = OpAccessChain %16 %18 %23 
                                        f32 %525 = OpLoad %524 
                                       bool %526 = OpFOrdLessThan %160 %525 
                                     bool_3 %527 = OpLoad %49 
                                     bool_3 %528 = OpCompositeInsert %526 %527 0 
                                                     OpStore %49 %528 
                                     bool_3 %529 = OpLoad %49 
                                       bool %530 = OpCompositeExtract %529 0 
                                       bool %531 = OpLoad %62 
                                       bool %532 = OpLogicalOr %530 %531 
                                                     OpStore %62 %532 
                               Uniform f32* %533 = OpAccessChain %16 %18 %90 
                                        f32 %534 = OpLoad %533 
                                       bool %535 = OpFOrdLessThan %160 %534 
                                     bool_3 %536 = OpLoad %49 
                                     bool_3 %537 = OpCompositeInsert %535 %536 0 
                                                     OpStore %49 %537 
                                     bool_3 %538 = OpLoad %49 
                                       bool %539 = OpCompositeExtract %538 0 
                                       bool %540 = OpLoad %62 
                                       bool %541 = OpLogicalOr %539 %540 
                                                     OpStore %62 %541 
                                       bool %543 = OpLoad %62 
                                                     OpSelectionMerge %545 None 
                                                     OpBranchConditional %543 %544 %547 
                                            %544 = OpLabel 
                                        f32 %546 = OpLoad %502 
                                                     OpStore %542 %546 
                                                     OpBranch %545 
                                            %547 = OpLabel 
                                                     OpStore %542 %345 
                                                     OpBranch %545 
                                            %545 = OpLabel 
                                        f32 %548 = OpLoad %542 
                                                     OpStore %8 %548 
                                        f32 %549 = OpLoad %8 
                                        f32 %550 = OpLoad %87 
                                        f32 %551 = OpFMul %549 %550 
                                                     OpStore %8 %551 
                 read_only Texture2DSampled %554 = OpLoad %553 
                                      f32_2 %556 = OpLoad %555 
                                      f32_4 %557 = OpImageSampleImplicitLod %554 %556 
                                        f32 %558 = OpCompositeExtract %557 3 
                                                     OpStore %552 %558 
                                        f32 %559 = OpLoad %552 
                                        f32 %560 = OpLoad %8 
                                        f32 %561 = OpFMul %559 %560 
                               Private f32* %562 = OpAccessChain %116 %491 
                                                     OpStore %562 %561 
                                      f32_4 %565 = OpLoad %116 
                                                     OpStore %564 %565 
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
Fallback "Hidden/Internal-GUITextureClip"
}