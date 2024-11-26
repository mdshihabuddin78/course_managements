import DashboardComponent from "../views/DashboardComponent";
import categoriesComponent from "../views/courses/categoriesComponent";
import coursesComponent from "../views/courses/coursesComponent";
import subCategoriesComponent from "../views/courses/subCategoriesComponent";
import lessonsComponent from "../views/courses/lessonsComponent";
import reviewsComponent from "../views/Review/reviewsComponent";
import courseReviewComponent from "../views/Review/courseReviewComponent";
import lessonReviewComponent from "../views/Review/lessonReviewComponent";
import TestimonialComponent from "../views/Review/testimonialComponent";
import RolesComponent from "../views/RolesPermission/RolesComponent";
import ModulesComponent from "../views/RolesPermission/ModulesComponent";
import RoleConfigsComponent from "../views/RolesPermission/RoleConfigsComponent";
import PermissionsComponents from "../views/RolesPermission/PermissionsComponents";
import UsersComponent from "../views/user/UsersComponent";
import SettingsComponent from "../views/SettingsComponent";
import AdminProfileComponent from "../views/user/AdminProfileComponent";
import pendingCoursesComponent from "../views/courses/pendingCoursesComponent";
import quizzesComponent from "../views/quiz/quizzesComponent";
import questionsComponent from "../views/quiz/questionsComponent";


const routes =[
    {
        path: '/admin/dashboard',
        name:'home',
        component: DashboardComponent,
        meta : {dataUrl : 'api/dashboard'},
    },

    //Courses
    {
        path: '/admin/course/courses',
        name:'courses',
        component: coursesComponent,
        meta : {'pageTitle' : 'Course List', dataUrl : 'api/courses'},
    },
    {
        path: '/admin/course/lessons',
        name:'lesson',
        component:lessonsComponent,
        meta : {'pageTitle' : 'Lessons List', dataUrl : 'api/lessons'},
    },
    {
        path: '/admin/course/categories',
        name:'categories',
        component:categoriesComponent,
        meta : {'pageTitle' : 'Category List', dataUrl : 'api/categories'},
    },
    {
        path: '/admin/course/sub-categories',
        name:'subCategories',
        component:subCategoriesComponent,
        meta : {'pageTitle' : 'Sub Category List', dataUrl : 'api/sub-categories'},
    },
    {
        path: '/admin/course/pending',
        name:'pending-courses',
        component: pendingCoursesComponent,
        meta : {'pageTitle' : 'Pending Course List', dataUrl : 'api/courses'},
    },


    // Quizzes
    {
        path: '/admin/quiz/quizzes',
        name:'quizzes',
        component: quizzesComponent,
        meta : {'pageTitle' : 'Quiz List', dataUrl : 'api/quizzes'},
    },
    {
        path: '/admin/quiz/questions',
        name:'questions',
        component: questionsComponent,
        meta : {'pageTitle' : 'Question List', dataUrl : 'api/questions'},
    },


   // Reviews
    {
        path: '/admin/review/reviews',
        name:'reviews',
        component:reviewsComponent,
        meta : {'pageTitle' : 'reviews List', dataUrl : 'api/reviews'},
    },
    {
        path: '/admin/review/course-review',
        name:'course-review',
        component:courseReviewComponent,
        meta : {'pageTitle' : 'course-review List', dataUrl : 'api/review/course-reviews'},
    },
    {
        path: '/admin/review/lesson-review',
        name:'lesson-review',
        component:lessonReviewComponent,
        meta : {'pageTitle' : 'lesson-review List', dataUrl : 'api/review/lesson-reviews'},
    },
    {
        path: '/admin/review/testimonials',
        name:'testimonials',
        component:TestimonialComponent,
        meta : {'pageTitle' : 'testimonials List', dataUrl : 'api/review/testimonials'},
    },


   // User
    {
        path: '/admin/user/users',
        name:'users',
        component:UsersComponent,
        meta : {'pageTitle' : 'User List', dataUrl : 'api/users'},
    },
    {
        path: '/admin/user/profile',
        name:'user-profile',
        component:AdminProfileComponent,
        meta : {'pageTitle' : 'Profile', dataUrl : 'api/users'},
    },


    // Configs
    {
        path: '/admin/config/roles',
        name: 'roles',
        component:RolesComponent,
        meta : {'pageTitle' : 'Roles', dataUrl : 'api/config/roles'},
    },
    {
        path: '/admin/config/modules',
        name: 'modules',
        component: ModulesComponent,
        meta : {'pageTitle' : 'Modules', dataUrl : 'api/config/modules'},
    },
    {
        path: '/admin/config/permissions',
        name: 'permissions',
        component: PermissionsComponents,
        meta : {'pageTitle' : 'Permissions', dataUrl : 'api/config/permissions'},
    },
    {
        path: '/admin/config/manage-roles',
        name: 'manageRoles',
        component: RoleConfigsComponent,
        meta : {'pageTitle' : 'Manage Roles'},
    },

    // Settings
    {
        path: '/admin/settings',
        name: 'settings',
        component:SettingsComponent,
        meta : {'pageTitle' : 'App Settings', dataUrl : 'api/settings'},
    },

];
export default routes;
