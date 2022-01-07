#define SK_GL

#include "include/core/SkSurface.h"
#include "include/core/SkData.h"
#include "include/gpu/GrTypes.h"
#include "include/gpu/GrDirectContext.h"
#include "include/gpu/gl/GrGLInterface.h"

#include <GLFW/glfw3.h>

#define MSAA_LEVEL 1

int main(int argc, char** argv)
{	
    GLFWwindow* window;

    if (!glfwInit()) {
        SkDebugf("Failed to Init GLFW\n");
        return -1;
    }

    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 3);
	glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 2);
	glfwWindowHint(GLFW_OPENGL_FORWARD_COMPAT, GL_TRUE);
	glfwWindowHint(GLFW_OPENGL_PROFILE, GLFW_OPENGL_CORE_PROFILE);
	//(uncomment to enable correct color spaces) glfwWindowHint(GLFW_SRGB_CAPABLE, GL_TRUE);
	glfwWindowHint(GLFW_STENCIL_BITS, 0);
	//glfwWindowHint(GLFW_ALPHA_BITS, 0);
	glfwWindowHint(GLFW_DEPTH_BITS, 0);

    window = glfwCreateWindow(640, 480, "Hello World", NULL, NULL);
    if (!window)
    {
        glfwTerminate();
        SkDebugf("Failed to Create Test Window\n");
        return -1;
    }

    glfwMakeContextCurrent(window);



    
    sk_sp<GrDirectContext> context = GrDirectContext::MakeGL();
    SkImageInfo info = SkImageInfo::MakeN32Premul(640, 480);
    SkSurfaceProps props;

    sk_sp<SkSurface> gpuSurface(
            SkSurface::MakeRenderTarget(context.get(), SkBudgeted::kNo, info, MSAA_LEVEL, nullptr));

    if (!gpuSurface) {
        SkDebugf("SkSurface::MakeRenderTarget returned null\n");
        return -1;
    }



	//sk_sp<SkSurface> gpuSurface(SkSurface::MakeRenderTarget(context, SkBudgeted::kNo, info));
    
    return 0;
}