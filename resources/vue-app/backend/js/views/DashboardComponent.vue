<template>
    <div class="container my-5">
        <h3 class="mb-4">Dashboard Overview</h3>
        <div class="row">
            <!-- Courses Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card shadow-sm border-left-primary h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                    Courses
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ courses.length  }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-graduation-cap fa-2x text-primary"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Posts Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card shadow-sm border-left-warning h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                    Lessons
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ lessons.length }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-comments fa-2x text-warning"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Students Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card shadow-sm border-left-success h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                    Students
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ students.length }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user-graduate fa-2x text-success"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Instructors Card -->
            <div class="col-xl-3 col-md-6 mb-4">
                <div class="card shadow-sm border-left-info h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                    Instructors
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">{{ instructors.length }}</div>
                            </div>
                            <div class="col-auto">
                                <i class="fas fa-user-tie fa-2x text-info"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Area Chart -->
            <div class="col-xl-12 col-lg-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                        <h6 class="m-0 font-weight-bold text-primary">Total Sales in Last 30 Days</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="lineChart" width="985" height="362"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "DashboardComponent",

        data() {
            return {
                courses: [],
                lessons: [],
                instructors: [],
                students: [],
            }
        },

        mounted() {
            // Chart initialization
            this.initCart();

            const _this = this;
            this.fetchData(false, (result) => {
                _this.courses = result.courses;
                _this.lessons = result.lessons;
                _this.instructors = result.instructors;
                _this.students = result.students;
            });
        },

        methods: {
            initCart() {
                const ctx = document.getElementById('lineChart').getContext('2d');
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'],
                        datasets: [{
                            label: 'Sales',
                            data: [12, 19, 3, 5, 2, 3, 10, 15, 13, 7],
                            borderColor: '#4e73df',
                            backgroundColor: 'rgba(78, 115, 223, 0.1)',
                            fill: true
                        }]
                    },
                    options: {
                        scales: {
                            y: {
                                beginAtZero: true
                            }
                        }
                    }
                });
            },
        }
    }
</script>

<style scoped>
    .card {
        border-radius: 10px;
        transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 0.75rem 1.5rem rgba(0, 0, 0, 0.2);
    }

    .card-header {
        background-color: #f8f9fc;
    }

    .shadow-sm {
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075) !important;
    }

    .text-primary, .text-success, .text-info, .text-warning {
        font-weight: bold;
    }

    .text-gray-800 {
        color: #5a5c69 !important;
    }

    .chart-area {
        position: relative;
    }

    .chart-area canvas {
        max-height: 400px;
        max-width: 100%;
    }
</style>
