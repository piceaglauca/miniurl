class MiniUrlsController < ApplicationController
  before_action :set_mini_url, only: [:show, :edit, :update, :destroy, :open]

  # GET /mini_urls
  # GET /mini_urls.json
  def index
    @mini_urls = MiniUrl.all
  end

  # GET /mini_urls/1
  # GET /mini_urls/1.json
  def show
    @ips = Ip.where(:mini_url_id => @mini_url.id).select(:ip, :num_visits)
  end

  # GET /mini_urls/new
  def new
    @mini_url = MiniUrl.new
  end

  # GET /mini_urls/1/edit
  def edit
  end

  # GET /:short_url
  def open
    if Ip.exists?(ip:request.remote_ip, mini_url_id: @mini_url.id)
      # this link has been followed before by this IP. Increment visit counter
      @ip = Ip.find_by ip: request.remote_ip, mini_url_id: @mini_url.id
      @ip.update(num_visits: @ip.num_visits + 1)
    else
      # either this link has never been followed, or it's a new IP. Either 
      # way, add new record to Ip table
      @ip = Ip.create(:ip => request.remote_ip,
                      :num_visits => 1,
                      :mini_url_id => @mini_url.id)
      end

      redirect_to @mini_url.full_url
  end

  # POST /mini_urls
  # POST /mini_urls.json
  def create
    @mini_url = MiniUrl.new(mini_url_params)

    respond_to do |format|
      if @mini_url.save
        format.html { redirect_to @mini_url, notice: 'Mini url was successfully created.' }
        format.json { render :show, status: :created, location: @mini_url }
      else
        format.html { render :new }
        format.json { render json: @mini_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mini_urls/1
  # PATCH/PUT /mini_urls/1.json
  def update
    respond_to do |format|
      if @mini_url.update(mini_url_params)
        format.html { redirect_to @mini_url, notice: 'Mini url was successfully updated.' }
        format.json { render :show, status: :ok, location: @mini_url }
      else
        format.html { render :edit }
        format.json { render json: @mini_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mini_urls/1
  # DELETE /mini_urls/1.json
  def destroy
    @mini_url.destroy
    respond_to do |format|
      format.html { redirect_to mini_urls_url, notice: 'Mini url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mini_url
      if ! params[:id].nil?
        @mini_url = MiniUrl.find(params[:id])
      elsif ! params[:short_url].nil?
        @mini_url = MiniUrl.find_by short_url: params[:short_url] 
      end
    end

    # Only allow a list of trusted parameters through.
    def mini_url_params
      params.require(:mini_url).permit(:short_url, :full_url)
    end
end
