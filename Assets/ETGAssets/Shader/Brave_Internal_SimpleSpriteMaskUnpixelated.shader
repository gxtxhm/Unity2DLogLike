//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/SimpleSpriteMaskUnpixelated" {
Properties {
_MainTex ("Base (RGB) Trans (A)", 2D) = "white" { }
_SelfIllumination ("Min Brightness", Float) = 0
_LuminanceCutoff ("Luminance Cutoff", Float) = 0
_ValueMaximum ("Max Value", Float) = 1
_ValueMinimum ("Min value", Float) = 1
_AtlasData ("Atlas Data", Vector) = (1,1,1,1)
_MaterialSourceIsSinglePassOutline ("Single Pass Outline", Float) = 0
}
SubShader {
 LOD 110
 Tags { "EnemyProjectile" = "EnemyProjectile" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" }
 Pass {
  LOD 110
  Tags { "EnemyProjectile" = "EnemyProjectile" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UnlitTilted" = "UnlitTilted" }
  ZTest Always
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 20859
Program "vp" {
SubProgram "d3d11 " {
Keywords { "OUTLINE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_OFF" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FrameCount;
uniform 	float _TimePerFrame;
uniform 	float _TimeOffset;
uniform 	float _ForcedFrame;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat1.x = in_POSITION0.z + -0.0625;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _FrameCount * _TimePerFrame;
    u_xlat0.x = u_xlat0.x * 1000.0 + _Time.y;
    u_xlat0.x = u_xlat0.x + (-_TimeOffset);
    u_xlat0.x = u_xlat0.x / _TimePerFrame;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat2 = u_xlat0.x * _FrameCount;
    u_xlatb2 = u_xlat2>=(-u_xlat2);
    u_xlat2 = (u_xlatb2) ? _FrameCount : (-_FrameCount);
    u_xlat4 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2 = _FrameCount + -1.0;
    u_xlat0.x = min(u_xlat2, u_xlat0.x);
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat2 = roundEven(_ForcedFrame);
    u_xlatb4.xy = lessThan(vec4(0.0, -0.5, 0.0, -0.5), vec4(_FrameCount, _ForcedFrame, _FrameCount, _ForcedFrame)).xy;
    u_xlat0.x = (u_xlatb4.y) ? u_xlat2 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _FrameCount;
    u_xlat2 = float(1.0) / _FrameCount;
    u_xlat0.x = in_TEXCOORD1.x * u_xlat2 + u_xlat0.x;
    u_xlat0.y = in_TEXCOORD1.y;
    vs_TEXCOORD0.xy = (u_xlatb4.x) ? u_xlat0.xy : in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _LuminanceCutoff;
uniform 	float _ValueMaximum;
uniform 	float _ValueMinimum;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat10_0;
bool u_xlatb0;
float u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = u_xlat0<_LuminanceCutoff;
    u_xlat0 = (u_xlatb0) ? 0.0 : u_xlat10_0.w;
    u_xlat1 = u_xlat0 + -0.100000001;
    SV_Target0.w = u_xlat0;
    u_xlatb0 = u_xlat1<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.x = 1.0;
    SV_Target0.yz = vec2(_ValueMaximum, _ValueMinimum);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "OUTLINE_OFF" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 261
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %229 %242 %252 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpMemberDecorate %18 5 Offset 18 
                                                      OpMemberDecorate %18 6 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %229 Location 229 
                                                      OpDecorate %242 Location 242 
                                                      OpDecorate %252 Location 252 
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
                                              %18 = OpTypeStruct %7 %16 %17 %6 %6 %6 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32; f32; f32; f32;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                               Private f32_4* %35 = OpVariable Private 
                                          u32 %36 = OpConstant 2 
                                              %37 = OpTypePointer Input %6 
                                          f32 %40 = OpConstant 3.67402E-40 
                                          u32 %42 = OpConstant 0 
                                              %43 = OpTypePointer Private %6 
                                          i32 %45 = OpConstant 2 
                                          i32 %54 = OpConstant 3 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                              %91 = OpTypePointer Uniform %6 
                                          i32 %94 = OpConstant 4 
                                         f32 %101 = OpConstant 3.67402E-40 
                                         i32 %109 = OpConstant 5 
                                Private f32* %125 = OpVariable Private 
                                             %131 = OpTypeBool 
                                             %132 = OpTypePointer Private %131 
                               Private bool* %133 = OpVariable Private 
                                             %138 = OpTypePointer Function %6 
                                Private f32* %150 = OpVariable Private 
                                         f32 %151 = OpConstant 3.67402E-40 
                                         f32 %170 = OpConstant 3.67402E-40 
                                         f32 %175 = OpConstant 3.67402E-40 
                                         i32 %186 = OpConstant 6 
                                             %190 = OpTypeVector %131 2 
                                             %191 = OpTypePointer Private %190 
                             Private bool_2* %192 = OpVariable Private 
                                         f32 %193 = OpConstant 3.67402E-40 
                                       f32_4 %194 = OpConstantComposite %170 %193 %170 %193 
                                             %204 = OpTypeVector %131 4 
                                             %227 = OpTypeVector %6 2 
                                             %228 = OpTypePointer Input %227 
                                Input f32_2* %229 = OpVariable Input 
                                             %241 = OpTypePointer Output %227 
                               Output f32_2* %242 = OpVariable Output 
                                             %243 = OpTypePointer Function %227 
                                Input f32_2* %252 = OpVariable Input 
                                             %255 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %139 = OpVariable Function 
                               Function f32* %207 = OpVariable Function 
                             Function f32_2* %244 = OpVariable Function 
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
                                   Input f32* %38 = OpAccessChain %11 %36 
                                          f32 %39 = OpLoad %38 
                                          f32 %41 = OpFAdd %39 %40 
                                 Private f32* %44 = OpAccessChain %35 %42 
                                                      OpStore %44 %41 
                               Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpLoad %35 
                                        f32_4 %49 = OpVectorShuffle %48 %48 0 0 0 0 
                                        f32_4 %50 = OpFMul %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpFAdd %50 %51 
                                                      OpStore %9 %52 
                                        f32_4 %53 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %20 %22 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %53 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %20 %45 %22 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %35 %62 
                               Uniform f32_4* %63 = OpAccessChain %20 %45 %27 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %35 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %35 %69 
                               Uniform f32_4* %70 = OpAccessChain %20 %45 %45 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %35 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %35 %76 
                               Uniform f32_4* %82 = OpAccessChain %20 %45 %54 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %35 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %27 
                                                      OpStore %90 %88 
                                 Uniform f32* %92 = OpAccessChain %20 %54 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %95 = OpAccessChain %20 %94 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFMul %93 %96 
                                 Private f32* %98 = OpAccessChain %9 %42 
                                                      OpStore %98 %97 
                                 Private f32* %99 = OpAccessChain %9 %42 
                                         f32 %100 = OpLoad %99 
                                         f32 %102 = OpFMul %100 %101 
                                Uniform f32* %103 = OpAccessChain %20 %27 %77 
                                         f32 %104 = OpLoad %103 
                                         f32 %105 = OpFAdd %102 %104 
                                Private f32* %106 = OpAccessChain %9 %42 
                                                      OpStore %106 %105 
                                Private f32* %107 = OpAccessChain %9 %42 
                                         f32 %108 = OpLoad %107 
                                Uniform f32* %110 = OpAccessChain %20 %109 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFNegate %111 
                                         f32 %113 = OpFAdd %108 %112 
                                Private f32* %114 = OpAccessChain %9 %42 
                                                      OpStore %114 %113 
                                Private f32* %115 = OpAccessChain %9 %42 
                                         f32 %116 = OpLoad %115 
                                Uniform f32* %117 = OpAccessChain %20 %94 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFDiv %116 %118 
                                Private f32* %120 = OpAccessChain %9 %42 
                                                      OpStore %120 %119 
                                Private f32* %121 = OpAccessChain %9 %42 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpExtInst %1 8 %122 
                                Private f32* %124 = OpAccessChain %9 %42 
                                                      OpStore %124 %123 
                                Private f32* %126 = OpAccessChain %9 %42 
                                         f32 %127 = OpLoad %126 
                                Uniform f32* %128 = OpAccessChain %20 %54 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                                      OpStore %125 %130 
                                         f32 %134 = OpLoad %125 
                                         f32 %135 = OpLoad %125 
                                         f32 %136 = OpFNegate %135 
                                        bool %137 = OpFOrdGreaterThanEqual %134 %136 
                                                      OpStore %133 %137 
                                        bool %140 = OpLoad %133 
                                                      OpSelectionMerge %142 None 
                                                      OpBranchConditional %140 %141 %145 
                                             %141 = OpLabel 
                                Uniform f32* %143 = OpAccessChain %20 %54 
                                         f32 %144 = OpLoad %143 
                                                      OpStore %139 %144 
                                                      OpBranch %142 
                                             %145 = OpLabel 
                                Uniform f32* %146 = OpAccessChain %20 %54 
                                         f32 %147 = OpLoad %146 
                                         f32 %148 = OpFNegate %147 
                                                      OpStore %139 %148 
                                                      OpBranch %142 
                                             %142 = OpLabel 
                                         f32 %149 = OpLoad %139 
                                                      OpStore %125 %149 
                                         f32 %152 = OpLoad %125 
                                         f32 %153 = OpFDiv %151 %152 
                                                      OpStore %150 %153 
                                         f32 %154 = OpLoad %150 
                                Private f32* %155 = OpAccessChain %9 %42 
                                         f32 %156 = OpLoad %155 
                                         f32 %157 = OpFMul %154 %156 
                                Private f32* %158 = OpAccessChain %9 %42 
                                                      OpStore %158 %157 
                                Private f32* %159 = OpAccessChain %9 %42 
                                         f32 %160 = OpLoad %159 
                                         f32 %161 = OpExtInst %1 10 %160 
                                Private f32* %162 = OpAccessChain %9 %42 
                                                      OpStore %162 %161 
                                Private f32* %163 = OpAccessChain %9 %42 
                                         f32 %164 = OpLoad %163 
                                         f32 %165 = OpLoad %125 
                                         f32 %166 = OpFMul %164 %165 
                                Private f32* %167 = OpAccessChain %9 %42 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %9 %42 
                                         f32 %169 = OpLoad %168 
                                         f32 %171 = OpExtInst %1 40 %169 %170 
                                Private f32* %172 = OpAccessChain %9 %42 
                                                      OpStore %172 %171 
                                Uniform f32* %173 = OpAccessChain %20 %54 
                                         f32 %174 = OpLoad %173 
                                         f32 %176 = OpFAdd %174 %175 
                                                      OpStore %125 %176 
                                         f32 %177 = OpLoad %125 
                                Private f32* %178 = OpAccessChain %9 %42 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpExtInst %1 37 %177 %179 
                                Private f32* %181 = OpAccessChain %9 %42 
                                                      OpStore %181 %180 
                                Private f32* %182 = OpAccessChain %9 %42 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpExtInst %1 2 %183 
                                Private f32* %185 = OpAccessChain %9 %42 
                                                      OpStore %185 %184 
                                Uniform f32* %187 = OpAccessChain %20 %186 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpExtInst %1 2 %188 
                                                      OpStore %125 %189 
                                Uniform f32* %195 = OpAccessChain %20 %54 
                                         f32 %196 = OpLoad %195 
                                Uniform f32* %197 = OpAccessChain %20 %186 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %20 %54 
                                         f32 %200 = OpLoad %199 
                                Uniform f32* %201 = OpAccessChain %20 %186 
                                         f32 %202 = OpLoad %201 
                                       f32_4 %203 = OpCompositeConstruct %196 %198 %200 %202 
                                      bool_4 %205 = OpFOrdLessThan %194 %203 
                                      bool_2 %206 = OpVectorShuffle %205 %205 0 1 
                                                      OpStore %192 %206 
                                      bool_2 %208 = OpLoad %192 
                                        bool %209 = OpCompositeExtract %208 1 
                                                      OpSelectionMerge %211 None 
                                                      OpBranchConditional %209 %210 %213 
                                             %210 = OpLabel 
                                         f32 %212 = OpLoad %125 
                                                      OpStore %207 %212 
                                                      OpBranch %211 
                                             %213 = OpLabel 
                                Private f32* %214 = OpAccessChain %9 %42 
                                         f32 %215 = OpLoad %214 
                                                      OpStore %207 %215 
                                                      OpBranch %211 
                                             %211 = OpLabel 
                                         f32 %216 = OpLoad %207 
                                Private f32* %217 = OpAccessChain %9 %42 
                                                      OpStore %217 %216 
                                Private f32* %218 = OpAccessChain %9 %42 
                                         f32 %219 = OpLoad %218 
                                Uniform f32* %220 = OpAccessChain %20 %54 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFDiv %219 %221 
                                Private f32* %223 = OpAccessChain %9 %42 
                                                      OpStore %223 %222 
                                Uniform f32* %224 = OpAccessChain %20 %54 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFDiv %151 %225 
                                                      OpStore %125 %226 
                                  Input f32* %230 = OpAccessChain %229 %42 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpLoad %125 
                                         f32 %233 = OpFMul %231 %232 
                                Private f32* %234 = OpAccessChain %9 %42 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFAdd %233 %235 
                                Private f32* %237 = OpAccessChain %9 %42 
                                                      OpStore %237 %236 
                                  Input f32* %238 = OpAccessChain %229 %77 
                                         f32 %239 = OpLoad %238 
                                Private f32* %240 = OpAccessChain %9 %77 
                                                      OpStore %240 %239 
                                      bool_2 %245 = OpLoad %192 
                                        bool %246 = OpCompositeExtract %245 0 
                                                      OpSelectionMerge %248 None 
                                                      OpBranchConditional %246 %247 %251 
                                             %247 = OpLabel 
                                       f32_4 %249 = OpLoad %9 
                                       f32_2 %250 = OpVectorShuffle %249 %249 0 1 
                                                      OpStore %244 %250 
                                                      OpBranch %248 
                                             %251 = OpLabel 
                                       f32_2 %253 = OpLoad %252 
                                                      OpStore %244 %253 
                                                      OpBranch %248 
                                             %248 = OpLabel 
                                       f32_2 %254 = OpLoad %244 
                                                      OpStore %242 %254 
                                 Output f32* %256 = OpAccessChain %81 %27 %77 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFNegate %257 
                                 Output f32* %259 = OpAccessChain %81 %27 %77 
                                                      OpStore %259 %258 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 87
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %60 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpDecorate %23 RelaxedPrecision 
                                                    OpDecorate %24 RelaxedPrecision 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpMemberDecorate %34 0 Offset 34 
                                                    OpMemberDecorate %34 1 Offset 34 
                                                    OpMemberDecorate %34 2 Offset 34 
                                                    OpDecorate %34 Block 
                                                    OpDecorate %36 DescriptorSet 36 
                                                    OpDecorate %36 Binding 36 
                                                    OpDecorate %53 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %56 RelaxedPrecision 
                                                    OpDecorate %58 RelaxedPrecision 
                                                    OpDecorate %60 RelaxedPrecision 
                                                    OpDecorate %60 Location 60 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
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
                                            %20 = OpTypePointer Private %6 
                               Private f32* %21 = OpVariable Private 
                                            %22 = OpTypeVector %6 3 
                                        f32 %25 = OpConstant 3.67402E-40 
                                        f32 %26 = OpConstant 3.67402E-40 
                                        f32 %27 = OpConstant 3.67402E-40 
                                      f32_3 %28 = OpConstantComposite %25 %26 %27 
                                            %30 = OpTypeBool 
                                            %31 = OpTypePointer Private %30 
                              Private bool* %32 = OpVariable Private 
                                            %34 = OpTypeStruct %6 %6 %6 
                                            %35 = OpTypePointer Uniform %34 
           Uniform struct {f32; f32; f32;}* %36 = OpVariable Uniform 
                                            %37 = OpTypeInt 32 1 
                                        i32 %38 = OpConstant 0 
                                            %39 = OpTypePointer Uniform %6 
                                            %43 = OpTypePointer Function %6 
                                        f32 %48 = OpConstant 3.67402E-40 
                                            %50 = OpTypeInt 32 0 
                                        u32 %51 = OpConstant 3 
                               Private f32* %55 = OpVariable Private 
                                        f32 %57 = OpConstant 3.67402E-40 
                                            %59 = OpTypePointer Output %7 
                              Output f32_4* %60 = OpVariable Output 
                                            %62 = OpTypePointer Output %6 
                                        i32 %67 = OpConstant 1 
                                        i32 %69 = OpConstant -1 
                                        f32 %75 = OpConstant 3.67402E-40 
                                        u32 %76 = OpConstant 0 
                                        i32 %80 = OpConstant 2 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                              Function f32* %44 = OpVariable Function 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %23 = OpLoad %9 
                                      f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                        f32 %29 = OpDot %24 %28 
                                                    OpStore %21 %29 
                                        f32 %33 = OpLoad %21 
                               Uniform f32* %40 = OpAccessChain %36 %38 
                                        f32 %41 = OpLoad %40 
                                       bool %42 = OpFOrdLessThan %33 %41 
                                                    OpStore %32 %42 
                                       bool %45 = OpLoad %32 
                                                    OpSelectionMerge %47 None 
                                                    OpBranchConditional %45 %46 %49 
                                            %46 = OpLabel 
                                                    OpStore %44 %48 
                                                    OpBranch %47 
                                            %49 = OpLabel 
                               Private f32* %52 = OpAccessChain %9 %51 
                                        f32 %53 = OpLoad %52 
                                                    OpStore %44 %53 
                                                    OpBranch %47 
                                            %47 = OpLabel 
                                        f32 %54 = OpLoad %44 
                                                    OpStore %21 %54 
                                        f32 %56 = OpLoad %21 
                                        f32 %58 = OpFAdd %56 %57 
                                                    OpStore %55 %58 
                                        f32 %61 = OpLoad %21 
                                Output f32* %63 = OpAccessChain %60 %51 
                                                    OpStore %63 %61 
                                        f32 %64 = OpLoad %55 
                                       bool %65 = OpFOrdLessThan %64 %48 
                                                    OpStore %32 %65 
                                       bool %66 = OpLoad %32 
                                        i32 %68 = OpSelect %66 %67 %38 
                                        i32 %70 = OpIMul %68 %69 
                                       bool %71 = OpINotEqual %70 %38 
                                                    OpSelectionMerge %73 None 
                                                    OpBranchConditional %71 %72 %73 
                                            %72 = OpLabel 
                                                    OpKill
                                            %73 = OpLabel 
                                Output f32* %77 = OpAccessChain %60 %76 
                                                    OpStore %77 %75 
                               Uniform f32* %78 = OpAccessChain %36 %67 
                                        f32 %79 = OpLoad %78 
                               Uniform f32* %81 = OpAccessChain %36 %80 
                                        f32 %82 = OpLoad %81 
                                      f32_2 %83 = OpCompositeConstruct %79 %82 
                                      f32_4 %84 = OpLoad %60 
                                      f32_4 %85 = OpVectorShuffle %84 %83 0 4 5 3 
                                                    OpStore %60 %85 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "OUTLINE_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_ON" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FrameCount;
uniform 	float _TimePerFrame;
uniform 	float _TimeOffset;
uniform 	float _ForcedFrame;
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _AtlasData;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
in  vec3 in_NORMAL0;
out vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
float u_xlat4;
bvec2 u_xlatb4;
void main()
{
    u_xlat0.xy = in_NORMAL0.xy * _AtlasData.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0625, 0.0625);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = _FrameCount * _TimePerFrame;
    u_xlat0.x = u_xlat0.x * 1000.0 + _Time.y;
    u_xlat0.x = u_xlat0.x + (-_TimeOffset);
    u_xlat0.x = u_xlat0.x / _TimePerFrame;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat2 = u_xlat0.x * _FrameCount;
    u_xlatb2 = u_xlat2>=(-u_xlat2);
    u_xlat2 = (u_xlatb2) ? _FrameCount : (-_FrameCount);
    u_xlat4 = float(1.0) / u_xlat2;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * u_xlat2;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat2 = _FrameCount + -1.0;
    u_xlat0.x = min(u_xlat2, u_xlat0.x);
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlat2 = roundEven(_ForcedFrame);
    u_xlatb4.xy = lessThan(vec4(0.0, -0.5, 0.0, -0.5), vec4(_FrameCount, _ForcedFrame, _FrameCount, _ForcedFrame)).xy;
    u_xlat0.x = (u_xlatb4.y) ? u_xlat2 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _FrameCount;
    u_xlat2 = float(1.0) / _FrameCount;
    u_xlat0.x = in_TEXCOORD1.x * u_xlat2 + u_xlat0.x;
    u_xlat1.xy = (-in_NORMAL0.xy) + in_NORMAL0.yx;
    u_xlat1.xy = _AtlasData.zw * u_xlat1.xy + in_NORMAL0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_TexelSize.xy + in_TEXCOORD0.xy;
    u_xlat0.y = in_TEXCOORD1.y;
    vs_TEXCOORD0.xy = (u_xlatb4.x) ? u_xlat0.xy : u_xlat1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	float _LuminanceCutoff;
uniform 	float _ValueMaximum;
uniform 	float _ValueMinimum;
uniform 	vec4 _MainTex_TexelSize;
uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
vec4 u_xlat10_1;
vec2 u_xlat2;
vec4 u_xlat10_2;
vec4 u_xlat10_3;
vec3 u_xlat4;
float u_xlat16_4;
vec2 u_xlat8;
float u_xlat16_8;
vec2 u_xlat10;
void main()
{
    u_xlat0.y = _MainTex_TexelSize.y;
    u_xlat0.x = float(0.0);
    u_xlat8.x = float(0.0);
    u_xlat1.xy = vs_TEXCOORD0.xy / _MainTex_TexelSize.xy;
    u_xlat1.xy = floor(u_xlat1.xy);
    u_xlat0.xy = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat0.xy;
    u_xlat10_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = dot(u_xlat10_2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_0 = u_xlat10_2.w * u_xlat16_0;
    u_xlat8.y = (-_MainTex_TexelSize.y);
    u_xlat4.xy = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat8.xy;
    u_xlat10_3 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_3.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat10_2.w, u_xlat10_3.w);
    u_xlat16_0 = max(u_xlat16_4, u_xlat16_0);
    u_xlat10.x = (-_MainTex_TexelSize.x);
    u_xlat2.y = float(0.0);
    u_xlat10.y = float(0.0);
    u_xlat4.xz = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat10.xy;
    u_xlat10_3 = texture(_MainTex, u_xlat4.xz);
    u_xlat16_4 = dot(u_xlat10_3.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_3.w * u_xlat16_4;
    u_xlat16_8 = max(u_xlat16_8, u_xlat10_3.w);
    u_xlat16_0 = max(u_xlat16_0, u_xlat16_4);
    u_xlat2.x = _MainTex_TexelSize.x;
    u_xlat4.xz = u_xlat1.xy * _MainTex_TexelSize.xy + u_xlat2.xy;
    u_xlat10_1 = texture(_MainTex, u_xlat4.xz);
    u_xlat16_4 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_4 = u_xlat10_1.w * u_xlat16_4;
    u_xlat8.x = max(u_xlat16_8, u_xlat10_1.w);
    u_xlat0.x = max(u_xlat16_0, u_xlat16_4);
    u_xlatb0 = u_xlat0.x<_LuminanceCutoff;
    u_xlat0.x = (u_xlatb0) ? 0.0 : u_xlat8.x;
    u_xlat4.x = u_xlat0.x + -0.100000001;
    SV_Target0.w = u_xlat0.x;
    u_xlatb0 = u_xlat4.x<0.0;
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0.x = 1.0;
    SV_Target0.yz = vec2(_ValueMaximum, _ValueMinimum);
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "OUTLINE_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 314
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %46 %103 %250 %286 %295 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpMemberDecorate %20 6 Offset 20 
                                                      OpMemberDecorate %20 7 Offset 20 
                                                      OpMemberDecorate %20 8 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %46 Location 46 
                                                      OpMemberDecorate %101 0 BuiltIn 101 
                                                      OpMemberDecorate %101 1 BuiltIn 101 
                                                      OpMemberDecorate %101 2 BuiltIn 101 
                                                      OpDecorate %101 Block 
                                                      OpDecorate %250 Location 250 
                                                      OpDecorate %286 Location 286 
                                                      OpDecorate %295 Location 295 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeStruct %7 %18 %19 %6 %6 %6 %6 %7 %7 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32; f32; f32; f32; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 8 
                                              %25 = OpTypePointer Uniform %7 
                                          f32 %34 = OpConstant 3.67402E-40 
                                        f32_2 %35 = OpConstantComposite %34 %34 
                                          f32 %39 = OpConstant 3.67402E-40 
                                          u32 %40 = OpConstant 2 
                                              %41 = OpTypePointer Private %6 
                                              %45 = OpTypePointer Input %7 
                                 Input f32_4* %46 = OpVariable Input 
                               Private f32_4* %52 = OpVariable Private 
                                          i32 %55 = OpConstant 1 
                                          i32 %59 = OpConstant 0 
                                          i32 %67 = OpConstant 2 
                                          i32 %76 = OpConstant 3 
                                          u32 %99 = OpConstant 1 
                                             %100 = OpTypeArray %6 %99 
                                             %101 = OpTypeStruct %7 %6 %100 
                                             %102 = OpTypePointer Output %101 
        Output struct {f32_4; f32; f32[1];}* %103 = OpVariable Output 
                                             %111 = OpTypePointer Output %7 
                                             %113 = OpTypePointer Uniform %6 
                                         i32 %116 = OpConstant 4 
                                         u32 %120 = OpConstant 0 
                                         f32 %124 = OpConstant 3.67402E-40 
                                         i32 %132 = OpConstant 5 
                                Private f32* %148 = OpVariable Private 
                                             %154 = OpTypeBool 
                                             %155 = OpTypePointer Private %154 
                               Private bool* %156 = OpVariable Private 
                                             %161 = OpTypePointer Function %6 
                                Private f32* %173 = OpVariable Private 
                                         f32 %174 = OpConstant 3.67402E-40 
                                         f32 %197 = OpConstant 3.67402E-40 
                                         i32 %208 = OpConstant 6 
                                             %212 = OpTypeVector %154 2 
                                             %213 = OpTypePointer Private %212 
                             Private bool_2* %214 = OpVariable Private 
                                         f32 %215 = OpConstant 3.67402E-40 
                                       f32_4 %216 = OpConstantComposite %39 %215 %39 %215 
                                             %226 = OpTypeVector %154 4 
                                             %249 = OpTypePointer Input %13 
                                Input f32_2* %250 = OpVariable Input 
                                             %251 = OpTypePointer Input %6 
                                         i32 %281 = OpConstant 7 
                                Input f32_2* %286 = OpVariable Input 
                                             %294 = OpTypePointer Output %13 
                               Output f32_2* %295 = OpVariable Output 
                                             %296 = OpTypePointer Function %13 
                                             %308 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %162 = OpVariable Function 
                               Function f32* %229 = OpVariable Function 
                             Function f32_2* %297 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %15 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 2 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_2 %33 = OpVectorShuffle %32 %32 0 1 
                                        f32_2 %36 = OpFMul %33 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 2 3 
                                                      OpStore %9 %38 
                                 Private f32* %42 = OpAccessChain %9 %40 
                                                      OpStore %42 %39 
                                        f32_4 %43 = OpLoad %9 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                        f32_4 %47 = OpLoad %46 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                        f32_3 %49 = OpFAdd %44 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %49 4 5 6 3 
                                                      OpStore %9 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpVectorShuffle %53 %53 1 1 1 1 
                               Uniform f32_4* %56 = OpAccessChain %22 %55 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFMul %54 %57 
                                                      OpStore %52 %58 
                               Uniform f32_4* %60 = OpAccessChain %22 %55 %59 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %65 = OpLoad %52 
                                        f32_4 %66 = OpFAdd %64 %65 
                                                      OpStore %52 %66 
                               Uniform f32_4* %68 = OpAccessChain %22 %55 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 2 2 2 2 
                                        f32_4 %72 = OpFMul %69 %71 
                                        f32_4 %73 = OpLoad %52 
                                        f32_4 %74 = OpFAdd %72 %73 
                                                      OpStore %9 %74 
                                        f32_4 %75 = OpLoad %9 
                               Uniform f32_4* %77 = OpAccessChain %22 %55 %76 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpFAdd %75 %78 
                                                      OpStore %9 %79 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 1 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %22 %67 %55 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpFMul %81 %83 
                                                      OpStore %52 %84 
                               Uniform f32_4* %85 = OpAccessChain %22 %67 %59 
                                        f32_4 %86 = OpLoad %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %87 0 0 0 0 
                                        f32_4 %89 = OpFMul %86 %88 
                                        f32_4 %90 = OpLoad %52 
                                        f32_4 %91 = OpFAdd %89 %90 
                                                      OpStore %52 %91 
                               Uniform f32_4* %92 = OpAccessChain %22 %67 %67 
                                        f32_4 %93 = OpLoad %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpVectorShuffle %94 %94 2 2 2 2 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %52 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %52 %98 
                              Uniform f32_4* %104 = OpAccessChain %22 %67 %76 
                                       f32_4 %105 = OpLoad %104 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpVectorShuffle %106 %106 3 3 3 3 
                                       f32_4 %108 = OpFMul %105 %107 
                                       f32_4 %109 = OpLoad %52 
                                       f32_4 %110 = OpFAdd %108 %109 
                               Output f32_4* %112 = OpAccessChain %103 %59 
                                                      OpStore %112 %110 
                                Uniform f32* %114 = OpAccessChain %22 %76 
                                         f32 %115 = OpLoad %114 
                                Uniform f32* %117 = OpAccessChain %22 %116 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFMul %115 %118 
                                Private f32* %121 = OpAccessChain %9 %120 
                                                      OpStore %121 %119 
                                Private f32* %122 = OpAccessChain %9 %120 
                                         f32 %123 = OpLoad %122 
                                         f32 %125 = OpFMul %123 %124 
                                Uniform f32* %126 = OpAccessChain %22 %59 %99 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpFAdd %125 %127 
                                Private f32* %129 = OpAccessChain %9 %120 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %9 %120 
                                         f32 %131 = OpLoad %130 
                                Uniform f32* %133 = OpAccessChain %22 %132 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                         f32 %136 = OpFAdd %131 %135 
                                Private f32* %137 = OpAccessChain %9 %120 
                                                      OpStore %137 %136 
                                Private f32* %138 = OpAccessChain %9 %120 
                                         f32 %139 = OpLoad %138 
                                Uniform f32* %140 = OpAccessChain %22 %116 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFDiv %139 %141 
                                Private f32* %143 = OpAccessChain %9 %120 
                                                      OpStore %143 %142 
                                Private f32* %144 = OpAccessChain %9 %120 
                                         f32 %145 = OpLoad %144 
                                         f32 %146 = OpExtInst %1 8 %145 
                                Private f32* %147 = OpAccessChain %9 %120 
                                                      OpStore %147 %146 
                                Private f32* %149 = OpAccessChain %9 %120 
                                         f32 %150 = OpLoad %149 
                                Uniform f32* %151 = OpAccessChain %22 %76 
                                         f32 %152 = OpLoad %151 
                                         f32 %153 = OpFMul %150 %152 
                                                      OpStore %148 %153 
                                         f32 %157 = OpLoad %148 
                                         f32 %158 = OpLoad %148 
                                         f32 %159 = OpFNegate %158 
                                        bool %160 = OpFOrdGreaterThanEqual %157 %159 
                                                      OpStore %156 %160 
                                        bool %163 = OpLoad %156 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %163 %164 %168 
                                             %164 = OpLabel 
                                Uniform f32* %166 = OpAccessChain %22 %76 
                                         f32 %167 = OpLoad %166 
                                                      OpStore %162 %167 
                                                      OpBranch %165 
                                             %168 = OpLabel 
                                Uniform f32* %169 = OpAccessChain %22 %76 
                                         f32 %170 = OpLoad %169 
                                         f32 %171 = OpFNegate %170 
                                                      OpStore %162 %171 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                         f32 %172 = OpLoad %162 
                                                      OpStore %148 %172 
                                         f32 %175 = OpLoad %148 
                                         f32 %176 = OpFDiv %174 %175 
                                                      OpStore %173 %176 
                                         f32 %177 = OpLoad %173 
                                Private f32* %178 = OpAccessChain %9 %120 
                                         f32 %179 = OpLoad %178 
                                         f32 %180 = OpFMul %177 %179 
                                Private f32* %181 = OpAccessChain %9 %120 
                                                      OpStore %181 %180 
                                Private f32* %182 = OpAccessChain %9 %120 
                                         f32 %183 = OpLoad %182 
                                         f32 %184 = OpExtInst %1 10 %183 
                                Private f32* %185 = OpAccessChain %9 %120 
                                                      OpStore %185 %184 
                                Private f32* %186 = OpAccessChain %9 %120 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpLoad %148 
                                         f32 %189 = OpFMul %187 %188 
                                Private f32* %190 = OpAccessChain %9 %120 
                                                      OpStore %190 %189 
                                Private f32* %191 = OpAccessChain %9 %120 
                                         f32 %192 = OpLoad %191 
                                         f32 %193 = OpExtInst %1 40 %192 %39 
                                Private f32* %194 = OpAccessChain %9 %120 
                                                      OpStore %194 %193 
                                Uniform f32* %195 = OpAccessChain %22 %76 
                                         f32 %196 = OpLoad %195 
                                         f32 %198 = OpFAdd %196 %197 
                                                      OpStore %148 %198 
                                         f32 %199 = OpLoad %148 
                                Private f32* %200 = OpAccessChain %9 %120 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpExtInst %1 37 %199 %201 
                                Private f32* %203 = OpAccessChain %9 %120 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %9 %120 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 2 %205 
                                Private f32* %207 = OpAccessChain %9 %120 
                                                      OpStore %207 %206 
                                Uniform f32* %209 = OpAccessChain %22 %208 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpExtInst %1 2 %210 
                                                      OpStore %148 %211 
                                Uniform f32* %217 = OpAccessChain %22 %76 
                                         f32 %218 = OpLoad %217 
                                Uniform f32* %219 = OpAccessChain %22 %208 
                                         f32 %220 = OpLoad %219 
                                Uniform f32* %221 = OpAccessChain %22 %76 
                                         f32 %222 = OpLoad %221 
                                Uniform f32* %223 = OpAccessChain %22 %208 
                                         f32 %224 = OpLoad %223 
                                       f32_4 %225 = OpCompositeConstruct %218 %220 %222 %224 
                                      bool_4 %227 = OpFOrdLessThan %216 %225 
                                      bool_2 %228 = OpVectorShuffle %227 %227 0 1 
                                                      OpStore %214 %228 
                                      bool_2 %230 = OpLoad %214 
                                        bool %231 = OpCompositeExtract %230 1 
                                                      OpSelectionMerge %233 None 
                                                      OpBranchConditional %231 %232 %235 
                                             %232 = OpLabel 
                                         f32 %234 = OpLoad %148 
                                                      OpStore %229 %234 
                                                      OpBranch %233 
                                             %235 = OpLabel 
                                Private f32* %236 = OpAccessChain %9 %120 
                                         f32 %237 = OpLoad %236 
                                                      OpStore %229 %237 
                                                      OpBranch %233 
                                             %233 = OpLabel 
                                         f32 %238 = OpLoad %229 
                                Private f32* %239 = OpAccessChain %9 %120 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %120 
                                         f32 %241 = OpLoad %240 
                                Uniform f32* %242 = OpAccessChain %22 %76 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFDiv %241 %243 
                                Private f32* %245 = OpAccessChain %9 %120 
                                                      OpStore %245 %244 
                                Uniform f32* %246 = OpAccessChain %22 %76 
                                         f32 %247 = OpLoad %246 
                                         f32 %248 = OpFDiv %174 %247 
                                                      OpStore %148 %248 
                                  Input f32* %252 = OpAccessChain %250 %120 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpLoad %148 
                                         f32 %255 = OpFMul %253 %254 
                                Private f32* %256 = OpAccessChain %9 %120 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFAdd %255 %257 
                                Private f32* %259 = OpAccessChain %9 %120 
                                                      OpStore %259 %258 
                                       f32_3 %260 = OpLoad %12 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %262 = OpFNegate %261 
                                       f32_3 %263 = OpLoad %12 
                                       f32_2 %264 = OpVectorShuffle %263 %263 1 0 
                                       f32_2 %265 = OpFAdd %262 %264 
                                       f32_4 %266 = OpLoad %52 
                                       f32_4 %267 = OpVectorShuffle %266 %265 4 5 2 3 
                                                      OpStore %52 %267 
                              Uniform f32_4* %268 = OpAccessChain %22 %24 
                                       f32_4 %269 = OpLoad %268 
                                       f32_2 %270 = OpVectorShuffle %269 %269 2 3 
                                       f32_4 %271 = OpLoad %52 
                                       f32_2 %272 = OpVectorShuffle %271 %271 0 1 
                                       f32_2 %273 = OpFMul %270 %272 
                                       f32_3 %274 = OpLoad %12 
                                       f32_2 %275 = OpVectorShuffle %274 %274 0 1 
                                       f32_2 %276 = OpFAdd %273 %275 
                                       f32_4 %277 = OpLoad %52 
                                       f32_4 %278 = OpVectorShuffle %277 %276 4 5 2 3 
                                                      OpStore %52 %278 
                                       f32_4 %279 = OpLoad %52 
                                       f32_2 %280 = OpVectorShuffle %279 %279 0 1 
                              Uniform f32_4* %282 = OpAccessChain %22 %281 
                                       f32_4 %283 = OpLoad %282 
                                       f32_2 %284 = OpVectorShuffle %283 %283 0 1 
                                       f32_2 %285 = OpFMul %280 %284 
                                       f32_2 %287 = OpLoad %286 
                                       f32_2 %288 = OpFAdd %285 %287 
                                       f32_4 %289 = OpLoad %52 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 2 3 
                                                      OpStore %52 %290 
                                  Input f32* %291 = OpAccessChain %250 %99 
                                         f32 %292 = OpLoad %291 
                                Private f32* %293 = OpAccessChain %9 %99 
                                                      OpStore %293 %292 
                                      bool_2 %298 = OpLoad %214 
                                        bool %299 = OpCompositeExtract %298 0 
                                                      OpSelectionMerge %301 None 
                                                      OpBranchConditional %299 %300 %304 
                                             %300 = OpLabel 
                                       f32_4 %302 = OpLoad %9 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                                      OpStore %297 %303 
                                                      OpBranch %301 
                                             %304 = OpLabel 
                                       f32_4 %305 = OpLoad %52 
                                       f32_2 %306 = OpVectorShuffle %305 %305 0 1 
                                                      OpStore %297 %306 
                                                      OpBranch %301 
                                             %301 = OpLabel 
                                       f32_2 %307 = OpLoad %297 
                                                      OpStore %295 %307 
                                 Output f32* %309 = OpAccessChain %103 %59 %99 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFNegate %310 
                                 Output f32* %312 = OpAccessChain %103 %59 %99 
                                                      OpStore %312 %311 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 222
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %31 %219 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpMemberDecorate %10 0 Offset 10 
                                                    OpMemberDecorate %10 1 Offset 10 
                                                    OpMemberDecorate %10 2 Offset 10 
                                                    OpMemberDecorate %10 3 Offset 10 
                                                    OpDecorate %10 Block 
                                                    OpDecorate %12 DescriptorSet 12 
                                                    OpDecorate %12 Binding 12 
                                                    OpDecorate %31 Location 31 
                                                    OpDecorate %50 RelaxedPrecision 
                                                    OpDecorate %54 RelaxedPrecision 
                                                    OpDecorate %54 DescriptorSet 54 
                                                    OpDecorate %54 Binding 54 
                                                    OpDecorate %55 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %67 RelaxedPrecision 
                                                    OpDecorate %70 RelaxedPrecision 
                                                    OpDecorate %71 RelaxedPrecision 
                                                    OpDecorate %72 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %87 RelaxedPrecision 
                                                    OpDecorate %91 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %93 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %96 RelaxedPrecision 
                                                    OpDecorate %97 RelaxedPrecision 
                                                    OpDecorate %98 RelaxedPrecision 
                                                    OpDecorate %99 RelaxedPrecision 
                                                    OpDecorate %101 RelaxedPrecision 
                                                    OpDecorate %103 RelaxedPrecision 
                                                    OpDecorate %104 RelaxedPrecision 
                                                    OpDecorate %105 RelaxedPrecision 
                                                    OpDecorate %106 RelaxedPrecision 
                                                    OpDecorate %107 RelaxedPrecision 
                                                    OpDecorate %108 RelaxedPrecision 
                                                    OpDecorate %125 RelaxedPrecision 
                                                    OpDecorate %126 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %130 RelaxedPrecision 
                                                    OpDecorate %131 RelaxedPrecision 
                                                    OpDecorate %133 RelaxedPrecision 
                                                    OpDecorate %134 RelaxedPrecision 
                                                    OpDecorate %135 RelaxedPrecision 
                                                    OpDecorate %136 RelaxedPrecision 
                                                    OpDecorate %138 RelaxedPrecision 
                                                    OpDecorate %139 RelaxedPrecision 
                                                    OpDecorate %140 RelaxedPrecision 
                                                    OpDecorate %141 RelaxedPrecision 
                                                    OpDecorate %142 RelaxedPrecision 
                                                    OpDecorate %153 RelaxedPrecision 
                                                    OpDecorate %154 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %158 RelaxedPrecision 
                                                    OpDecorate %159 RelaxedPrecision 
                                                    OpDecorate %161 RelaxedPrecision 
                                                    OpDecorate %162 RelaxedPrecision 
                                                    OpDecorate %163 RelaxedPrecision 
                                                    OpDecorate %164 RelaxedPrecision 
                                                    OpDecorate %166 RelaxedPrecision 
                                                    OpDecorate %167 RelaxedPrecision 
                                                    OpDecorate %168 RelaxedPrecision 
                                                    OpDecorate %169 RelaxedPrecision 
                                                    OpDecorate %170 RelaxedPrecision 
                                                    OpDecorate %187 RelaxedPrecision 
                                                    OpDecorate %188 RelaxedPrecision 
                                                    OpDecorate %219 RelaxedPrecision 
                                                    OpDecorate %219 Location 219 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeStruct %6 %6 %6 %7 
                                            %11 = OpTypePointer Uniform %10 
    Uniform struct {f32; f32; f32; f32_4;}* %12 = OpVariable Uniform 
                                            %13 = OpTypeInt 32 1 
                                        i32 %14 = OpConstant 3 
                                            %15 = OpTypeInt 32 0 
                                        u32 %16 = OpConstant 1 
                                            %17 = OpTypePointer Uniform %6 
                                            %20 = OpTypePointer Private %6 
                                        f32 %22 = OpConstant 3.67402E-40 
                                        u32 %23 = OpConstant 0 
                                            %25 = OpTypeVector %6 2 
                                            %26 = OpTypePointer Private %25 
                             Private f32_2* %27 = OpVariable Private 
                             Private f32_2* %29 = OpVariable Private 
                                            %30 = OpTypePointer Input %25 
                               Input f32_2* %31 = OpVariable Input 
                                            %33 = OpTypePointer Uniform %7 
                             Private f32_4* %50 = OpVariable Private 
                                            %51 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %52 = OpTypeSampledImage %51 
                                            %53 = OpTypePointer UniformConstant %52 
UniformConstant read_only Texture2DSampled* %54 = OpVariable UniformConstant 
                               Private f32* %59 = OpVariable Private 
                                            %60 = OpTypeVector %6 3 
                                        f32 %63 = OpConstant 3.67402E-40 
                                        f32 %64 = OpConstant 3.67402E-40 
                                        f32 %65 = OpConstant 3.67402E-40 
                                      f32_3 %66 = OpConstantComposite %63 %64 %65 
                                        u32 %68 = OpConstant 3 
                             Private f32_4* %86 = OpVariable Private 
                               Private f32* %91 = OpVariable Private 
                               Private f32* %99 = OpVariable Private 
                              Private f32* %105 = OpVariable Private 
                            Private f32_2* %109 = OpVariable Private 
                            Private f32_2* %114 = OpVariable Private 
                            Private f32_2* %117 = OpVariable Private 
                            Private f32_4* %125 = OpVariable Private 
                            Private f32_4* %153 = OpVariable Private 
                                           %172 = OpTypeBool 
                                           %173 = OpTypePointer Private %172 
                             Private bool* %174 = OpVariable Private 
                                       i32 %177 = OpConstant 0 
                                           %181 = OpTypePointer Function %6 
                                       f32 %192 = OpConstant 3.67402E-40 
                             Private bool* %195 = OpVariable Private 
                                       i32 %200 = OpConstant 1 
                                       i32 %202 = OpConstant -1 
                                       f32 %208 = OpConstant 3.67402E-40 
                                       i32 %212 = OpConstant 2 
                                           %218 = OpTypePointer Output %7 
                             Output f32_4* %219 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                             Function f32* %182 = OpVariable Function 
                               Uniform f32* %18 = OpAccessChain %12 %14 %16 
                                        f32 %19 = OpLoad %18 
                               Private f32* %21 = OpAccessChain %9 %16 
                                                    OpStore %21 %19 
                               Private f32* %24 = OpAccessChain %9 %23 
                                                    OpStore %24 %22 
                               Private f32* %28 = OpAccessChain %27 %23 
                                                    OpStore %28 %22 
                                      f32_2 %32 = OpLoad %31 
                             Uniform f32_4* %34 = OpAccessChain %12 %14 
                                      f32_4 %35 = OpLoad %34 
                                      f32_2 %36 = OpVectorShuffle %35 %35 0 1 
                                      f32_2 %37 = OpFDiv %32 %36 
                                                    OpStore %29 %37 
                                      f32_2 %38 = OpLoad %29 
                                      f32_2 %39 = OpExtInst %1 8 %38 
                                                    OpStore %29 %39 
                                      f32_2 %40 = OpLoad %29 
                             Uniform f32_4* %41 = OpAccessChain %12 %14 
                                      f32_4 %42 = OpLoad %41 
                                      f32_2 %43 = OpVectorShuffle %42 %42 0 1 
                                      f32_2 %44 = OpFMul %40 %43 
                                      f32_4 %45 = OpLoad %9 
                                      f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                                      f32_2 %47 = OpFAdd %44 %46 
                                      f32_4 %48 = OpLoad %9 
                                      f32_4 %49 = OpVectorShuffle %48 %47 4 5 2 3 
                                                    OpStore %9 %49 
                 read_only Texture2DSampled %55 = OpLoad %54 
                                      f32_4 %56 = OpLoad %9 
                                      f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                                      f32_4 %58 = OpImageSampleImplicitLod %55 %57 
                                                    OpStore %50 %58 
                                      f32_4 %61 = OpLoad %50 
                                      f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32 %67 = OpDot %62 %66 
                                                    OpStore %59 %67 
                               Private f32* %69 = OpAccessChain %50 %68 
                                        f32 %70 = OpLoad %69 
                                        f32 %71 = OpLoad %59 
                                        f32 %72 = OpFMul %70 %71 
                                                    OpStore %59 %72 
                               Uniform f32* %73 = OpAccessChain %12 %14 %16 
                                        f32 %74 = OpLoad %73 
                                        f32 %75 = OpFNegate %74 
                               Private f32* %76 = OpAccessChain %27 %16 
                                                    OpStore %76 %75 
                                      f32_2 %77 = OpLoad %29 
                             Uniform f32_4* %78 = OpAccessChain %12 %14 
                                      f32_4 %79 = OpLoad %78 
                                      f32_2 %80 = OpVectorShuffle %79 %79 0 1 
                                      f32_2 %81 = OpFMul %77 %80 
                                      f32_2 %82 = OpLoad %27 
                                      f32_2 %83 = OpFAdd %81 %82 
                                      f32_4 %84 = OpLoad %9 
                                      f32_4 %85 = OpVectorShuffle %84 %83 4 5 2 3 
                                                    OpStore %9 %85 
                 read_only Texture2DSampled %87 = OpLoad %54 
                                      f32_4 %88 = OpLoad %9 
                                      f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                      f32_4 %90 = OpImageSampleImplicitLod %87 %89 
                                                    OpStore %86 %90 
                                      f32_4 %92 = OpLoad %86 
                                      f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                        f32 %94 = OpDot %93 %66 
                                                    OpStore %91 %94 
                               Private f32* %95 = OpAccessChain %86 %68 
                                        f32 %96 = OpLoad %95 
                                        f32 %97 = OpLoad %91 
                                        f32 %98 = OpFMul %96 %97 
                                                    OpStore %91 %98 
                              Private f32* %100 = OpAccessChain %86 %68 
                                       f32 %101 = OpLoad %100 
                              Private f32* %102 = OpAccessChain %50 %68 
                                       f32 %103 = OpLoad %102 
                                       f32 %104 = OpExtInst %1 40 %101 %103 
                                                    OpStore %99 %104 
                                       f32 %106 = OpLoad %91 
                                       f32 %107 = OpLoad %59 
                                       f32 %108 = OpExtInst %1 40 %106 %107 
                                                    OpStore %105 %108 
                              Uniform f32* %110 = OpAccessChain %12 %14 %23 
                                       f32 %111 = OpLoad %110 
                                       f32 %112 = OpFNegate %111 
                              Private f32* %113 = OpAccessChain %109 %23 
                                                    OpStore %113 %112 
                              Private f32* %115 = OpAccessChain %114 %16 
                                                    OpStore %115 %22 
                              Private f32* %116 = OpAccessChain %109 %16 
                                                    OpStore %116 %22 
                                     f32_2 %118 = OpLoad %29 
                            Uniform f32_4* %119 = OpAccessChain %12 %14 
                                     f32_4 %120 = OpLoad %119 
                                     f32_2 %121 = OpVectorShuffle %120 %120 0 1 
                                     f32_2 %122 = OpFMul %118 %121 
                                     f32_2 %123 = OpLoad %109 
                                     f32_2 %124 = OpFAdd %122 %123 
                                                    OpStore %117 %124 
                read_only Texture2DSampled %126 = OpLoad %54 
                                     f32_2 %127 = OpLoad %117 
                                     f32_4 %128 = OpImageSampleImplicitLod %126 %127 
                                                    OpStore %125 %128 
                                     f32_4 %129 = OpLoad %125 
                                     f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32 %131 = OpDot %130 %66 
                                                    OpStore %59 %131 
                              Private f32* %132 = OpAccessChain %125 %68 
                                       f32 %133 = OpLoad %132 
                                       f32 %134 = OpLoad %59 
                                       f32 %135 = OpFMul %133 %134 
                                                    OpStore %59 %135 
                                       f32 %136 = OpLoad %99 
                              Private f32* %137 = OpAccessChain %125 %68 
                                       f32 %138 = OpLoad %137 
                                       f32 %139 = OpExtInst %1 40 %136 %138 
                                                    OpStore %91 %139 
                                       f32 %140 = OpLoad %105 
                                       f32 %141 = OpLoad %59 
                                       f32 %142 = OpExtInst %1 40 %140 %141 
                                                    OpStore %105 %142 
                              Uniform f32* %143 = OpAccessChain %12 %14 %23 
                                       f32 %144 = OpLoad %143 
                              Private f32* %145 = OpAccessChain %114 %23 
                                                    OpStore %145 %144 
                                     f32_2 %146 = OpLoad %29 
                            Uniform f32_4* %147 = OpAccessChain %12 %14 
                                     f32_4 %148 = OpLoad %147 
                                     f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                     f32_2 %150 = OpFMul %146 %149 
                                     f32_2 %151 = OpLoad %114 
                                     f32_2 %152 = OpFAdd %150 %151 
                                                    OpStore %117 %152 
                read_only Texture2DSampled %154 = OpLoad %54 
                                     f32_2 %155 = OpLoad %117 
                                     f32_4 %156 = OpImageSampleImplicitLod %154 %155 
                                                    OpStore %153 %156 
                                     f32_4 %157 = OpLoad %153 
                                     f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32 %159 = OpDot %158 %66 
                                                    OpStore %59 %159 
                              Private f32* %160 = OpAccessChain %153 %68 
                                       f32 %161 = OpLoad %160 
                                       f32 %162 = OpLoad %59 
                                       f32 %163 = OpFMul %161 %162 
                                                    OpStore %59 %163 
                                       f32 %164 = OpLoad %91 
                              Private f32* %165 = OpAccessChain %153 %68 
                                       f32 %166 = OpLoad %165 
                                       f32 %167 = OpExtInst %1 40 %164 %166 
                                                    OpStore %91 %167 
                                       f32 %168 = OpLoad %105 
                                       f32 %169 = OpLoad %59 
                                       f32 %170 = OpExtInst %1 40 %168 %169 
                              Private f32* %171 = OpAccessChain %9 %23 
                                                    OpStore %171 %170 
                              Private f32* %175 = OpAccessChain %9 %23 
                                       f32 %176 = OpLoad %175 
                              Uniform f32* %178 = OpAccessChain %12 %177 
                                       f32 %179 = OpLoad %178 
                                      bool %180 = OpFOrdLessThan %176 %179 
                                                    OpStore %174 %180 
                                      bool %183 = OpLoad %174 
                                                    OpSelectionMerge %185 None 
                                                    OpBranchConditional %183 %184 %186 
                                           %184 = OpLabel 
                                                    OpStore %182 %22 
                                                    OpBranch %185 
                                           %186 = OpLabel 
                                       f32 %187 = OpLoad %91 
                                                    OpStore %182 %187 
                                                    OpBranch %185 
                                           %185 = OpLabel 
                                       f32 %188 = OpLoad %182 
                              Private f32* %189 = OpAccessChain %9 %68 
                                                    OpStore %189 %188 
                              Private f32* %190 = OpAccessChain %9 %68 
                                       f32 %191 = OpLoad %190 
                                       f32 %193 = OpFAdd %191 %192 
                              Private f32* %194 = OpAccessChain %29 %23 
                                                    OpStore %194 %193 
                              Private f32* %196 = OpAccessChain %29 %23 
                                       f32 %197 = OpLoad %196 
                                      bool %198 = OpFOrdLessThan %197 %22 
                                                    OpStore %195 %198 
                                      bool %199 = OpLoad %195 
                                       i32 %201 = OpSelect %199 %200 %177 
                                       i32 %203 = OpIMul %201 %202 
                                      bool %204 = OpINotEqual %203 %177 
                                                    OpSelectionMerge %206 None 
                                                    OpBranchConditional %204 %205 %206 
                                           %205 = OpLabel 
                                                    OpKill
                                           %206 = OpLabel 
                              Private f32* %209 = OpAccessChain %9 %23 
                                                    OpStore %209 %208 
                              Uniform f32* %210 = OpAccessChain %12 %200 
                                       f32 %211 = OpLoad %210 
                              Uniform f32* %213 = OpAccessChain %12 %212 
                                       f32 %214 = OpLoad %213 
                                     f32_2 %215 = OpCompositeConstruct %211 %214 
                                     f32_4 %216 = OpLoad %9 
                                     f32_4 %217 = OpVectorShuffle %216 %215 0 4 5 3 
                                                    OpStore %9 %217 
                                     f32_4 %220 = OpLoad %9 
                                                    OpStore %219 %220 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "OUTLINE_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_OFF" }
""
}
SubProgram "vulkan " {
Keywords { "OUTLINE_OFF" }
""
}
SubProgram "d3d11 " {
Keywords { "OUTLINE_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
Keywords { "OUTLINE_ON" }
""
}
SubProgram "vulkan " {
Keywords { "OUTLINE_ON" }
""
}
}
}
}
}