import homeComponent from "../views/homeComponent";
import aboutComponent from "../views/aboutComponent";
import coursesComponent from "../views/coursesComponent";
import courseDetailsComponent from "../views/courseDetailsComponent";
import blogComponent from "../views/blogComponent";
import blogDetailsComponent from "../views/blogDetailsComponent";
import contactComponent from "../views/contactComponent";
import lessonComponent from "../views/lessonComponent";
import searchComponent from "../components/searchComponent";
import studentComponent from "../views/student/studentComponent";
import studentMyCoursesComponent from "../views/student/studentMyCoursesComponent";
import studentProfileComponent from "../views/student/studentProfileComponent";
import studentWishlistComponent from "../views/student/studentWishlistComponent";
import studentMessagesComponent from "../views/student/studentMessagesComponent";
import studentPurchaseHistoryComponent from "../views/student/studentPurchaseHistoryComponent";


const route = [
    {
        path : '/',
        name : 'home',
        component : homeComponent,
        meta : {'pageTitle' : 'Home', dataUrl : 'api/pages/index'},
    },
    {
        path : '/about',
        name : 'about us',
        component : aboutComponent,
        meta : {'pageTitle' : 'About'},
    },
    {
        path : '/courses',
        name : 'courses',
        component : coursesComponent,
        meta : {'pageTitle' : 'Courses', dataUrl : 'api/pages/courses'},
    },
    {
        path : '/courses/:id',
        name : 'courseDetails',
        component : courseDetailsComponent,
        props: true,
        meta : {'pageTitle' : 'CourseDetails', dataUrl : 'api/pages/courses'},
    },

    {
        path : '/blog',
        name : 'blog',
        component :blogComponent,
        meta : {'pageTitle' : 'Blog'},
    },
    {
        path : '/blogDetails',
        name : 'blogDetails',
        component :blogDetailsComponent,
        meta : {'pageTitle' : 'BlogDetails'},
    },
    {
        path : '/contact',
        name : 'contact',
        component: contactComponent,
        meta : {'pageTitle' : 'Contact'},
    },
    {
        path : '/lesson/:id',
        name : 'lesson',
        component:lessonComponent,
        meta : {'pageTitle' : 'LessonDetails', dataUrl : 'api/pages/lessons'},
    },
    {
        path:'/search',
        name:'search',
        component : searchComponent
    },
    {
        path:'/student',
        component:studentComponent,
        children: [
            {
                path: '/my-courses',
                name:'student-myCourses',
                component: studentMyCoursesComponent,
                meta : {dataUrl : 'api/student/my-courses'}
            },
            {
                path: 'wishlist',
                name:'student-wishlist',
                component: studentWishlistComponent,
                meta : {dataUrl : 'api/student/wish-list'},
            },
            {
                path: 'messages',
                name:'student-messages',
                component: studentMessagesComponent,
                meta : {dataUrl : 'api/student/messages'},
            },
            {
                path: 'purchase-history',
                name:'student-purchaseHistory',
                component: studentPurchaseHistoryComponent,
                meta : {dataUrl : 'api/student/purchase'},
            },
            {
                path: 'profile',
                name:'student-profile',
                component: studentProfileComponent,
                meta : {'pageTitle' : 'Student Profile', dataUrl : 'api/users'},
            },
        ]

    },

];
export default route;