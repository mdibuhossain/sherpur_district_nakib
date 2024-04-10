import React from "react";
import axios from "axios";
import DashboardLayout from "./layout";
import "suneditor/dist/css/suneditor.min.css";
import CustomEditor from "../../components/CustomEditor";

const AddDistrictInfo = () => {
  const [postLoading, setPostLoading] = React.useState(false);
  const [isPostAdded, setIsPostAdded] = React.useState(false);
  const [isPostPublished, setIsPostPublished] = React.useState(false);
  const [editorContent, setEditorContent] = React.useState("");

  const handleIsPostAdded = () => {
    setIsPostAdded(!isPostAdded);
  };

  const handleIsPostPublished = () => {
    setIsPostPublished(!isPostPublished);
  };

  const handleCreatePost = async (e) => {
    e.preventDefault();
    setPostLoading(true);
    const payload = {
      title: e.target["title"].value,
    };
    const formData = new FormData();
    formData.append("payload", JSON.stringify(payload));
    if (isPostAdded) {
      formData.append(
        "post",
        JSON.stringify({
          postTitle: e.target["postTitle"].value,
          content: e.target["content"].value,
          isVisible: isPostPublished,
        })
      );
      formData.append("image", e.target["bannerImg"].files[0]);
    }
    try {
      axios
        .post(
          `${import.meta.env.VITE_APP_PUBLIC_SERVER}/district-info`,
          formData,
          {
            headers: {
              "Content-Type": "multipart/form-data",
            },
          }
        )
        .then((res) => {
          console.log(res);
        })
        .catch((err) => {
          console.log(err);
        });
    } catch (error) {
      console.log(error.message);
    } finally {
      setPostLoading(false);
    }
  };

  return (
    <DashboardLayout>
      <form
        onSubmit={handleCreatePost}
        className="border border-gray-300 rounded-md"
      >
        <input
          required
          name="title"
          type="text"
          className="appearance-none rounded-none relative block w-full px-3 py-2 border  border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
          placeholder="Main Title"
        />
        <div className="px-3 py-2 flex flex-col space-y-2">
          <label className="inline-flex items-center cursor-pointer">
            <span className="me-3 text-sm text-gray-900">
              Will you add blog?
            </span>
            <input
              type="checkbox"
              value={isPostAdded}
              onChange={handleIsPostAdded}
              className="sr-only peer"
            />
            <div className="relative w-11 h-6 bg-zinc-400 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-gray-200 after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-green-500"></div>
          </label>
          {isPostAdded && (
            <label className="inline-flex items-center cursor-pointer">
              <span className="me-3 text-sm text-gray-900">
                Will you publish the blog?
              </span>
              <input
                type="checkbox"
                value={isPostPublished}
                onChange={handleIsPostPublished}
                className="sr-only peer"
              />
              <div className="relative w-11 h-6 bg-zinc-400 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full rtl:peer-checked:after:-translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:start-[2px] after:bg-gray-200 after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-green-500"></div>
            </label>
          )}
        </div>
        <CustomEditor
          editorContent={editorContent}
          setEditorContent={setEditorContent}
          isPostAdded={isPostAdded}
        />
        <button
          type="submit"
          className="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-b-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          {postLoading ? (
            <div className="animate-spin rounded-full h-5 w-5 border-b-2 border-white"></div>
          ) : (
            "Create"
          )}
        </button>
      </form>
    </DashboardLayout>
  );
};

export default AddDistrictInfo;
