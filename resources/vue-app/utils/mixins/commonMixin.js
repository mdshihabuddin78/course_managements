export default {

    data() {
        return {
            baseUrl: window.baseUrl,    // Base URL for the application
            authUser: window.authUser,  // Authenticated user information from the window object
            currentUrl: window.location.href,
            questionOptions: [
                { label: 'A', key: 'option_a' },
                { label: 'B', key: 'option_b' },
                { label: 'C', key: 'option_c' },
                { label: 'D', key: 'option_d' }
            ],
            UI_HEADER_HIDE: 0,
            UI_HEADER_REGULAR: 1,
            UI_FOOTER_REGULAR: 1,
            UI_FOOTER_MINI: 2,
            CODE_SUCCESS: 2000,
            CODE_WARNING: 2020,
            CODE_DANGER: 3000,
            PERM_VIEW: 'view',
            PERM_ADD: 'add',
            PERM_EDIT: 'edit',
            PERM_DELETE: 'delete',
            PERM_MANAGE: 'manage',
            TYPE_COURSE: 1,
            TYPE_LESSON: 2,
            TYPE_LESSON_VIDEO: 2,
            TYPE_CATEGORY: 3,
            TYPE_USER: 4,
            TYPE_UPLOAD: 5,
            DEF_FILES: {},
        };
    },
    created() {
        this.DEF_FILES = {
            [this.TYPE_COURSE]: 'images/course-def-thumbnail.jpg',
            [this.TYPE_LESSON]: 'images/course-def-thumbnail.jpg',
            [this.TYPE_LESSON_VIDEO]: 'images/course-def-thumbnail.jpg',
            [this.TYPE_CATEGORY]: 'images/category-def-thumbnail.gif',
            [this.TYPE_USER]: 'images/def-user-avatar.svg',
            [this.TYPE_UPLOAD]: 'images/upload.jpg',
        };
    },
    computed: {
        auth() {
            return this.$store.getters.auth
        },
        /**
         * Retrieve the list of data from the Vuex store.
         * This is a computed property to automatically react to changes in the store.
         */
        dataList() {
            return this.$store.getters.dataList
        },

        /**
         * Retrieve form data from the Vuex store.
         * This is a computed property to automatically react to changes in the store.
         */
        formData() {
            return this.$store.getters.formData;
        },

        showHeader() {
            return this.$store.getters.showHeader;
        },

        showFooter() {
            return this.$store.getters.showFooter;
        },

        /**
         * Retrieve configuration data from the Vuex store.
         * This is a computed property to automatically react to changes in the store.
         */
        Config() {
            return this.$store.getters.Config;
        },

        perPage() {
            const settings = this.$store.getters.settings;
            return settings && settings.items_per_page ? +settings.items_per_page : 10;
        }
    },
    methods: {
        dd(data) {
            console.log(data);
        },
        isEmptyData(data) {
            if (data == null || data === '') return true;
            if (typeof data === 'string' || Array.isArray(data)) return data.length === 0;
            if (typeof data === 'object') return Object.keys(data).length === 0;
            return false;
        },
        isFree(course) {
            if (this.isEmptyData(course)) return true;
            return parseFloat(course.price) === 0 ;
        },
        objLen(obj) {
            if (!obj || obj !== 'object') return 0;

            return Object.keys(obj).length;
        },
        asset(path) {
            return baseUrl + '/' + path;
        },
        generateFileUrl(file, type = this.TYPE_COURSE) {
            let def = this.DEF_FILES[type];

            if (file && file.path)
                def = 'storage/' + file.path;

            return this.baseUrl + '/' + def;
        },

        limitText(text, maxLength = 70) {
            if (text && text.length > maxLength) {
                return text.substring(0, maxLength) + '...';
            }
            return text;
        },

        removeArrItem(array, item) {
            if (!Array.isArray(array) || !item) return;

            const index = array.indexOf(item);
            array.splice(index , 1)
        },

        removeObjArrItem(objArr, obj, key = 'id') {
            if (!Array.isArray(objArr) || !obj || !obj[key]) return;

            const index = objArr.findIndex(item => item[key] === obj[key]);
            if (index !== -1) objArr.splice(index, 1);
        },

        goTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        },


        formatDecimal(value) {
            if (value % 1 === 0) return parseInt(value);
            return parseFloat(value).toFixed(2);
        },

        formatSecondsToTime(seconds) {
            if (seconds === null || seconds === undefined) return 'NA';

            const hours = Math.floor(seconds / 3600);            // Calculate hours
            const minutes = Math.floor((seconds % 3600) / 60);   // Calculate minutes
            const remainingSeconds = seconds % 60;                // Calculate remaining seconds

            // Build the time string conditionally
            let formattedTime = [];

            if (hours > 0) formattedTime.push(String(hours));  // Include hours only if greater than 0
            formattedTime.push(String(minutes).padStart(2, '0'));  // Always include minutes
            formattedTime.push(String(remainingSeconds).padStart(2, '0')); // Always include seconds

            return formattedTime.join(':'); // Join components with a colon
        },

        formatDaysToDuration(days) {
            if (this.isEmptyData(days)) return 'NA';

            if (days >= 365) return Math.ceil(days / 365) + ' years'; // Convert days to years
            if (days >= 30) return Math.ceil(days / 30) + ' months'; // Convert days to months
            if (days >= 7) return Math.ceil(days / 7) + ' weeks'; // Convert days to weeks
            return days + ' days'; // Keep days as-is

        },

        // Authentication-related methods

        can(task) {
            return this.Config && this.Config.permissions && this.Config.permissions.includes(task);
        },

        getSetting(key, defVal) {
            const settings = this.$store.getters.settings;
            return settings && settings[key] ? settings[key] : defVal ? defVal : "";
        },


        /**
         * Display a toast notification with a custom message and type.
         * @param {String} message - The message to display in the toast.
         * @param {String} [type="success"] - The type of toast (e.g., 'success', 'error').
         */
        showToast(message, type = "success") {
            this.$toast(message, {
                type: type,
                timeout: 3000,        // 3 seconds timeout
                position: "top-right", // Toast position at top-right
            });
        },


        showSweetAlert({
                           title = 'Are you sure?',
                           text = "You won't be able to revert this!",
                           icon = 'warning',
                           showCancelButton = true,
                           confirmButtonText = 'Yes',
                           cancelButtonText = 'No',
                           confirmButtonColor= '#ff1695',
                           cancelButtonColor = '#00cccd',
                           callback = false
        }) {
            this.$swal({title, text, icon, showCancelButton, confirmButtonText, cancelButtonText, confirmButtonColor, cancelButtonColor}).then((result) => {

                if (typeof callback === 'function') callback(result.isConfirmed);
            });
        },

        // close the modal and reset the form data.
        closeModal(modalId = '#backendModal', callBack = false, defVal = {}) {
            $(modalId).modal('hide'); // Hide the modal

            if (typeof callBack === 'function') callBack(); // Execute callback if provided
            this.$store.commit('setFormData', defVal); // Reset the form data
        },

        // open the modal for adding or updating list.
        openModal(modalId = '#backendModal', callBack = false) {
            $(modalId).modal('show'); // Show the modal

            if (typeof callBack === 'function') callBack(); // Execute callback if provided
        },


        // upload the file on storage and set it's infos on form data
        handleFileUpload(event, key = 'thumbnail', dataHolder = this.formData, player) {
            const file = event.target.files[0];  // Get the selected file
            if (!file) {  // Check if the file is selected
                alert("Please upload a valid file.");  // Show an alert if the file is not valid
                return;
            }

            const imgFormData = new FormData();
            imgFormData.append('file', file);  // Append the file to the FormData
            imgFormData.append('key', key);

            // If the file is a video, get its duration
            if (file.type.startsWith('video/')) {
                const videoElement = document.createElement('video');
                videoElement.src = URL.createObjectURL(file);

                videoElement.addEventListener('loadedmetadata', () => {
                    const duration = videoElement.duration;
                    imgFormData.append('duration', duration);
                    this.sendFileToServer(imgFormData, dataHolder, key, player);
                });

                videoElement.load();
            } else {
                this.sendFileToServer(imgFormData, dataHolder, key, player);
            }
        },

        sendFileToServer(imgFormData, dataHolder, key, player) {
            const _this = this;
            this.httpReq({
                customUrl: 'api/files/upload',
                method: 'post',
                callback: (res) => {
                    if (res.data.success) {
                        _this.$set(dataHolder, key, res.data);
                        if (player) player.load();
                    }
                },
                data: imgFormData
            });
        },

        getSolvedQsN(questions) {
            if (this.isEmptyData(this.auth) || this.isEmptyData(questions)) return 0;

            let n = 0;
            questions.forEach((q) => {
                if (this.auth.solved_questions_id.includes(q.id)) n++;
            });

            return n;
        },

        isSolvedAllQs(questions){
            return questions && this.getSolvedQsN(questions) === questions.length;
        },

        isSolveQs(question) {
            return question && this.auth && this.auth.solved_questions_id.includes(question.id);
        },

        isCompleteAllQuizzes(quizzes) {
            if (this.isEmptyData(quizzes)) return true;
            const lastQuiz = quizzes[quizzes.length - 1];
            if (this.isEmptyData(lastQuiz)) return true;
            return this.isSolvedAllQs(lastQuiz.questions);
        }


    }
}
