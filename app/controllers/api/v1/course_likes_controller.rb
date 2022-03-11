class Api::V1::CourseLikesController < Api::V1::GraphitiController
  def index
    course_likes = CourseLikeResource.all(params)
    respond_with(course_likes)
  end

  def show
    course_like = CourseLikeResource.find(params)
    respond_with(course_like)
  end

  def create
    course_like = CourseLikeResource.build(params)

    if course_like.save
      render jsonapi: course_like, status: :created
    else
      render jsonapi_errors: course_like
    end
  end

  def update
    course_like = CourseLikeResource.find(params)

    if course_like.update_attributes
      render jsonapi: course_like
    else
      render jsonapi_errors: course_like
    end
  end

  def destroy
    course_like = CourseLikeResource.find(params)

    if course_like.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: course_like
    end
  end
end
